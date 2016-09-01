package com.adobe.mediacore;

import android.webkit.WebView;
import android.webkit.WebViewClient;

class CustomAdView$1
  extends WebViewClient
{
  CustomAdView$1(CustomAdView paramCustomAdView) {}
  
  public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
  {
    if ((paramString != null) && (paramString.startsWith("http://")))
    {
      CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdClickThru(paramString, true));
      return true;
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdView.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */