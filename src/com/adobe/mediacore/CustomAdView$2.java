package com.adobe.mediacore;

import android.webkit.ConsoleMessage;
import android.webkit.WebChromeClient;
import com.adobe.mediacore.logging.Logger;

class CustomAdView$2
  extends WebChromeClient
{
  CustomAdView$2(CustomAdView paramCustomAdView) {}
  
  public boolean onConsoleMessage(ConsoleMessage paramConsoleMessage)
  {
    CustomAdView.access$200(this$0).w(CustomAdView.access$100(), paramConsoleMessage.message() + " -- From line " + paramConsoleMessage.lineNumber() + " of " + paramConsoleMessage.sourceId());
    return true;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdView.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */