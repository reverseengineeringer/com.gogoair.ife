package com.auditude.ads.view;

import android.content.Context;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.ILinearAsset;
import com.auditude.ads.model.INonLinearAsset;
import com.auditude.ads.model.IOnPageAsset;
import com.auditude.ads.model.OnPageAsset;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.view.linear.ExternalVideoView;
import com.auditude.ads.view.linear.LinearVideoView;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public class ViewFactory
{
  private Context context;
  private boolean isInitialized = false;
  private HashMap viewCache = new HashMap();
  private HashMap viewTypeDictionary = new HashMap();
  
  public ViewFactory(Context paramContext)
  {
    context = paramContext;
  }
  
  private void initialize()
  {
    if (!isInitialized)
    {
      viewTypeDictionary.put("Auditude.Ads.View.Linear.LinearVideoView", LinearVideoView.class);
      viewTypeDictionary.put("Auditude.Ads.View.Linear.ExternalVideoView", ExternalVideoView.class);
      isInitialized = true;
    }
  }
  
  public final void dispose()
  {
    Iterator localIterator = viewCache.values().iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        viewTypeDictionary.clear();
        viewCache.clear();
        viewTypeDictionary = null;
        viewCache = null;
        return;
      }
      ((IAdView)localIterator.next()).dispose();
    }
  }
  
  public final IAdView getView(String paramString)
  {
    return getView(paramString, false);
  }
  
  public final IAdView getView(String paramString, boolean paramBoolean)
  {
    if (StringUtil.isNullOrEmpty(paramString)) {}
    do
    {
      return null;
      if ((viewCache.containsKey(paramString)) && (!paramBoolean)) {
        return (IAdView)viewCache.get(paramString);
      }
    } while (!viewTypeDictionary.containsKey(paramString));
    Object localObject1 = (Class)viewTypeDictionary.get(paramString);
    try
    {
      localObject1 = ((Class)localObject1).getConstructor(new Class[] { Context.class }).newInstance(new Object[] { context });
      if ((localObject1 instanceof IAdView))
      {
        localObject1 = (IAdView)localObject1;
        setView(paramString, (IAdView)localObject1);
        return (IAdView)localObject1;
      }
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      for (;;)
      {
        localInvocationTargetException.printStackTrace();
        Object localObject2 = null;
      }
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      for (;;)
      {
        localNoSuchMethodException.printStackTrace();
        Object localObject3 = null;
      }
    }
    catch (InstantiationException localInstantiationException)
    {
      for (;;)
      {
        localInstantiationException.printStackTrace();
        Object localObject4 = null;
      }
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      for (;;)
      {
        localIllegalAccessException.printStackTrace();
        Object localObject5 = null;
        continue;
        localObject5 = null;
      }
    }
  }
  
  public final IAdView getViewForAsset(Asset paramAsset)
  {
    return getViewForAsset(paramAsset, false);
  }
  
  public final IAdView getViewForAsset(Asset paramAsset, boolean paramBoolean)
  {
    return getView(getViewSourceForAsset(paramAsset), paramBoolean);
  }
  
  public final String getViewSourceForAsset(Asset paramAsset)
  {
    if (!isInitialized) {
      initialize();
    }
    if (paramAsset == null) {}
    do
    {
      do
      {
        return null;
        if ((paramAsset instanceof IOnPageAsset))
        {
          if ((paramAsset instanceof OnPageAsset)) {}
          for (;;)
          {
            paramAsset = (OnPageAsset)paramAsset;
            if ((!paramAsset.getFormat().equals("onpage")) || (!paramAsset.getResourceType().equals("static"))) {
              break;
            }
            return "Auditude.Ads.View.OnPage.StaticBannerView";
            paramAsset = null;
          }
        }
        if (!(paramAsset instanceof ILinearAsset)) {
          break;
        }
      } while (!paramAsset.getFormat().equals("video"));
      if (((Boolean)AuditudeEnv.getInstance().getAdSettings().getProperty("auditudeHandlesLinearVideoAds")).booleanValue()) {
        return "Auditude.Ads.View.Linear.LinearVideoView";
      }
      return "Auditude.Ads.View.Linear.ExternalVideoView";
    } while (!(paramAsset instanceof INonLinearAsset));
    return null;
  }
  
  public final void reset()
  {
    Iterator localIterator = viewCache.values().iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      IAdView localIAdView = (IAdView)localIterator.next();
      if (localIAdView != null) {
        localIAdView.reset();
      }
    }
  }
  
  public final void setView(String paramString, IAdView paramIAdView)
  {
    if ((StringUtil.isNullOrEmpty(paramString)) || (paramIAdView == null)) {
      return;
    }
    viewCache.put(paramString, paramIAdView);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.ViewFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */