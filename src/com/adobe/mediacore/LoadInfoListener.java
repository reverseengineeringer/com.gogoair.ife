package com.adobe.mediacore;

import com.adobe.mediacore.qos.LoadInfo;

abstract interface LoadInfoListener
  extends MediaPlayer.EventListener
{
  public abstract void onInfo(LoadInfo paramLoadInfo);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.LoadInfoListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */