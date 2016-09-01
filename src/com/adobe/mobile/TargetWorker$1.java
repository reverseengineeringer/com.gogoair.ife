package com.adobe.mobile;

import java.util.HashMap;
import java.util.concurrent.Callable;

final class TargetWorker$1
  implements Callable
{
  public HashMap call()
    throws Exception
  {
    return Lifecycle.getContextData();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.TargetWorker.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */