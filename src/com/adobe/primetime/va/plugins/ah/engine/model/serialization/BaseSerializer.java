package com.adobe.primetime.va.plugins.ah.engine.model.serialization;

import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.Dao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.Dao.DaoField;
import com.adobe.primetime.va.plugins.ah.engine.model.report.Report;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

abstract class BaseSerializer
  implements ISerializable
{
  protected String _logTag;
  protected ILogger _logger;
  
  BaseSerializer(ILogger paramILogger)
  {
    if (paramILogger == null) {
      throw new Error("Reference to logger object cannot be NULL.");
    }
    _logger = paramILogger;
    _logTag = BaseSerializer.class.getSimpleName();
  }
  
  ArrayList _processDao(Dao paramDao)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramDao.getData().entrySet().iterator();
    label322:
    while (localIterator.hasNext())
    {
      Object localObject1 = (Map.Entry)localIterator.next();
      String str1 = (String)((Map.Entry)localObject1).getKey();
      localObject1 = (Dao.DaoField)((Map.Entry)localObject1).getValue();
      Object localObject2 = value;
      Object localObject3 = hint;
      String str2 = paramDao.getRealm();
      localObject1 = null;
      if (localObject2 != null)
      {
        if ((localObject2 instanceof Long)) {
          localObject1 = (String)serializeLong(str1, (Long)localObject2, str2, localObject3);
        }
        for (;;)
        {
          if (localObject1 == null) {
            break label322;
          }
          localArrayList.add(localObject1);
          break;
          if ((localObject2 instanceof Integer)) {
            localObject1 = (String)serializeInteger(str1, (Integer)localObject2, str2, localObject3);
          } else if ((localObject2 instanceof Double)) {
            localObject1 = (String)serializeDouble(str1, (Double)localObject2, str2, localObject3);
          } else if ((localObject2 instanceof Boolean)) {
            localObject1 = (String)serializeBooleanToLong(str1, (Boolean)localObject2, str2, localObject3);
          } else if ((localObject2 instanceof String)) {
            localObject1 = (String)serializeString(str1, (String)localObject2, str2, localObject3);
          } else if ((localObject2 instanceof Dao)) {
            localObject1 = (String)serializeDao((Dao)localObject2);
          } else {
            _logger.warn(_logTag, "_processDao() - Unable to serialize DAO. Field: " + str1 + ". Value: " + localObject2 + ".");
          }
        }
      }
    }
    return localArrayList;
  }
  
  abstract Object serializeBooleanToLong(String paramString1, Boolean paramBoolean, String paramString2, Object paramObject);
  
  abstract Object serializeDao(Dao paramDao);
  
  abstract Object serializeDouble(String paramString1, Double paramDouble, String paramString2, Object paramObject);
  
  abstract Object serializeInteger(String paramString1, Integer paramInteger, String paramString2, Object paramObject);
  
  abstract Object serializeLong(String paramString1, Long paramLong, String paramString2, Object paramObject);
  
  abstract Object serializeMap(Map paramMap);
  
  public Map serializeReport(Report paramReport)
  {
    _logger.error(_logTag, "#serializeReport() - Pure virtual method. Must override.");
    return null;
  }
  
  abstract Object serializeString(String paramString1, String paramString2, String paramString3, Object paramObject);
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.serialization.BaseSerializer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */