package com.auditude.ads.util.log;

public final class LogLevel
{
  public static final LogLevel ALL = new LogLevel(0, "ALL");
  public static final LogLevel DEBUG;
  public static final LogLevel ERROR;
  public static final LogLevel FATAL = new LogLevel(1000, "FATAL");
  public static final LogLevel INFO;
  public static final LogLevel WARN;
  private String name;
  private int verbosity;
  
  static
  {
    ERROR = new LogLevel(8, "ERROR");
    WARN = new LogLevel(6, "WARN");
    INFO = new LogLevel(4, "INFO");
    DEBUG = new LogLevel(2, "DEBUG");
  }
  
  public LogLevel(int paramInt, String paramString)
  {
    verbosity = paramInt;
    name = paramString;
  }
  
  public String getName()
  {
    return name;
  }
  
  public int getVerbosity()
  {
    return verbosity;
  }
  
  public Boolean isAtLeast(LogLevel paramLogLevel)
  {
    if (verbosity >= verbosity) {
      return Boolean.valueOf(true);
    }
    return Boolean.valueOf(false);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.log.LogLevel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */