package com.auditude.ads.core;

import com.auditude.ads.reporting.ReportingHelper;
import com.auditude.ads.util.log.ILogger;
import com.auditude.ads.util.log.Log;
import com.auditude.ads.util.log.LogLevel;
import com.auditude.ads.util.log.targets.AbstractTarget;
import com.auditude.ads.util.log.targets.TraceTarget;

public class AuditudeEnv
{
  public static final String PLAYER_REVISION = "57988";
  private static AuditudeEnv instance;
  private AdSettings adSettings;
  private APIBridge apiBridge;
  private ReportingHelper reporting;
  public Boolean shouldIgnoreNextBreak = Boolean.valueOf(false);
  public Boolean shouldPauseAdPatterns = Boolean.valueOf(false);
  
  public static AuditudeEnv getInstance()
  {
    return instance;
  }
  
  private void initLoggers()
  {
    Log.flush();
    new TraceTarget(Boolean.valueOf(true), Boolean.valueOf(true), Boolean.valueOf(true), Boolean.valueOf(true)).setLevel(LogLevel.ALL);
  }
  
  public static void setEnvironment(AuditudeEnv paramAuditudeEnv)
  {
    instance = paramAuditudeEnv;
  }
  
  public final APIBridge getAPI()
  {
    return apiBridge;
  }
  
  public final AdSettings getAdSettings()
  {
    return adSettings;
  }
  
  public final ReportingHelper getReportingHelper()
  {
    return reporting;
  }
  
  public final void init(APIBridge paramAPIBridge, ReportingHelper paramReportingHelper, AdSettings paramAdSettings)
  {
    apiBridge = paramAPIBridge;
    reporting = paramReportingHelper;
    adSettings = paramAdSettings;
    initLoggers();
    Log.getLogger().info("Auditude Library Version: 57988");
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.core.AuditudeEnv
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */