package com.adobe.mobile;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.io.File;
import java.math.BigDecimal;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class MessageFullScreen
  extends Message
{
  private static final String JSON_CONFIG_HTML = "html";
  private static final String MESSAGE_SCHEME = "adbinapp";
  private static final String MESSAGE_SCHEME_PATH_CANCEL = "cancel";
  private static final String MESSAGE_SCHEME_PATH_CONFIRM = "confirm";
  protected String html;
  protected Activity messageFullScreenActivity;
  protected String replacedHtml;
  protected ViewGroup rootViewGroup;
  private WebView webView;
  
  private static void killMessageActivity(MessageFullScreen paramMessageFullScreen)
  {
    messageFullScreenActivity.finish();
    messageFullScreenActivity.overridePendingTransition(0, 0);
    isVisible = false;
  }
  
  protected boolean initWithPayloadObject(JSONObject paramJSONObject)
  {
    if ((paramJSONObject == null) || (paramJSONObject.length() <= 0)) {}
    while (!super.initWithPayloadObject(paramJSONObject)) {
      return false;
    }
    try
    {
      paramJSONObject = paramJSONObject.getJSONObject("payload");
      if (paramJSONObject.length() <= 0)
      {
        StaticMethods.logDebugFormat("Messages - Unable to create fullscreen message \"%s\", payload is empty", new Object[] { messageId });
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logDebugFormat("Messages - Unable to create fullscreen message \"%s\", payload is required", new Object[] { messageId });
      return false;
    }
    try
    {
      html = paramJSONObject.getString("html");
      if (html.length() <= 0)
      {
        StaticMethods.logDebugFormat("Messages - Unable to create fullscreen message \"%s\", html is empty", new Object[] { messageId });
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logDebugFormat("Messages - Unable to create fullscreen message \"%s\", html is required", new Object[] { messageId });
      return false;
    }
    try
    {
      paramJSONObject = paramJSONObject.getJSONArray("assets");
      if ((paramJSONObject != null) && (paramJSONObject.length() > 0))
      {
        assets = new ArrayList();
        int k = paramJSONObject.length();
        int i = 0;
        while (i < k)
        {
          JSONArray localJSONArray = paramJSONObject.getJSONArray(i);
          if ((localJSONArray != null) && (localJSONArray.length() > 0))
          {
            ArrayList localArrayList = new ArrayList();
            int m = localJSONArray.length();
            int j = 0;
            while (j < m)
            {
              localArrayList.add(localJSONArray.getString(j));
              j += 1;
            }
            assets.add(localArrayList);
          }
          i += 1;
        }
      }
      return true;
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logDebugFormat("Messages - No assets found for fullscreen message \"%s\"", new Object[] { messageId });
    }
  }
  
  protected void show()
  {
    for (;;)
    {
      Activity localActivity;
      HashMap localHashMap;
      try
      {
        localActivity = StaticMethods.getCurrentActivity();
        super.show();
        Messages.setCurrentMessageFullscreen(this);
        localHashMap = new HashMap();
        if ((assets == null) || (assets.size() <= 0)) {
          break label196;
        }
        Iterator localIterator = assets.iterator();
        if (!localIterator.hasNext()) {
          break label196;
        }
        Object localObject3 = (ArrayList)localIterator.next();
        int i = ((ArrayList)localObject3).size();
        if (i <= 0) {
          continue;
        }
        String str = (String)((ArrayList)localObject3).get(0);
        Object localObject1 = ((ArrayList)localObject3).iterator();
        if (!((Iterator)localObject1).hasNext()) {
          break label266;
        }
        File localFile = RemoteDownload.getFileForCachedURL((String)((Iterator)localObject1).next(), "messageImages");
        if (localFile == null) {
          continue;
        }
        localObject1 = localFile.toURI().toString();
        if (localObject1 != null) {
          break label263;
        }
        localObject3 = (String)((ArrayList)localObject3).get(i - 1);
        if (!RemoteDownload.stringIsUrl((String)localObject3))
        {
          i = 1;
          if (i == 0) {
            break label263;
          }
          localObject1 = localObject3;
          if (localObject1 == null) {
            continue;
          }
          localHashMap.put(str, localObject1);
          continue;
        }
        i = 0;
      }
      catch (StaticMethods.NullActivityException localNullActivityException)
      {
        StaticMethods.logErrorFormat(localNullActivityException.getMessage(), new Object[0]);
        return;
      }
      continue;
      label196:
      replacedHtml = StaticMethods.expandTokens(html, localHashMap);
      try
      {
        Intent localIntent = new Intent(localActivity.getApplicationContext(), MessageFullScreenActivity.class);
        localIntent.addFlags(65536);
        localActivity.startActivity(localIntent);
        localActivity.overridePendingTransition(0, 0);
        return;
      }
      catch (ActivityNotFoundException localActivityNotFoundException)
      {
        StaticMethods.logWarningFormat("Messages - Must declare MessageFullScreenActivity in AndroidManifest.xml in order to show full screen messages (%s)", new Object[] { localActivityNotFoundException.getMessage() });
        return;
      }
      label263:
      continue;
      label266:
      Object localObject2 = null;
    }
  }
  
  protected void showInRootViewGroup()
  {
    int i = StaticMethods.getCurrentOrientation();
    if ((isVisible) && (orientationWhenShown == i)) {
      return;
    }
    orientationWhenShown = i;
    new Handler(Looper.getMainLooper()).post(new MessageFullScreenRunner(this));
  }
  
  private static class MessageFullScreenRunner
    implements Runnable
  {
    private MessageFullScreen message;
    
    protected MessageFullScreenRunner(MessageFullScreen paramMessageFullScreen)
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
        message.webView.setVerticalScrollBarEnabled(false);
        message.webView.setHorizontalScrollBarEnabled(false);
        message.webView.setBackgroundColor(0);
        message.webView.setWebViewClient(new MessageFullScreen.MessageFullScreenWebViewClient(message));
        WebSettings localWebSettings = message.webView.getSettings();
        localWebSettings.setJavaScriptEnabled(true);
        localWebSettings.setAllowFileAccess(true);
        localWebSettings.setDefaultTextEncodingName("UTF-8");
        message.webView.loadDataWithBaseURL("file:///android_asset/", message.replacedHtml, "text/html", "UTF-8", null);
        if (message.rootViewGroup == null)
        {
          StaticMethods.logErrorFormat("Messages - unable to get root view group from os", new Object[0]);
          MessageFullScreen.killMessageActivity(message);
          return;
        }
        i = message.rootViewGroup.getMeasuredWidth();
        j = message.rootViewGroup.getMeasuredHeight();
        if ((i == 0) || (j == 0))
        {
          StaticMethods.logErrorFormat("Messages - root view hasn't been measured, cannot show message", new Object[0]);
          MessageFullScreen.killMessageActivity(message);
          return;
        }
      }
      catch (Exception localException)
      {
        StaticMethods.logDebugFormat("Messages - Failed to show full screen message (%s)", new Object[] { localException.getMessage() });
        return;
      }
      if (message.isVisible) {
        message.rootViewGroup.addView(message.webView, i, j);
      }
      for (;;)
      {
        message.isVisible = true;
        return;
        TranslateAnimation localTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, j, 0.0F);
        localTranslateAnimation.setDuration(300L);
        message.webView.setAnimation(localTranslateAnimation);
        message.rootViewGroup.addView(message.webView, i, j);
      }
    }
  }
  
  private static class MessageFullScreenWebViewClient
    extends WebViewClient
  {
    private MessageFullScreen message;
    
    protected MessageFullScreenWebViewClient(MessageFullScreen paramMessageFullScreen)
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
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageFullScreen
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */