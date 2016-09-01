package crittercism.android;

import android.content.SharedPreferences;
import java.util.HashMap;
import java.util.Map;

public final class dm
  extends dj
{
  public Map a = new HashMap();
  private dx b;
  private au c;
  private boolean d = false;
  private boolean e = false;
  private boolean f = false;
  private boolean g = false;
  
  public dm(au paramau)
  {
    c = paramau;
    b = paramau.l();
  }
  
  private void a(String paramString, Object paramObject)
  {
    try
    {
      a.put(paramString, paramObject);
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public final void a()
  {
    boolean bool2 = false;
    boolean bool1 = b.b();
    if (d) {
      a("optOutStatus", Boolean.valueOf(bool1));
    }
    if (!bool1)
    {
      if (e) {
        a("crashedOnLastLoad", Boolean.valueOf(dr.a));
      }
      if (f) {
        a("userUUID", c.c());
      }
      if (g)
      {
        du localdu = AA;
        if (localdu != null)
        {
          bool1 = bool2;
          if (a.getBoolean("rateMyAppEnabled", false))
          {
            bool1 = bool2;
            if (!a.getBoolean("hasRatedApp", false))
            {
              int i = localdu.a();
              int j = a.getInt("rateAfterNumLoads", 5);
              bool1 = bool2;
              if (i >= j)
              {
                bool1 = bool2;
                if ((i - j) % a.getInt("remindAfterNumLoads", 5) == 0) {
                  bool1 = true;
                }
              }
            }
          }
          a("shouldShowRateAppAlert", Boolean.valueOf(bool1));
          a("message", localdu.b());
          a("title", localdu.c());
        }
      }
    }
  }
  
  public final void b()
  {
    d = true;
  }
  
  public final void c()
  {
    e = true;
  }
  
  public final void d()
  {
    f = true;
  }
  
  public final void e()
  {
    g = true;
  }
}

/* Location:
 * Qualified Name:     crittercism.android.dm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */