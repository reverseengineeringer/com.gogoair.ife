package com.adobe.mediacore;

class DefaultMediaPlayer$13
  implements ProfileChangedListener
{
  DefaultMediaPlayer$13(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onChanged(long paramLong1, long paramLong2)
  {
    DefaultMediaPlayer.access$300(this$0).getCustomAdView().setBitrate(paramLong1);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.13
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */