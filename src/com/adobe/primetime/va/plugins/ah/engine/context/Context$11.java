package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;

class Context$11
  implements ICallback
{
  Context$11(Context paramContext) {}
  
  public Object call(Object arg1)
  {
    synchronized (Context.access$200(this$0))
    {
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiSeekStart()");
      if (!Context.access$300(this$0, "_onApiSeekStart")) {
        return null;
      }
      Context.access$1302(this$0, this$0._assetData.getAdData());
      Context.access$1402(this$0, this$0._assetData.getChapterData());
      this$0._assetData.setAdData(null);
      this$0._assetData.setType("main");
      Context.access$1002(this$0, this$0._assetData.getVideoId());
      this$0._assetData.setChapterData(null);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.11
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */