package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.EventDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.QoSDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;
import java.util.HashMap;
import java.util.Map;

class Context$20
  implements ICallback
{
  Context$20(Context paramContext) {}
  
  public Object call(Object paramObject)
  {
    synchronized (Context.access$200(this$0))
    {
      paramObject = (Map)((Event)paramObject).getData();
      Context.access$100(this$0).debug(Context.access$000(this$0), "#_onApiQuantumEnd(interval=" + this$0._channel.request("reporting_interval") + ")");
      if (!Context.access$300(this$0, "_onApiQuantumEnd")) {
        return null;
      }
      if (!Context.access$400(this$0).validateFields((HashMap)paramObject, new String[] { "playhead" })) {
        return null;
      }
    }
    Context.access$1600(this$0).getEventDao().setPlayhead(((Double)((Map)paramObject).get("playhead")).doubleValue());
    Context.access$500(this$0, (Map)paramObject);
    Context.access$1600(this$0).getQoSDao().setBitrate(this$0._qosData.getBitrate());
    Context.access$1600(this$0).getQoSDao().setFps(this$0._qosData.getFps());
    Context.access$1600(this$0).getQoSDao().setDroppedFrames(this$0._qosData.getDroppedFrames());
    Context.access$1600(this$0).getQoSDao().setStartupTime(-this$0._qosData.getStartupTime());
    Context.access$700(this$0, Context.access$1600(this$0));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.Context.20
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */