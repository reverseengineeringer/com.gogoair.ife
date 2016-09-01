package com.adobe.primetime.va.plugins.ah.engine.filter;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.radio.Command;
import com.adobe.primetime.core.radio.CommandQueue;

class ReportFilter$3
  implements ICallback
{
  ReportFilter$3(ReportFilter paramReportFilter) {}
  
  public Object call(Object paramObject)
  {
    paramObject = ((Event)paramObject).getData();
    ReportFilter.access$1000(this$0).addCommand(new Command(ReportFilter.access$900(this$0), paramObject));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.filter.ReportFilter.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */