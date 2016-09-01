package com.gogoair.ife.views;

import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.FrameLayout;

class PlayerActivity$10
  implements ViewTreeObserver.OnGlobalLayoutListener
{
  PlayerActivity$10(PlayerActivity paramPlayerActivity) {}
  
  public void onGlobalLayout()
  {
    PlayerActivity.access$3100(this$0).getViewTreeObserver().removeOnGlobalLayoutListener(this);
    PlayerActivity.access$900(this$0, PlayerActivity.access$700(this$0), PlayerActivity.access$800(this$0));
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.10
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */