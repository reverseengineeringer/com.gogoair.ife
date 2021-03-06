package android.support.v4.util;

public class Pair
{
  public final Object first;
  public final Object second;
  
  public Pair(Object paramObject1, Object paramObject2)
  {
    first = paramObject1;
    second = paramObject2;
  }
  
  public static Pair create(Object paramObject1, Object paramObject2)
  {
    return new Pair(paramObject1, paramObject2);
  }
  
  private static boolean objectsEqual(Object paramObject1, Object paramObject2)
  {
    return (paramObject1 == paramObject2) || ((paramObject1 != null) && (paramObject1.equals(paramObject2)));
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof Pair)) {}
    do
    {
      return false;
      paramObject = (Pair)paramObject;
    } while ((!objectsEqual(first, first)) || (!objectsEqual(second, second)));
    return true;
  }
  
  public int hashCode()
  {
    int j = 0;
    int i;
    if (first == null)
    {
      i = 0;
      if (second != null) {
        break label33;
      }
    }
    for (;;)
    {
      return i ^ j;
      i = first.hashCode();
      break;
      label33:
      j = second.hashCode();
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.util.Pair
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */