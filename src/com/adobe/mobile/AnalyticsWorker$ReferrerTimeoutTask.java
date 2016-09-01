package com.adobe.mobile;

import java.util.TimerTask;

public class AnalyticsWorker$ReferrerTimeoutTask
  extends TimerTask
{
  private boolean kickFlag = false;
  
  AnalyticsWorker$ReferrerTimeoutTask(AnalyticsWorker paramAnalyticsWorker, boolean paramBoolean)
  {
    kickFlag = paramBoolean;
  }
  
  public void run()
  {
    ReferrerHandler.setReferrerProcessed(true);
    StaticMethods.logDebugFormat("Analytics - Referrer timeout has expired without referrer data", new Object[0]);
    this$0.kick(kickFlag);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsWorker.ReferrerTimeoutTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */