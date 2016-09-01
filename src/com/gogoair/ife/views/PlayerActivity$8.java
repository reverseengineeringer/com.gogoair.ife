package com.gogoair.ife.views;

import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import com.gogoair.ife.utils.ClosedCaptionMediaController;

class PlayerActivity$8
  implements View.OnTouchListener
{
  PlayerActivity$8(PlayerActivity paramPlayerActivity) {}
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if (PlayerActivity.access$3000(this$0) == null) {
      return false;
    }
    if (PlayerActivity.access$3000(this$0).isShowing())
    {
      PlayerActivity.access$3000(this$0).hide();
      return false;
    }
    PlayerActivity.access$3000(this$0).show(5000);
    return false;
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */