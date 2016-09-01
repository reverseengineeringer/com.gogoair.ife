package com.adobe.mediacore;

import com.adobe.ave.MediaErrorCode;

public abstract interface MediaPlayerItemLoader$LoaderListener
{
  public abstract void onError(MediaErrorCode paramMediaErrorCode, String paramString);
  
  public abstract void onLoadComplete(MediaPlayerItem paramMediaPlayerItem);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerItemLoader.LoaderListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */