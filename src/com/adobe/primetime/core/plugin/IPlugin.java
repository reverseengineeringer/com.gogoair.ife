package com.adobe.primetime.core.plugin;

import java.util.ArrayList;

public abstract interface IPlugin
{
  public abstract void bootstrap(PluginManager paramPluginManager);
  
  public abstract void configure(IPluginConfig paramIPluginConfig);
  
  public abstract void destroy();
  
  public abstract void disable();
  
  public abstract void enable();
  
  public abstract String getName();
  
  public abstract boolean isInitialized();
  
  public abstract Object resolveData(ArrayList paramArrayList);
  
  public abstract void setup();
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.plugin.IPlugin
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */