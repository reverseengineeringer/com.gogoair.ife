package com.auditude.ads.network.vast;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.event.AdPluginEvent;
import com.auditude.ads.model.Ad;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.Click;
import com.auditude.ads.model.IClick;
import com.auditude.ads.model.LinearAsset;
import com.auditude.ads.model.NonLinearAsset;
import com.auditude.ads.model.OnPageAsset;
import com.auditude.ads.model.media.MediaFile;
import com.auditude.ads.model.tracking.TrackingEvent;
import com.auditude.ads.model.tracking.TrackingUrl;
import com.auditude.ads.network.NetworkAdLoader;
import com.auditude.ads.network.vast.loader.VASTXMLLoader;
import com.auditude.ads.network.vast.model.VASTAd;
import com.auditude.ads.network.vast.model.VASTAdCreativeBase;
import com.auditude.ads.network.vast.model.VASTClick;
import com.auditude.ads.network.vast.model.VASTCompanionCreative;
import com.auditude.ads.network.vast.model.VASTDocument;
import com.auditude.ads.network.vast.model.VASTInlineAd;
import com.auditude.ads.network.vast.model.VASTLinearCreative;
import com.auditude.ads.network.vast.model.VASTMediaFile;
import com.auditude.ads.network.vast.model.VASTNonLinearCreative;
import com.auditude.ads.network.vast.model.VASTTrackingEvent;
import com.auditude.ads.network.vast.model.VASTTrackingUrl;
import com.auditude.ads.network.vast.model.VASTWrapperAd;
import com.auditude.ads.network.vast.repackaging.VastAssetRepackagerInfo;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.event.Event;
import com.auditude.ads.util.event.IEventDispatcher;
import com.auditude.ads.util.event.IEventListener;
import com.auditude.ads.util.log.ILogger;
import com.auditude.ads.util.log.Log;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public class VASTAdLoader
  extends NetworkAdLoader
  implements IEventListener
{
  private VASTXMLLoader loader;
  
  private void addVASTProgressTracking(Asset paramAsset, int paramInt, VASTTrackingEvent paramVASTTrackingEvent)
  {
    if ((paramVASTTrackingEvent == null) || (paramVASTTrackingEvent.getTrackingUrls() == null) || (paramVASTTrackingEvent.getTrackingUrls().isEmpty())) {
      return;
    }
    paramVASTTrackingEvent = paramVASTTrackingEvent.getTrackingUrls();
    switch (paramInt)
    {
    default: 
      paramAsset = null;
    }
    while (paramAsset != null)
    {
      paramVASTTrackingEvent = paramVASTTrackingEvent.iterator();
      while (paramVASTTrackingEvent.hasNext())
      {
        VASTTrackingUrl localVASTTrackingUrl = (VASTTrackingUrl)paramVASTTrackingEvent.next();
        if (!StringUtil.isNullOrEmpty(localVASTTrackingUrl.getUrl()))
        {
          TrackingUrl localTrackingUrl = new TrackingUrl(localVASTTrackingUrl.getUrl(), paramAsset.getType());
          localTrackingUrl.setOffset(localVASTTrackingUrl.getOffset());
          localTrackingUrl.setOffsetIsPercent(localVASTTrackingUrl.getOffsetIsPercent());
          paramAsset.addTrackingUrl(localTrackingUrl);
        }
      }
      paramAsset = paramAsset.getTrackingEventByType("start", true);
      continue;
      paramAsset = paramAsset.getTrackingEventByType("firstquartile", true);
      continue;
      paramAsset = paramAsset.getTrackingEventByType("midpoint", true);
      continue;
      paramAsset = paramAsset.getTrackingEventByType("thirdquartile", true);
      continue;
      paramAsset = paramAsset.getTrackingEventByType("complete", true);
    }
  }
  
  private void addVASTTracking(Asset paramAsset, VASTTrackingEvent paramVASTTrackingEvent)
  {
    if (paramVASTTrackingEvent == null) {
      return;
    }
    addVASTTrackingUrls(paramAsset, paramVASTTrackingEvent.getTrackingUrls(), type);
  }
  
  private void addVASTTrackingUrls(Asset paramAsset, ArrayList paramArrayList, String paramString)
  {
    if ((paramArrayList == null) || (paramArrayList.isEmpty())) {}
    for (;;)
    {
      return;
      paramAsset = paramAsset.getTrackingEventByType(paramString, true);
      if (paramAsset != null)
      {
        paramArrayList = paramArrayList.iterator();
        while (paramArrayList.hasNext())
        {
          paramString = (VASTTrackingUrl)paramArrayList.next();
          if (!StringUtil.isNullOrEmpty(paramString.getUrl()))
          {
            TrackingUrl localTrackingUrl = new TrackingUrl(paramString.getUrl(), paramAsset.getType());
            localTrackingUrl.setOffset(paramString.getOffset());
            localTrackingUrl.setOffsetIsPercent(paramString.getOffsetIsPercent());
            paramAsset.addTrackingUrl(localTrackingUrl);
          }
        }
      }
    }
  }
  
  private ArrayList getCompanionAssets(VASTInlineAd paramVASTInlineAd)
  {
    Object localObject1 = paramVASTInlineAd.getCompanionAds();
    if ((localObject1 != null) && (((ArrayList)localObject1).size() > 0))
    {
      paramVASTInlineAd = new ArrayList();
      localObject1 = ((ArrayList)localObject1).iterator();
      if (!((Iterator)localObject1).hasNext()) {
        return paramVASTInlineAd;
      }
      VASTCompanionCreative localVASTCompanionCreative = (VASTCompanionCreative)((Iterator)localObject1).next();
      OnPageAsset localOnPageAsset = new OnPageAsset(getAd());
      localOnPageAsset.setFormat("onpage");
      setAssetProperties(localOnPageAsset, localVASTCompanionCreative);
      localOnPageAsset.setAltText(altText);
      Object localObject2 = new Click(localOnPageAsset);
      if (!StringUtil.isNullOrEmpty(clickThroughUrl)) {
        ((Click)localObject2).setUrl(clickThroughUrl);
      }
      Iterator localIterator;
      if (localVASTCompanionCreative.getClickTrackingUrls() != null) {
        localIterator = localVASTCompanionCreative.getClickTrackingUrls().iterator();
      }
      for (;;)
      {
        if (!localIterator.hasNext())
        {
          localOnPageAsset.setClick((IClick)localObject2);
          localObject2 = new MediaFile();
          source = url;
          width = localOnPageAsset.getWidth();
          height = localOnPageAsset.getHeight();
          localOnPageAsset.AddMediaFile((MediaFile)localObject2);
          paramVASTInlineAd.add(localOnPageAsset);
          break;
        }
        ((Click)localObject2).addTrackingUrlForType(new TrackingUrl((String)localIterator.next(), "click"), "click");
      }
    }
    return null;
  }
  
  private Asset getLinearAsset(VASTInlineAd paramVASTInlineAd)
  {
    int j = -1;
    if (linearAd == null) {
      return null;
    }
    LinearAsset localLinearAsset = new LinearAsset(getAd());
    errorUrl = errorUrl;
    int i = j;
    if (paramVASTInlineAd.getSkipOffset() != null)
    {
      i = j;
      if (paramVASTInlineAd.getSkipOffset().length() > 0)
      {
        if (!paramVASTInlineAd.getSkipOffset().matches("(^[-.0-9]+:[-.0-9]+:[-.0-9]+$)")) {
          break label465;
        }
        i = StringUtil.parseDuration(paramVASTInlineAd.getSkipOffset()) * 1000;
      }
    }
    localLinearAsset.setSkipOffset(i);
    VASTLinearCreative localVASTLinearCreative = linearAd;
    localLinearAsset.setDurationInMillis(duration * 1000);
    localLinearAsset.setID(id);
    localLinearAsset.setApiFramework(apiFramework);
    localLinearAsset.setAdParameters(adParameters);
    if ((localVASTLinearCreative.getMediaFiles() != null) && (localVASTLinearCreative.getMediaFiles().size() > 0))
    {
      localObject1 = (VASTMediaFile)localVASTLinearCreative.getMediaFiles().get(0);
      if (!(localObject1 instanceof VASTMediaFile)) {
        break label549;
      }
      label178:
      if (localObject1 != null)
      {
        localLinearAsset.setWidth(width);
        localLinearAsset.setHeight(height);
      }
    }
    Object localObject1 = localVASTLinearCreative.getMediaFiles();
    label230:
    Object localObject2;
    if ((localObject1 != null) && (((ArrayList)localObject1).size() > 0))
    {
      localObject1 = ((ArrayList)localObject1).iterator();
      if (((Iterator)localObject1).hasNext()) {}
    }
    else
    {
      localLinearAsset.setFormat("video");
      if (click != null)
      {
        localObject1 = new Click(localLinearAsset);
        ((Click)localObject1).setUrl(click.getUrl());
        localObject2 = click.getTrackingUrls();
        if (localObject2 != null) {
          localObject2 = ((ArrayList)localObject2).iterator();
        }
      }
    }
    for (;;)
    {
      if (!((Iterator)localObject2).hasNext())
      {
        localLinearAsset.setClick((IClick)localObject1);
        addVASTTrackingUrls(localLinearAsset, paramVASTInlineAd.getImpressionUrls(), "creativeview");
        addVASTTracking(localLinearAsset, localVASTLinearCreative.getTrackingEventByType("creativeview"));
        addVASTProgressTracking(localLinearAsset, 0, localVASTLinearCreative.getTrackingEventByType("start"));
        addVASTProgressTracking(localLinearAsset, 25, localVASTLinearCreative.getTrackingEventByType("firstquartile"));
        addVASTProgressTracking(localLinearAsset, 50, localVASTLinearCreative.getTrackingEventByType("midpoint"));
        addVASTProgressTracking(localLinearAsset, 75, localVASTLinearCreative.getTrackingEventByType("thirdquartile"));
        addVASTProgressTracking(localLinearAsset, 100, localVASTLinearCreative.getTrackingEventByType("complete"));
        addVASTTracking(localLinearAsset, localVASTLinearCreative.getTrackingEventByType("progress"));
        addVASTTracking(localLinearAsset, localVASTLinearCreative.getTrackingEventByType("vasterror"));
        addVASTTracking(localLinearAsset, localVASTLinearCreative.getTrackingEventByType("skip"));
        return localLinearAsset;
        label465:
        i = j;
        if (!paramVASTInlineAd.getSkipOffset().contains("%")) {
          break;
        }
        i = j;
        if (linearAd == null) {
          break;
        }
        i = j;
        if (linearAd.duration <= 0) {
          break;
        }
        i = StringUtil.convertToInt(paramVASTInlineAd.getSkipOffset().replaceAll("%", ""));
        float f = linearAd.duration;
        i = Math.round(i * f / 100.0F * 1000.0F);
        break;
        label549:
        localObject1 = null;
        break label178;
        localObject2 = (VASTMediaFile)((Iterator)localObject1).next();
        localObject3 = new MediaFile();
        id = id;
        bitrate = bitrate;
        width = width;
        height = height;
        source = url;
        mimeType = type;
        scalable = scalable;
        maintainAspectRatio = maintainAspectRatio;
        delivery = delivery;
        apiFramework = apiFramework;
        localLinearAsset.AddMediaFile((MediaFile)localObject3);
        break label230;
      }
      Object localObject3 = (String)((Iterator)localObject2).next();
      if (!StringUtil.isNullOrEmpty((String)localObject3)) {
        ((Click)localObject1).addTrackingUrlForType(new TrackingUrl((String)localObject3, "click"), "click");
      }
    }
  }
  
  private ArrayList getNonLinearAssets(VASTInlineAd paramVASTInlineAd)
  {
    Object localObject1 = paramVASTInlineAd.getNonLinearAds();
    ArrayList localArrayList;
    NonLinearAsset localNonLinearAsset;
    if ((localObject1 != null) && (((ArrayList)localObject1).size() > 0))
    {
      localArrayList = new ArrayList();
      localObject1 = ((ArrayList)localObject1).iterator();
      int i = 0;
      if (!((Iterator)localObject1).hasNext()) {
        return localArrayList;
      }
      VASTNonLinearCreative localVASTNonLinearCreative = (VASTNonLinearCreative)((Iterator)localObject1).next();
      localNonLinearAsset = new NonLinearAsset(getAd());
      localNonLinearAsset.setFormat("overlay");
      setAssetProperties(localNonLinearAsset, localVASTNonLinearCreative);
      Object localObject2 = new MediaFile();
      source = url;
      apiFramework = apiFramework;
      width = width;
      height = height;
      localNonLinearAsset.AddMediaFile((MediaFile)localObject2);
      localNonLinearAsset.setApiFramework(apiFramework);
      if (!StringUtil.isNullOrEmpty(clickThroughUrl))
      {
        localObject2 = new Click(localNonLinearAsset);
        ((Click)localObject2).setUrl(clickThroughUrl);
        localNonLinearAsset.setClick((IClick)localObject2);
      }
      if ((linearAd == null) || (i != 0)) {
        break label232;
      }
      addVASTTrackingUrls(localNonLinearAsset, paramVASTInlineAd.getImpressionUrls(), "creativeview");
      i = 1;
    }
    label232:
    for (;;)
    {
      localArrayList.add(localNonLinearAsset);
      break;
      return null;
    }
  }
  
  private void onLoadComplete(IEventDispatcher paramIEventDispatcher)
  {
    paramIEventDispatcher.removeEventListener("complete", this);
    paramIEventDispatcher.removeEventListener("failed", this);
    parseVastDocument(loader.getDocument());
    notifyComplete();
  }
  
  private void onLoadFailed(IEventDispatcher paramIEventDispatcher)
  {
    paramIEventDispatcher.removeEventListener("complete", this);
    paramIEventDispatcher.removeEventListener("failed", this);
    paramIEventDispatcher = new HashMap();
    Ad localAd = getAd();
    if (localAd != null) {
      paramIEventDispatcher.put("AdId", localAd.getID());
    }
    paramIEventDispatcher.put("InternalErrorId", Integer.valueOf(1109));
    paramIEventDispatcher.put("Description", "Connection failed on:" + getSource());
    notifyError(new AdPluginEvent("NetworkAdResponseEmpty", paramIEventDispatcher));
    logError(1109, "Connection failed on:" + getSource());
    notifyComplete();
  }
  
  private void parseVastDocument(VASTDocument paramVASTDocument)
  {
    ArrayList localArrayList1 = new ArrayList();
    Object localObject1;
    if (paramVASTDocument != null)
    {
      localObject1 = paramVASTDocument.getAds();
      if ((localObject1 != null) && (((ArrayList)localObject1).size() > 0))
      {
        localObject1 = ((ArrayList)localObject1).iterator();
        if (((Iterator)localObject1).hasNext()) {
          break label205;
        }
      }
    }
    if (localArrayList1.size() > 0)
    {
      localObject1 = localArrayList1;
      label51:
      setResult(localObject1);
      if ((localArrayList1 != null) && (paramVASTDocument != null) && ((!localArrayList1.isEmpty()) || (!getAd().getDispatchError().booleanValue()) || (reachedMaxWrapper))) {
        break label397;
      }
      paramVASTDocument = new HashMap();
      localObject1 = getAd();
      if (localObject1 != null) {
        paramVASTDocument.put("AdId", ((Ad)localObject1).getID());
      }
      paramVASTDocument.put("InternalErrorId", Integer.valueOf(1108));
      paramVASTDocument.put("Description", "No ads returned from:" + getSource());
      notifyError(new AdPluginEvent("NetworkAdResponseEmpty", paramVASTDocument));
      logError(1108, "No ads returned from:" + getSource());
    }
    label205:
    label397:
    while ((paramVASTDocument == null) || (!reachedMaxWrapper) || (!getAd().getDispatchError().booleanValue()))
    {
      return;
      Object localObject2 = (VASTAd)((Iterator)localObject1).next();
      if ((localObject2 == null) || (((VASTAd)localObject2).getInlineAds() == null)) {
        break;
      }
      localObject2 = ((VASTAd)localObject2).getInlineAds().iterator();
      while (((Iterator)localObject2).hasNext())
      {
        Object localObject3 = (VASTInlineAd)((Iterator)localObject2).next();
        ArrayList localArrayList2 = new ArrayList();
        Object localObject4 = getLinearAsset((VASTInlineAd)localObject3);
        if (localObject4 != null)
        {
          ((Asset)localObject4).setNetworkAdId(((VASTInlineAd)localObject3).getNetworkAdId());
          ((Asset)localObject4).setCompanionRequired(companionRequired);
          if (localObject4 != null) {
            localArrayList2.add(localObject4);
          }
          localObject4 = getNonLinearAssets((VASTInlineAd)localObject3);
          if ((localObject4 != null) && (((ArrayList)localObject4).size() > 0)) {
            localArrayList2.addAll((Collection)localObject4);
          }
          localObject3 = getCompanionAssets((VASTInlineAd)localObject3);
          if ((localObject3 != null) && (((ArrayList)localObject3).size() > 0)) {
            localArrayList2.addAll((Collection)localObject3);
          }
          if (localArrayList2.size() > 0) {
            localArrayList1.add(localArrayList2);
          }
        }
      }
      break;
      localObject1 = null;
      break label51;
    }
    logError(1110, "");
  }
  
  private void setAssetProperties(Asset paramAsset, VASTAdCreativeBase paramVASTAdCreativeBase)
  {
    paramAsset.setID(id);
    paramAsset.setWidth(width);
    paramAsset.setHeight(height);
    paramAsset.setAdParameters(adParameters);
    paramAsset.setCreativeType(creativeType);
    if (StringUtil.isNullOrEmpty(resourceType)) {}
    for (String str = "static";; str = resourceType.toLowerCase())
    {
      paramAsset.setResourceType(str);
      addVASTTracking(paramAsset, paramVASTAdCreativeBase.getTrackingEventByType("creativeview"));
      return;
    }
  }
  
  public void cancel() {}
  
  public void load()
  {
    boolean bool4 = false;
    super.load();
    AdSettings localAdSettings = AuditudeEnv.getInstance().getAdSettings();
    if (localAdSettings.getProperty("repackageCreativeEnabled") != null) {}
    for (boolean bool1 = Boolean.valueOf(localAdSettings.getProperty("repackageCreativeEnabled").toString()).booleanValue();; bool1 = false)
    {
      if (localAdSettings.getProperty("fallbackOnInvalidCreative") != null) {}
      for (boolean bool2 = Boolean.valueOf(localAdSettings.getProperty("fallbackOnInvalidCreative").toString()).booleanValue();; bool2 = false)
      {
        if ((!bool1) && (localAdSettings.getProperty("validMimeTypes") != null)) {}
        for (Object localObject1 = (ArrayList)localAdSettings.getProperty("validMimeTypes");; localObject1 = null)
        {
          Ad localAd = getAd();
          Object localObject2 = Boolean.valueOf(false);
          if (localAd != null) {
            localObject2 = Boolean.valueOf(localAd.isRepackagingEnabled());
          }
          boolean bool3 = bool4;
          if (bool1)
          {
            bool3 = bool4;
            if (((Boolean)localObject2).booleanValue()) {
              bool3 = true;
            }
          }
          loader = new VASTXMLLoader(6, (ArrayList)localObject1, new VastAssetRepackagerInfo(Boolean.valueOf(bool3), (String)localAdSettings.getProperty("repackageCreativeFormat"), localAdSettings.getDomain(), localAdSettings.getZoneId()), Boolean.valueOf(bool2));
          loader.addEventListener("complete", this);
          loader.addEventListener("failed", this);
          if (localAd != null)
          {
            localObject1 = new VASTWrapperAd();
            allowMultipleAds = localAd.getAllowMultipleAds();
            followAdditionalWrappers = localAd.getFollowRedirects();
            localObject2 = new VASTAd(localAd.getID(), Boolean.valueOf(bool2));
            ((VASTAd)localObject2).setIsFromVmapDoc(localAd.getIsFromVmapDoc());
            ((VASTAd)localObject2).setWrapperAd((VASTWrapperAd)localObject1);
            loader.State = localObject2;
          }
          localObject1 = getSource();
          if (((localObject1 instanceof String)) && (!StringUtil.isNullOrEmpty((String)localObject1))) {
            Log.getLogger().info("Sending network ad request to: " + localObject1);
          }
          loader.init(localObject1);
          return;
        }
      }
    }
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if (paramString.equalsIgnoreCase("complete"))
    {
      onLoadComplete(((Event)paramObject).getOwner());
      return;
    }
    if (paramString.equalsIgnoreCase("failed"))
    {
      onLoadFailed(((Event)paramObject).getOwner());
      return;
    }
    notifyComplete();
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.VASTAdLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */