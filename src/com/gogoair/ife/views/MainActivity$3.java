package com.gogoair.ife.views;

import android.content.Intent;
import android.database.Cursor;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.GVNetworkManager;
import com.gogoair.ife.utils.GVNetworkManager.GVNetworkType;

class MainActivity$3
  implements AdapterView.OnItemClickListener
{
  MainActivity$3(MainActivity paramMainActivity, Cursor paramCursor) {}
  
  public void onItemClick(AdapterView paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = GVNetworkManager.getCurrentNetwork();
    if (paramAdapterView == GVNetworkManager.GVNetworkType.off) {
      MainActivity.access$200(this$0, this$0, Constants.GVErrorCode.NOWIFI);
    }
    do
    {
      return;
      if ((paramAdapterView == GVNetworkManager.GVNetworkType.ground) || (paramAdapterView == GVNetworkManager.GVNetworkType.unknown))
      {
        MainActivity.access$200(this$0, this$0, Constants.GVErrorCode.NOTASPFLIGHT);
        return;
      }
    } while (!val$cursor.moveToPosition(paramInt));
    paramAdapterView = new GVLibraryEntry(val$cursor);
    if (paramAdapterView.hasExpired())
    {
      MainActivity.access$200(this$0, this$0, Constants.GVErrorCode.EXPIRED);
      return;
    }
    paramView = new Intent(this$0, PlayerActivity.class);
    paramView.putExtra("INTENT_EXTRA_GV_LIBRARY_ENTRY", paramAdapterView);
    this$0.startActivity(paramView);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.MainActivity.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */