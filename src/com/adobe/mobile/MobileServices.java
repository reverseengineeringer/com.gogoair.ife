package com.adobe.mobile;

public class MobileServices
{
  public static String getAnalyticsVisitorID()
  {
    return Analytics.getTrackingIdentifier();
  }
  
  public static String getMarketingCloudVisitorID()
  {
    return Visitor.getMarketingCloudId();
  }
  
  public static String getReportSuiteIDs()
  {
    return MobileConfig.getInstance().getReportSuiteIds();
  }
  
  public static String getSCTrackingServer()
  {
    return MobileConfig.getInstance().getTrackingServer();
  }
  
  public static boolean getUseSSL()
  {
    return MobileConfig.getInstance().getSSL();
  }
  
  public static String getVisitorID()
  {
    return Config.getUserIdentifier();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MobileServices
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */