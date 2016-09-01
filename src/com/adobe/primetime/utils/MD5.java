package com.adobe.primetime.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5
{
  public static String hash(String paramString)
  {
    try
    {
      Object localObject = MessageDigest.getInstance("MD5");
      ((MessageDigest)localObject).update(paramString.getBytes());
      localObject = ((MessageDigest)localObject).digest();
      StringBuilder localStringBuilder = new StringBuilder();
      int j = localObject.length;
      int i = 0;
      while (i < j)
      {
        for (paramString = Integer.toHexString(localObject[i] & 0xFF); paramString.length() < 2; paramString = "0" + paramString) {}
        localStringBuilder.append(paramString);
        i += 1;
      }
      paramString = localStringBuilder.toString();
      return paramString;
    }
    catch (NoSuchAlgorithmException paramString)
    {
      paramString.printStackTrace();
    }
    return "";
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.utils.MD5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */