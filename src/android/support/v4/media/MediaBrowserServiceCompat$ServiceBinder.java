package android.support.v4.media;

import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.os.ResultReceiver;
import android.text.TextUtils;

class MediaBrowserServiceCompat$ServiceBinder
  extends IMediaBrowserServiceCompat.Stub
{
  private MediaBrowserServiceCompat$ServiceBinder(MediaBrowserServiceCompat paramMediaBrowserServiceCompat) {}
  
  public void addSubscription(String paramString, IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks)
  {
    MediaBrowserServiceCompat.access$300(this$0).post(new MediaBrowserServiceCompat.ServiceBinder.3(this, paramIMediaBrowserServiceCompatCallbacks, paramString));
  }
  
  public void connect(String paramString, Bundle paramBundle, IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks)
  {
    int i = Binder.getCallingUid();
    if (!MediaBrowserServiceCompat.access$000(this$0, paramString, i)) {
      throw new IllegalArgumentException("Package/uid mismatch: uid=" + i + " package=" + paramString);
    }
    MediaBrowserServiceCompat.access$300(this$0).post(new MediaBrowserServiceCompat.ServiceBinder.1(this, paramIMediaBrowserServiceCompatCallbacks, paramString, paramBundle, i));
  }
  
  public void disconnect(IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks)
  {
    MediaBrowserServiceCompat.access$300(this$0).post(new MediaBrowserServiceCompat.ServiceBinder.2(this, paramIMediaBrowserServiceCompatCallbacks));
  }
  
  public void getMediaItem(String paramString, ResultReceiver paramResultReceiver)
  {
    if ((TextUtils.isEmpty(paramString)) || (paramResultReceiver == null)) {
      return;
    }
    MediaBrowserServiceCompat.access$300(this$0).post(new MediaBrowserServiceCompat.ServiceBinder.5(this, paramString, paramResultReceiver));
  }
  
  public void removeSubscription(String paramString, IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks)
  {
    MediaBrowserServiceCompat.access$300(this$0).post(new MediaBrowserServiceCompat.ServiceBinder.4(this, paramIMediaBrowserServiceCompatCallbacks, paramString));
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.MediaBrowserServiceCompat.ServiceBinder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */