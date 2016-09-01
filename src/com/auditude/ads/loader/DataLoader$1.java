package com.auditude.ads.loader;

import android.os.Handler;
import android.os.Message;

class DataLoader$1
  extends Handler
{
  DataLoader$1(DataLoader paramDataLoader) {}
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    case 0: 
    default: 
    case 2: 
      do
      {
        return;
        paramMessage = (String)obj;
      } while (DataLoader.access$0(this$0) == null);
      DataLoader.access$0(this$0).onRequestComplete(paramMessage);
      return;
    }
    DataLoader.access$1(this$0, (Exception)obj);
    DataLoader.access$3(this$0, DataLoader.access$2(this$0));
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.loader.DataLoader.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */