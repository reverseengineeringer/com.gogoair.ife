package com.auditude.ads;

import android.content.Context;
import com.auditude.ads.loader.AdPluginLoader;
import com.auditude.ads.loader.IPluginLoader;

public class AuditudePlugin
  extends AuditudeBasePlugin
{
  public AuditudePlugin(Context paramContext)
  {
    super(paramContext);
  }
  
  protected IPluginLoader getLoader()
  {
    return new AdPluginLoader(getContext());
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.AuditudePlugin
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */