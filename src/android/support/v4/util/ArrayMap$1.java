package android.support.v4.util;

import java.util.Map;

class ArrayMap$1
  extends MapCollections
{
  ArrayMap$1(ArrayMap paramArrayMap) {}
  
  protected void colClear()
  {
    this$0.clear();
  }
  
  protected Object colGetEntry(int paramInt1, int paramInt2)
  {
    return this$0.mArray[((paramInt1 << 1) + paramInt2)];
  }
  
  protected Map colGetMap()
  {
    return this$0;
  }
  
  protected int colGetSize()
  {
    return this$0.mSize;
  }
  
  protected int colIndexOfKey(Object paramObject)
  {
    return this$0.indexOfKey(paramObject);
  }
  
  protected int colIndexOfValue(Object paramObject)
  {
    return this$0.indexOfValue(paramObject);
  }
  
  protected void colPut(Object paramObject1, Object paramObject2)
  {
    this$0.put(paramObject1, paramObject2);
  }
  
  protected void colRemoveAt(int paramInt)
  {
    this$0.removeAt(paramInt);
  }
  
  protected Object colSetValue(int paramInt, Object paramObject)
  {
    return this$0.setValueAt(paramInt, paramObject);
  }
}

/* Location:
 * Qualified Name:     android.support.v4.util.ArrayMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */