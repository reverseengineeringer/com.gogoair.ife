package com.adobe.mobile;

import java.util.Map;

public final class Visitor
{
  public static String getMarketingCloudId()
  {
    return VisitorIDService.sharedInstance().getMarketingCloudID();
  }
  
  public static void syncIdentifiers(Map paramMap)
  {
    VisitorIDService.sharedInstance().idSync(paramMap);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Visitor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */