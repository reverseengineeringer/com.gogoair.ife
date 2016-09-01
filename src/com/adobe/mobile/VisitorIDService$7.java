package com.adobe.mobile;

import java.util.concurrent.Callable;

class VisitorIDService$7
  implements Callable
{
  VisitorIDService$7(VisitorIDService paramVisitorIDService, StringBuilder paramStringBuilder) {}
  
  public Void call()
    throws Exception
  {
    if (VisitorIDService.access$000(this$0) != null)
    {
      val$returnValue.append("&");
      val$returnValue.append("mboxMCGVID");
      val$returnValue.append("=");
      val$returnValue.append(VisitorIDService.access$000(this$0));
      if (VisitorIDService.access$200(this$0) != null)
      {
        val$returnValue.append("&");
        val$returnValue.append("mboxAAMB");
        val$returnValue.append("=");
        val$returnValue.append(VisitorIDService.access$200(this$0));
      }
      if (VisitorIDService.access$100(this$0) != null)
      {
        val$returnValue.append("&");
        val$returnValue.append("mboxMCGLH");
        val$returnValue.append("=");
        val$returnValue.append(VisitorIDService.access$100(this$0));
      }
      String str = StaticMethods.getAID();
      if (str != null)
      {
        val$returnValue.append("&");
        val$returnValue.append("mboxMCAVID");
        val$returnValue.append("=");
        val$returnValue.append(str);
      }
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.VisitorIDService.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */