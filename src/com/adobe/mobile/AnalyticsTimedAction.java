package com.adobe.mobile;

import java.util.Map;

final class AnalyticsTimedAction
{
  protected long adjustedStartTime;
  protected Map contextData;
  protected int databaseID;
  protected long startTime;
  
  protected AnalyticsTimedAction(Map paramMap, long paramLong1, long paramLong2, int paramInt)
  {
    contextData = paramMap;
    databaseID = paramInt;
    startTime = paramLong1;
    adjustedStartTime = paramLong2;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsTimedAction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */