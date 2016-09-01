package com.gogoair.ife.views;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.Visibility;
import com.adobe.mediacore.MediaPlayerItem;
import com.adobe.mediacore.info.ClosedCaptionsTrack;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import java.util.List;

class PlayerActivity$4$2
  implements DialogInterface.OnClickListener
{
  PlayerActivity$4$2(PlayerActivity.4 param4) {}
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if (paramInt == 0)
    {
      PlayerActivity.access$1400(this$1.this$0).setCCVisibility(MediaPlayer.Visibility.INVISIBLE);
      PlayerActivity.access$1602(this$1.this$0, 0);
      PlayerActivity.access$300(this$1.this$0).setSelectedSubtitleIndex(PlayerActivity.access$1600(this$1.this$0));
    }
    for (;;)
    {
      paramDialogInterface.cancel();
      return;
      PlayerActivity.access$1400(this$1.this$0).setCCVisibility(MediaPlayer.Visibility.VISIBLE);
      ClosedCaptionsTrack localClosedCaptionsTrack = (ClosedCaptionsTrack)PlayerActivity.access$1300(this$1.this$0).get(paramInt - 1);
      if (PlayerActivity.access$1400(this$1.this$0).getCurrentItem().selectClosedCaptionsTrack(localClosedCaptionsTrack))
      {
        PlayerActivity.access$1602(this$1.this$0, paramInt);
        PlayerActivity.access$300(this$1.this$0).setSelectedSubtitleIndex(PlayerActivity.access$1600(this$1.this$0));
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.4.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */