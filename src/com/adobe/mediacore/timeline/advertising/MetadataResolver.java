package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.MediaPlayerNotification.Error;
import com.adobe.mediacore.MediaPlayerNotification.ErrorCode;
import com.adobe.mediacore.MediaResource;
import com.adobe.mediacore.MediaResource.Type;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import com.adobe.mediacore.utils.NumberUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MetadataResolver
  extends ContentResolver
{
  private static final int DEFAULT_POSTROLL_TIME = -2;
  private static final int DEFAULT_PREROLL_TIME = 0;
  private static final String JSON_METADATA_KEY = "json_metadata";
  private static final String LOG_TAG = "[PSDK]::[MetadataAd]::" + MetadataResolver.class.getSimpleName();
  private static final String NODE_NAME_ADBREAK_ADLIST = "ad-list";
  private static final String NODE_NAME_ADBREAK_REPLACE = "replace";
  private static final String NODE_NAME_ADBREAK_TAG = "tag";
  private static final String NODE_NAME_ADBREAK_TIME = "time";
  private static final String NODE_NAME_AD_DURATION = "duration";
  private static final String NODE_NAME_AD_TAG = "tag";
  private static final String NODE_NAME_AD_URL = "url";
  private static final String NODE_NAME_CLICK_INFO = "click-info";
  private static final String NODE_NAME_ID = "id";
  private static final String NODE_NAME_TITLE = "title";
  private static final String NODE_NAME_URL = "url";
  private AdBreak _availableAdBreak = null;
  private Iterator _availableAdIterator = null;
  private long _linearTagIndex = 0L;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private int _nextAvailableAdId = 3000;
  private final List _positionedAdBreakPlacements = new ArrayList();
  
  private List createAdBreakPlacementsFor(PlacementInformation paramPlacementInformation)
  {
    _logger.i(LOG_TAG + "#createAdBreakPlacementFor", "Input : " + paramPlacementInformation.toString());
    ArrayList localArrayList1 = new ArrayList();
    long l = paramPlacementInformation.getDuration();
    if (_availableAdBreak != null)
    {
      Object localObject = getNextLinearTag();
      ArrayList localArrayList2 = new ArrayList();
      while (l > 0L)
      {
        Ad localAd = getAdForDuration(l);
        if (localAd != null)
        {
          localArrayList2.add(localAd);
          l -= localAd.getDuration();
        }
        else
        {
          l = 0L;
        }
      }
      localObject = AdBreak.createAdBreak(localArrayList2, paramPlacementInformation.getTime(), paramPlacementInformation.getDuration(), (String)localObject);
      _logger.i(LOG_TAG + "#createAdBreakPlacementFor", "Output : " + ((AdBreak)localObject).toString());
      localArrayList1.add(new AdBreakPlacement((AdBreak)localObject, paramPlacementInformation));
    }
    _logger.i(LOG_TAG + "#createAdBreakPlacementFor", "Number of ad breaks returned : " + String.valueOf(localArrayList1.size()));
    return localArrayList1;
  }
  
  private List extractAdBreakPlacements(String paramString)
    throws JSONException
  {
    paramString = new JSONArray(paramString);
    return new AdvertisingJSONFactory(null).createAdBreakPlacements(paramString);
  }
  
  private Metadata extractMetadata(Metadata paramMetadata)
  {
    if (paramMetadata == null) {}
    while (!(paramMetadata instanceof MetadataNode)) {
      return null;
    }
    return ((MetadataNode)paramMetadata).getNode(DefaultMetadataKeys.ADVERTISING_METADATA.getValue());
  }
  
  private Ad getAdForDuration(long paramLong)
  {
    int i = 0;
    for (;;)
    {
      if (_availableAdIterator == null) {
        _availableAdIterator = _availableAdBreak.adsIterator();
      }
      Object localObject;
      if (!_availableAdIterator.hasNext()) {
        if (i == 0)
        {
          _availableAdIterator = _availableAdBreak.adsIterator();
          i = 1;
          if (_availableAdIterator != null) {
            break label70;
          }
          localObject = null;
        }
      }
      label70:
      Ad localAd;
      do
      {
        return (Ad)localObject;
        _availableAdIterator = null;
        break;
        localAd = (Ad)_availableAdIterator.next();
        localObject = localAd;
      } while (localAd.getDuration() <= paramLong);
    }
  }
  
  private String getNextLinearTag()
  {
    _linearTagIndex += 1L;
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("linear_").append(_linearTagIndex);
    return localStringBuilder.toString();
  }
  
  private void handleInvalidMetadata(Exception paramException)
  {
    _logger.w(LOG_TAG + "#handleInvalidMetadata", paramException.getMessage());
    MediaPlayerNotification.Error localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.AD_RESOLVER_METADATA_INVALID, "Invalid JSON metadata.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("DESCRIPTION", paramException.getMessage());
    localError.setMetadata(localMetadataNode);
    notifyResolveError(localError);
  }
  
  private boolean isAlreadyPositioned(AdBreakPlacement paramAdBreakPlacement)
  {
    return paramAdBreakPlacement.getTime() >= 0L;
  }
  
  private void processMetadata(Metadata paramMetadata)
  {
    for (;;)
    {
      try
      {
        paramMetadata = paramMetadata.getValue("json_metadata");
        if (paramMetadata == null) {
          continue;
        }
        localObject1 = extractAdBreakPlacements(paramMetadata);
        paramMetadata = new ArrayList();
        localObject1 = ((List)localObject1).iterator();
      }
      catch (JSONException paramMetadata)
      {
        Object localObject1;
        handleInvalidMetadata(paramMetadata);
        return;
        Object localObject2 = ((AdBreakPlacement)localObject2).getAdBreak().adsIterator();
        if (!((Iterator)localObject2).hasNext()) {
          continue;
        }
        paramMetadata.add(((Iterator)localObject2).next());
        continue;
      }
      catch (IllegalArgumentException paramMetadata)
      {
        handleInvalidMetadata(paramMetadata);
        return;
      }
      if (!((Iterator)localObject1).hasNext()) {
        break label122;
      }
      localObject2 = (AdBreakPlacement)((Iterator)localObject1).next();
      if (!isAlreadyPositioned((AdBreakPlacement)localObject2)) {
        continue;
      }
      _positionedAdBreakPlacements.add(localObject2);
    }
    label122:
    while (paramMetadata.size() <= 0) {}
    _availableAdBreak = AdBreak.createAdBreak(paramMetadata, -1L, 0L, "availableAdBreak");
  }
  
  protected boolean doCanResolve(PlacementOpportunity paramPlacementOpportunity)
  {
    return paramPlacementOpportunity.getPlacementInformation().getMode() == PlacementInformation.Mode.INSERT;
  }
  
  protected ContentTracker doProvideAdTracker()
  {
    return null;
  }
  
  protected void doResolveAds(Metadata paramMetadata, PlacementOpportunity paramPlacementOpportunity)
  {
    if ((_positionedAdBreakPlacements.size() == 0) || (_availableAdBreak == null)) {
      processMetadata(extractMetadata(paramMetadata));
    }
    if ((paramPlacementOpportunity.getPlacementInformation() == null) || (paramPlacementOpportunity.getPlacementInformation().getType() == PlacementInformation.Type.SERVER_MAP)) {
      paramMetadata = _positionedAdBreakPlacements;
    }
    for (;;)
    {
      notifyResolveComplete(paramMetadata);
      return;
      if (paramPlacementOpportunity.getPlacementInformation().getType() == PlacementInformation.Type.PRE_ROLL)
      {
        if (_positionedAdBreakPlacements.size() > 0)
        {
          AdBreak localAdBreak = ((AdBreakPlacement)_positionedAdBreakPlacements.get(0)).getAdBreak();
          paramMetadata = new ArrayList();
          paramMetadata.add(new AdBreakPlacement(localAdBreak.cloneFor(paramPlacementOpportunity.getPlacementInformation()), paramPlacementOpportunity.getPlacementInformation()));
        }
        else
        {
          paramMetadata = Collections.emptyList();
        }
      }
      else {
        paramMetadata = createAdBreakPlacementsFor(paramPlacementOpportunity.getPlacementInformation());
      }
    }
  }
  
  private class AdvertisingJSONFactory
  {
    private AdvertisingJSONFactory() {}
    
    private AdClick createAdClick(JSONObject paramJSONObject)
      throws JSONException
    {
      if (paramJSONObject.toString().contains("click-info"))
      {
        paramJSONObject = paramJSONObject.getJSONArray("click-info").getJSONObject(0);
        String str1 = paramJSONObject.getString("title");
        String str2 = paramJSONObject.getString("url");
        return new AdClick(paramJSONObject.getString("id"), str1, str2);
      }
      return new AdClick("", "", "");
    }
    
    private AdAsset createPrimaryAdAsset(JSONObject paramJSONObject, long paramLong, int paramInt)
      throws JSONException
    {
      return new AdAsset(paramInt, paramLong, MediaResource.createFromUrl(paramJSONObject.getString("url"), null), createAdClick(paramJSONObject), null, "");
    }
    
    private int getNextTimelineId()
    {
      try
      {
        int i = MetadataResolver.access$108(MetadataResolver.this);
        return i;
      }
      finally
      {
        localObject = finally;
        throw ((Throwable)localObject);
      }
    }
    
    public Ad createAd(JSONObject paramJSONObject)
      throws JSONException
    {
      long l = NumberUtils.parseLong(paramJSONObject.getString("duration"), -1L);
      int i = getNextTimelineId();
      paramJSONObject = createPrimaryAdAsset(paramJSONObject, l, i);
      return Ad.createAd(MediaResource.Type.HLS, l, i, paramJSONObject, new ArrayList(), null, false);
    }
    
    public AdBreakPlacement createAdBreakPlacement(JSONObject paramJSONObject)
      throws JSONException
    {
      String str = paramJSONObject.getString("tag");
      long l1 = NumberUtils.parseNumber(paramJSONObject.getString("time"), -1L);
      long l2 = NumberUtils.parseNumber(paramJSONObject.getString("replace"), 0L);
      List localList = createAds(paramJSONObject.getJSONArray("ad-list"));
      paramJSONObject = PlacementInformation.Type.MID_ROLL;
      if (l1 == 0L) {
        paramJSONObject = PlacementInformation.Type.PRE_ROLL;
      }
      paramJSONObject = new PlacementInformation(paramJSONObject, l1, l2);
      return new AdBreakPlacement(AdBreak.createAdBreak(localList, l1, l2, str), paramJSONObject);
    }
    
    public List createAdBreakPlacements(JSONArray paramJSONArray)
      throws JSONException
    {
      ArrayList localArrayList = new ArrayList();
      int j = paramJSONArray.length();
      if (j > 0)
      {
        int i = 0;
        while (i < j)
        {
          localArrayList.add(createAdBreakPlacement(paramJSONArray.getJSONObject(i)));
          i += 1;
        }
      }
      return localArrayList;
    }
    
    public List createAds(JSONArray paramJSONArray)
      throws JSONException
    {
      ArrayList localArrayList = new ArrayList();
      int j = paramJSONArray.length();
      if (j > 0)
      {
        int i = 0;
        while (i < j)
        {
          localArrayList.add(createAd(paramJSONArray.getJSONObject(i)));
          i += 1;
        }
      }
      return localArrayList;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.MetadataResolver
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */