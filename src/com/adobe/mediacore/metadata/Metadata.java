package com.adobe.mediacore.metadata;

import java.util.Set;

public abstract interface Metadata
{
  public abstract boolean containsKey(String paramString);
  
  public abstract byte[] getByteArray(String paramString);
  
  public abstract String getValue(String paramString);
  
  public abstract boolean isEmpty();
  
  public abstract Set keySet();
  
  public abstract void setByteArray(String paramString, byte[] paramArrayOfByte);
  
  public abstract void setValue(String paramString1, String paramString2);
  
  public abstract byte[] toByteArray();
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.metadata.Metadata
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */