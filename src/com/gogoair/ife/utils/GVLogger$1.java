package com.gogoair.ife.utils;

import android.content.Context;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.storage.MediaDb;
import org.json.JSONException;
import org.json.JSONObject;

class GVLogger$1
  implements GVLogger.RemoteLoggerListener
{
  GVLogger$1(GVLogger paramGVLogger, GVLibraryEntry paramGVLibraryEntry, Context paramContext) {}
  
  private void logError(String paramString)
  {
    GVLogger.getDefaultLogger().logASP("ERROR", Constants.GVErrorCode.ACC_GRADE_LOG_FAIL.getValue(), 0, val$entry.getAppData(), paramString);
  }
  
  private void logSuccess()
  {
    GVLogger.getDefaultLogger().logASP("INFO", Constants.GVInfoCode.ACC_GRADE_LOG_SUCCESS.getValue(), 0, val$entry.getAppData(), "Accounting grade log sent successfully.");
    MediaDb localMediaDb = new MediaDb(val$context);
    val$entry.setPlaybackLogged(true);
    localMediaDb.updateLibraryEntry(val$entry);
    localMediaDb.close();
  }
  
  public void onLogFailure(String paramString)
  {
    GVLogger.getDefaultLogger().d("GVLogger", "Accounting grade failed, log to ASP logger");
    logError("Failed to log accounting grade. Following error was returned: " + paramString);
  }
  
  public void onLogSuccess(String paramString)
  {
    try
    {
      paramString = new JSONObject(paramString);
      if ((paramString.has("msg")) && (paramString.getString("msg").equals("success")))
      {
        logSuccess();
        return;
      }
      if ((paramString.has("status")) && (paramString.getString("status").equals("success")))
      {
        logSuccess();
        return;
      }
    }
    catch (JSONException paramString)
    {
      paramString.printStackTrace();
      logError("Invalid JSON response from server.");
      return;
    }
    logError("JSONObject error.");
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.GVLogger.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */