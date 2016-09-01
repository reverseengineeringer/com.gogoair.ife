package com.gogoair.ife.views;

import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.view.View.OnClickListener;

class MainActivity$2
  implements View.OnClickListener
{
  MainActivity$2(MainActivity paramMainActivity) {}
  
  public void onClick(View paramView)
  {
    paramView = new Intent("android.intent.action.VIEW", Uri.parse("http://airbornemedia.gogoinflight.com/app"));
    this$0.startActivity(paramView);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.MainActivity.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */