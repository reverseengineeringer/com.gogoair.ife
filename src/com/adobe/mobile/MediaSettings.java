package com.adobe.mobile;

public class MediaSettings
{
  public String CPM;
  public String channel;
  public int completeCloseOffsetThreshold = 1;
  public boolean isMediaAd;
  public double length;
  public String milestones;
  public String name;
  public String offsetMilestones;
  public String parentName;
  public String parentPod;
  public double parentPodPosition;
  public String playerID;
  public String playerName;
  public boolean segmentByMilestones;
  public boolean segmentByOffsetMilestones;
  public int trackSeconds = 0;
  
  public static MediaSettings adSettingsWith(String paramString1, double paramDouble1, String paramString2, String paramString3, String paramString4, double paramDouble2, String paramString5)
  {
    MediaSettings localMediaSettings = new MediaSettings();
    isMediaAd = true;
    name = paramString1;
    length = paramDouble1;
    playerName = paramString2;
    parentName = paramString3;
    parentPod = paramString4;
    parentPodPosition = paramDouble2;
    CPM = paramString5;
    return localMediaSettings;
  }
  
  public static MediaSettings settingsWith(String paramString1, double paramDouble, String paramString2, String paramString3)
  {
    MediaSettings localMediaSettings = new MediaSettings();
    name = paramString1;
    length = paramDouble;
    playerName = paramString2;
    playerID = paramString3;
    return localMediaSettings;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MediaSettings
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */