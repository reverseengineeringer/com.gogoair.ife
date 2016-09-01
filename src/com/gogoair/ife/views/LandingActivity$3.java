package com.gogoair.ife.views;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;

class LandingActivity$3
  implements View.OnClickListener
{
  LandingActivity$3(LandingActivity paramLandingActivity) {}
  
  public void onClick(View paramView)
  {
    paramView = new Intent(LandingActivity.access$200(this$0), PlayerActivity.class);
    paramView.putExtra("INTENT_EXTRA_GV_LIBRARY_ENTRY", LandingActivity.access$300(this$0));
    this$0.startActivity(paramView);
    LandingActivity.access$400(this$0).finish();
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.LandingActivity.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */