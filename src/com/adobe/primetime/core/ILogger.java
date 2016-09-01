package com.adobe.primetime.core;

public abstract interface ILogger
{
  public abstract void debug(String paramString1, String paramString2);
  
  public abstract void disable();
  
  public abstract void enable();
  
  public abstract boolean enabled();
  
  public abstract void error(String paramString1, String paramString2);
  
  public abstract void info(String paramString1, String paramString2);
  
  public abstract void warn(String paramString1, String paramString2);
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.ILogger
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */