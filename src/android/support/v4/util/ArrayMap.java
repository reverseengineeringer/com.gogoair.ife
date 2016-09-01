package android.support.v4.util;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class ArrayMap
  extends SimpleArrayMap
  implements Map
{
  MapCollections mCollections;
  
  public ArrayMap() {}
  
  public ArrayMap(int paramInt)
  {
    super(paramInt);
  }
  
  public ArrayMap(SimpleArrayMap paramSimpleArrayMap)
  {
    super(paramSimpleArrayMap);
  }
  
  private MapCollections getCollection()
  {
    if (mCollections == null) {
      mCollections = new ArrayMap.1(this);
    }
    return mCollections;
  }
  
  public boolean containsAll(Collection paramCollection)
  {
    return MapCollections.containsAllHelper(this, paramCollection);
  }
  
  public Set entrySet()
  {
    return getCollection().getEntrySet();
  }
  
  public Set keySet()
  {
    return getCollection().getKeySet();
  }
  
  public void putAll(Map paramMap)
  {
    ensureCapacity(mSize + paramMap.size());
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      put(localEntry.getKey(), localEntry.getValue());
    }
  }
  
  public boolean removeAll(Collection paramCollection)
  {
    return MapCollections.removeAllHelper(this, paramCollection);
  }
  
  public boolean retainAll(Collection paramCollection)
  {
    return MapCollections.retainAllHelper(this, paramCollection);
  }
  
  public Collection values()
  {
    return getCollection().getValues();
  }
}

/* Location:
 * Qualified Name:     android.support.v4.util.ArrayMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */