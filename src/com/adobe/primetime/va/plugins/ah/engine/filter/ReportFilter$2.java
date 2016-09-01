package com.adobe.primetime.va.plugins.ah.engine.filter;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.va.plugins.ah.engine.model.report.Report;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

class ReportFilter$2
  implements ICallback
{
  ReportFilter$2(ReportFilter paramReportFilter) {}
  
  public Object call(Object paramObject)
  {
    if (ReportFilter.access$000(this$0)) {
      return null;
    }
    paramObject = ReportFilter.access$100(this$0).keySet().iterator();
    while (((Iterator)paramObject).hasNext())
    {
      localObject = (String)((Iterator)paramObject).next();
      localObject = ReportFilter.access$600(ReportFilter.access$500(ReportFilter.access$400((ArrayList)ReportFilter.access$100(this$0).get(localObject))));
      ReportFilter.access$700(this$0, (ArrayList)localObject);
      localObject = ((ArrayList)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        Report localReport = (Report)((Iterator)localObject).next();
        HashMap localHashMap = new HashMap();
        localHashMap.put("report", localReport);
        ReportFilter.access$300(this$0).trigger(new Event("filter:data_available", localHashMap));
      }
    }
    ReportFilter.access$100(this$0).clear();
    Object localObject = (String)ReportFilter.access$300(this$0).request("session_id");
    if (ReportFilter.access$800(this$0).containsKey(localObject)) {}
    for (paramObject = (HashMap)ReportFilter.access$800(this$0).get(localObject);; paramObject = new HashMap())
    {
      ReportFilter.access$800(this$0).clear();
      ReportFilter.access$800(this$0).put(localObject, paramObject);
      ReportFilter.access$202(this$0, false);
      return null;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.filter.ReportFilter.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */