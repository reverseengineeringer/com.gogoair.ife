package com.adobe.primetime.va.plugins.ah.engine.model.serialization;

import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.Dao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.Dao.Hint;
import com.adobe.primetime.va.plugins.ah.engine.model.report.Report;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class QueryStringSerializer
  extends BaseSerializer
{
  private static final String DATA_TYPE_LONG = "l";
  private static final String DATA_TYPE_SHORT = "h";
  private static final String DATA_TYPE_STRING = "s";
  
  public QueryStringSerializer(ILogger paramILogger)
  {
    super(paramILogger);
  }
  
  private String _removeLastCharacter(String paramString)
  {
    String str = paramString;
    if (paramString.length() > 0) {
      str = paramString.substring(0, paramString.length() - 1);
    }
    return str;
  }
  
  protected Object serializeBooleanToLong(String paramString1, Boolean paramBoolean, String paramString2, Object paramObject)
  {
    if (paramBoolean != null)
    {
      String str = "l";
      long l = 0L;
      if (paramBoolean.booleanValue()) {
        l = 1L;
      }
      paramBoolean = str;
      if (paramObject != null)
      {
        paramBoolean = str;
        if ((paramObject instanceof Dao.Hint))
        {
          paramBoolean = str;
          if (paramObject == Dao.Hint.SHORT) {
            paramBoolean = "h";
          }
        }
      }
      return paramBoolean + ":" + paramString2 + ":" + paramString1 + "=" + l;
    }
    return null;
  }
  
  String serializeDao(Dao paramDao)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    paramDao = _processDao(paramDao);
    int i = 0;
    if (i < paramDao.size())
    {
      if (i == paramDao.size() - 1) {
        localStringBuilder.append((String)paramDao.get(i));
      }
      for (;;)
      {
        i += 1;
        break;
        localStringBuilder.append((String)paramDao.get(i)).append("&");
      }
    }
    return localStringBuilder.toString();
  }
  
  protected Object serializeDouble(String paramString1, Double paramDouble, String paramString2, Object paramObject)
  {
    if (paramDouble != null) {
      return "l:" + paramString2 + ":" + paramString1 + "=" + paramDouble.longValue();
    }
    return null;
  }
  
  protected Object serializeInteger(String paramString1, Integer paramInteger, String paramString2, Object paramObject)
  {
    if (paramInteger != null) {
      return "l:" + paramString2 + ":" + paramString1 + "=" + paramInteger;
    }
    return null;
  }
  
  protected Object serializeLong(String paramString1, Long paramLong, String paramString2, Object paramObject)
  {
    String str2 = "l";
    if (paramLong != null)
    {
      String str1 = str2;
      if (paramObject != null)
      {
        str1 = str2;
        if ((paramObject instanceof Dao.Hint))
        {
          str1 = str2;
          if (paramObject == Dao.Hint.SHORT) {
            str1 = "h";
          }
        }
      }
      return str1 + ":" + paramString2 + ":" + paramString1 + "=" + paramLong;
    }
    return null;
  }
  
  String serializeMap(Map paramMap)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = paramMap.keySet().iterator();
    for (;;)
    {
      if (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        try
        {
          localStringBuilder.append("s:meta:" + str + "=" + URLEncoder.encode((String)paramMap.get(str), "utf-8"));
          localStringBuilder.append("&");
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException)
        {
          for (;;)
          {
            _logger.warn(_logTag, "#serializeMap() - Unable to serialize string: " + localUnsupportedEncodingException.getMessage());
          }
        }
      }
    }
    return _removeLastCharacter(localStringBuilder.toString());
  }
  
  public HashMap serializeReport(Report paramReport)
  {
    Object localObject = new ArrayList();
    if (paramReport.getAdobeAnalyticsData() != null) {
      ((ArrayList)localObject).add(serializeDao(paramReport.getAdobeAnalyticsData()));
    }
    if (paramReport.getUserData() != null) {
      ((ArrayList)localObject).add(serializeDao(paramReport.getUserData()));
    }
    if (paramReport.getCUserData() != null) {
      ((ArrayList)localObject).add(serializeDao(paramReport.getCUserData()));
    }
    if (paramReport.getServiceProviderData() != null) {
      ((ArrayList)localObject).add(serializeDao(paramReport.getServiceProviderData()));
    }
    if (paramReport.getSessionData() != null) {
      ((ArrayList)localObject).add(serializeDao(paramReport.getSessionData()));
    }
    if (paramReport.getEventData() != null) {
      ((ArrayList)localObject).add(serializeDao(paramReport.getEventData()));
    }
    if (paramReport.getAssetData() != null) {
      ((ArrayList)localObject).add(serializeDao(paramReport.getAssetData()));
    }
    if (paramReport.getStreamData() != null) {
      ((ArrayList)localObject).add(serializeDao(paramReport.getStreamData()));
    }
    if (paramReport.getQosData() != null) {
      ((ArrayList)localObject).add(serializeDao(paramReport.getQosData()));
    }
    if (paramReport.getMeta() != null) {
      ((ArrayList)localObject).add(serializeMap((HashMap)paramReport.getMeta()));
    }
    StringBuilder localStringBuilder = new StringBuilder();
    int i = 0;
    if (i < ((ArrayList)localObject).size())
    {
      if (i == ((ArrayList)localObject).size() - 1) {
        localStringBuilder.append((String)((ArrayList)localObject).get(i));
      }
      for (;;)
      {
        i += 1;
        break;
        localStringBuilder.append((String)((ArrayList)localObject).get(i)).append("&");
      }
    }
    localObject = new HashMap();
    ((HashMap)localObject).put("serializedOutput", localStringBuilder);
    ((HashMap)localObject).put("callback", paramReport.getCallback());
    return (HashMap)localObject;
  }
  
  protected Object serializeString(String paramString1, String paramString2, String paramString3, Object paramObject)
  {
    if ((paramString2 != null) && (!paramString2.equals(""))) {
      try
      {
        paramString1 = "s:" + paramString3 + ":" + paramString1 + "=" + URLEncoder.encode(paramString2, "utf-8");
        return paramString1;
      }
      catch (UnsupportedEncodingException paramString1)
      {
        _logger.warn(_logTag, "serializeString() - Unable to serialize string: " + paramString1.getMessage());
      }
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.serialization.QueryStringSerializer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */