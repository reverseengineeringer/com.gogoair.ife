package com.auditude.ads.util.log;

import com.auditude.ads.util.log.targets.ILoggingTarget;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class Log
{
  public static final String ALL_LOGGER = "log.all";
  private static int NONE = Integer.MAX_VALUE;
  private static HashMap loggers;
  private static int targetLevel = NONE;
  private static ArrayList targets;
  
  public static void addLogger(String paramString, ILogger paramILogger)
  {
    if (paramILogger == null) {}
    for (;;)
    {
      return;
      if (loggers == null) {
        loggers = new HashMap();
      }
      loggers.put(paramString, paramILogger);
      int i = 0;
      while (i < targets.size())
      {
        ((ILoggingTarget)targets.get(i)).addLogger(paramILogger);
        i += 1;
      }
    }
  }
  
  public static void addTarget(ILoggingTarget paramILoggingTarget)
  {
    Iterator localIterator;
    if (paramILoggingTarget != null)
    {
      localIterator = loggers.keySet().iterator();
      if (localIterator.hasNext()) {
        break label55;
      }
      targets.add(paramILoggingTarget);
      if (targetLevel != NONE) {
        break label85;
      }
      targetLevel = paramILoggingTarget.getLevel().getVerbosity();
    }
    label55:
    label85:
    while (paramILoggingTarget.getLevel().getVerbosity() >= targetLevel)
    {
      return;
      String str = (String)localIterator.next();
      paramILoggingTarget.addLogger((ILogger)loggers.get(str));
      break;
    }
    targetLevel = paramILoggingTarget.getLevel().getVerbosity();
  }
  
  public static void flush()
  {
    loggers = new HashMap();
    targets = new ArrayList();
    targetLevel = NONE;
  }
  
  public static ILogger getLogger()
  {
    return getLogger(null);
  }
  
  public static ILogger getLogger(String paramString)
  {
    if (loggers == null) {
      loggers = new HashMap();
    }
    String str = paramString;
    if (paramString == null) {
      str = "log.all";
    }
    ILogger localILogger = (ILogger)loggers.get(str);
    paramString = localILogger;
    if (localILogger == null)
    {
      paramString = new LogLogger(str);
      addLogger(str, paramString);
    }
    return paramString;
  }
  
  public static void removeTarget(ILoggingTarget paramILoggingTarget)
  {
    Iterator localIterator;
    int i;
    if (paramILoggingTarget != null)
    {
      localIterator = loggers.keySet().iterator();
      if (localIterator.hasNext()) {
        break label42;
      }
      i = targets.size() - 1;
    }
    for (;;)
    {
      if (i < 0)
      {
        resetTargetLevel();
        return;
        label42:
        String str = (String)localIterator.next();
        paramILoggingTarget.removeLogger((ILogger)loggers.get(str));
        break;
      }
      if (paramILoggingTarget == targets.get(i)) {
        targets.remove(i);
      }
      i -= 1;
    }
  }
  
  private static void resetTargetLevel()
  {
    int j = NONE;
    int i = 0;
    for (;;)
    {
      if (i >= targets.size())
      {
        targetLevel = j;
        return;
      }
      int k;
      if (j != NONE)
      {
        k = j;
        if (((ILoggingTarget)targets.get(i)).getLevel().getVerbosity() >= j) {}
      }
      else
      {
        k = ((ILoggingTarget)targets.get(i)).getLevel().getVerbosity();
      }
      i += 1;
      j = k;
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.log.Log
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */