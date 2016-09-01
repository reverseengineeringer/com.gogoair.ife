package com.adobe.mobile;

import java.util.concurrent.Callable;

class VisitorIDService$6
  implements Callable
{
  VisitorIDService$6(VisitorIDService paramVisitorIDService, StringBuilder paramStringBuilder) {}
  
  public Void call()
    throws Exception
  {
    if (VisitorIDService.access$000(this$0) != null)
    {
      val$returnValue.append("&");
      val$returnValue.append("d_mid");
      val$returnValue.append("=");
      val$returnValue.append(VisitorIDService.access$000(this$0));
      if (VisitorIDService.access$200(this$0) != null)
      {
        val$returnValue.append("&");
        val$returnValue.append("d_blob");
        val$returnValue.append("=");
        val$returnValue.append(VisitorIDService.access$200(this$0));
      }
      if (VisitorIDService.access$100(this$0) != null)
      {
        val$returnValue.append("&");
        val$returnValue.append("dcs_region");
        val$returnValue.append("=");
        val$returnValue.append(VisitorIDService.access$100(this$0));
      }
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.VisitorIDService.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */