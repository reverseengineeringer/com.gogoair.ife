package com.gogoair.ife.gogo_vision.model;

import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import org.json.JSONException;
import org.json.JSONObject;

public class GVLibraryEntry
  implements Parcelable
{
  public static final Parcelable.Creator CREATOR = new GVLibraryEntry.1();
  private static final String JSON_NAME_CACHEID = "cacheId";
  private static final String JSON_NAME_CURRENCYCODE = "currencyCode";
  private static final String JSON_NAME_DURATION = "duration";
  private static final String JSON_NAME_DURATIONURL = "durationUrl";
  private static final String JSON_NAME_IMA = "ima";
  private static final String JSON_NAME_LOCALEINFO = "localeInfo";
  private static final String JSON_NAME_LOGICALMEDIAID = "logicalMediaId";
  private static final String JSON_NAME_MACADDRESS = "macAddress";
  private static final String JSON_NAME_MEDIAFILEURL = "mediaFileUrl";
  private static final String JSON_NAME_PHYSICALMEDIAID = "physicalMediaId";
  private static final String JSON_NAME_PLAYDURATION = "playDuration";
  private static final String JSON_NAME_PRODUCTID = "productId";
  private static final String JSON_NAME_PRODUCTPRICE = "productPrice";
  private static final String JSON_NAME_RA = "ra";
  private static final String JSON_NAME_SY = "sy";
  private static final String JSON_NAME_TI = "ti";
  private static final String NO_CACHE_ID = "freeVideo";
  private String appData;
  private String cacheId;
  private int duration;
  private String durationUrl;
  private String ima;
  private String logicalMediaId;
  private String macAddress;
  private String mediaFileUrl;
  private String physicalMediaId;
  private String playDuration;
  private int playbackElapsed;
  private boolean playbackLogged;
  private long playbackStart;
  private String ra;
  private int selectedSubtitleIndex;
  private String sy;
  private String ti;
  private String token;
  
  public GVLibraryEntry(Cursor paramCursor)
  {
    try
    {
      duration = paramCursor.getInt(paramCursor.getColumnIndexOrThrow("duration"));
      durationUrl = paramCursor.getString(paramCursor.getColumnIndexOrThrow("durationUrl"));
      ima = paramCursor.getString(paramCursor.getColumnIndexOrThrow("ima"));
      macAddress = paramCursor.getString(paramCursor.getColumnIndexOrThrow("macAddress"));
      mediaFileUrl = paramCursor.getString(paramCursor.getColumnIndexOrThrow("mediaFileUrl"));
      logicalMediaId = paramCursor.getString(paramCursor.getColumnIndexOrThrow("logicalMediaId"));
      physicalMediaId = paramCursor.getString(paramCursor.getColumnIndexOrThrow("physicalMediaId"));
      playDuration = paramCursor.getString(paramCursor.getColumnIndexOrThrow("playDuration"));
      ra = paramCursor.getString(paramCursor.getColumnIndexOrThrow("ra"));
      sy = paramCursor.getString(paramCursor.getColumnIndexOrThrow("sy"));
      ti = paramCursor.getString(paramCursor.getColumnIndexOrThrow("ti"));
      token = paramCursor.getString(paramCursor.getColumnIndexOrThrow("token"));
      playbackElapsed = paramCursor.getInt(paramCursor.getColumnIndexOrThrow("playback_elapsed_time"));
      playbackStart = paramCursor.getLong(paramCursor.getColumnIndexOrThrow("playback_start_time"));
      if (paramCursor.getInt(paramCursor.getColumnIndexOrThrow("playback_logged")) != 0) {}
      for (boolean bool = true;; bool = false)
      {
        playbackLogged = bool;
        appData = paramCursor.getString(paramCursor.getColumnIndexOrThrow("app_data"));
        selectedSubtitleIndex = paramCursor.getInt(paramCursor.getColumnIndexOrThrow("playback_subtitle_index"));
        return;
      }
      return;
    }
    catch (IllegalArgumentException paramCursor)
    {
      paramCursor.printStackTrace();
    }
  }
  
  private GVLibraryEntry(Parcel paramParcel)
  {
    cacheId = paramParcel.readString();
    duration = paramParcel.readInt();
    durationUrl = paramParcel.readString();
    ima = paramParcel.readString();
    macAddress = paramParcel.readString();
    mediaFileUrl = paramParcel.readString();
    logicalMediaId = paramParcel.readString();
    physicalMediaId = paramParcel.readString();
    playDuration = paramParcel.readString();
    ra = paramParcel.readString();
    sy = paramParcel.readString();
    ti = paramParcel.readString();
    token = paramParcel.readString();
    playbackElapsed = paramParcel.readInt();
    playbackStart = paramParcel.readLong();
    if (paramParcel.readInt() == 1) {}
    for (;;)
    {
      playbackLogged = bool;
      appData = paramParcel.readString();
      selectedSubtitleIndex = paramParcel.readInt();
      return;
      bool = false;
    }
  }
  
  public GVLibraryEntry(JSONObject paramJSONObject)
    throws JSONException
  {
    playbackStart = System.currentTimeMillis();
    playbackElapsed = 0;
    playbackLogged = false;
    selectedSubtitleIndex = 0;
    logicalMediaId = paramJSONObject.getString("logicalMediaId");
    physicalMediaId = paramJSONObject.getString("physicalMediaId");
    if (paramJSONObject.has("cacheId")) {
      cacheId = paramJSONObject.getString("cacheId");
    }
    String str2 = physicalMediaId;
    String str3 = paramJSONObject.getString("productId");
    double d = paramJSONObject.getDouble("productPrice");
    String str4 = paramJSONObject.getString("currencyCode");
    String str5 = paramJSONObject.getString("localeInfo");
    String str6 = physicalMediaId;
    String str7 = logicalMediaId;
    if (cacheId == null) {}
    for (String str1 = "freeVideo";; str1 = cacheId)
    {
      token = String.format("mediaId=%s&productId=%s&productPrice=%f&currencyCode=%s&localeInfo=%s&physicalMediaId=%s&logicalMediaId=%s&cacheId=%s", new Object[] { str2, str3, Double.valueOf(d), str4, str5, str6, str7, str1 });
      appData = paramJSONObject.toString();
      if (paramJSONObject.has("duration")) {
        duration = paramJSONObject.getInt("duration");
      }
      if (paramJSONObject.has("durationUrl")) {
        durationUrl = paramJSONObject.getString("durationUrl");
      }
      if (paramJSONObject.has("ima")) {
        ima = paramJSONObject.getString("ima");
      }
      if (paramJSONObject.has("macAddress")) {
        macAddress = paramJSONObject.getString("macAddress");
      }
      if (paramJSONObject.has("mediaFileUrl")) {
        mediaFileUrl = paramJSONObject.getString("mediaFileUrl");
      }
      if (paramJSONObject.has("playDuration")) {
        playDuration = paramJSONObject.getString("playDuration");
      }
      if (paramJSONObject.has("ra")) {
        ra = paramJSONObject.getString("ra");
      }
      if (paramJSONObject.has("sy")) {
        sy = paramJSONObject.getString("sy");
      }
      if (paramJSONObject.has("ti")) {
        ti = paramJSONObject.getString("ti");
      }
      return;
    }
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getAppData()
  {
    return appData;
  }
  
  public String getCacheId()
  {
    return cacheId;
  }
  
  public int getDuration()
  {
    return duration;
  }
  
  public String getDurationUrl()
  {
    return durationUrl;
  }
  
  public String getIma()
  {
    return ima;
  }
  
  public String getLogicalMediaId()
  {
    return logicalMediaId;
  }
  
  public String getMacAddress()
  {
    return macAddress;
  }
  
  public String getMediaFileUrl()
  {
    return mediaFileUrl;
  }
  
  public String getPhysicalMediaId()
  {
    return physicalMediaId;
  }
  
  public String getPlayDuration()
  {
    return playDuration;
  }
  
  public int getPlaybackElapsed()
  {
    return playbackElapsed;
  }
  
  public long getPlaybackStart()
  {
    return playbackStart;
  }
  
  public String getRa()
  {
    return ra;
  }
  
  public int getSelectedSubtitleIndex()
  {
    return selectedSubtitleIndex;
  }
  
  public String getSy()
  {
    return sy;
  }
  
  public String getTi()
  {
    return ti;
  }
  
  public String getToken()
  {
    return token;
  }
  
  public boolean hasExpired()
  {
    return System.currentTimeMillis() - playbackStart > 86400000L;
  }
  
  public boolean isPlaybackLogged()
  {
    return playbackLogged;
  }
  
  public void setPlaybackElapsed(int paramInt)
  {
    playbackElapsed = paramInt;
  }
  
  public void setPlaybackLogged(boolean paramBoolean)
  {
    playbackLogged = paramBoolean;
  }
  
  public void setSelectedSubtitleIndex(int paramInt)
  {
    selectedSubtitleIndex = paramInt;
  }
  
  public long timeToExpiryInMillis()
  {
    return playbackStart + 86400000L - System.currentTimeMillis();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(cacheId);
    paramParcel.writeInt(duration);
    paramParcel.writeString(durationUrl);
    paramParcel.writeString(ima);
    paramParcel.writeString(macAddress);
    paramParcel.writeString(mediaFileUrl);
    paramParcel.writeString(logicalMediaId);
    paramParcel.writeString(physicalMediaId);
    paramParcel.writeString(playDuration);
    paramParcel.writeString(ra);
    paramParcel.writeString(sy);
    paramParcel.writeString(ti);
    paramParcel.writeString(token);
    paramParcel.writeInt(playbackElapsed);
    paramParcel.writeLong(playbackStart);
    if (playbackLogged) {}
    for (paramInt = 1;; paramInt = 0)
    {
      paramParcel.writeInt(paramInt);
      paramParcel.writeString(appData);
      paramParcel.writeInt(selectedSubtitleIndex);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.gogo_vision.model.GVLibraryEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */