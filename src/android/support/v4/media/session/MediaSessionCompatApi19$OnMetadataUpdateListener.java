package android.support.v4.media.session;

import android.media.Rating;
import android.media.RemoteControlClient.OnMetadataUpdateListener;

class MediaSessionCompatApi19$OnMetadataUpdateListener
  implements RemoteControlClient.OnMetadataUpdateListener
{
  protected final MediaSessionCompatApi14.Callback mCallback;
  
  public MediaSessionCompatApi19$OnMetadataUpdateListener(MediaSessionCompatApi14.Callback paramCallback)
  {
    mCallback = paramCallback;
  }
  
  public void onMetadataUpdate(int paramInt, Object paramObject)
  {
    if ((paramInt == 268435457) && ((paramObject instanceof Rating))) {
      mCallback.onSetRating(paramObject);
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.session.MediaSessionCompatApi19.OnMetadataUpdateListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */