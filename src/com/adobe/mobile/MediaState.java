package com.adobe.mobile;

import java.util.Date;

public final class MediaState
{
  public boolean ad;
  public boolean clicked = false;
  public boolean complete = false;
  public boolean eventFirstTime;
  protected int eventType;
  public double length;
  public String mediaEvent;
  public int milestone;
  public String name;
  public double offset;
  public int offsetMilestone;
  public Date openTime = new Date();
  public double percent;
  public String playerName;
  public String segment;
  public double segmentLength;
  public int segmentNum;
  public double timePlayed;
  private double timePlayedSinceTrack;
  private long timestamp;
  
  protected MediaState(MediaState paramMediaState)
  {
    name = name;
    length = length;
    playerName = playerName;
    mediaEvent = mediaEvent;
    eventFirstTime = eventFirstTime;
    openTime = openTime;
    offset = offset;
    percent = percent;
    timePlayed = timePlayed;
    milestone = milestone;
    offsetMilestone = offsetMilestone;
    segmentNum = segmentNum;
    segment = segment;
    segmentLength = segmentLength;
    complete = complete;
    eventType = eventType;
    timestamp = timestamp;
    timePlayedSinceTrack = timePlayedSinceTrack;
    clicked = clicked;
    ad = ad;
  }
  
  protected MediaState(String paramString1, double paramDouble, String paramString2, long paramLong)
  {
    name = paramString1;
    length = paramDouble;
    playerName = paramString2;
    timestamp = StaticMethods.getTimeSince1970();
    segment = "";
    segmentNum = 0;
    segmentLength = 0.0D;
    openTime.setTime(paramLong);
  }
  
  private void checkComplete()
  {
    if (length == -1.0D) {
      complete = false;
    }
    while (percent < 100.0D) {
      return;
    }
    complete = true;
  }
  
  private void generatePercent()
  {
    double d = 100.0D;
    if (length != -1.0D)
    {
      percent = (offset / length * 100.0D);
      if (percent < 100.0D) {
        d = percent;
      }
      percent = d;
    }
  }
  
  protected int getEventType()
  {
    return eventType;
  }
  
  protected double getTimePlayed()
  {
    return timePlayed;
  }
  
  protected double getTimePlayedSinceTrack()
  {
    return timePlayedSinceTrack;
  }
  
  protected double getTimestamp()
  {
    return timestamp;
  }
  
  protected void setEventType(int paramInt)
  {
    eventType = paramInt;
    String str;
    switch (eventType)
    {
    default: 
      str = "CLOSE";
    }
    for (;;)
    {
      mediaEvent = str;
      return;
      str = "PLAY";
      continue;
      str = "STOP";
      continue;
      str = "MONITOR";
      continue;
      str = "TRACK";
      continue;
      str = "COMPLETE";
      continue;
      str = "CLICK";
    }
  }
  
  protected void setOffset(double paramDouble)
  {
    offset = paramDouble;
    if (length > 0.0D) {
      if (paramDouble >= length) {
        break label51;
      }
    }
    for (;;)
    {
      offset = paramDouble;
      if (offset < 0.0D) {
        offset = 0.0D;
      }
      generatePercent();
      checkComplete();
      return;
      label51:
      paramDouble = length;
    }
  }
  
  protected void setTimePlayed(double paramDouble)
  {
    timePlayed = paramDouble;
  }
  
  protected void setTimePlayedSinceTrack(double paramDouble)
  {
    timePlayedSinceTrack = paramDouble;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MediaState
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */