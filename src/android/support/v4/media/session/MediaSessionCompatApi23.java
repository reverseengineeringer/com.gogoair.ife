package android.support.v4.media.session;

import android.net.Uri;
import android.os.Bundle;

class MediaSessionCompatApi23
{
  public static Object createCallback(Callback paramCallback)
  {
    return new CallbackProxy(paramCallback);
  }
  
  public static abstract interface Callback
    extends MediaSessionCompatApi21.Callback
  {
    public abstract void onPlayFromUri(Uri paramUri, Bundle paramBundle);
  }
  
  static class CallbackProxy
    extends MediaSessionCompatApi21.CallbackProxy
  {
    public CallbackProxy(MediaSessionCompatApi23.Callback paramCallback)
    {
      super();
    }
    
    public void onPlayFromUri(Uri paramUri, Bundle paramBundle)
    {
      ((MediaSessionCompatApi23.Callback)mCallback).onPlayFromUri(paramUri, paramBundle);
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.session.MediaSessionCompatApi23
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */