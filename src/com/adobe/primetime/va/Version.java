package com.adobe.primetime.va;

public final class Version
{
  private static final Integer API_LEVEL = Integer.valueOf(3);
  private static final String BUILD = "4518d6";
  private static final String PLATFORM = "android";
  private static final String VERSION = "1.5.2.9";
  
  public static Integer getApiLevel()
  {
    return API_LEVEL;
  }
  
  public static String getBuild()
  {
    return "4518d6";
  }
  
  public static String getMajor()
  {
    return getNumberAtPosition(0);
  }
  
  public static String getMicro()
  {
    return getNumberAtPosition(2);
  }
  
  public static String getMinor()
  {
    return getNumberAtPosition(1);
  }
  
  public static String getNumberAtPosition(int paramInt)
  {
    return "1.5.2.9".split("\\.")[paramInt];
  }
  
  public static String getPatch()
  {
    return getNumberAtPosition(3);
  }
  
  public static String getVersion()
  {
    return "android-1.5.2.9-4518d6";
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.Version
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */