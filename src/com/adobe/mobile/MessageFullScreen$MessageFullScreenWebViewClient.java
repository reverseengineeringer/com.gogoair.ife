package com.adobe.mobile;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.math.BigDecimal;
import java.util.HashMap;

class MessageFullScreen$MessageFullScreenWebViewClient
  extends WebViewClient
{
  private MessageFullScreen message;
  
  protected MessageFullScreen$MessageFullScreenWebViewClient(MessageFullScreen paramMessageFullScreen)
  {
    message = paramMessageFullScreen;
  }
  
  private void dismissMessage(WebView paramWebView)
  {
    if (message.rootViewGroup == null)
    {
      StaticMethods.logErrorFormat("Messages - unable to get root view group from os", new Object[0]);
      return;
    }
    TranslateAnimation localTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, 0.0F, message.rootViewGroup.getMeasuredHeight());
    localTranslateAnimation.setDuration(300L);
    localTranslateAnimation.setAnimationListener(new MessageFullScreen.MessageFullScreenWebViewClient.1(this));
    paramWebView.setAnimation(localTranslateAnimation);
    message.rootViewGroup.removeView(paramWebView);
  }
  
  public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    if (!paramString.startsWith("adbinapp")) {}
    int i;
    do
    {
      do
      {
        return true;
        if (paramString.contains("cancel"))
        {
          message.viewed();
          dismissMessage(paramWebView);
          return true;
        }
      } while (!paramString.contains("confirm"));
      message.clickedThrough();
      dismissMessage(paramWebView);
      i = paramString.indexOf("url=");
    } while (i < 0);
    paramString = paramString.substring(i + 4);
    HashMap localHashMap = new HashMap();
    if (StaticMethods.getVisitorID() == null)
    {
      paramWebView = "";
      localHashMap.put("{userId}", paramWebView);
      if (StaticMethods.getAID() != null) {
        break label213;
      }
    }
    label213:
    for (paramWebView = "";; paramWebView = StaticMethods.getAID())
    {
      localHashMap.put("{trackingId}", paramWebView);
      localHashMap.put("{messageId}", message.messageId);
      localHashMap.put("{lifetimeValue}", AnalyticsTrackLifetimeValueIncrease.getLifetimeValue().toString());
      paramWebView = StaticMethods.expandTokens(paramString, localHashMap);
      try
      {
        paramString = new Intent("android.intent.action.VIEW");
        paramString.setData(Uri.parse(paramWebView));
        message.messageFullScreenActivity.startActivity(paramString);
        return true;
      }
      catch (Exception paramWebView)
      {
        StaticMethods.logDebugFormat("Messages - unable to launch intent from full screen message (%s)", new Object[] { paramWebView.getMessage() });
        return true;
      }
      paramWebView = StaticMethods.getVisitorID();
      break;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageFullScreen.MessageFullScreenWebViewClient
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */