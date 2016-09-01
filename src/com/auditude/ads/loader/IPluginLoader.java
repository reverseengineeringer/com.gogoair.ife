package com.auditude.ads.loader;

public abstract interface IPluginLoader
{
  public abstract void cancel();
  
  public abstract void load();
  
  public abstract void setPluginLoaderListener(PluginLoaderListener paramPluginLoaderListener);
  
  public static abstract interface PluginLoaderListener
  {
    public abstract void loadComplete(Object paramObject);
    
    public abstract void loadFailed(Throwable paramThrowable);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.loader.IPluginLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */