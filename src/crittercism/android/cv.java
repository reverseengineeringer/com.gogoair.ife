package crittercism.android;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class cv
  implements cx
{
  public Map a = new HashMap();
  
  public cv(au paramau)
  {
    a.put("app_id", paramau.a());
    a.put("hashed_device_id", paramau.c());
    a.put("library_version", "5.0.6");
  }
  
  public final cv a(String paramString1, String paramString2)
  {
    a.put(paramString1, paramString2);
    return this;
  }
  
  public final cv a(String paramString, JSONArray paramJSONArray)
  {
    a.put(paramString, paramJSONArray);
    return this;
  }
  
  public final void a(OutputStream paramOutputStream)
  {
    dy.b();
    paramOutputStream.write(new JSONObject(a).toString().getBytes("UTF8"));
  }
  
  public final String toString()
  {
    try
    {
      String str = new JSONObject(a).toString(4);
      return str;
    }
    catch (JSONException localJSONException)
    {
      dy.a();
    }
    return null;
  }
  
  public static final class a
    implements cy
  {}
}

/* Location:
 * Qualified Name:     crittercism.android.cv
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */