package com.adobe.mediacore;

class DefaultMediaPlayer$4
  implements ContentPlacementCompletedListener
{
  DefaultMediaPlayer$4(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onCompleted()
  {
    if ((DefaultMediaPlayer.access$500(this$0) != null) && (DefaultMediaPlayer.access$500(this$0).doneInitialResolving())) {
      this$0.endAdResolving();
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */