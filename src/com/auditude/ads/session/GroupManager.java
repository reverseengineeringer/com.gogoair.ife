package com.auditude.ads.session;

import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.event.SMILEvent;
import com.auditude.ads.event.SMILEvent.SMILEventType;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.OnPageAsset;
import com.auditude.ads.model.smil.Group;
import com.auditude.ads.model.smil.Group.PrefetchCompleteListener;
import com.auditude.ads.model.smil.Par;
import com.auditude.ads.model.smil.Par.ParResoultionCompleteListener;
import com.auditude.ads.model.smil.Ref;
import com.auditude.ads.view.ViewManager;
import com.auditude.ads.view.model.AdViewSource;
import java.util.ArrayList;
import java.util.Iterator;

public abstract class GroupManager
  implements Group.PrefetchCompleteListener, Par.ParResoultionCompleteListener
{
  private AdSettings adSettings;
  private APIBridge api;
  private Group group;
  private boolean isHandlingGroup = false;
  private Par par;
  private ViewManager viewManager;
  
  public GroupManager(APIBridge paramAPIBridge, ViewManager paramViewManager, AdSettings paramAdSettings)
  {
    api = paramAPIBridge;
    viewManager = paramViewManager;
    adSettings = paramAdSettings;
  }
  
  private ArrayList consolidateCompanionAssets(OnPageAsset[] paramArrayOfOnPageAsset, String paramString)
  {
    int i = 0;
    if (getAdSettings().hasProperty("showStaticImageBanners")) {}
    for (boolean bool = ((Boolean)getAdSettings().getProperty("showStaticImageBanners")).booleanValue();; bool = false)
    {
      ArrayList localArrayList = new ArrayList();
      int j = paramArrayOfOnPageAsset.length;
      if (i >= j) {
        return localArrayList;
      }
      paramString = paramArrayOfOnPageAsset[i];
      if (paramString != null)
      {
        if (bool) {
          break label80;
        }
        localArrayList.add(paramString);
      }
      label80:
      while (paramString.getStaticAsset() == null)
      {
        i += 1;
        break;
      }
      paramString = paramString.getStaticAsset();
      if ((paramString instanceof OnPageAsset)) {}
      for (;;)
      {
        localArrayList.add((OnPageAsset)paramString);
        break;
        paramString = null;
      }
    }
  }
  
  private void handleBaseAsset(Asset paramAsset, OnPageAsset[] paramArrayOfOnPageAsset)
  {
    showAdSource(new AdViewSource(paramAsset, paramArrayOfOnPageAsset, paramAsset.getAdParameters()));
  }
  
  private void handleCompanionAssets(ArrayList paramArrayList)
  {
    if ((paramArrayList != null) && (paramArrayList.size() > 0)) {
      paramArrayList = paramArrayList.iterator();
    }
    for (;;)
    {
      if (!paramArrayList.hasNext()) {
        return;
      }
      OnPageAsset localOnPageAsset = (OnPageAsset)paramArrayList.next();
      viewManager.showAdSource(new AdViewSource(localOnPageAsset, null, localOnPageAsset.getAdParameters()));
    }
  }
  
  private void showSegment(Ref paramRef)
  {
    if ((paramRef == null) || (paramRef.isWatched()))
    {
      showNextSegment();
      return;
    }
    OnPageAsset[] arrayOfOnPageAsset = paramRef.getCompanions();
    if (paramRef.getPrimaryAsset() != null)
    {
      handleBaseAsset(paramRef.getPrimaryAsset(), arrayOfOnPageAsset);
      return;
    }
    if ((arrayOfOnPageAsset != null) && (arrayOfOnPageAsset.length > 0))
    {
      handleCompanionAssets(consolidateCompanionAssets(arrayOfOnPageAsset, "skin"));
      handleCompanionAssets(consolidateCompanionAssets(arrayOfOnPageAsset, "onpage"));
      showNextSegment();
      return;
    }
    showNextSegment();
  }
  
  public void begin(Group paramGroup)
  {
    if (isHandlingGroup) {
      return;
    }
    isHandlingGroup = true;
    par = null;
    group = paramGroup;
    if (paramGroup == null)
    {
      groupEnd();
      return;
    }
    paramGroup.begin();
    Boolean localBoolean = Boolean.valueOf(false);
    if (AuditudeEnv.getInstance().getAdSettings().hasProperty("prefetchNetworkAds")) {
      localBoolean = (Boolean)AuditudeEnv.getInstance().getAdSettings().getProperty("prefetchNetworkAds");
    }
    if (localBoolean.booleanValue())
    {
      paramGroup.load(this, null);
      return;
    }
    groupBegin();
    showNextSegment();
  }
  
  public void dispose()
  {
    api = null;
    viewManager = null;
    isHandlingGroup = false;
  }
  
  public void end()
  {
    end(false);
  }
  
  public void end(boolean paramBoolean)
  {
    isHandlingGroup = false;
    par = null;
    if (group != null)
    {
      group.end(paramBoolean);
      group = null;
    }
  }
  
  public final APIBridge getAPI()
  {
    return api;
  }
  
  public final AdSettings getAdSettings()
  {
    return adSettings;
  }
  
  public final Group getGroup()
  {
    return group;
  }
  
  protected final AdViewSource getNextAdSource()
  {
    if (group == null) {}
    for (;;)
    {
      return null;
      for (Object localObject = par; localObject != null; localObject = group.getNext())
      {
        localObject = ((Par)localObject).getNext();
        if ((localObject != null) && (((Ref)localObject).getPrimaryAsset() != null)) {
          return new AdViewSource(((Ref)localObject).getPrimaryAsset(), ((Ref)localObject).getCompanions(), null);
        }
      }
    }
  }
  
  protected final Par getPar()
  {
    return par;
  }
  
  public final ViewManager getViewManager()
  {
    return viewManager;
  }
  
  protected void groupBegin() {}
  
  protected void groupEnd()
  {
    end(true);
  }
  
  protected final boolean isHandlingGroup()
  {
    return isHandlingGroup;
  }
  
  public void onParResolutionComplete()
  {
    if (par != null) {
      par.setParResolutionCompleteListener(null);
    }
    showNextSegment();
  }
  
  public void onPrefetchComplete(ArrayList paramArrayList)
  {
    groupBegin();
    showNextSegment();
  }
  
  protected void resolvePar(Par paramPar)
  {
    if ((paramPar != null) && (!paramPar.isResolved()))
    {
      paramPar.setParResolutionCompleteListener(this);
      paramPar.resolve(null);
    }
  }
  
  protected abstract void showAdSource(AdViewSource paramAdViewSource);
  
  protected void showNextSegment()
  {
    if (!isHandlingGroup) {
      return;
    }
    if ((par != null) && (par.moveNext()))
    {
      Ref localRef = par.getCurrent();
      if (localRef != null)
      {
        showSegment(localRef);
        return;
      }
    }
    if ((group == null) || (!group.moveNext()))
    {
      groupEnd();
      return;
    }
    par = group.getCurrent();
    api.dispatchEvent("smilEvent", new SMILEvent(api, SMILEvent.SMILEventType.PAR_BEGIN, null, par, false));
    if ((par != null) && (!par.isResolved()))
    {
      resolvePar(par);
      return;
    }
    showNextSegment();
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.session.GroupManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */