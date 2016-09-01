package com.adobe.mobile;

import java.util.concurrent.Callable;

class VisitorIDService$4
  implements Callable
{
  VisitorIDService$4(VisitorIDService paramVisitorIDService, StringBuilder paramStringBuilder) {}
  
  public Void call()
    throws Exception
  {
    if (VisitorIDService.access$000(this$0) != null)
    {
      val$returnValue.append("?");
      val$returnValue.append("mid");
      val$returnValue.append("=");
      val$returnValue.append(VisitorIDService.access$000(this$0));
      val$returnValue.append("&");
      val$returnValue.append("mcorgid");
      val$returnValue.append("=");
      val$returnValue.append(MobileConfig.getInstance().getMarketingCloudOrganizationId());
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.VisitorIDService.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */