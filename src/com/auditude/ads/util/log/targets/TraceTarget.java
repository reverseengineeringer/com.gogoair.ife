package com.auditude.ads.util.log.targets;

import android.util.Log;
import com.auditude.ads.util.log.ILogger;
import com.auditude.ads.util.log.LogEvent;
import com.auditude.ads.util.log.LogLevel;
import java.util.Calendar;
import java.util.Date;

public class TraceTarget
  extends AbstractTarget
{
  public String fieldSeparator = " ";
  public Boolean includeCategory;
  public Boolean includeDate;
  public Boolean includeLevel;
  public Boolean includeTime;
  
  public TraceTarget(Boolean paramBoolean1, Boolean paramBoolean2, Boolean paramBoolean3, Boolean paramBoolean4)
  {
    includeTime = paramBoolean1;
    includeDate = paramBoolean2;
    includeCategory = paramBoolean3;
    includeLevel = paramBoolean4;
  }
  
  private String padTime(int paramInt, Boolean paramBoolean)
  {
    if (paramBoolean.booleanValue())
    {
      if (paramInt < 10) {
        return "00" + String.valueOf(paramInt);
      }
      if (paramInt < 100) {
        return "0" + String.valueOf(paramInt);
      }
      return String.valueOf(paramInt);
    }
    if (paramInt > 9) {
      return String.valueOf(paramInt);
    }
    return "0" + String.valueOf(paramInt);
  }
  
  public void logEvent(LogEvent paramLogEvent)
  {
    String str2 = "";
    String str1;
    if (!includeDate.booleanValue())
    {
      str1 = str2;
      if (!includeTime.booleanValue()) {}
    }
    else
    {
      Calendar localCalendar = Calendar.getInstance();
      localCalendar.setTime(new Date());
      if (includeDate.booleanValue()) {
        str2 = Integer.toString(localCalendar.get(2) + 1) + "/" + Integer.toString(localCalendar.get(5)) + "/" + Integer.toString(localCalendar.get(1)) + fieldSeparator;
      }
      str1 = str2;
      if (includeTime.booleanValue()) {
        str1 = str2 + padTime(localCalendar.get(11), Boolean.valueOf(false)) + ":" + padTime(localCalendar.get(12), Boolean.valueOf(false)) + ":" + padTime(localCalendar.get(13), Boolean.valueOf(false)) + "." + padTime(localCalendar.get(14), Boolean.valueOf(true)) + fieldSeparator;
      }
    }
    for (;;)
    {
      str2 = ((ILogger)paramLogEvent.getOwner()).getCategory();
      str1 = str1 + data;
      int i = level.getVerbosity();
      if (i == LogLevel.ERROR.getVerbosity())
      {
        Log.e(str2, str1);
        return;
      }
      if (i == LogLevel.WARN.getVerbosity())
      {
        Log.w(str2, str1);
        return;
      }
      if (i == LogLevel.INFO.getVerbosity())
      {
        Log.i(str2, str1);
        return;
      }
      if (i == LogLevel.DEBUG.getVerbosity())
      {
        Log.d(str2, str1);
        return;
      }
      if (i == LogLevel.FATAL.getVerbosity())
      {
        Log.e(str2, str1);
        return;
      }
      Log.i(str2, str1);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.log.targets.TraceTarget
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */