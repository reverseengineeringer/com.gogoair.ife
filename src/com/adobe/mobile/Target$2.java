package com.adobe.mobile;

import java.util.concurrent.Callable;

final class Target$2
  implements Callable
{
  public String call()
    throws Exception
  {
    return TargetWorker.getPcID();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Target.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */