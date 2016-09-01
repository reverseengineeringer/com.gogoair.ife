package com.adobe.mediacore.utils;

public class NumberUtils
{
  private static final String FALSE = "false";
  private static final String TRUE = "true";
  
  public static boolean isNumeric(String paramString)
  {
    try
    {
      Double.parseDouble(paramString);
      return true;
    }
    catch (Exception paramString) {}
    return false;
  }
  
  public static boolean parseBoolean(String paramString)
    throws NumberFormatException
  {
    if ((paramString == null) || ("false".equalsIgnoreCase(paramString.trim()))) {
      return false;
    }
    if ("true".equalsIgnoreCase(paramString.trim())) {
      return true;
    }
    throw new NumberFormatException("Unable to parse [" + paramString + "] to boolean.");
  }
  
  public static long parseLong(String paramString, long paramLong)
  {
    if (paramString != null) {}
    try
    {
      long l;
      if (!paramString.isEmpty()) {
        l = Long.parseLong(paramString);
      }
      for (paramLong = l;; paramLong = 0L) {
        return paramLong;
      }
      return paramLong;
    }
    catch (NumberFormatException paramString) {}
  }
  
  public static long parseNumber(String paramString, long paramLong)
  {
    if (paramString != null) {}
    try
    {
      long l;
      if (!paramString.isEmpty()) {
        l = Double.valueOf(Double.parseDouble(paramString)).longValue();
      }
      for (paramLong = l;; paramLong = 0L) {
        return paramLong;
      }
      return paramLong;
    }
    catch (NumberFormatException paramString) {}
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.utils.NumberUtils
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */