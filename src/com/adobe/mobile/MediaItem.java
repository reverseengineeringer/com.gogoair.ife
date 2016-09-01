package com.adobe.mobile;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.concurrent.ExecutorService;

final class MediaItem
{
  private static final Object monitorMutex = new Object();
  protected String CPM;
  protected Media.MediaCallback callback = null;
  protected String channel;
  private int completeCloseOffsetThreshold = 1;
  private boolean completeTracked;
  protected MediaState currentMediaState = null;
  private HashSet firstEventList = new HashSet();
  protected boolean itemClosed;
  protected int lastTrackSegmentNumber;
  protected double length;
  protected boolean mediaAd;
  protected MediaAnalytics mediaAnalytics;
  private ArrayList milestones = new ArrayList();
  private MonitorThread monitor;
  protected String name;
  private ArrayList offsetMilestones = new ArrayList();
  protected String parentName;
  protected String parentPod;
  protected double parentPodPosition;
  protected String playerID;
  protected String playerName;
  protected MediaState previousMediaState = null;
  private boolean segmentByMilestones = false;
  private boolean segmentByOffsetMilestones = false;
  protected double timestamp;
  protected boolean trackCalled;
  private int trackSecondsThreshold = 0;
  
  public MediaItem(MediaSettings paramMediaSettings, MediaAnalytics paramMediaAnalytics, String paramString1, double paramDouble, String paramString2)
  {
    name = paramString1;
    length = paramDouble;
    playerName = paramString2;
    mediaAnalytics = paramMediaAnalytics;
    playerID = playerID;
    timestamp = StaticMethods.getTimeSince1970();
    channel = channel;
    setMilestones(milestones);
    setOffsetMilestones(offsetMilestones);
    if ((segmentByMilestones) && (milestones.size() > 0))
    {
      bool = true;
      setSegmentByMilestones(bool);
      if ((!segmentByOffsetMilestones) || (offsetMilestones.size() <= 0)) {
        break label301;
      }
    }
    label301:
    for (boolean bool = true;; bool = false)
    {
      setSegmentByOffsetMilestones(bool);
      setTrackSecondsThreshold(trackSeconds);
      setCompleteCloseOffsetThreshold(completeCloseOffsetThreshold);
      if (isMediaAd)
      {
        mediaAd = true;
        parentPodPosition = parentPodPosition;
        parentName = parentName;
        parentPod = parentPod;
        CPM = CPM;
      }
      if (completeCloseOffsetThreshold > 0) {
        i = completeCloseOffsetThreshold;
      }
      completeCloseOffsetThreshold = i;
      i = j;
      if (trackSeconds > 0) {
        i = trackSeconds;
      }
      trackSecondsThreshold = i;
      return;
      bool = false;
      break;
    }
  }
  
  private void calculateCurrentMilestoneAndSegment()
  {
    if (isLive()) {}
    int i;
    int j;
    do
    {
      do
      {
        do
        {
          return;
        } while (milestones.size() == 0);
        i = calculateLastPassedMilestoneIndex();
      } while (i == -1);
      j = ((Integer)milestones.get(i)).intValue();
      currentMediaState.milestone = j;
    } while (!segmentByMilestones);
    currentMediaState.segmentNum = (i + 1);
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("M:");
    localStringBuilder.append(Integer.toString(j));
    localStringBuilder.append("-");
    if (i < milestones.size() - 1) {
      localStringBuilder.append(Integer.toString(((Integer)milestones.get(i + 1)).intValue()));
    }
    for (;;)
    {
      currentMediaState.segment = localStringBuilder.toString();
      return;
      localStringBuilder.append("100");
    }
  }
  
  private void calculateCurrentOffsetMilestoneAndSegment()
  {
    if (offsetMilestones.size() == 0) {}
    int i;
    int j;
    do
    {
      do
      {
        return;
        i = calculateLastPassedOffsetMilestoneIndex();
      } while (i == -1);
      j = ((Integer)offsetMilestones.get(i)).intValue();
      currentMediaState.offsetMilestone = j;
    } while (!segmentByOffsetMilestones);
    currentMediaState.segmentNum = (i + 1);
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("O:");
    localStringBuilder.append(Integer.toString(j));
    localStringBuilder.append("-");
    if (i < offsetMilestones.size() - 1)
    {
      localStringBuilder.append(Integer.toString(((Integer)offsetMilestones.get(i + 1)).intValue()));
      currentMediaState.segment = localStringBuilder.toString();
      return;
    }
    if (isLive()) {}
    for (String str = "E";; str = Integer.toString((int)length))
    {
      localStringBuilder.append(str);
      break;
    }
  }
  
  private int calculateLastPassedMilestoneIndex()
  {
    if (milestones.size() == 0) {
      return -1;
    }
    int j = -1;
    int i = 0;
    while (i < milestones.size())
    {
      int k = ((Integer)milestones.get(i)).intValue();
      if (currentMediaState.percent >= k) {
        j = i;
      }
      i += 1;
    }
    return j;
  }
  
  private int calculateLastPassedOffsetMilestoneIndex()
  {
    if (offsetMilestones.size() == 0) {
      return -1;
    }
    int j = -1;
    int i = 0;
    while (i < offsetMilestones.size())
    {
      int k = ((Integer)offsetMilestones.get(i)).intValue();
      if (currentMediaState.offset >= k) {
        j = i;
      }
      i += 1;
    }
    return j;
  }
  
  private void setEventFirstTime(MediaState paramMediaState)
  {
    String str2 = mediaEvent;
    String str1;
    if (str2.equals("MILESTONE")) {
      str1 = str2 + "_" + milestone;
    }
    for (;;)
    {
      if (!firstEventList.contains(str1))
      {
        eventFirstTime = true;
        firstEventList.add(str1);
      }
      return;
      str1 = str2;
      if (str2.equals("OFFSET_MILESTONE")) {
        str1 = str2 + "_" + offsetMilestone;
      }
    }
  }
  
  private void setMilestones(String paramString)
  {
    int i = 0;
    milestones.clear();
    if ((paramString == null) || (paramString.length() <= 0)) {
      return;
    }
    milestones.add(Integer.valueOf(0));
    paramString = paramString.split(",");
    int j = paramString.length;
    while (i < j)
    {
      int k = (int)Double.parseDouble(paramString[i]);
      if ((k > 0) && (k <= 100) && (!milestones.contains(Integer.valueOf(k)))) {
        milestones.add(Integer.valueOf(k));
      }
      i += 1;
    }
    Collections.sort(milestones);
  }
  
  private void setOffsetMilestones(String paramString)
  {
    int i = 0;
    offsetMilestones.clear();
    if ((paramString == null) || (paramString.length() <= 0)) {
      return;
    }
    offsetMilestones.add(Integer.valueOf(0));
    paramString = paramString.split(",");
    int j = paramString.length;
    if (i < j)
    {
      int k = (int)Double.parseDouble(paramString[i]);
      if ((k <= 0) || (offsetMilestones.contains(Integer.valueOf(k))) || ((!isLive()) && (k > length))) {}
      for (;;)
      {
        i += 1;
        break;
        offsetMilestones.add(Integer.valueOf(k));
      }
    }
    Collections.sort(offsetMilestones);
  }
  
  private void updateCurrentMediaStateMediaEventIfNeeded(int paramInt)
  {
    if (paramInt == 0) {}
    do
    {
      do
      {
        return;
        if (currentMediaState.percent >= 100.0D)
        {
          currentMediaState.mediaEvent = "CLOSE";
          return;
        }
      } while (previousMediaState == null);
      if (currentMediaState.milestone > previousMediaState.milestone)
      {
        currentMediaState.mediaEvent = "MILESTONE";
        return;
      }
      if (currentMediaState.offsetMilestone > previousMediaState.offsetMilestone)
      {
        currentMediaState.mediaEvent = "OFFSET_MILESTONE";
        return;
      }
    } while ((getTrackSecondsThreshold() <= 0) || (currentMediaState.getTimePlayedSinceTrack() < getTrackSecondsThreshold()));
    currentMediaState.mediaEvent = "SECONDS";
  }
  
  private void updateCurrentMediaStateWithOffset(double paramDouble, int paramInt)
  {
    MediaState localMediaState = currentMediaState;
    if (paramInt == 6) {}
    for (boolean bool = true;; bool = false)
    {
      clicked = bool;
      currentMediaState.ad = mediaAd;
      currentMediaState.setOffset(validateOffset(paramDouble));
      calculateCurrentOffsetMilestoneAndSegment();
      calculateCurrentMilestoneAndSegment();
      updateTimePlayed(paramInt);
      currentMediaState.setEventType(paramInt);
      updateCurrentMediaStateMediaEventIfNeeded(paramInt);
      setEventFirstTime(currentMediaState);
      return;
    }
  }
  
  private void updateMediaStates()
  {
    previousMediaState = currentMediaState;
    currentMediaState = new MediaState(name, length, playerName, timestamp);
  }
  
  private void updateTimePlayed(int paramInt)
  {
    if (previousMediaState == null) {
      return;
    }
    double d2 = 0.0D;
    double d1 = d2;
    if (currentMediaState.offset > previousMediaState.offset)
    {
      d1 = d2;
      if (paramInt != 1) {
        d1 = currentMediaState.offset - previousMediaState.offset;
      }
    }
    currentMediaState.setTimePlayed(previousMediaState.getTimePlayed() + d1);
    currentMediaState.setTimePlayedSinceTrack(d1 + previousMediaState.getTimePlayedSinceTrack());
  }
  
  private double validateOffset(double paramDouble)
  {
    double d = paramDouble;
    if (paramDouble < 0.0D)
    {
      d = paramDouble;
      if (previousMediaState != null) {
        d = currentMediaState.getTimestamp() - previousMediaState.getTimestamp() + previousMediaState.offset;
      }
    }
    return d;
  }
  
  /* Error */
  protected void click(double paramDouble)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokespecial 347	com/adobe/mobile/MediaItem:updateMediaStates	()V
    //   6: aload_0
    //   7: getfield 61	com/adobe/mobile/MediaItem:previousMediaState	Lcom/adobe/mobile/MediaState;
    //   10: astore_3
    //   11: aload_3
    //   12: ifnonnull +6 -> 18
    //   15: aload_0
    //   16: monitorexit
    //   17: return
    //   18: aload_0
    //   19: dload_1
    //   20: bipush 6
    //   22: invokespecial 349	com/adobe/mobile/MediaItem:updateCurrentMediaStateWithOffset	(DI)V
    //   25: goto -10 -> 15
    //   28: astore_3
    //   29: aload_0
    //   30: monitorexit
    //   31: aload_3
    //   32: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	33	0	this	MediaItem
    //   0	33	1	paramDouble	double
    //   10	2	3	localMediaState	MediaState
    //   28	4	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	11	28	finally
    //   18	25	28	finally
  }
  
  protected void close()
  {
    for (;;)
    {
      try
      {
        updateMediaStates();
        if (previousMediaState != null)
        {
          int i = previousMediaState.getEventType();
          if (i != 0) {}
        }
        else
        {
          return;
        }
        if (previousMediaState.eventType == 2)
        {
          updateCurrentMediaStateWithOffset(currentMediaState.offset, 0);
          if (isCurrentOffsetPastCompleteThreshold()) {
            currentMediaState.complete = true;
          }
          stopMonitor();
        }
        else
        {
          updateCurrentMediaStateWithOffset(-1.0D, 0);
        }
      }
      finally {}
    }
  }
  
  /* Error */
  protected void complete(double paramDouble)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokespecial 347	com/adobe/mobile/MediaItem:updateMediaStates	()V
    //   6: aload_0
    //   7: getfield 61	com/adobe/mobile/MediaItem:previousMediaState	Lcom/adobe/mobile/MediaState;
    //   10: ifnull +16 -> 26
    //   13: aload_0
    //   14: getfield 61	com/adobe/mobile/MediaItem:previousMediaState	Lcom/adobe/mobile/MediaState;
    //   17: invokevirtual 353	com/adobe/mobile/MediaState:getEventType	()I
    //   20: istore_3
    //   21: iload_3
    //   22: iconst_5
    //   23: if_icmpne +6 -> 29
    //   26: aload_0
    //   27: monitorexit
    //   28: return
    //   29: aload_0
    //   30: dload_1
    //   31: iconst_5
    //   32: invokespecial 349	com/adobe/mobile/MediaItem:updateCurrentMediaStateWithOffset	(DI)V
    //   35: aload_0
    //   36: getfield 59	com/adobe/mobile/MediaItem:currentMediaState	Lcom/adobe/mobile/MediaState;
    //   39: getfield 362	com/adobe/mobile/MediaState:complete	Z
    //   42: ifeq +7 -> 49
    //   45: aload_0
    //   46: invokevirtual 365	com/adobe/mobile/MediaItem:stopMonitor	()V
    //   49: aload_0
    //   50: getfield 59	com/adobe/mobile/MediaItem:currentMediaState	Lcom/adobe/mobile/MediaState;
    //   53: iconst_1
    //   54: putfield 362	com/adobe/mobile/MediaState:complete	Z
    //   57: goto -31 -> 26
    //   60: astore 4
    //   62: aload_0
    //   63: monitorexit
    //   64: aload 4
    //   66: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	67	0	this	MediaItem
    //   0	67	1	paramDouble	double
    //   20	4	3	i	int
    //   60	5	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	21	60	finally
    //   29	49	60	finally
    //   49	57	60	finally
  }
  
  protected double getLength()
  {
    return length;
  }
  
  protected String getName()
  {
    return name;
  }
  
  protected String getPlayerID()
  {
    return playerID;
  }
  
  protected String getPlayerName()
  {
    return playerName;
  }
  
  protected MediaState getReportMediaState()
  {
    int j = 1;
    MediaState localMediaState = new MediaState(currentMediaState);
    if (previousMediaState != null)
    {
      if (currentMediaState.milestone > previousMediaState.milestone) {
        break label111;
      }
      milestone = 0;
    }
    label111:
    for (int i = 1;; i = 0)
    {
      if (currentMediaState.offsetMilestone <= previousMediaState.offsetMilestone)
      {
        offsetMilestone = 0;
        i = j;
      }
      for (;;)
      {
        if (i != 0)
        {
          segment = previousMediaState.segment;
          segmentNum = previousMediaState.segmentNum;
          segmentLength = previousMediaState.segmentLength;
        }
        return localMediaState;
      }
    }
  }
  
  public int getTrackSecondsThreshold()
  {
    return trackSecondsThreshold;
  }
  
  protected boolean isCompleteTracked()
  {
    return completeTracked;
  }
  
  protected boolean isCurrentOffsetPastCompleteThreshold()
  {
    return currentMediaState.offset >= length - completeCloseOffsetThreshold;
  }
  
  protected boolean isLive()
  {
    return length == -1.0D;
  }
  
  protected boolean isPlaying()
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (currentMediaState != null)
    {
      bool1 = bool2;
      if (currentMediaState.eventType != 0)
      {
        bool1 = bool2;
        if (currentMediaState.eventType != 2) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  protected boolean isSegmentByMilestones()
  {
    return segmentByMilestones;
  }
  
  protected boolean isSegmentByOffsetMilestones()
  {
    return segmentByOffsetMilestones;
  }
  
  /* Error */
  protected void monitor(double paramDouble)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokespecial 347	com/adobe/mobile/MediaItem:updateMediaStates	()V
    //   6: aload_0
    //   7: getfield 61	com/adobe/mobile/MediaItem:previousMediaState	Lcom/adobe/mobile/MediaState;
    //   10: astore_3
    //   11: aload_3
    //   12: ifnonnull +6 -> 18
    //   15: aload_0
    //   16: monitorexit
    //   17: return
    //   18: aload_0
    //   19: dload_1
    //   20: iconst_3
    //   21: invokespecial 349	com/adobe/mobile/MediaItem:updateCurrentMediaStateWithOffset	(DI)V
    //   24: aload_0
    //   25: getfield 59	com/adobe/mobile/MediaItem:currentMediaState	Lcom/adobe/mobile/MediaState;
    //   28: getfield 362	com/adobe/mobile/MediaState:complete	Z
    //   31: ifeq -16 -> 15
    //   34: aload_0
    //   35: invokevirtual 365	com/adobe/mobile/MediaItem:stopMonitor	()V
    //   38: goto -23 -> 15
    //   41: astore_3
    //   42: aload_0
    //   43: monitorexit
    //   44: aload_3
    //   45: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	46	0	this	MediaItem
    //   0	46	1	paramDouble	double
    //   10	2	3	localMediaState	MediaState
    //   41	4	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	11	41	finally
    //   18	38	41	finally
  }
  
  /* Error */
  protected void play(double paramDouble)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 59	com/adobe/mobile/MediaItem:currentMediaState	Lcom/adobe/mobile/MediaState;
    //   6: ifnull +15 -> 21
    //   9: aload_0
    //   10: invokevirtual 387	com/adobe/mobile/MediaItem:isPlaying	()Z
    //   13: istore_3
    //   14: iload_3
    //   15: ifeq +6 -> 21
    //   18: aload_0
    //   19: monitorexit
    //   20: return
    //   21: aload_0
    //   22: invokespecial 347	com/adobe/mobile/MediaItem:updateMediaStates	()V
    //   25: aload_0
    //   26: dload_1
    //   27: iconst_1
    //   28: invokespecial 349	com/adobe/mobile/MediaItem:updateCurrentMediaStateWithOffset	(DI)V
    //   31: aload_0
    //   32: getfield 59	com/adobe/mobile/MediaItem:currentMediaState	Lcom/adobe/mobile/MediaState;
    //   35: getfield 362	com/adobe/mobile/MediaState:complete	Z
    //   38: ifne -20 -> 18
    //   41: aload_0
    //   42: invokevirtual 390	com/adobe/mobile/MediaItem:startMonitor	()V
    //   45: goto -27 -> 18
    //   48: astore 4
    //   50: aload_0
    //   51: monitorexit
    //   52: aload 4
    //   54: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	55	0	this	MediaItem
    //   0	55	1	paramDouble	double
    //   13	2	3	bool	boolean
    //   48	5	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	14	48	finally
    //   21	45	48	finally
  }
  
  public void setCompleteCloseOffsetThreshold(int paramInt)
  {
    completeCloseOffsetThreshold = paramInt;
  }
  
  protected void setCompleteTracked(boolean paramBoolean)
  {
    completeTracked = paramBoolean;
  }
  
  protected void setSegmentByMilestones(boolean paramBoolean)
  {
    segmentByMilestones = paramBoolean;
  }
  
  protected void setSegmentByOffsetMilestones(boolean paramBoolean)
  {
    segmentByOffsetMilestones = paramBoolean;
  }
  
  public void setTrackSecondsThreshold(int paramInt)
  {
    trackSecondsThreshold = paramInt;
  }
  
  protected void startMonitor()
  {
    if ((monitor != null) && (!monitor.canceled)) {
      return;
    }
    if (monitor != null) {
      stopMonitor();
    }
    monitor = new MonitorThread(null);
    monitor.monitorMediaItem = this;
    monitor.start();
  }
  
  protected void stop(double paramDouble)
  {
    try
    {
      updateMediaStates();
      updateCurrentMediaStateWithOffset(paramDouble, 2);
      stopMonitor();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  protected void stopMonitor()
  {
    if (monitor != null) {
      synchronized (monitorMutex)
      {
        monitor.canceled = true;
        monitor = null;
        return;
      }
    }
  }
  
  private static class MonitorThread
    extends Thread
  {
    protected boolean canceled = false;
    long delay = 1000L;
    protected MediaItem monitorMediaItem;
    
    public void run()
    {
      try
      {
        while (!canceled)
        {
          Thread.sleep(delay);
          StaticMethods.getMediaExecutor().execute(new MediaItem.MonitorThread.1(this));
        }
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        StaticMethods.logWarningFormat("Media - Background Thread Interrupted : %s", new Object[] { localInterruptedException.getMessage() });
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MediaItem
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */