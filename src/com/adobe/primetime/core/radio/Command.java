package com.adobe.primetime.core.radio;

import com.adobe.primetime.core.ICallback;

public class Command
  implements Runnable
{
  private ICallback _callback;
  private Object _param;
  
  public Command(ICallback paramICallback)
  {
    this(paramICallback, null);
  }
  
  public Command(ICallback paramICallback, Object paramObject)
  {
    _callback = paramICallback;
    _param = paramObject;
  }
  
  public void run()
  {
    if (_callback == null) {
      return;
    }
    _callback.call(_param);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.radio.Command
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */