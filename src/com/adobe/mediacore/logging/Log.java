package com.adobe.mediacore.logging;

public final class Log
{
  private static LogFactory _logFactory = new DefaultLogFactory();
  
  public static LogFactory getLogFactory()
  {
    return _logFactory;
  }
  
  public static Logger getLogger(String paramString)
  {
    return _logFactory.getLogger(paramString);
  }
  
  public static void setLogFactory(LogFactory paramLogFactory)
  {
    _logFactory = paramLogFactory;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.logging.Log
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */