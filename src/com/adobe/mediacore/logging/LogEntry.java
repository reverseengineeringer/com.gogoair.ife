package com.adobe.mediacore.logging;

public class LogEntry
{
  private final String dateTime;
  private final String message;
  private final String tag;
  private final Logger.Verbosity verbosity;
  
  public LogEntry(String paramString1, String paramString2, Logger.Verbosity paramVerbosity, String paramString3)
  {
    dateTime = paramString1;
    message = paramString2;
    verbosity = paramVerbosity;
    tag = paramString3;
  }
  
  public String getDateTime()
  {
    return dateTime;
  }
  
  public String getMessage()
  {
    return message;
  }
  
  public String getTag()
  {
    return tag;
  }
  
  public Logger.Verbosity getVerbosity()
  {
    return verbosity;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.logging.LogEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */