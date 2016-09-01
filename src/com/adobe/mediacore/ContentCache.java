package com.adobe.mediacore;

import java.util.Set;

abstract interface ContentCache
{
  public abstract boolean addContent(String paramString, AdHandle paramAdHandle);
  
  public abstract void clearCache();
  
  public abstract Set getCachedUrls();
  
  public abstract AdHandle getHandle(String paramString);
  
  public abstract boolean isCached(String paramString);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */