package com.adobe.mobile;

import java.util.Map;
import java.util.concurrent.Callable;

class VisitorIDService$5
  implements Callable
{
  VisitorIDService$5(VisitorIDService paramVisitorIDService, Map paramMap) {}
  
  public Void call()
    throws Exception
  {
    if (VisitorIDService.access$000(this$0) != null)
    {
      val$returnValue.put("mid", VisitorIDService.access$000(this$0));
      if (VisitorIDService.access$200(this$0) != null) {
        val$returnValue.put("aamb", VisitorIDService.access$200(this$0));
      }
      if (VisitorIDService.access$100(this$0) != null) {
        val$returnValue.put("aamlh", VisitorIDService.access$100(this$0));
      }
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.VisitorIDService.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */