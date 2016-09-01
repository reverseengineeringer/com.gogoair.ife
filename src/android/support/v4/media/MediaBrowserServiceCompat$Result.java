package android.support.v4.media;

public class MediaBrowserServiceCompat$Result
{
  private Object mDebug;
  private boolean mDetachCalled;
  private boolean mSendResultCalled;
  
  MediaBrowserServiceCompat$Result(MediaBrowserServiceCompat paramMediaBrowserServiceCompat, Object paramObject)
  {
    mDebug = paramObject;
  }
  
  public void detach()
  {
    if (mDetachCalled) {
      throw new IllegalStateException("detach() called when detach() had already been called for: " + mDebug);
    }
    if (mSendResultCalled) {
      throw new IllegalStateException("detach() called when sendResult() had already been called for: " + mDebug);
    }
    mDetachCalled = true;
  }
  
  boolean isDone()
  {
    return (mDetachCalled) || (mSendResultCalled);
  }
  
  void onResultSent(Object paramObject) {}
  
  public void sendResult(Object paramObject)
  {
    if (mSendResultCalled) {
      throw new IllegalStateException("sendResult() called twice for: " + mDebug);
    }
    mSendResultCalled = true;
    onResultSent(paramObject);
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.MediaBrowserServiceCompat.Result
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */