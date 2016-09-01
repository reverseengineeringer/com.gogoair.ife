package crittercism.android;

import java.util.HashMap;
import java.util.Map;

public final class dq
{
  private static Map a;
  
  static
  {
    HashMap localHashMap = new HashMap();
    a = localHashMap;
    localHashMap.put("com.amazon.venezia", new dp.a.a());
    a.put("com.android.vending", new dp.b.a());
  }
  
  public static do a(String paramString)
  {
    if ((paramString != null) && (a.containsKey(paramString))) {
      return (do)a.get(paramString);
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     crittercism.android.dq
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */