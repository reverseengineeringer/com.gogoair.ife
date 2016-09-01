package com.adobe.mediacore.info;

public class ClosedCaptionsTrack
  extends Track
{
  private boolean _isActive;
  private int _serviceType;
  
  public ClosedCaptionsTrack(String paramString1, int paramInt, String paramString2, boolean paramBoolean1, boolean paramBoolean2)
  {
    super(paramString1, paramString2, paramBoolean1);
    _serviceType = paramInt;
    _isActive = paramBoolean2;
  }
  
  public int getServiceType()
  {
    return _serviceType;
  }
  
  public boolean isActive()
  {
    return _isActive;
  }
  
  public String toString()
  {
    return "ClosedCaptionsTrack { name: " + getName() + " serviceType: " + getServiceType() + " }";
  }
  
  public static enum DefaultCCTypes
  {
    CC1(0),  CC2(1),  CC3(2),  CC4(3),  CS1(4),  CS2(5),  CS3(6),  CS4(7),  CS5(8),  CS6(9);
    
    private final int value;
    
    private DefaultCCTypes(int paramInt1)
    {
      value = paramInt1;
    }
    
    final int getValue()
    {
      return value;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.info.ClosedCaptionsTrack
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */