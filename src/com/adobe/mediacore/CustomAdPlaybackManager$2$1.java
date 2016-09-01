package com.adobe.mediacore;

class CustomAdPlaybackManager$2$1
  implements Runnable
{
  CustomAdPlaybackManager$2$1(CustomAdPlaybackManager.2 param2) {}
  
  public void run()
  {
    CustomAdPlaybackManager.access$500(this$1.this$0).suspendPlayer();
    CustomAdPlaybackManager.access$100(this$1.this$0).dispatch(AdPlaybackEvent.createStartEvent(CustomAdPlaybackManager.access$300(this$1.this$0), CustomAdPlaybackManager.access$900(this$1.this$0)));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdPlaybackManager.2.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */