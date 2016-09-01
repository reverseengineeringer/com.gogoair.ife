package android.support.v4.media.session;

import android.media.RemoteControlClient.OnPlaybackPositionUpdateListener;

class MediaSessionCompatApi18$OnPlaybackPositionUpdateListener
  implements RemoteControlClient.OnPlaybackPositionUpdateListener
{
  protected final MediaSessionCompatApi14.Callback mCallback;
  
  public MediaSessionCompatApi18$OnPlaybackPositionUpdateListener(MediaSessionCompatApi14.Callback paramCallback)
  {
    mCallback = paramCallback;
  }
  
  public void onPlaybackPositionUpdate(long paramLong)
  {
    mCallback.onSeekTo(paramLong);
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.session.MediaSessionCompatApi18.OnPlaybackPositionUpdateListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */