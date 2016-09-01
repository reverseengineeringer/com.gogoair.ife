package com.auditude.ads.util;

import android.os.Handler;

public class TimeoutUtil
  implements Runnable
{
  private Object data;
  private boolean inProgress = false;
  private boolean isCanceled = false;
  private TimeoutCompleteListener listener;
  private Handler mHandler;
  
  public TimeoutUtil(Object paramObject)
  {
    data = paramObject;
  }
  
  private void CleanupTimer()
  {
    if (mHandler != null)
    {
      mHandler.removeCallbacks(this);
      mHandler = null;
    }
  }
  
  public final void Begin(long paramLong)
  {
    isCanceled = false;
    if (paramLong > 0L)
    {
      mHandler = new Handler();
      mHandler.removeCallbacks(this);
      mHandler.postDelayed(this, paramLong);
    }
    inProgress = true;
  }
  
  public void Complete()
  {
    if (inProgress)
    {
      CleanupTimer();
      inProgress = false;
      isCanceled = true;
      if (listener != null) {
        listener.onTimeoutComplete(this);
      }
    }
  }
  
  public void addTimeoutCompleteListener(TimeoutCompleteListener paramTimeoutCompleteListener)
  {
    listener = paramTimeoutCompleteListener;
  }
  
  public void dispose()
  {
    CleanupTimer();
    listener = null;
  }
  
  public final Object getData()
  {
    return data;
  }
  
  public final boolean getIsCanceled()
  {
    return isCanceled;
  }
  
  public void run()
  {
    if (inProgress)
    {
      CleanupTimer();
      inProgress = false;
      if (listener != null) {
        listener.onTimeoutComplete(this);
      }
    }
  }
  
  public static abstract interface TimeoutCompleteListener
  {
    public abstract void onTimeoutComplete(TimeoutUtil paramTimeoutUtil);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.TimeoutUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */