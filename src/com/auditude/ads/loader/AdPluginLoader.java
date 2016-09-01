package com.auditude.ads.loader;

import android.content.Context;
import com.auditude.ads.AuditudeAdUnit;

public class AdPluginLoader
  implements IPluginLoader
{
  Context context;
  IPluginLoader.PluginLoaderListener listener;
  
  public AdPluginLoader(Context paramContext)
  {
    context = paramContext;
  }
  
  private void notifyLoadComplete(Object paramObject)
  {
    if (listener != null) {
      listener.loadComplete(paramObject);
    }
  }
  
  public void cancel() {}
  
  public void load()
  {
    notifyLoadComplete(new AuditudeAdUnit(context));
  }
  
  public void setPluginLoaderListener(IPluginLoader.PluginLoaderListener paramPluginLoaderListener)
  {
    listener = paramPluginLoaderListener;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.loader.AdPluginLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */