package com.adobe.mobile;

import android.content.SharedPreferences;
import java.util.HashMap;
import java.util.concurrent.Callable;
import org.json.JSONException;
import org.json.JSONObject;

final class AudienceManagerWorker$1
  implements Callable
{
  public HashMap call()
    throws Exception
  {
    if (AudienceManagerWorker.access$000()) {}
    for (;;)
    {
      try
      {
        str = StaticMethods.getSharedPreferences().getString("AAMUserProfile", null);
        if (str != null)
        {
          int i = str.length();
          if (i <= 0) {}
        }
      }
      catch (StaticMethods.NullContextException localNullContextException)
      {
        String str;
        StaticMethods.logErrorFormat("Audience Manager - Problem accessing profile data (%s)", new Object[] { localNullContextException.getMessage() });
        continue;
      }
      try
      {
        AudienceManagerWorker.access$102(StaticMethods.mapFromJson(new JSONObject(str)));
        AudienceManagerWorker.access$002(false);
        return AudienceManagerWorker.access$100();
      }
      catch (JSONException localJSONException)
      {
        StaticMethods.logWarningFormat("Audience Manager - Problem accessing profile data (%s)", new Object[] { localJSONException.getLocalizedMessage() });
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AudienceManagerWorker.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */