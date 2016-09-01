package crittercism.android;

import org.json.JSONException;
import org.json.JSONObject;

public final class dt
{
  private boolean a;
  private boolean b;
  
  public dt(boolean paramBoolean)
  {
    a = paramBoolean;
    b = true;
  }
  
  public final boolean a()
  {
    try
    {
      boolean bool = a;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public static final class a
  {
    public static dt a(ax paramax)
    {
      Object localObject1 = null;
      Object localObject2 = paramax.a(cr.i.a(), cr.i.b());
      if (localObject2 != null) {}
      for (;;)
      {
        try
        {
          localObject2 = new JSONObject((String)localObject2);
          localObject1 = localObject2;
        }
        catch (JSONException localJSONException)
        {
          dy.b();
          continue;
          boolean bool = paramax.c(cr.l.a(), cr.l.b());
          continue;
          bool = false;
          continue;
        }
        if (localObject1 != null)
        {
          bool = ((JSONObject)localObject1).optBoolean("optOutStatusSet", false);
          if (bool)
          {
            bool = ((JSONObject)localObject1).optBoolean("optOutStatus", false);
            return new dt(bool);
          }
        }
        localObject1 = null;
      }
    }
  }
}

/* Location:
 * Qualified Name:     crittercism.android.dt
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */