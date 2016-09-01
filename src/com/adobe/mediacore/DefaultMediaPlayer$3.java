package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;

class DefaultMediaPlayer$3
  implements ResourceLoadedListener
{
  DefaultMediaPlayer$3(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onLoaded()
  {
    DefaultMediaPlayer.access$1700(this$0).i(DefaultMediaPlayer.access$1500() + "#endLoadResource", "Loading of media resource is complete. [" + DefaultMediaPlayer.access$1600(this$0) + "].");
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */