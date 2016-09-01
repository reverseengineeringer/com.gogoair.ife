package com.adobe.primetime.va.plugins.ah.engine.filter;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.radio.Command;
import com.adobe.primetime.core.radio.CommandQueue;

class ReportFilter$4
  implements ICallback
{
  ReportFilter$4(ReportFilter paramReportFilter) {}
  
  public Object call(Object paramObject)
  {
    ReportFilter.access$1000(this$0).addCommand(new Command(ReportFilter.access$1100(this$0), this));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.filter.ReportFilter.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */