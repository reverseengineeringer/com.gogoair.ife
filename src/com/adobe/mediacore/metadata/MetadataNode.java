package com.adobe.mediacore.metadata;

import com.adobe.mediacore.utils.ByteArraySerializer;
import java.io.Serializable;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class MetadataNode
  implements Metadata, Serializable
{
  private static final long serialVersionUID = 1L;
  private final Map _byteArrays = new HashMap();
  private final Map _children = new HashMap();
  private final Map _objects = new HashMap();
  private final Map _values = new HashMap();
  
  public static Metadata fromByteArray(byte[] paramArrayOfByte)
  {
    paramArrayOfByte = ByteArraySerializer.fromByteArray(paramArrayOfByte);
    if ((paramArrayOfByte instanceof Metadata)) {
      return (Metadata)paramArrayOfByte;
    }
    return null;
  }
  
  public final boolean containsKey(String paramString)
  {
    return (_values.containsKey(paramString)) || (_children.containsKey(paramString)) || (_objects.containsKey(paramString));
  }
  
  public final boolean containsNode(String paramString)
  {
    return _children.containsKey(paramString);
  }
  
  public final boolean containsObject(String paramString)
  {
    return _objects.containsKey(paramString);
  }
  
  public final byte[] getByteArray(String paramString)
  {
    return (byte[])_byteArrays.get(paramString);
  }
  
  public final MetadataNode getNode(String paramString)
  {
    return (MetadataNode)_children.get(paramString);
  }
  
  public final Object getObject(String paramString)
  {
    return _objects.get(paramString);
  }
  
  public final String getValue(String paramString)
  {
    return (String)_values.get(paramString);
  }
  
  public final boolean isEmpty()
  {
    return (_values.isEmpty()) && (_children.isEmpty());
  }
  
  public final Set keySet()
  {
    HashSet localHashSet = new HashSet();
    localHashSet.addAll(_values.keySet());
    localHashSet.addAll(_children.keySet());
    return localHashSet;
  }
  
  public final void setByteArray(String paramString, byte[] paramArrayOfByte)
  {
    _byteArrays.put(paramString, paramArrayOfByte);
  }
  
  public final void setNode(String paramString, Metadata paramMetadata)
  {
    _children.put(paramString, paramMetadata);
  }
  
  public final void setObject(String paramString, Object paramObject)
  {
    _objects.put(paramString, paramObject);
  }
  
  public final void setValue(String paramString1, String paramString2)
  {
    _values.put(paramString1, paramString2);
    if (paramString2 != null) {
      _byteArrays.put(paramString1, paramString2.getBytes());
    }
  }
  
  public byte[] toByteArray()
  {
    return ByteArraySerializer.toByteArray(this);
  }
  
  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer("{");
    Iterator localIterator = _values.entrySet().iterator();
    Object localObject;
    String str;
    while (localIterator.hasNext())
    {
      localObject = (Map.Entry)localIterator.next();
      str = (String)((Map.Entry)localObject).getKey();
      localObject = (String)((Map.Entry)localObject).getValue();
      localStringBuffer.append("\"").append(str).append("\":").append("\"").append((String)localObject).append("\",");
    }
    if (_children.size() > 0)
    {
      localStringBuffer.append("\"children\":{");
      localIterator = _children.entrySet().iterator();
      while (localIterator.hasNext())
      {
        localObject = (Map.Entry)localIterator.next();
        str = (String)((Map.Entry)localObject).getKey();
        localObject = (Metadata)((Map.Entry)localObject).getValue();
        localStringBuffer.append("\"").append(str).append("\":").append(localObject).append(",");
      }
      localStringBuffer.deleteCharAt(localStringBuffer.length() - 1);
      localStringBuffer.append("}");
    }
    for (;;)
    {
      return "}";
      localStringBuffer.append("\"children\":null");
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.metadata.MetadataNode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */