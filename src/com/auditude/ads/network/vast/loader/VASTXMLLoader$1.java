package com.auditude.ads.network.vast.loader;

import android.os.Handler;
import android.os.Message;
import com.auditude.ads.network.vast.model.VASTAd;
import com.auditude.ads.util.event.IEventListener;

class VASTXMLLoader$1
  extends Handler
{
  VASTXMLLoader$1(VASTXMLLoader paramVASTXMLLoader, IEventListener paramIEventListener) {}
  
  public void handleMessage(Message paramMessage)
  {
    String str;
    switch (what)
    {
    case 0: 
    default: 
      return;
    case 2: 
      str = (String)obj;
      VASTXMLLoader.access$4(this$0, new VASTDocumentProcessor(VASTXMLLoader.access$0(this$0), VASTXMLLoader.access$1(this$0), VASTXMLLoader.access$2(this$0), VASTXMLLoader.access$3(this$0)));
      VASTXMLLoader.access$5(this$0).addEventListener("processComplete", val$that);
      VASTXMLLoader.access$5(this$0).addEventListener("processFailed", val$that);
      if (!(val$that).State instanceof VASTAd)) {
        break;
      }
    }
    for (paramMessage = (VASTAd)val$that).State;; paramMessage = null)
    {
      VASTXMLLoader.access$5(this$0).process(str, paramMessage);
      return;
      VASTXMLLoader.access$6(this$0, (Exception)obj);
      VASTXMLLoader.access$7(this$0);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.loader.VASTXMLLoader.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */