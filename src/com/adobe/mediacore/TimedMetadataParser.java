package com.adobe.mediacore;

import com.adobe.ave.TagData;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.metadata.TimedMetadata;
import com.adobe.mediacore.metadata.TimedMetadata.Type;
import com.adobe.mediacore.utils.NumberUtils;
import com.adobe.mediacore.utils.StringUtils;
import java.util.ArrayList;
import java.util.Iterator;

final class TimedMetadataParser
{
  private static final String AD_CUE_DURATION_KEY = "DURATION";
  private static final String AD_CUE_ID_KEY = "ID";
  private static final String CUE_DATA = "DATA";
  
  private static long getMetadataId(Metadata paramMetadata, String paramString, long paramLong)
  {
    if ((paramMetadata != null) && (paramMetadata.containsKey("ID"))) {
      try
      {
        long l = Long.parseLong(paramMetadata.getValue("ID"));
        return l;
      }
      catch (NumberFormatException paramMetadata) {}
    }
    return (paramString + paramLong).hashCode();
  }
  
  private static Metadata parseMetadata(String paramString)
  {
    MetadataNode localMetadataNode = new MetadataNode();
    if (StringUtils.isEmpty(paramString)) {
      return localMetadataNode;
    }
    paramString = splitIgnoringQuotes(',', paramString).iterator();
    while (paramString.hasNext())
    {
      String str = (String)paramString.next();
      Object localObject = splitIgnoringQuotes('=', str);
      if (((ArrayList)localObject).size() != 2)
      {
        localObject = StringUtils.trimQuotes(str.trim()).trim();
        if (NumberUtils.isNumeric((String)localObject)) {
          localMetadataNode.setValue("DURATION", (String)localObject);
        } else {
          localMetadataNode.setValue("DATA", ((String)localObject).trim());
        }
      }
      else
      {
        str = StringUtils.trimQuotes(((String)((ArrayList)localObject).get(0)).trim()).trim();
        localObject = StringUtils.trimQuotes(((String)((ArrayList)localObject).get(1)).trim()).trim();
        if (!StringUtils.isEmpty(str)) {
          localMetadataNode.setValue(str, (String)localObject);
        }
      }
    }
    return localMetadataNode;
  }
  
  public static TimedMetadata parseTagData(TagData paramTagData)
  {
    String str = data;
    long l1 = time;
    if (StringUtils.isEmpty(str)) {}
    do
    {
      return null;
      paramTagData = str.split(":", 2);
    } while (paramTagData.length < 1);
    str = paramTagData[0].trim();
    if (paramTagData.length >= 2) {}
    for (paramTagData = parseMetadata(paramTagData[1]);; paramTagData = new MetadataNode())
    {
      long l2 = getMetadataId(paramTagData, str, l1);
      return new TimedMetadata(TimedMetadata.Type.TAG, l1, l2, str, paramTagData);
    }
  }
  
  private static ArrayList splitIgnoringQuotes(char paramChar, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    int j = 0;
    if (j < paramString.length())
    {
      char c = paramString.charAt(j);
      if (c == '"')
      {
        localStringBuilder.append(c);
        if (i != 0) {
          i = 0;
        }
      }
      for (;;)
      {
        j += 1;
        break;
        i = 1;
        continue;
        if (c == paramChar)
        {
          if (i != 0)
          {
            localStringBuilder.append(c);
          }
          else
          {
            if (localStringBuilder.length() > 0) {
              localArrayList.add(localStringBuilder.toString());
            }
            localStringBuilder = new StringBuilder();
          }
        }
        else {
          localStringBuilder.append(c);
        }
      }
    }
    if (localStringBuilder.length() > 0) {
      localArrayList.add(localStringBuilder.toString());
    }
    return localArrayList;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TimedMetadataParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */