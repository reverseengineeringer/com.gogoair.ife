package com.adobe.mediacore.utils;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public final class StringUtils
{
  public static Metadata extractFromString(String paramString1, String paramString2, String paramString3)
  {
    MetadataNode localMetadataNode = new MetadataNode();
    paramString2 = paramString1.split(paramString2);
    int j = paramString2.length;
    int i = 0;
    while (i < j)
    {
      paramString1 = paramString2[i];
      if (!paramString1.contains(paramString3))
      {
        i += 1;
      }
      else
      {
        paramString1 = paramString1.split(paramString3);
        String str = paramString1[0].trim();
        if (paramString1.length > 1) {}
        for (paramString1 = paramString1[1].trim();; paramString1 = "")
        {
          localMetadataNode.setValue(str, paramString1);
          break;
        }
      }
    }
    return localMetadataNode;
  }
  
  public static String getFileExtension(String paramString)
  {
    for (;;)
    {
      try
      {
        paramString = new URL(paramString).getFile();
        int i = paramString.lastIndexOf(".");
        if (i != -1)
        {
          paramString = paramString.substring(i + 1).trim();
          String str = paramString;
          if (paramString != null)
          {
            str = paramString;
            if (paramString.contains("?")) {
              str = paramString.substring(0, paramString.lastIndexOf("?")).trim();
            }
          }
          return str;
        }
      }
      catch (MalformedURLException paramString)
      {
        return null;
      }
      paramString = null;
    }
  }
  
  public static String[] getReunion(String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    HashSet localHashSet = new HashSet();
    if (paramArrayOfString1 != null) {
      localHashSet.addAll(Arrays.asList(paramArrayOfString1));
    }
    if (paramArrayOfString2 != null) {
      localHashSet.addAll(Arrays.asList(paramArrayOfString2));
    }
    return (String[])localHashSet.toArray(new String[localHashSet.size()]);
  }
  
  public static boolean isEmpty(String paramString)
  {
    return (paramString == null) || (paramString.trim().length() == 0);
  }
  
  public static String trimQuotes(String paramString)
  {
    String str = paramString;
    if (paramString.startsWith("\"")) {
      str = paramString.substring(1, paramString.length());
    }
    paramString = str;
    if (str.endsWith("\"")) {
      paramString = str.substring(0, str.length() - 1);
    }
    return paramString;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.utils.StringUtils
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */