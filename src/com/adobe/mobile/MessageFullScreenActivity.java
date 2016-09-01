package com.adobe.mobile;

import android.os.Bundle;
import android.view.ViewGroup;
import android.widget.LinearLayout;

public class MessageFullScreenActivity
  extends AdobeMarketingActivity
{
  protected MessageFullScreen message;
  
  public void onBackPressed()
  {
    message.isVisible = false;
    message.viewed();
    finish();
    overridePendingTransition(0, 0);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    setContentView(new LinearLayout(this));
    message = Messages.getCurrentFullscreenMessage();
    message.messageFullScreenActivity = this;
  }
  
  public void onResume()
  {
    super.onResume();
    try
    {
      ViewGroup localViewGroup = (ViewGroup)findViewById(16908290);
      if (localViewGroup == null)
      {
        StaticMethods.logErrorFormat("Messages - unable to get root view group from os", new Object[0]);
        finish();
        overridePendingTransition(0, 0);
        return;
      }
      localViewGroup.post(new MessageFullScreenActivity.1(this, localViewGroup));
      return;
    }
    catch (NullPointerException localNullPointerException)
    {
      StaticMethods.logWarningFormat("Messages - content view is in undefined state (%s)", new Object[] { localNullPointerException.getMessage() });
      finish();
      overridePendingTransition(0, 0);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageFullScreenActivity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */