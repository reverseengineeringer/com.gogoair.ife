package com.adobe.mobile;

public enum MobilePrivacyStatus
{
  MOBILE_PRIVACY_STATUS_OPT_IN(0),  MOBILE_PRIVACY_STATUS_OPT_OUT(1),  MOBILE_PRIVACY_STATUS_UNKNOWN(2);
  
  private final int value;
  
  private MobilePrivacyStatus(int paramInt1)
  {
    value = paramInt1;
  }
  
  protected int getValue()
  {
    return value;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MobilePrivacyStatus
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */