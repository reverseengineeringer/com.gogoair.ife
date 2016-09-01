package com.auditude.ads.session;

import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.model.Ad;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.IAsset;
import com.auditude.ads.model.ILinearAsset;
import com.auditude.ads.model.media.MediaFile;
import com.auditude.ads.model.smil.Group;
import com.auditude.ads.model.smil.Par;
import com.auditude.ads.model.smil.Sequence;
import com.auditude.ads.repackaging.AssetRepackager;
import com.auditude.ads.repackaging.AssetRepackager.AssetRepackagingCompletionListener;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.event.IEventListener;
import com.auditude.ads.view.ViewManager;
import com.auditude.ads.view.ViewManagerEvent;
import com.auditude.ads.view.model.AdViewSource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class BreakManager
  extends GroupManager
  implements AssetRepackager.AssetRepackagingCompletionListener, IEventListener
{
  AssetRepackager assetRepackager;
  AdViewSource currentAdViewSource;
  
  public BreakManager(APIBridge paramAPIBridge, ViewManager paramViewManager, AdSettings paramAdSettings)
  {
    super(paramAPIBridge, paramViewManager, paramAdSettings);
    paramViewManager.addEventListener("viewManagerEvent", this);
  }
  
  private void checkAssetDaisyChaining(IAsset paramIAsset)
  {
    if ((paramIAsset instanceof ILinearAsset)) {
      if (!(paramIAsset instanceof Asset)) {
        break label68;
      }
    }
    for (;;)
    {
      paramIAsset = ((Asset)paramIAsset).getAuditudeParams();
      if ((paramIAsset != null) && (paramIAsset.containsKey("daisy_chaining")) && ("conditional".equals((String)paramIAsset.get("daisy_chaining"))) && (getGroup() != null)) {
        getGroup().setSkipCurrentSequence(true);
      }
      return;
      label68:
      paramIAsset = null;
    }
  }
  
  private void checkParDaisyChaining(HashMap paramHashMap)
  {
    if ((paramHashMap != null) && (paramHashMap.containsKey("daisy_chaining")) && ("never".equals((String)paramHashMap.get("daisy_chaining"))) && (getGroup() != null)) {
      getGroup().setSkipCurrentSequence(true);
    }
  }
  
  private boolean hasAvailableDuration(ILinearAsset paramILinearAsset)
  {
    return (getPar() != null) && (getPar().getSequence() != null) && (getPar().getSequence().getRemainingMaxAdDuration() >= paramILinearAsset.getDurationInMillis()) && ((paramILinearAsset.getDurationInMillis() <= getPar().getSequence().getCreativeMaxDuration()) || (getPar().getSequence().getCreativeMaxDuration() < 0));
  }
  
  private void onLinearAdAboutToBegin(IAsset paramIAsset)
  {
    if ((!isHandlingGroup()) || (!(paramIAsset instanceof ILinearAsset))) {
      return;
    }
    checkAssetDaisyChaining(paramIAsset);
  }
  
  public void dispose()
  {
    getViewManager().removeEventListener("viewManagerEvent", this);
    super.dispose();
  }
  
  public void end(boolean paramBoolean)
  {
    boolean bool = isHandlingGroup();
    super.end(paramBoolean);
    if (bool)
    {
      if (getViewManager() != null) {
        getViewManager().reset();
      }
      getAPI().breakEnd(null);
    }
  }
  
  protected void groupBegin()
  {
    super.groupBegin();
    APIBridge localAPIBridge = getAPI();
    if (getGroup() != null) {}
    for (HashMap localHashMap = getGroup().getDescription();; localHashMap = null)
    {
      localAPIBridge.breakBegin(localHashMap);
      return;
    }
  }
  
  public final boolean isHandlingBreak()
  {
    return isHandlingGroup();
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if (!paramString.equalsIgnoreCase("viewManagerEvent")) {}
    do
    {
      return;
      paramString = (ViewManagerEvent)paramObject;
      switch (paramString.getType())
      {
      case LINEAR_AD_BEGIN: 
      default: 
        return;
      case LINEAR_AD_ABOUT_TO_BEGIN: 
        onLinearAdAboutToBegin(paramString.getAsset());
        return;
      }
    } while (!isHandlingGroup());
    showNextSegment();
  }
  
  public void onRepackagingComplete(Asset paramAsset, boolean paramBoolean)
  {
    assetRepackager = null;
    if (paramBoolean)
    {
      if (currentAdViewSource != null) {
        getViewManager().showAdSource(currentAdViewSource);
      }
      return;
    }
    showNextSegment();
  }
  
  protected void resolvePar(Par paramPar)
  {
    if (paramPar != null)
    {
      Ad localAd = paramPar.getPrimaryAd();
      if ((localAd != null) && (localAd.getIsNetworkAd())) {
        checkParDaisyChaining(localAd.getAuditudeParams());
      }
    }
    super.resolvePar(paramPar);
  }
  
  protected void showAdSource(AdViewSource paramAdViewSource)
  {
    Asset localAsset = (Asset)paramAdViewSource.getAsset();
    Object localObject;
    if ((paramAdViewSource != null) && ((localAsset instanceof ILinearAsset))) {
      if ((localAsset instanceof ILinearAsset))
      {
        localObject = localAsset;
        if (!hasAvailableDuration((ILinearAsset)localObject)) {
          break label278;
        }
        if (getAdSettings().getProperty("repackageCreativeEnabled") == null) {
          break label283;
        }
      }
    }
    label260:
    label278:
    label283:
    for (boolean bool = Boolean.valueOf(getAdSettings().getProperty("repackageCreativeEnabled").toString()).booleanValue();; bool = false)
    {
      localObject = "";
      if (getAdSettings().getProperty("repackageCreativeFormat") != null) {
        localObject = getAdSettings().getProperty("repackageCreativeFormat").toString();
      }
      if ((StringUtil.isNotNullOrEmpty((String)localObject)) && (bool) && (((Ad)localAsset.getParent()).isRepackagingEnabled()))
      {
        Iterator localIterator = localAsset.getMediaFiles().iterator();
        for (Boolean localBoolean = Boolean.valueOf(false);; localBoolean = Boolean.valueOf(true))
        {
          MediaFile localMediaFile;
          do
          {
            if (!localIterator.hasNext())
            {
              if (localBoolean.booleanValue()) {
                break label260;
              }
              currentAdViewSource = paramAdViewSource;
              assetRepackager = new AssetRepackager(this, localAsset, (String)localObject, getAdSettings().getDomain(), getAdSettings().getZoneId());
              assetRepackager.repackage();
              return;
              localObject = null;
              break;
            }
            localMediaFile = (MediaFile)localIterator.next();
          } while ((localMediaFile == null) || (!StringUtil.isNotNullOrEmpty(mimeType)) || (!((String)localObject).toLowerCase().equalsIgnoreCase(mimeType)));
        }
        getViewManager().showAdSource(paramAdViewSource);
        return;
      }
      getViewManager().showAdSource(paramAdViewSource);
      return;
      showNextSegment();
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.session.BreakManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */