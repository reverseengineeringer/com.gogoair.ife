package com.adobe.mediacore.timeline.advertising.auditude;

import android.content.Context;
import android.os.Handler;
import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.MediaPlayerNotification.Error;
import com.adobe.mediacore.MediaPlayerNotification.ErrorCode;
import com.adobe.mediacore.MediaPlayerNotification.Warning;
import com.adobe.mediacore.MediaPlayerNotification.WarningCode;
import com.adobe.mediacore.MediaResource;
import com.adobe.mediacore.MediaResource.MimeType;
import com.adobe.mediacore.MediaResource.Type;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.AuditudeSettings;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.NopTimelineOperation;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import com.adobe.mediacore.timeline.advertising.AdClick;
import com.adobe.mediacore.timeline.advertising.ContentResolver;
import com.adobe.mediacore.timeline.advertising.ContentResolver.OnTimeUpdateListener;
import com.adobe.mediacore.timeline.advertising.ContentTracker;
import com.adobe.mediacore.timeline.advertising.PlacementInformation;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Mode;
import com.adobe.mediacore.timeline.advertising.PlacementInformation.Type;
import com.adobe.mediacore.timeline.advertising.customadmarkers.CustomRangeHelper;
import com.adobe.mediacore.utils.ReplacementTimeRange;
import com.adobe.mediacore.utils.StringUtils;
import com.auditude.ads.AuditudeAdUnitDelegate;
import com.auditude.ads.event.AdPluginEvent;
import com.auditude.ads.event.AuditudePluginEventListener;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.IClick;
import com.auditude.ads.model.media.MediaFile;
import com.auditude.ads.model.smil.Group;
import com.auditude.ads.model.smil.Group.PrefetchCompleteListener;
import com.auditude.ads.model.smil.Ref;
import com.auditude.ads.model.smil.Sequence;
import com.auditude.ads.reporting.ReportingHelper;
import com.auditude.ads.response.AdResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class AuditudeResolver
  extends ContentResolver
  implements ContentResolver.OnTimeUpdateListener, Group.PrefetchCompleteListener
{
  private static final int ADBREAK_TIMECHANGE_TOLERANCE = 1000;
  private static final int AUDITUDE_TIME_SCALE = 1000;
  private static final int MINIMUM_AD_DURATION = 5;
  private static final int MINIMUM_AD_LOTS = 1;
  private static final int MIN_INIT_REQUEST_INTERVAL = 1200;
  private static final int POST_ROLL_DEFAULT_TIME = 10000000;
  private static final int PRE_ROLL_DEFAULT_TIME = 0;
  private final int EMPTY_AD_ID = 0;
  private final String LOG_TAG = "[PSDK]::[AuditudeAd]::" + AuditudeResolver.class.getSimpleName();
  private final String REPACKAGING_MIME_TYPE = "application/x-mpegURL";
  private AuditudeRequest _auditudeRequest = null;
  private AuditudeTracker _auditudeTracker;
  private Group _currentEmptyAdBreak;
  private List _emptyAdBreaks;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private PlacementOpportunity _placementOpportunity = null;
  private LinkedList _requestQueue = new LinkedList();
  private Context _resolverContext;
  private AuditudeAdUnitDelegate auditudeAdResolver;
  private boolean creativeRepackagingEnabled = false;
  private Handler handler = new Handler();
  private long lastRequestTime;
  private int loadingGroupCount = 0;
  private final AuditudePluginEventListener pluginEventListener = new AuditudeResolver.1(this);
  private String userAgent = "";
  
  public AuditudeResolver()
  {
    initializeAdUnit();
  }
  
  public AuditudeResolver(Context paramContext)
  {
    _resolverContext = paramContext;
    initializeAdUnit();
  }
  
  private Group breakAtPlayheadTime(long paramLong)
  {
    if ((paramLong > 0L) && (_emptyAdBreaks != null) && (_emptyAdBreaks.size() > 0))
    {
      Iterator localIterator = _emptyAdBreaks.iterator();
      while (localIterator.hasNext())
      {
        Group localGroup = (Group)localIterator.next();
        if (Math.abs(localGroup.getStartTime() - paramLong) <= 1000L) {
          return localGroup;
        }
      }
    }
    return null;
  }
  
  private AdAsset createAdAsset(String paramString1, String paramString2, long paramLong, Metadata paramMetadata, AdClick paramAdClick, String paramString3)
  {
    paramString1 = MediaResource.createFromUrl(paramString1, paramMetadata);
    return new AdAsset(extractId(paramString2), paramLong, paramString1, paramAdClick, paramMetadata, paramString3);
  }
  
  private PlacementInformation createPlacementInformation(AdBreak paramAdBreak)
  {
    if ((_placementOpportunity.getPlacementInformation() == null) || (_placementOpportunity.getPlacementInformation().getType() == PlacementInformation.Type.SERVER_MAP) || (_placementOpportunity.getPlacementInformation().getType().equals(PlacementInformation.Type.CUSTOM_TIME_RANGES)))
    {
      PlacementInformation.Type localType = PlacementInformation.Type.MID_ROLL;
      if (paramAdBreak.getTime() == 0L) {
        localType = PlacementInformation.Type.PRE_ROLL;
      }
      for (;;)
      {
        return new PlacementInformation(localType, paramAdBreak.getTime(), 0L);
        if (paramAdBreak.getTime() >= 10000000L) {
          localType = PlacementInformation.Type.POST_ROLL;
        }
      }
    }
    return new PlacementInformation(_placementOpportunity.getPlacementInformation().getType(), _placementOpportunity.getPlacementInformation().getTime(), _placementOpportunity.getPlacementInformation().getDuration());
  }
  
  private void execResolveAds(Metadata paramMetadata, PlacementOpportunity paramPlacementOpportunity)
  {
    _placementOpportunity = paramPlacementOpportunity;
    if (!(paramMetadata instanceof MetadataNode)) {
      throw new IllegalArgumentException("The provided metadata is not valid for Auditude resolver");
    }
    AuditudeSettings localAuditudeSettings = extractAuditudeSettings((MetadataNode)paramMetadata);
    paramMetadata = ((MetadataNode)paramMetadata).getNode(DefaultMetadataKeys.CUSTOM_PARAMETERS.getValue());
    _requestQueue.add(new AuditudeRequest(localAuditudeSettings, paramPlacementOpportunity, paramMetadata));
  }
  
  private AdAsset extractAdAsset(Asset paramAsset, Metadata paramMetadata, AdClick paramAdClick)
  {
    Object localObject = paramAsset.getMediaFiles();
    if (localObject == null)
    {
      _logger.w(LOG_TAG + "#extractAdAsset", "Received invalid response from Auditude. Asset has no media files associated with it");
      return null;
    }
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      MediaFile localMediaFile = (MediaFile)((Iterator)localObject).next();
      if (isMediaFileSupported(localMediaFile)) {
        return createAdAsset(source, id, paramAsset.getDurationInMillis(), paramMetadata, paramAdClick, "");
      }
      String str = paramAsset.getCreativeType();
      if (((paramAsset.getApiFramework() != null) && (paramAsset.getApiFramework().equals("VPAID"))) || ((str != null) && (str.equals("application/javascript"))))
      {
        long l2 = paramAsset.getDurationInMillis();
        long l1 = l2;
        if (l2 <= 0L) {
          l1 = 15L;
        }
        return createAdAsset(source, id, l1, paramMetadata, paramAdClick, paramAsset.getAdParameters());
      }
    }
    return null;
  }
  
  private List extractAdBreakPlacements()
  {
    ArrayList localArrayList1 = new ArrayList();
    _emptyAdBreaks = new ArrayList();
    Iterator localIterator1 = auditudeAdResolver.getAdResponse().getBreaks().iterator();
    while (localIterator1.hasNext())
    {
      Object localObject1 = (Group)localIterator1.next();
      ArrayList localArrayList2 = new ArrayList();
      Iterator localIterator2 = ((Group)localObject1).getRefs().iterator();
      while (localIterator2.hasNext())
      {
        Ref localRef = (Ref)localIterator2.next();
        if ((localRef != null) && (localRef.getAd() != null) && (localRef.getPrimaryAsset() != null))
        {
          Object localObject2 = new AuditudeSettings();
          ((AuditudeSettings)localObject2).setData(localRef);
          Asset localAsset = localRef.getPrimaryAsset();
          localObject2 = extractPrimaryAdAsset(localAsset, (Metadata)localObject2);
          if (localObject2 != null)
          {
            ArrayList localArrayList3 = new ArrayList();
            String str = localAsset.getCreativeType();
            if (((localAsset.getApiFramework() != null) && (localAsset.getApiFramework().equals("VPAID"))) || ((str != null) && (str.equals("application/javascript"))))
            {
              long l2 = localAsset.getDurationInMillis();
              long l1 = l2;
              if (l2 <= 0L) {
                l1 = 15L;
              }
              localArrayList2.add(com.adobe.mediacore.timeline.advertising.Ad.createAd(MediaResource.Type.CUSTOM, l1, extractId(localRef.getAd().getID()), (AdAsset)localObject2, localArrayList3, getAdTracker(), true));
            }
            else
            {
              localArrayList2.add(com.adobe.mediacore.timeline.advertising.Ad.createAd(MediaResource.Type.HLS, localAsset.getDurationInMillis(), extractId(localRef.getAd().getID()), (AdAsset)localObject2, localArrayList3, getAdTracker(), false));
            }
          }
          else
          {
            _logger.w(LOG_TAG + "#extractAdBreaks", "Ad will be skipped. Auditude response contains a primary asset that is not supported");
          }
        }
      }
      if (localArrayList2.size() > 0)
      {
        localObject1 = AdBreak.createAdBreak(localArrayList2, ((Group)localObject1).getStartTime(), 0L, String.valueOf(((Group)localObject1).getIndex()));
        localArrayList1.add(new AdBreakPlacement((AdBreak)localObject1, createPlacementInformation((AdBreak)localObject1)));
      }
      else
      {
        _emptyAdBreaks.add(localObject1);
        localArrayList1.add(new NopTimelineOperation());
      }
    }
    return localArrayList1;
  }
  
  private AdClick extractAdClick(Asset paramAsset)
  {
    paramAsset = paramAsset.getClick();
    if (paramAsset == null) {
      return new AdClick("", "", "");
    }
    return new AdClick(paramAsset.getID(), paramAsset.getTitle(), paramAsset.getUrl());
  }
  
  private AuditudeSettings extractAuditudeSettings(MetadataNode paramMetadataNode)
  {
    MetadataNode localMetadataNode = null;
    if (paramMetadataNode.containsNode(DefaultMetadataKeys.AUDITUDE_METADATA_KEY.getValue())) {
      localMetadataNode = paramMetadataNode.getNode(DefaultMetadataKeys.AUDITUDE_METADATA_KEY.getValue());
    }
    if (paramMetadataNode.containsKey(DefaultMetadataKeys.ADVERTISING_METADATA.getValue())) {
      localMetadataNode = paramMetadataNode.getNode(DefaultMetadataKeys.ADVERTISING_METADATA.getValue());
    }
    if ((localMetadataNode == null) || (!(localMetadataNode instanceof AuditudeSettings))) {
      throw new IllegalArgumentException("No AuditudeSettings metdata or compatible metadata have been found.");
    }
    return (AuditudeSettings)localMetadataNode;
  }
  
  private int extractId(String paramString)
  {
    int i = 0;
    if (paramString != null) {}
    try
    {
      i = Integer.parseInt(paramString);
      return i;
    }
    catch (NumberFormatException paramString)
    {
      _logger.w(LOG_TAG + "#extractId", "Number format exception when parsing id from auditude. Will use default values");
    }
    return 0;
  }
  
  private AdAsset extractPrimaryAdAsset(Asset paramAsset, Metadata paramMetadata)
  {
    return extractAdAsset(paramAsset, paramMetadata, extractAdClick(paramAsset));
  }
  
  private HashMap getCustomParams(AuditudeSettings paramAuditudeSettings, PlacementInformation paramPlacementInformation, Metadata paramMetadata, List paramList)
  {
    Object localObject2 = new HashMap();
    Object localObject1 = paramAuditudeSettings.getTargetingParameters();
    Object localObject3;
    String str1;
    if (localObject1 != null)
    {
      localObject3 = ((Metadata)localObject1).keySet().iterator();
      while (((Iterator)localObject3).hasNext())
      {
        str1 = (String)((Iterator)localObject3).next();
        String str2 = ((Metadata)localObject1).getValue(str1);
        if ((!StringUtils.isEmpty(str1)) && (!StringUtils.isEmpty(str2))) {
          ((HashMap)localObject2).put(str1, str2);
        }
      }
    }
    localObject1 = new HashMap();
    ((HashMap)localObject1).put("userData", localObject2);
    paramList = getTimeLineString(paramList);
    if (paramList != null) {
      ((HashMap)localObject1).put("auditudeTimeline", paramList);
    }
    paramList = new HashMap();
    paramAuditudeSettings = paramAuditudeSettings.getCustomParameters();
    if (paramAuditudeSettings != null)
    {
      localObject2 = paramAuditudeSettings.keySet().iterator();
      while (((Iterator)localObject2).hasNext())
      {
        localObject3 = (String)((Iterator)localObject2).next();
        str1 = paramAuditudeSettings.getValue((String)localObject3);
        if ((!StringUtils.isEmpty((String)localObject3)) && (str1 != null)) {
          paramList.put(localObject3, str1);
        }
      }
    }
    if (paramMetadata != null)
    {
      paramAuditudeSettings = paramMetadata.keySet().iterator();
      while (paramAuditudeSettings.hasNext())
      {
        localObject2 = (String)paramAuditudeSettings.next();
        localObject3 = paramMetadata.getValue((String)localObject2);
        if ((!StringUtils.isEmpty((String)localObject2)) && (!StringUtils.isEmpty((String)localObject3))) {
          paramList.put(localObject2, localObject3);
        }
      }
    }
    if ((!paramList.containsKey("PSDK_AVAIL_DURATION")) && (paramPlacementInformation != null) && (paramPlacementInformation.getDuration() != -1L)) {
      paramList.put("PSDK_AVAIL_DURATION", String.valueOf(paramPlacementInformation.getDuration() / 1000L));
    }
    ((HashMap)localObject1).put("auditudePassThroughParams", paramList);
    _logger.i(LOG_TAG + "#getCustomParams", "Auditude custom params: " + localObject1);
    return (HashMap)localObject1;
  }
  
  private List getMediaIds(AuditudeSettings paramAuditudeSettings)
  {
    ArrayList localArrayList = new ArrayList();
    String str = paramAuditudeSettings.getMediaId();
    paramAuditudeSettings = paramAuditudeSettings.getDefaultMediaId();
    if (StringUtils.isEmpty(str))
    {
      _logger.e(LOG_TAG + "#getMediaIds()", "Auditude asset ID parameter cannot be null or empty.");
      throw new IllegalArgumentException("Auditude asset ID parameter cannot be null or empty.");
    }
    localArrayList.add(str);
    if (!StringUtils.isEmpty(paramAuditudeSettings)) {
      localArrayList.add(paramAuditudeSettings);
    }
    return localArrayList;
  }
  
  private String getTimeLineString(List paramList)
  {
    StringBuilder localStringBuilder;
    if ((paramList != null) && (paramList.size() > 0))
    {
      if (((PlacementInformation)paramList.get(0)).getType() == PlacementInformation.Type.SERVER_MAP) {}
      while ((((PlacementInformation)paramList.get(0)).getType() == PlacementInformation.Type.PRE_ROLL) && (paramList.size() == 1) && (((PlacementInformation)paramList.get(0)).getDuration() == -1L)) {
        return null;
      }
      localStringBuilder = new StringBuilder();
      int i = 0;
      if (i < paramList.size())
      {
        if (i > 0) {
          localStringBuilder.append("&tl=");
        }
        localStringBuilder.append(serializePlacement((PlacementInformation)paramList.get(i), false));
        PlacementInformation localPlacementInformation;
        if (paramList.size() > 1)
        {
          if (i >= paramList.size() - 1) {
            break label237;
          }
          localPlacementInformation = new PlacementInformation(PlacementInformation.Type.MID_ROLL, PlacementInformation.Mode.INSERT, ((PlacementInformation)paramList.get(i)).getTime(), ((PlacementInformation)paramList.get(i + 1)).getTime() - ((PlacementInformation)paramList.get(i)).getTime());
          localStringBuilder.append("&tl=").append(serializePlacement(localPlacementInformation, true));
        }
        for (;;)
        {
          i += 1;
          break;
          label237:
          if (((PlacementInformation)paramList.get(i)).getType() != PlacementInformation.Type.POST_ROLL)
          {
            localPlacementInformation = new PlacementInformation(PlacementInformation.Type.MID_ROLL, PlacementInformation.Mode.INSERT, ((PlacementInformation)paramList.get(i)).getTime(), 10000000L);
            localStringBuilder.append("&tl=").append(serializePlacement(localPlacementInformation, true));
          }
        }
      }
    }
    for (paramList = localStringBuilder.toString();; paramList = null) {
      return paramList;
    }
  }
  
  private void handleInvalidMetadata(Exception paramException)
  {
    _logger.w(LOG_TAG + "#handleInvalidMetadata", String.valueOf(paramException.getMessage()));
    MediaPlayerNotification.Error localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.AD_RESOLVER_METADATA_INVALID, "Invalid ad metadata.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("DESCRIPTION", paramException.getMessage());
    localError.setMetadata(localMetadataNode);
    notifyResolveError(localError);
  }
  
  private void initializeAdUnit()
  {
    auditudeAdResolver = new AuditudeAdUnitDelegate();
    auditudeAdResolver.setProperty("repackageCreativeFormat", "application/x-mpegURL");
    auditudeAdResolver.setProperty("applicationContext", _resolverContext);
    auditudeAdResolver.setPluginEventListener(pluginEventListener);
  }
  
  private boolean isMediaFileSupported(MediaFile paramMediaFile)
  {
    boolean bool2 = true;
    boolean bool1;
    if ((paramMediaFile == null) || (mimeType == null)) {
      bool1 = false;
    }
    do
    {
      do
      {
        return bool1;
        bool1 = bool2;
      } while (mimeType.equalsIgnoreCase(MediaResource.MimeType.HLS_MIME_TYPE.getValue()));
      paramMediaFile = StringUtils.getFileExtension(source);
      if (paramMediaFile == null) {
        break;
      }
      bool1 = bool2;
    } while (paramMediaFile.equalsIgnoreCase(MediaResource.Type.HLS.getValue()));
    return false;
  }
  
  private void issueAdResolvingRequest(AuditudeSettings paramAuditudeSettings, PlacementOpportunity paramPlacementOpportunity, Metadata paramMetadata, List paramList)
  {
    List localList = getMediaIds(paramAuditudeSettings);
    String str = paramAuditudeSettings.getDomain();
    if (StringUtils.isEmpty(str))
    {
      _logger.e(LOG_TAG + "#initAuditudeAdResolver()", "Auditude domain parameter cannot be null or empty.");
      throw new IllegalArgumentException("Auditude domain parameter cannot be null or empty.");
    }
    try
    {
      int i = Integer.parseInt(paramAuditudeSettings.getZoneId());
      creativeRepackagingEnabled = paramAuditudeSettings.isCreativeRepackagingEnabled();
      paramPlacementOpportunity = getCustomParams(paramAuditudeSettings, paramPlacementOpportunity.getPlacementInformation(), paramMetadata, paramList);
      auditudeAdResolver.setProperty("repackageCreativeFormat", "application/x-mpegURL");
      auditudeAdResolver.setProperty("repackageCreativeEnabled", Boolean.valueOf(creativeRepackagingEnabled));
      paramMetadata = new ArrayList();
      paramMetadata.add("application/x-mpegURL");
      paramMetadata.add("application/javascript");
      auditudeAdResolver.setProperty("validMimeTypes", paramMetadata);
      auditudeAdResolver.setProperty("fallbackOnInvalidCreative", Boolean.valueOf(paramAuditudeSettings.isFallbackOnInvalidCreativeEnabled()));
      userAgent = paramAuditudeSettings.getUserAgent();
      if (!StringUtils.isEmpty(userAgent)) {
        auditudeAdResolver.setProperty("userAgent", userAgent);
      }
      auditudeAdResolver.init(str, localList, i, paramPlacementOpportunity, 10);
      return;
    }
    catch (NumberFormatException paramAuditudeSettings)
    {
      throw new IllegalArgumentException("Auditude zoneId parameter must be a valid number.", paramAuditudeSettings);
    }
  }
  
  private void loadAdBreaks(AdPluginEvent paramAdPluginEvent)
  {
    Object localObject1 = auditudeAdResolver.getAdResponse().getBreaks();
    loadingGroupCount = ((ArrayList)localObject1).size();
    Object localObject2;
    Object localObject3;
    if (loadingGroupCount > 0)
    {
      localObject2 = _logger;
      localObject3 = LOG_TAG + "#loadAdBreaks";
      StringBuilder localStringBuilder = new StringBuilder().append("Loading ad breaks. Creative repackaging is: ");
      if (creativeRepackagingEnabled) {}
      for (paramAdPluginEvent = "enabled";; paramAdPluginEvent = "disabled")
      {
        ((Logger)localObject2).i((String)localObject3, paramAdPluginEvent + ".");
        paramAdPluginEvent = ((ArrayList)localObject1).iterator();
        while (paramAdPluginEvent.hasNext()) {
          ((Group)paramAdPluginEvent.next()).load(this, Boolean.valueOf(creativeRepackagingEnabled), null);
        }
      }
    }
    paramAdPluginEvent = paramAdPluginEvent.getData();
    if ((paramAdPluginEvent != null) && (paramAdPluginEvent.containsKey("errors")))
    {
      paramAdPluginEvent = ((ArrayList)paramAdPluginEvent.get("errors")).iterator();
      while (paramAdPluginEvent.hasNext())
      {
        localObject1 = (HashMap)paramAdPluginEvent.next();
        localObject2 = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.AD_RESOLVER_RETURNED_NO_ADS, "Ad Resolver Returned no ads");
        localObject3 = new MetadataNode();
        ((Metadata)localObject3).setValue("AdId", ((HashMap)localObject1).get("AdId").toString());
        ((Metadata)localObject3).setValue("InternalError", ((HashMap)localObject1).get("InternalErrorId").toString());
        ((Metadata)localObject3).setValue("Description", ((HashMap)localObject1).get("Description").toString());
        ((MediaPlayerNotification.Warning)localObject2).setMetadata((Metadata)localObject3);
        notifyResolveWarning((MediaPlayerNotification.Warning)localObject2);
      }
    }
    onPrefetchComplete(null);
  }
  
  private void processReplacementRanges(PlacementOpportunity paramPlacementOpportunity, CustomRangeHelper paramCustomRangeHelper)
  {
    _placementOpportunity = paramPlacementOpportunity;
    for (;;)
    {
      int i;
      try
      {
        localObject = paramPlacementOpportunity.getMetadata();
        paramCustomRangeHelper = paramCustomRangeHelper.mergeRanges(paramCustomRangeHelper.extractCustomTimeRanges(paramCustomRangeHelper.extractCustomTimeRangeMetadata()));
        localObject = new AuditudeRequest(extractAuditudeSettings((MetadataNode)localObject), paramPlacementOpportunity, ((MetadataNode)localObject).getNode(DefaultMetadataKeys.CUSTOM_PARAMETERS.getValue()));
        if (((ReplacementTimeRange)paramCustomRangeHelper.get(0)).getBegin() == 0L) {
          break label222;
        }
        ((AuditudeRequest)localObject).addPlacement(new PlacementInformation(PlacementInformation.Type.PRE_ROLL, PlacementInformation.Mode.REPLACE, 0L, -1L));
      }
      catch (Exception paramPlacementOpportunity)
      {
        Object localObject;
        ReplacementTimeRange localReplacementTimeRange;
        long l;
        handleInvalidMetadata(paramPlacementOpportunity);
        return;
      }
      if (i < paramCustomRangeHelper.size())
      {
        localReplacementTimeRange = (ReplacementTimeRange)paramCustomRangeHelper.get(i);
        if (localReplacementTimeRange.getBegin() == 0L)
        {
          paramPlacementOpportunity = PlacementInformation.Type.PRE_ROLL;
          if (localReplacementTimeRange.getReplacementDuration() < 0L)
          {
            l = -1L;
            ((AuditudeRequest)localObject).addPlacement(new PlacementInformation(paramPlacementOpportunity, PlacementInformation.Mode.REPLACE, localReplacementTimeRange.getBegin(), Long.valueOf(l).longValue()));
            i += 1;
          }
        }
        else
        {
          paramPlacementOpportunity = PlacementInformation.Type.MID_ROLL;
          continue;
        }
        l = localReplacementTimeRange.getReplacementDuration();
      }
      else
      {
        _requestQueue.add(localObject);
        return;
        label222:
        i = 0;
      }
    }
  }
  
  private static String serializePlacement(PlacementInformation paramPlacementInformation, boolean paramBoolean)
  {
    long l2 = 1L;
    long l3;
    long l1;
    if (paramPlacementInformation.getDuration() != -1L)
    {
      l3 = paramPlacementInformation.getDuration() / 1000L;
      l1 = l3 / 5L;
    }
    for (;;)
    {
      StringBuilder localStringBuilder;
      String str;
      if (paramPlacementInformation.getDuration() == 0L)
      {
        l2 = 0L;
        localStringBuilder = new StringBuilder();
        if (!paramBoolean) {
          break label164;
        }
        str = "n";
        label61:
        localStringBuilder.append(str).append(",");
        if (l3 != -1L) {
          break label172;
        }
        localStringBuilder.append("*").append(",");
        label99:
        if (l3 != -1L) {
          break label192;
        }
        localStringBuilder.append("*").append(",");
        label123:
        if (!paramBoolean)
        {
          if (paramPlacementInformation.getType() != PlacementInformation.Type.PRE_ROLL) {
            break label228;
          }
          localStringBuilder.append("p");
        }
      }
      for (;;)
      {
        return localStringBuilder.toString();
        if (l1 < 1L) {
          break;
        }
        l2 = l1;
        break;
        label164:
        str = "l";
        break label61;
        label172:
        localStringBuilder.append(String.valueOf(l3)).append(",");
        break label99;
        label192:
        if (paramBoolean)
        {
          localStringBuilder.append("0");
          break label123;
        }
        localStringBuilder.append(String.valueOf(l2)).append(",");
        break label123;
        label228:
        if (paramPlacementInformation.getType() == PlacementInformation.Type.POST_ROLL) {
          localStringBuilder.append("t");
        } else {
          localStringBuilder.append("m");
        }
      }
      l1 = 1L;
      l3 = -1L;
    }
  }
  
  private void startConsumer()
  {
    if (_requestQueue.isEmpty()) {
      return;
    }
    long l2 = System.currentTimeMillis();
    if (1200L > l2 - lastRequestTime) {}
    for (long l1 = 1200L - (l2 - lastRequestTime);; l1 = 0L)
    {
      lastRequestTime = (l2 + l1);
      handler.postDelayed(new AuditudeResolver.2(this), l1);
      return;
    }
  }
  
  private void trackBeginEventForSequencesInGroup(Group paramGroup)
  {
    paramGroup = paramGroup.getSequenceList();
    if (paramGroup != null)
    {
      paramGroup = paramGroup.iterator();
      while (paramGroup.hasNext())
      {
        Sequence localSequence = (Sequence)paramGroup.next();
        if (auditudeAdResolver != null) {
          auditudeAdResolver.getReportingEngine().onSequenceBegin(localSequence);
        }
      }
    }
  }
  
  private void trackEndEventForSequencesInGroup(Group paramGroup)
  {
    paramGroup = paramGroup.getSequenceList();
    if (paramGroup != null)
    {
      paramGroup = paramGroup.iterator();
      while (paramGroup.hasNext())
      {
        Sequence localSequence = (Sequence)paramGroup.next();
        if (auditudeAdResolver != null) {
          auditudeAdResolver.getReportingEngine().onSequenceEnd(localSequence);
        }
      }
    }
  }
  
  protected boolean doCanResolve(PlacementOpportunity paramPlacementOpportunity)
  {
    AuditudeSettings localAuditudeSettings = extractAuditudeSettings((MetadataNode)paramPlacementOpportunity.getMetadata());
    return (paramPlacementOpportunity.getPlacementInformation().getMode() == PlacementInformation.Mode.INSERT) || ((paramPlacementOpportunity.getPlacementInformation().getMode() == PlacementInformation.Mode.REPLACE) && (localAuditudeSettings != null));
  }
  
  protected ContentTracker doProvideAdTracker()
  {
    if (_auditudeTracker == null) {
      _auditudeTracker = new AuditudeTracker(auditudeAdResolver.getReportingEngine());
    }
    return _auditudeTracker;
  }
  
  /* Error */
  protected void doResolveAds(Metadata paramMetadata, PlacementOpportunity paramPlacementOpportunity)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_2
    //   3: invokevirtual 223	com/adobe/mediacore/timeline/PlacementOpportunity:getPlacementInformation	()Lcom/adobe/mediacore/timeline/advertising/PlacementInformation;
    //   6: invokevirtual 229	com/adobe/mediacore/timeline/advertising/PlacementInformation:getType	()Lcom/adobe/mediacore/timeline/advertising/PlacementInformation$Type;
    //   9: getstatic 238	com/adobe/mediacore/timeline/advertising/PlacementInformation$Type:CUSTOM_TIME_RANGES	Lcom/adobe/mediacore/timeline/advertising/PlacementInformation$Type;
    //   12: invokevirtual 242	com/adobe/mediacore/timeline/advertising/PlacementInformation$Type:equals	(Ljava/lang/Object;)Z
    //   15: ifeq +23 -> 38
    //   18: aload_0
    //   19: aload_2
    //   20: new 774	com/adobe/mediacore/timeline/advertising/customadmarkers/CustomRangeHelper
    //   23: dup
    //   24: aload_1
    //   25: invokespecial 885	com/adobe/mediacore/timeline/advertising/customadmarkers/CustomRangeHelper:<init>	(Lcom/adobe/mediacore/metadata/Metadata;)V
    //   28: invokespecial 887	com/adobe/mediacore/timeline/advertising/auditude/AuditudeResolver:processReplacementRanges	(Lcom/adobe/mediacore/timeline/PlacementOpportunity;Lcom/adobe/mediacore/timeline/advertising/customadmarkers/CustomRangeHelper;)V
    //   31: aload_0
    //   32: invokespecial 138	com/adobe/mediacore/timeline/advertising/auditude/AuditudeResolver:startConsumer	()V
    //   35: aload_0
    //   36: monitorexit
    //   37: return
    //   38: aload_0
    //   39: aload_1
    //   40: aload_2
    //   41: invokespecial 889	com/adobe/mediacore/timeline/advertising/auditude/AuditudeResolver:execResolveAds	(Lcom/adobe/mediacore/metadata/Metadata;Lcom/adobe/mediacore/timeline/PlacementOpportunity;)V
    //   44: goto -13 -> 31
    //   47: astore_1
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_1
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	AuditudeResolver
    //   0	52	1	paramMetadata	Metadata
    //   0	52	2	paramPlacementOpportunity	PlacementOpportunity
    // Exception table:
    //   from	to	target	type
    //   2	31	47	finally
    //   31	35	47	finally
    //   38	44	47	finally
  }
  
  public void onPrefetchComplete(ArrayList paramArrayList)
  {
    Object localObject2;
    Object localObject1;
    if ((paramArrayList != null) && (paramArrayList.size() > 0))
    {
      paramArrayList = paramArrayList.iterator();
      while (paramArrayList.hasNext())
      {
        localObject2 = (AdPluginEvent)paramArrayList.next();
        localObject1 = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.AD_RESOLVER_RETURNED_NO_ADS, "Ad Resolver Returned no ads");
        localObject2 = ((AdPluginEvent)localObject2).getData();
        if (localObject2 != null)
        {
          MetadataNode localMetadataNode = new MetadataNode();
          localMetadataNode.setValue("AdId", ((HashMap)localObject2).get("AdId").toString());
          localMetadataNode.setValue("InternalError", ((HashMap)localObject2).get("InternalErrorId").toString());
          localMetadataNode.setValue("Description", ((HashMap)localObject2).get("Description").toString());
          ((MediaPlayerNotification.Warning)localObject1).setMetadata(localMetadataNode);
          notifyResolveWarning((MediaPlayerNotification.Warning)localObject1);
        }
      }
    }
    loadingGroupCount -= 1;
    if (loadingGroupCount <= 0)
    {
      localObject1 = extractAdBreakPlacements();
      localObject2 = new ArrayList();
      paramArrayList = (ArrayList)localObject2;
      if (_placementOpportunity != null)
      {
        paramArrayList = (ArrayList)localObject2;
        if (_placementOpportunity.getPlacementInformation() != null)
        {
          paramArrayList = (ArrayList)localObject2;
          if (_auditudeRequest != null)
          {
            paramArrayList = _auditudeRequest.getPlacementInformations();
            if ((localObject1 == null) || (((List)localObject1).size() <= 0) || (!(((List)localObject1).get(0) instanceof NopTimelineOperation))) {
              break label299;
            }
            paramArrayList = (ArrayList)localObject1;
          }
        }
      }
    }
    for (;;)
    {
      _logger.i(LOG_TAG + "#createAdBreakFor", "Number of ad breaks returned : " + String.valueOf(paramArrayList.size()));
      notifyResolveComplete(paramArrayList);
      return;
      label299:
      if ((_placementOpportunity.getPlacementInformation().getType() == PlacementInformation.Type.PRE_ROLL) || ((((PlacementInformation)paramArrayList.get(0)).getType() == PlacementInformation.Type.PRE_ROLL) && (paramArrayList.size() == 1) && (((PlacementInformation)paramArrayList.get(0)).getDuration() == -1L)))
      {
        _logger.i(LOG_TAG + "#createAdBreakFor", "Input : " + _placementOpportunity.toString());
        paramArrayList = new ArrayList();
        if (((List)localObject1).size() > 0)
        {
          localObject1 = ((AdBreakPlacement)((List)localObject1).get(0)).getAdBreak().cloneFor(_placementOpportunity.getPlacementInformation());
          _logger.i(LOG_TAG + "#createAdBreakFor", "Output : " + ((AdBreak)localObject1).toString());
          paramArrayList.add(new AdBreakPlacement((AdBreak)localObject1, createPlacementInformation((AdBreak)localObject1)));
        }
      }
      else
      {
        paramArrayList = (ArrayList)localObject1;
      }
    }
  }
  
  public void onTimeUpdate(long paramLong1, long paramLong2)
  {
    Group localGroup = breakAtPlayheadTime(paramLong1);
    _logger.i(LOG_TAG + "#onTimeUpdate", "selected group: " + localGroup);
    if ((_currentEmptyAdBreak != null) && (_currentEmptyAdBreak != localGroup))
    {
      _logger.i(LOG_TAG + "#onTimeUpdate", "group end: " + _currentEmptyAdBreak);
      trackEndEventForSequencesInGroup(_currentEmptyAdBreak);
      _currentEmptyAdBreak = null;
    }
    if ((localGroup != null) && (_currentEmptyAdBreak != localGroup))
    {
      _currentEmptyAdBreak = localGroup;
      _logger.i(LOG_TAG + "#onTimeUpdate", "group begin: " + localGroup);
      trackBeginEventForSequencesInGroup(localGroup);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.auditude.AuditudeResolver
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */