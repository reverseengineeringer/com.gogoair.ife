package com.auditude.ads.util;

import java.util.Calendar;
import java.util.Date;

public class AuditudeUtil$LocaltimeTagResult
  implements AuditudeUtil.ITagResult
{
  public String getResult()
  {
    Object localObject = Calendar.getInstance();
    ((Calendar)localObject).setTime(new Date());
    String str5 = Integer.toString(((Calendar)localObject).get(1));
    String str1 = Integer.toString(((Calendar)localObject).get(2) + 1);
    String str2;
    label58:
    String str3;
    label77:
    String str4;
    if (str1.length() >= 2)
    {
      str2 = Integer.toString(((Calendar)localObject).get(5));
      if (str2.length() < 2) {
        break label188;
      }
      str3 = Integer.toString(((Calendar)localObject).get(11));
      if (str3.length() < 2) {
        break label211;
      }
      str4 = Integer.toString(((Calendar)localObject).get(12));
      label97:
      if (str4.length() < 2) {
        break label234;
      }
    }
    for (localObject = Integer.toString(((Calendar)localObject).get(13));; localObject = '0' + (String)localObject) {
      if (((String)localObject).length() >= 2)
      {
        return str5 + str1 + str2 + str3 + str4 + (String)localObject;
        str1 = '0' + str1;
        break;
        label188:
        str2 = '0' + str2;
        break label58;
        label211:
        str3 = '0' + str3;
        break label77;
        label234:
        str4 = '0' + str4;
        break label97;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.AuditudeUtil.LocaltimeTagResult
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */