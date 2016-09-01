package com.adobe.mobile;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

final class MediaAnalytics
{
  private static final String AD_CLICKED_KEY = "a.media.ad.clicked";
  private static final String AD_COMPLETE_KEY = "a.media.ad.complete";
  private static final String AD_CPM = "a.media.ad.CPM";
  private static final String AD_LENGTH_KEY = "a.media.ad.length";
  private static final String AD_MILESTONE_KEY = "a.media.ad.milestone";
  private static final String AD_NAME_KEY = "a.media.ad.name";
  private static final String AD_OFFSET_MILESTONE_KEY = "a.media.ad.offsetMilestone";
  private static final String AD_PLAYER_NAME_KEY = "a.media.ad.playerName";
  private static final String AD_POD = "a.media.ad.pod";
  private static final String AD_POD_POSITION = "a.media.ad.podPosition";
  private static final String AD_SEGMENT_KEY = "a.media.ad.segment";
  private static final String AD_SEGMENT_NUM_KEY = "a.media.ad.segmentNum";
  private static final String AD_SEGMENT_VIEW_KEY = "a.media.ad.segmentView";
  private static final String AD_TIME_PLAYED_KEY = "a.media.ad.timePlayed";
  private static final String AD_VIEW_KEY = "a.media.ad.view";
  private static final String CHANNEL_KEY = "a.media.channel";
  private static final String COMPLETE_KEY = "a.media.complete";
  private static final String CONTENT_TYPE_KEY = "a.contentType";
  private static final String CONTENT_TYPE_VALUE = "video";
  private static final String CONTENT_TYPE_VALUE_AD = "videoAd";
  private static final String DEFAULT_PLAYER_NAME = "Not_Specified";
  private static final String INITIAL_HIT_PAGE_EVENT = "m_s";
  private static final String LENGTH_KEY = "a.media.length";
  protected static final double LIVE_EVENT_LENGTH = -1.0D;
  private static final String MEDIA_CLICKED_KEY = "a.media.clicked";
  private static final String MEDIA_HIT_PAGE_EVENT = "m_i";
  private static final String MEDIA_VIEW_KEY = "a.media.view";
  private static final String MILESTONE_KEY = "a.media.milestone";
  private static final String NAME_KEY = "a.media.name";
  private static final String OFFSET_MILESTONE_KEY = "a.media.offsetMilestone";
  private static final String PAGE_EVENT_VAR_OVERRIDE = "&&pe";
  private static final String PEV_VALUE_OVERRIDE = "video";
  private static final String PEV_VALUE_OVERRIDE_AD = "videoAd";
  private static final String PEV_VAR_OVERRIDE = "&&pev3";
  private static final String PLAYER_NAME_KEY = "a.media.playerName";
  private static final String SEGMENT_KEY = "a.media.segment";
  private static final String SEGMENT_NUM_KEY = "a.media.segmentNum";
  private static final String SEGMENT_VIEW_KEY = "a.media.segmentView";
  private static final String TIME_PLAYED_KEY = "a.media.timePlayed";
  private static MediaAnalytics _instance = null;
  private static final Object _instanceMutex = new Object();
  private static final List unwantedValues = Arrays.asList(new String[] { null, "" });
  protected int completeCloseOffsetThreshold = 1;
  private final HashMap mediaItemList = new HashMap();
  protected int trackSeconds = 0;
  
  private void addGenericMediaContextData(HashMap paramHashMap, MediaItem paramMediaItem, boolean paramBoolean)
  {
    String str;
    if (paramBoolean)
    {
      str = "m_s";
      paramHashMap.put("&&pe", str);
      if ((!mediaAd) || (isNilOrEmptyString(parentName))) {
        break label220;
      }
      paramHashMap.put("&&pev3", "videoAd");
      paramHashMap.put("a.contentType", "videoAd");
      paramHashMap.put("a.media.ad.name", paramMediaItem.getName());
      paramHashMap.put("a.media.ad.playerName", paramMediaItem.getPlayerName());
      paramHashMap.put("a.media.name", cleanName(parentName));
      if (!paramMediaItem.isLive()) {
        paramHashMap.put("a.media.ad.length", Integer.toString((int)paramMediaItem.getLength()));
      }
      if ((parentPod != null) && (parentPod.length() > 0)) {
        paramHashMap.put("a.media.ad.pod", parentPod);
      }
      if (parentPodPosition > 0.0D) {
        paramHashMap.put("a.media.ad.podPosition", Integer.toString((int)parentPodPosition));
      }
      if ((paramBoolean) && (!isNilOrEmptyString(CPM))) {
        paramHashMap.put("a.media.ad.CPM", CPM);
      }
    }
    for (;;)
    {
      if (!isNilOrEmptyString(channel)) {
        paramHashMap.put("a.media.channel", channel);
      }
      return;
      str = "m_i";
      break;
      label220:
      paramHashMap.put("&&pev3", "video");
      paramHashMap.put("a.contentType", "video");
      paramHashMap.put("a.media.name", paramMediaItem.getName());
      paramHashMap.put("a.media.playerName", paramMediaItem.getPlayerName());
      if (!paramMediaItem.isLive()) {
        paramHashMap.put("a.media.length", Integer.toString((int)paramMediaItem.getLength()));
      }
    }
  }
  
  private void addSegmentContextData(HashMap paramHashMap, MediaItem paramMediaItem)
  {
    Object localObject2;
    if ((paramMediaItem.isSegmentByMilestones()) || (paramMediaItem.isSegmentByOffsetMilestones()))
    {
      localObject2 = currentMediaState;
      if (previousMediaState == null) {
        break label186;
      }
      if ((currentMediaState.segmentNum != lastTrackSegmentNumber) || (currentMediaState.complete))
      {
        if (mediaAd) {
          break label166;
        }
        localObject1 = "a.media.segmentView";
        paramHashMap.put(localObject1, String.valueOf(true));
      }
      if (currentMediaState.segmentNum == previousMediaState.segmentNum) {
        break label186;
      }
    }
    label111:
    label166:
    label179:
    label186:
    for (Object localObject1 = previousMediaState;; localObject1 = localObject2)
    {
      if (segmentNum > 0)
      {
        if (!mediaAd)
        {
          localObject2 = "a.media.segmentNum";
          paramHashMap.put(localObject2, Integer.toString(segmentNum));
        }
      }
      else if (segment != null) {
        if (mediaAd) {
          break label179;
        }
      }
      for (localObject2 = "a.media.segment";; localObject2 = "a.media.ad.segment")
      {
        paramHashMap.put(localObject2, segment);
        lastTrackSegmentNumber = currentMediaState.segmentNum;
        return;
        localObject1 = "a.media.ad.segmentView";
        break;
        localObject2 = "a.media.ad.segmentNum";
        break label111;
      }
    }
  }
  
  private String cleanName(String paramString)
  {
    if (isNilOrEmptyString(paramString)) {
      return null;
    }
    return paramString.replace("\n", "").replace("\r", "").replace("--**--", "");
  }
  
  private boolean hashMapIsNullOrEmpty(HashMap paramHashMap)
  {
    return (paramHashMap == null) || (paramHashMap.size() == 0);
  }
  
  private boolean isNilOrEmptyString(String paramString)
  {
    return (paramString == null) || (paramString.trim().length() == 0);
  }
  
  private MediaItem mediaItemWithName(String paramString)
  {
    paramString = cleanName(paramString);
    if ((isNilOrEmptyString(paramString)) || (hashMapIsNullOrEmpty(mediaItemList))) {
      return null;
    }
    return (MediaItem)mediaItemList.get(paramString);
  }
  
  private void notifyDelegateOfMediaState(MediaItem paramMediaItem)
  {
    if (callback != null) {
      callback.call(paramMediaItem.getReportMediaState());
    }
  }
  
  private void removeEmptyValues(HashMap paramHashMap)
  {
    paramHashMap.values().removeAll(unwantedValues);
  }
  
  private void removeMediaItemIfComplete(MediaItem paramMediaItem)
  {
    if (currentMediaState.percent >= 100.0D) {
      mediaItemList.remove(name);
    }
  }
  
  protected static MediaAnalytics sharedInstance()
  {
    synchronized (_instanceMutex)
    {
      if (_instance == null) {
        _instance = new MediaAnalytics();
      }
      MediaAnalytics localMediaAnalytics = _instance;
      return localMediaAnalytics;
    }
  }
  
  private void trackMedia(HashMap paramHashMap)
  {
    AnalyticsTrackInternal.trackInternal("Media", paramHashMap, StaticMethods.getTimeSince1970());
  }
  
  private void trackMediaItemWithContextData(MediaItem paramMediaItem, HashMap paramHashMap)
  {
    trackMedia(paramHashMap);
    currentMediaState.setTimePlayedSinceTrack(0.0D);
  }
  
  private void trackMediaStateIfNecessary(MediaItem paramMediaItem, HashMap paramHashMap, boolean paramBoolean)
  {
    if (paramHashMap != null)
    {
      paramHashMap = new HashMap(paramHashMap);
      addGenericMediaContextData(paramHashMap, paramMediaItem, false);
      addSegmentContextData(paramHashMap, paramMediaItem);
      if (previousMediaState != null) {
        break label89;
      }
      paramHashMap.put("&&pe", "m_s");
      if (mediaAd) {
        break label82;
      }
      str = "a.media.view";
      label53:
      paramHashMap.put(str, Boolean.valueOf(true));
      trackMediaItemWithContextData(paramMediaItem, paramHashMap);
    }
    label82:
    label89:
    boolean bool;
    label167:
    label209:
    label256:
    do
    {
      return;
      paramHashMap = new HashMap();
      break;
      str = "a.media.ad.view";
      break label53;
      bool = paramBoolean;
      if (currentMediaState.complete)
      {
        if (!paramMediaItem.isCompleteTracked())
        {
          if (mediaAd) {
            break label360;
          }
          str = "a.media.complete";
          paramHashMap.put(str, String.valueOf(true));
          paramMediaItem.setCompleteTracked(true);
          paramBoolean = true;
        }
        removeMediaItemIfComplete(paramMediaItem);
        bool = paramBoolean;
      }
      if (currentMediaState.clicked)
      {
        if (mediaAd) {
          break label367;
        }
        str = "a.media.clicked";
        paramHashMap.put(str, String.valueOf(true));
      }
      paramBoolean = bool;
      if (currentMediaState.offsetMilestone > previousMediaState.offsetMilestone)
      {
        if (mediaAd) {
          break label374;
        }
        str = "a.media.offsetMilestone";
        paramHashMap.put(str, Integer.toString(currentMediaState.offsetMilestone));
        paramBoolean = true;
      }
      if (currentMediaState.milestone > previousMediaState.milestone)
      {
        if (mediaAd) {
          break label381;
        }
        str = "a.media.milestone";
        paramHashMap.put(str, Integer.toString(currentMediaState.milestone));
        paramBoolean = true;
      }
      bool = paramBoolean;
      if (paramMediaItem.getTrackSecondsThreshold() > 0)
      {
        bool = paramBoolean;
        if (currentMediaState.getTimePlayedSinceTrack() >= paramMediaItem.getTrackSecondsThreshold()) {
          bool = true;
        }
      }
    } while (!bool);
    if (currentMediaState.getTimePlayedSinceTrack() > 0.0D) {
      if (mediaAd) {
        break label388;
      }
    }
    label360:
    label367:
    label374:
    label381:
    label388:
    for (String str = "a.media.timePlayed";; str = "a.media.ad.timePlayed")
    {
      paramHashMap.put(str, Integer.toString((int)currentMediaState.getTimePlayedSinceTrack()));
      trackMediaItemWithContextData(paramMediaItem, paramHashMap);
      return;
      str = "a.media.ad.complete";
      break;
      str = "a.media.ad.clicked";
      break label167;
      str = "a.media.ad.offsetMilestone";
      break label209;
      str = "a.media.ad.milestone";
      break label256;
    }
  }
  
  private void trackMediaViewed(MediaItem paramMediaItem)
  {
    HashMap localHashMap = new HashMap();
    if (!mediaAd) {}
    for (String str = "a.media.view";; str = "a.media.ad.view")
    {
      localHashMap.put(str, String.valueOf(true));
      addGenericMediaContextData(localHashMap, paramMediaItem, true);
      addSegmentContextData(localHashMap, paramMediaItem);
      trackMediaItemWithContextData(paramMediaItem, localHashMap);
      removeMediaItemIfComplete(paramMediaItem);
      return;
    }
  }
  
  /* Error */
  protected void click(String paramString, double paramDouble)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: invokespecial 391	com/adobe/mobile/MediaAnalytics:mediaItemWithName	(Ljava/lang/String;)Lcom/adobe/mobile/MediaItem;
    //   7: astore_1
    //   8: aload_1
    //   9: ifnull +14 -> 23
    //   12: aload_1
    //   13: invokevirtual 394	com/adobe/mobile/MediaItem:isPlaying	()Z
    //   16: istore 4
    //   18: iload 4
    //   20: ifne +6 -> 26
    //   23: aload_0
    //   24: monitorexit
    //   25: return
    //   26: aload_1
    //   27: iconst_0
    //   28: putfield 397	com/adobe/mobile/MediaItem:trackCalled	Z
    //   31: aload_1
    //   32: dload_2
    //   33: invokevirtual 399	com/adobe/mobile/MediaItem:click	(D)V
    //   36: aload_0
    //   37: aload_1
    //   38: invokespecial 401	com/adobe/mobile/MediaAnalytics:notifyDelegateOfMediaState	(Lcom/adobe/mobile/MediaItem;)V
    //   41: aload_1
    //   42: getfield 397	com/adobe/mobile/MediaItem:trackCalled	Z
    //   45: ifne -22 -> 23
    //   48: aload_1
    //   49: getfield 236	com/adobe/mobile/MediaItem:previousMediaState	Lcom/adobe/mobile/MediaState;
    //   52: ifnull -29 -> 23
    //   55: aload_0
    //   56: aload_1
    //   57: aconst_null
    //   58: iconst_1
    //   59: invokespecial 403	com/adobe/mobile/MediaAnalytics:trackMediaStateIfNecessary	(Lcom/adobe/mobile/MediaItem;Ljava/util/HashMap;Z)V
    //   62: goto -39 -> 23
    //   65: astore_1
    //   66: aload_0
    //   67: monitorexit
    //   68: aload_1
    //   69: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	70	0	this	MediaAnalytics
    //   0	70	1	paramString	String
    //   0	70	2	paramDouble	double
    //   16	3	4	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	8	65	finally
    //   12	18	65	finally
    //   26	62	65	finally
  }
  
  protected final Object clone()
    throws CloneNotSupportedException
  {
    throw new CloneNotSupportedException();
  }
  
  protected void close(String paramString)
  {
    for (;;)
    {
      try
      {
        paramString = mediaItemWithName(paramString);
        if (paramString == null) {
          return;
        }
        trackCalled = false;
        paramString.close();
        notifyDelegateOfMediaState(paramString);
        if (!trackCalled)
        {
          if (currentMediaState.getTimePlayed() > 0.0D) {
            trackMediaStateIfNecessary(paramString, null, true);
          }
          mediaItemList.remove(name);
        }
        else
        {
          itemClosed = true;
        }
      }
      finally {}
    }
  }
  
  /* Error */
  protected void complete(String paramString, double paramDouble)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: invokespecial 391	com/adobe/mobile/MediaAnalytics:mediaItemWithName	(Ljava/lang/String;)Lcom/adobe/mobile/MediaItem;
    //   7: astore_1
    //   8: aload_1
    //   9: ifnull +14 -> 23
    //   12: aload_1
    //   13: invokevirtual 394	com/adobe/mobile/MediaItem:isPlaying	()Z
    //   16: istore 4
    //   18: iload 4
    //   20: ifne +6 -> 26
    //   23: aload_0
    //   24: monitorexit
    //   25: return
    //   26: aload_1
    //   27: iconst_0
    //   28: putfield 397	com/adobe/mobile/MediaItem:trackCalled	Z
    //   31: aload_1
    //   32: dload_2
    //   33: invokevirtual 421	com/adobe/mobile/MediaItem:complete	(D)V
    //   36: aload_0
    //   37: aload_1
    //   38: invokespecial 401	com/adobe/mobile/MediaAnalytics:notifyDelegateOfMediaState	(Lcom/adobe/mobile/MediaItem;)V
    //   41: aload_1
    //   42: getfield 397	com/adobe/mobile/MediaItem:trackCalled	Z
    //   45: ifne -22 -> 23
    //   48: aload_1
    //   49: getfield 236	com/adobe/mobile/MediaItem:previousMediaState	Lcom/adobe/mobile/MediaState;
    //   52: ifnull -29 -> 23
    //   55: aload_0
    //   56: aload_1
    //   57: aconst_null
    //   58: iconst_0
    //   59: invokespecial 403	com/adobe/mobile/MediaAnalytics:trackMediaStateIfNecessary	(Lcom/adobe/mobile/MediaItem;Ljava/util/HashMap;Z)V
    //   62: goto -39 -> 23
    //   65: astore_1
    //   66: aload_0
    //   67: monitorexit
    //   68: aload_1
    //   69: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	70	0	this	MediaAnalytics
    //   0	70	1	paramString	String
    //   0	70	2	paramDouble	double
    //   16	3	4	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	8	65	finally
    //   12	18	65	finally
    //   26	62	65	finally
  }
  
  protected void monitor(String paramString, double paramDouble)
  {
    for (;;)
    {
      try
      {
        paramString = mediaItemWithName(paramString);
        if (paramString != null)
        {
          boolean bool = paramString.isPlaying();
          if (bool) {}
        }
        else
        {
          return;
        }
        if (trackCalled)
        {
          trackCalled = false;
          continue;
        }
        paramString.monitor(paramDouble);
      }
      finally {}
      notifyDelegateOfMediaState(paramString);
      if ((previousMediaState != null) && (!trackCalled)) {
        trackMediaStateIfNecessary(paramString, null, false);
      }
    }
  }
  
  protected void open(MediaSettings paramMediaSettings, Media.MediaCallback paramMediaCallback)
  {
    String str2;
    try
    {
      str2 = cleanName(name);
      if (isNilOrEmptyString(str2)) {
        StaticMethods.logWarningFormat("Analytics - ADBMediaSettings is required with a valid name. Media item not opened", new Object[0]);
      }
      for (;;)
      {
        return;
        if ((!isMediaAd) || (!isNilOrEmptyString(parentName))) {
          break;
        }
        StaticMethods.logWarningFormat("Analytics - Media ad requires parent name, please specify a parent name. Media item not opened", new Object[0]);
      }
      if (length <= 0.0D) {}
    }
    finally {}
    for (double d = length;; d = -1.0D)
    {
      if (isNilOrEmptyString(playerName)) {}
      for (String str1 = "Not_Specified";; str1 = cleanName(playerName))
      {
        if (mediaItemList.containsKey(str2)) {
          close(str2);
        }
        if (!isNilOrEmptyString(playerID))
        {
          Iterator localIterator = mediaItemList.keySet().iterator();
          while (localIterator.hasNext())
          {
            String str3 = (String)localIterator.next();
            String str4 = ((MediaItem)mediaItemList.get(str3)).getPlayerID();
            if ((str4 != null) && (str4.equals(playerID))) {
              close(str3);
            }
          }
        }
        paramMediaSettings = new MediaItem(paramMediaSettings, this, str2, d, str1);
        callback = paramMediaCallback;
        mediaItemList.put(str2, paramMediaSettings);
        break;
      }
    }
  }
  
  protected void play(String paramString, double paramDouble)
  {
    for (;;)
    {
      try
      {
        paramString = mediaItemWithName(paramString);
        if (paramString == null) {
          return;
        }
        trackCalled = false;
        paramString.play(paramDouble);
        notifyDelegateOfMediaState(paramString);
        if (!trackCalled)
        {
          if (previousMediaState == null) {
            trackMediaViewed(paramString);
          }
        }
        else
        {
          trackCalled = false;
          removeMediaItemIfComplete(paramString);
          continue;
        }
        if (currentMediaState.segmentNum == lastTrackSegmentNumber) {
          break label103;
        }
      }
      finally {}
      if (currentMediaState.timePlayed > 0.0D) {
        trackMediaStateIfNecessary(paramString, null, true);
      } else {
        label103:
        trackMediaStateIfNecessary(paramString, null, false);
      }
    }
  }
  
  protected void setTrackCalledOnItem(String paramString)
  {
    paramString = mediaItemWithName(paramString);
    if (paramString == null) {
      return;
    }
    trackCalled = true;
  }
  
  /* Error */
  protected void stop(String paramString, double paramDouble)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: invokespecial 391	com/adobe/mobile/MediaAnalytics:mediaItemWithName	(Ljava/lang/String;)Lcom/adobe/mobile/MediaItem;
    //   7: astore_1
    //   8: aload_1
    //   9: ifnull +14 -> 23
    //   12: aload_1
    //   13: invokevirtual 394	com/adobe/mobile/MediaItem:isPlaying	()Z
    //   16: istore 4
    //   18: iload 4
    //   20: ifne +6 -> 26
    //   23: aload_0
    //   24: monitorexit
    //   25: return
    //   26: aload_1
    //   27: iconst_0
    //   28: putfield 397	com/adobe/mobile/MediaItem:trackCalled	Z
    //   31: aload_1
    //   32: dload_2
    //   33: invokevirtual 494	com/adobe/mobile/MediaItem:stop	(D)V
    //   36: aload_0
    //   37: aload_1
    //   38: invokespecial 401	com/adobe/mobile/MediaAnalytics:notifyDelegateOfMediaState	(Lcom/adobe/mobile/MediaItem;)V
    //   41: aload_1
    //   42: getfield 397	com/adobe/mobile/MediaItem:trackCalled	Z
    //   45: ifne -22 -> 23
    //   48: aload_1
    //   49: getfield 236	com/adobe/mobile/MediaItem:previousMediaState	Lcom/adobe/mobile/MediaState;
    //   52: ifnull -29 -> 23
    //   55: aload_0
    //   56: aload_1
    //   57: aconst_null
    //   58: iconst_0
    //   59: invokespecial 403	com/adobe/mobile/MediaAnalytics:trackMediaStateIfNecessary	(Lcom/adobe/mobile/MediaItem;Ljava/util/HashMap;Z)V
    //   62: goto -39 -> 23
    //   65: astore_1
    //   66: aload_0
    //   67: monitorexit
    //   68: aload_1
    //   69: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	70	0	this	MediaAnalytics
    //   0	70	1	paramString	String
    //   0	70	2	paramDouble	double
    //   16	3	4	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	8	65	finally
    //   12	18	65	finally
    //   26	62	65	finally
  }
  
  protected void track(String paramString, Map paramMap)
  {
    for (;;)
    {
      try
      {
        MediaItem localMediaItem = mediaItemWithName(paramString);
        if (localMediaItem == null) {
          return;
        }
        if (currentMediaState != null)
        {
          if (paramMap != null)
          {
            paramString = new HashMap(paramMap);
            removeEmptyValues(paramString);
            trackMediaStateIfNecessary(localMediaItem, paramString, true);
          }
        }
        else
        {
          if (itemClosed) {
            mediaItemList.remove(name);
          }
          trackCalled = false;
          continue;
        }
        paramString = new HashMap();
      }
      finally {}
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MediaAnalytics
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */