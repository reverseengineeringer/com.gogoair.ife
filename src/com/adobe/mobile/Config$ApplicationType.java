package com.adobe.mobile;

public enum Config$ApplicationType
{
  APPLICATION_TYPE_HANDHELD(0),  APPLICATION_TYPE_WEARABLE(1);
  
  private final int value;
  
  private Config$ApplicationType(int paramInt1)
  {
    value = paramInt1;
  }
  
  protected int getValue()
  {
    return value;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Config.ApplicationType
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */