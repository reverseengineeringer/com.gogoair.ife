package com.auditude.ads.response;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.loader.DataLoader;
import com.auditude.ads.loader.DataLoader.DataLoaderListener;
import java.util.Date;
import org.json.JSONArray;
import org.json.JSONObject;

public class AudienceManager
  implements DataLoader.DataLoaderListener
{
  public static final String AUD_AAM_SEGS = "aud_aam_segs";
  public static final String AUD_AAM_SEGS_DATE = "aud_aam_segs_expire";
  public static final String AUD_AAM_UUID = "aud_aam_uuid";
  public static final String AUD_CN_NAME = "aud";
  public static final String AUD_OBJ_NAME = "stuff";
  public static final String AUD_SEGS_PARAM_NAME = "segs";
  private String aamUrl;
  private DataLoader dataLoader;
  private AudienceManagerListener listener;
  private String[] segmentsValues;
  private int timeout;
  private String uuid;
  
  public AudienceManager(int paramInt)
  {
    timeout = paramInt;
  }
  
  private Boolean loadData()
  {
    Object localObject1 = (Context)AuditudeEnv.getInstance().getAdSettings().getProperty("applicationContext");
    if (localObject1 != null) {
      try
      {
        localObject1 = ((Context)localObject1).getSharedPreferences("aud_aam_segs", 0);
        Object localObject2 = ((SharedPreferences)localObject1).getString("aud_aam_segs_expire", null);
        String str = ((SharedPreferences)localObject1).getString("aamUrl", null);
        if (localObject2 != null)
        {
          localObject2 = new Date((String)localObject2);
          if (((int)(new Date().getTime() - ((Date)localObject2).getTime()) < 86400000) && (str.equalsIgnoreCase(aamUrl)))
          {
            str = ((SharedPreferences)localObject1).getString("aud_aam_segs", null);
            if ((str != null) && (str.length() > 0)) {
              segmentsValues = str.split(",");
            }
            uuid = ((SharedPreferences)localObject1).getString("aud_aam_uuid", null);
            return Boolean.valueOf(true);
          }
          return Boolean.valueOf(false);
        }
        return Boolean.valueOf(false);
      }
      catch (Exception localException)
      {
        return Boolean.valueOf(false);
      }
    }
    return Boolean.valueOf(false);
  }
  
  private void saveData()
  {
    Object localObject2 = (Context)AuditudeEnv.getInstance().getAdSettings().getProperty("applicationContext");
    if (localObject2 != null) {
      try
      {
        Object localObject1 = new Date();
        localObject2 = ((Context)localObject2).getSharedPreferences("aud_aam_segs", 0).edit();
        ((SharedPreferences.Editor)localObject2).clear();
        ((SharedPreferences.Editor)localObject2).putString("aud_aam_segs_expire", ((Date)localObject1).toGMTString());
        ((SharedPreferences.Editor)localObject2).putString("aamUrl", aamUrl);
        if (uuid != null) {
          ((SharedPreferences.Editor)localObject2).putString("aud_aam_uuid", uuid);
        }
        localObject1 = new StringBuilder();
        int i;
        if ((segmentsValues != null) && (segmentsValues.length > 0)) {
          i = 0;
        }
        for (;;)
        {
          if (i >= segmentsValues.length)
          {
            ((SharedPreferences.Editor)localObject2).putString("aud_aam_segs", ((StringBuilder)localObject1).toString());
            ((SharedPreferences.Editor)localObject2).commit();
            return;
          }
          ((StringBuilder)localObject1).append(segmentsValues[i] + ",");
          i += 1;
        }
        return;
      }
      catch (Exception localException) {}
    }
  }
  
  public String[] getSegmentsValues()
  {
    return segmentsValues;
  }
  
  public String getUuid()
  {
    return uuid;
  }
  
  public void loadSegmentData(String paramString)
  {
    aamUrl = paramString;
    segmentsValues = null;
    uuid = null;
    if (loadData().booleanValue())
    {
      listener.onAudienceManagerComplete();
      return;
    }
    dataLoader = new DataLoader();
    dataLoader.setDataLoaderListener(this);
    dataLoader.load(aamUrl, null, timeout);
  }
  
  public void onRequestComplete(String paramString)
  {
    int i = 0;
    try
    {
      paramString = new JSONObject(paramString);
      uuid = paramString.optString("uuid");
      paramString = paramString.getJSONArray("stuff");
      for (;;)
      {
        if (i >= paramString.length())
        {
          saveData();
          listener.onAudienceManagerComplete();
          return;
        }
        Object localObject = paramString.getJSONObject(i);
        if ((((JSONObject)localObject).optString("cn").toLowerCase().equals("aud")) && (((JSONObject)localObject).optString("cv") != null))
        {
          localObject = ((JSONObject)localObject).optString("cv").split("=");
          if ((localObject != null) && (localObject.length > 1) && (localObject[0].equals("segs")) && (localObject[1].length() > 0)) {
            segmentsValues = localObject[1].split(",");
          }
        }
        i += 1;
      }
      return;
    }
    catch (Exception paramString)
    {
      listener.onAudienceManagerFailed(paramString);
    }
  }
  
  public void onRequestFailed(Throwable paramThrowable)
  {
    listener.onAudienceManagerFailed(paramThrowable);
  }
  
  public void setAudienceManagerListener(AudienceManagerListener paramAudienceManagerListener)
  {
    listener = paramAudienceManagerListener;
  }
  
  public static abstract interface AudienceManagerListener
  {
    public abstract void onAudienceManagerComplete();
    
    public abstract void onAudienceManagerFailed(Throwable paramThrowable);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.AudienceManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */