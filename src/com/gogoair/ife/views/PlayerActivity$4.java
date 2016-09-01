package com.gogoair.ife.views;

import android.app.AlertDialog.Builder;
import com.gogoair.ife.utils.ClosedCaptionMediaController.ClosedCaptionMediaControllerListener;
import java.util.ArrayList;

class PlayerActivity$4
  implements ClosedCaptionMediaController.ClosedCaptionMediaControllerListener
{
  PlayerActivity$4(PlayerActivity paramPlayerActivity) {}
  
  public void onClosedCaptionButtonPressed()
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(this$0.getString(2131034136));
    localArrayList.addAll(PlayerActivity.access$2300(this$0));
    AlertDialog.Builder localBuilder = new AlertDialog.Builder(this$0);
    localBuilder.setTitle(this$0.getString(2131034134));
    localBuilder.setSingleChoiceItems((CharSequence[])localArrayList.toArray(new String[localArrayList.size() - 1]), PlayerActivity.access$1600(this$0), new PlayerActivity.4.2(this)).setNegativeButton(this$0.getString(2131034135), new PlayerActivity.4.1(this));
    localBuilder.show();
  }
  
  public void onHideMediaController()
  {
    PlayerActivity.access$2500(this$0);
  }
  
  public void onShowMediaController()
  {
    PlayerActivity.access$2400(this$0);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */