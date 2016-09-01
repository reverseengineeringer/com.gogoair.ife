package com.adobe.mediacore.utils;

import java.util.Date;

public class DateUtils
{
  public static long getMillisecondsSince(Date paramDate)
  {
    if (paramDate == null) {}
    Date localDate;
    do
    {
      return 0L;
      localDate = new Date();
    } while (localDate.compareTo(paramDate) <= 0);
    return localDate.getTime() - paramDate.getTime();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.utils.DateUtils
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */