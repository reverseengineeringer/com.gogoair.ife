package com.adobe.primetime.va.plugins.ah.engine.context;

import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.EventDao;
import com.adobe.primetime.va.plugins.ah.engine.model.report.Report;
import com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem;

public class ReportFactory
{
  private Context _context;
  private String _logTag;
  private ILogger _logger;
  
  public ReportFactory(Context paramContext, ILogger paramILogger)
  {
    if (paramILogger == null) {
      throw new Error("Reference to the logger object cannot be NULL.");
    }
    _logTag = ReportFactory.class.getSimpleName();
    _logger = paramILogger;
    if (paramContext == null) {
      throw new Error("Reference to the context object cannot be NULL.");
    }
    _context = paramContext;
  }
  
  public Report createReportForItem(TrackItem paramTrackItem)
  {
    _logger.debug(_logTag, "Creating report for item: " + paramTrackItem.getEventDao().getType());
    return new Report(_context._adobeAnalyticsData, _context._userData, _context._serviceProviderData, _context._sessionData, paramTrackItem);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.context.ReportFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */