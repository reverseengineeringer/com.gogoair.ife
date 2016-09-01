package com.adobe.mediacore;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

final class ProfilingManager
{
  private static final String LOG_TAG = "[PSDK]::[PROFILING]::" + ProfilingManager.class.getSimpleName();
  public static final boolean PROFILING_ENABLED = false;
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private static Map _registeredProfilers = new ConcurrentHashMap();
  
  static long getElapsedTime(String paramString)
  {
    if (_registeredProfilers.containsKey(paramString)) {
      return ((Profiler)_registeredProfilers.get(paramString)).getElapsedTime();
    }
    return 0L;
  }
  
  static long getTotalElapsedTime(String paramString)
  {
    if (_registeredProfilers.containsKey(paramString)) {
      return ((Profiler)_registeredProfilers.get(paramString)).getTotalElapsedTime();
    }
    return 0L;
  }
  
  static void log(String paramString1, String paramString2)
  {
    _logger.i(LOG_TAG, "Elapsed/Total time for " + paramString2 + " is " + getElapsedTime(paramString1) + " ms " + getTotalElapsedTime(paramString1));
  }
  
  static void recordElapsedTime(String paramString)
  {
    if (_registeredProfilers.containsKey(paramString)) {
      ((Profiler)_registeredProfilers.get(paramString)).registerElapsedTime();
    }
  }
  
  static void recordStartElapsedTime(String paramString)
  {
    if (_registeredProfilers.containsKey(paramString)) {
      ((Profiler)_registeredProfilers.get(paramString)).registerStartElapsedTime();
    }
  }
  
  static void registerProfiler(String paramString)
  {
    if (!_registeredProfilers.containsKey(paramString)) {
      _registeredProfilers.put(paramString, new Profiler());
    }
  }
  
  static void unregisterProfiler(String paramString)
  {
    if (_registeredProfilers.containsKey(paramString)) {
      _registeredProfilers.remove(paramString);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ProfilingManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */