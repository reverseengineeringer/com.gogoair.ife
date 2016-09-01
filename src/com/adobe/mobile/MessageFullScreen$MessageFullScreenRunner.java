package com.adobe.mobile;

import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.webkit.WebSettings;
import android.webkit.WebView;

class MessageFullScreen$MessageFullScreenRunner
  implements Runnable
{
  private MessageFullScreen message;
  
  protected MessageFullScreen$MessageFullScreenRunner(MessageFullScreen paramMessageFullScreen)
  {
    message = paramMessageFullScreen;
  }
  
  public void run()
  {
    int i;
    int j;
    try
    {
      MessageFullScreen.access$002(message, new WebView(message.messageFullScreenActivity));
      MessageFullScreen.access$000(message).setVerticalScrollBarEnabled(false);
      MessageFullScreen.access$000(message).setHorizontalScrollBarEnabled(false);
      MessageFullScreen.access$000(message).setBackgroundColor(0);
      MessageFullScreen.access$000(message).setWebViewClient(new MessageFullScreen.MessageFullScreenWebViewClient(message));
      WebSettings localWebSettings = MessageFullScreen.access$000(message).getSettings();
      localWebSettings.setJavaScriptEnabled(true);
      localWebSettings.setAllowFileAccess(true);
      localWebSettings.setDefaultTextEncodingName("UTF-8");
      MessageFullScreen.access$000(message).loadDataWithBaseURL("file:///android_asset/", message.replacedHtml, "text/html", "UTF-8", null);
      if (message.rootViewGroup == null)
      {
        StaticMethods.logErrorFormat("Messages - unable to get root view group from os", new Object[0]);
        MessageFullScreen.access$100(message);
        return;
      }
      i = message.rootViewGroup.getMeasuredWidth();
      j = message.rootViewGroup.getMeasuredHeight();
      if ((i == 0) || (j == 0))
      {
        StaticMethods.logErrorFormat("Messages - root view hasn't been measured, cannot show message", new Object[0]);
        MessageFullScreen.access$100(message);
        return;
      }
    }
    catch (Exception localException)
    {
      StaticMethods.logDebugFormat("Messages - Failed to show full screen message (%s)", new Object[] { localException.getMessage() });
      return;
    }
    if (message.isVisible) {
      message.rootViewGroup.addView(MessageFullScreen.access$000(message), i, j);
    }
    for (;;)
    {
      message.isVisible = true;
      return;
      TranslateAnimation localTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, j, 0.0F);
      localTranslateAnimation.setDuration(300L);
      MessageFullScreen.access$000(message).setAnimation(localTranslateAnimation);
      message.rootViewGroup.addView(MessageFullScreen.access$000(message), i, j);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageFullScreen.MessageFullScreenRunner
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */