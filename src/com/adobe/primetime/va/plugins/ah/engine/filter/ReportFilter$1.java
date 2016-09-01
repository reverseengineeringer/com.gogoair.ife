package com.adobe.primetime.va.plugins.ah.engine.filter;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.SessionDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.Report;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

class ReportFilter$1
  implements ICallback
{
  ReportFilter$1(ReportFilter paramReportFilter) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (HashMap)paramObject;
    if (ReportFilter.access$000(this$0)) {}
    do
    {
      return null;
      paramObject = (Report)((HashMap)paramObject).get("report");
      if (paramObject != null)
      {
        String str = ((Report)paramObject).getSessionData().getSessionId();
        if (!ReportFilter.access$100(this$0).containsKey(str)) {
          ReportFilter.access$100(this$0).put(str, new ArrayList());
        }
        ((ArrayList)ReportFilter.access$100(this$0).get(str)).add(paramObject);
      }
    } while (ReportFilter.access$200(this$0));
    ReportFilter.access$202(this$0, true);
    paramObject = new HashMap();
    ((HashMap)paramObject).put("reset", Boolean.valueOf(true));
    ((HashMap)paramObject).put("repeat_count", Integer.valueOf(1));
    ReportFilter.access$300(this$0).command("clock:flush_filter.resume", paramObject);
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.filter.ReportFilter.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */