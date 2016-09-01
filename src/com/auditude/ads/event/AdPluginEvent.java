package com.auditude.ads.event;

import java.util.HashMap;

public class AdPluginEvent
{
  public static final String BREAK_BEGIN = "breakBegin";
  public static final String BREAK_END = "breakEnd";
  public static final String INIT_COMPLETE = "initComplete";
  public static final String LOAD_COMPLETE = "loadComplete";
  public static final String NETWORK_AD_RESPONSE_EMPTY = "NetworkAdResponseEmpty";
  public static final String PAUSE_PLAYBACK = "pausePlayback";
  public static final String RESUME_PLAYBACK = "resumePlayback";
  private HashMap data;
  private String type;
  
  public AdPluginEvent(String paramString)
  {
    this(paramString, null);
  }
  
  public AdPluginEvent(String paramString, HashMap paramHashMap)
  {
    type = paramString;
    data = paramHashMap;
  }
  
  public final HashMap getData()
  {
    return data;
  }
  
  public final String getType()
  {
    return type;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.event.AdPluginEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */