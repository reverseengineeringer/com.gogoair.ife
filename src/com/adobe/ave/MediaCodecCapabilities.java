package com.adobe.ave;

import android.media.MediaCodecInfo;
import android.media.MediaCodecInfo.CodecCapabilities;
import android.media.MediaCodecInfo.CodecProfileLevel;
import android.media.MediaCodecList;
import android.os.Build.VERSION;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class MediaCodecCapabilities
{
  private static final String TAG = "MediaCodecCapabilities(j)";
  private static Map capabilitiesMap = new HashMap();
  private static ArrayList codecInfoList = new ArrayList();
  
  public static boolean IsABRSupportedByMediaCodec(String paramString)
  {
    if (Build.VERSION.SDK_INT < 19) {
      return false;
    }
    label46:
    Object localObject;
    label96:
    boolean bool;
    if ((!codecInfoList.isEmpty()) && (!capabilitiesMap.keySet().isEmpty()) && (paramString.equalsIgnoreCase("video/avc")))
    {
      i = 0;
      if (i < codecInfoList.size())
      {
        paramString = (MediaCodecInfo)codecInfoList.get(i);
        localObject = (MediaCodecInfo.CodecCapabilities)capabilitiesMap.get(paramString.getName());
        if (localObject != null) {
          break label96;
        }
      }
      do
      {
        i += 1;
        break label46;
        break;
        bool = ((MediaCodecInfo.CodecCapabilities)localObject).isFeatureSupported("adaptive-playback");
        Log.w("MediaCodecCapabilities(j)", "IsCodecSupported (video/avc) : info = " + paramString.getName() + "AdaptivePlayback supported = " + bool);
      } while (!bool);
      return true;
    }
    int k = MediaCodecList.getCodecCount();
    int i = 0;
    label156:
    if (i < k)
    {
      localObject = MediaCodecList.getCodecInfoAt(i);
      if (!((MediaCodecInfo)localObject).isEncoder()) {
        break label182;
      }
    }
    for (;;)
    {
      i += 1;
      break label156;
      break;
      label182:
      String[] arrayOfString = ((MediaCodecInfo)localObject).getSupportedTypes();
      int j = 0;
      while (j < arrayOfString.length)
      {
        if (arrayOfString[j].equalsIgnoreCase(paramString))
        {
          bool = ((MediaCodecInfo)localObject).getCapabilitiesForType(arrayOfString[j]).isFeatureSupported("adaptive-playback");
          Log.w("MediaCodecCapabilities(j)", "IsCodecSupported (video/avc) : info = " + ((MediaCodecInfo)localObject).getName() + "AdaptivePlayback supported = " + bool);
          if (bool) {
            return true;
          }
        }
        j += 1;
      }
    }
  }
  
  public static boolean IsCodecSupported(String paramString)
  {
    int k = MediaCodecList.getCodecCount();
    int i = 0;
    if (i < k)
    {
      MediaCodecInfo localMediaCodecInfo = MediaCodecList.getCodecInfoAt(i);
      if (localMediaCodecInfo.isEncoder()) {}
      for (;;)
      {
        i += 1;
        break;
        String[] arrayOfString = localMediaCodecInfo.getSupportedTypes();
        int j = 0;
        while (j < arrayOfString.length)
        {
          if (arrayOfString[j].equalsIgnoreCase(paramString))
          {
            Log.w("MediaCodecCapabilities(j)", "IsCodecSupported (" + paramString + ") : info = " + localMediaCodecInfo.getName() + " : yes, it's supported");
            return true;
          }
          j += 1;
        }
      }
    }
    Log.w("MediaCodecCapabilities(j)", "IsCodecSupported (" + paramString + ") : no, it's not supported");
    return false;
  }
  
  public static boolean IsProfileLevelSupported(String paramString, int paramInt1, int paramInt2)
  {
    boolean bool2 = false;
    if (codecInfoList.isEmpty()) {
      getCodecInfos(paramString);
    }
    if (codecInfoList.isEmpty())
    {
      Log.w("MediaCodecCapabilities(j)", "no codeInfo for mime " + paramString);
      return bool2;
    }
    boolean bool1;
    Object localObject;
    if (capabilitiesMap.keySet().isEmpty())
    {
      int i = 0;
      bool1 = false;
      for (;;)
      {
        if (i >= codecInfoList.size()) {
          break label161;
        }
        localObject = (MediaCodecInfo)codecInfoList.get(i);
        paramString = null;
        try
        {
          MediaCodecInfo.CodecCapabilities localCodecCapabilities = ((MediaCodecInfo)localObject).getCapabilitiesForType(new String("video/avc"));
          paramString = localCodecCapabilities;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            Log.w("MediaCodecCapabilities(j)", "caught exception");
            continue;
            if (isProfileLevelSupportedByCapacities(paramString, paramInt1, paramInt2, ((MediaCodecInfo)localObject).getName())) {
              bool1 = true;
            }
          }
        }
        if (paramString != null) {
          break;
        }
        i += 1;
      }
    }
    for (;;)
    {
      label161:
      bool2 = bool1;
      if (bool1) {
        break;
      }
      Log.w("MediaCodecCapabilities(j)", "profile " + paramInt1 + " and level " + paramInt2 + "not supported");
      return bool1;
      paramString = capabilitiesMap.keySet().iterator();
      bool1 = false;
      while (paramString.hasNext())
      {
        String str = (String)paramString.next();
        localObject = (MediaCodecInfo.CodecCapabilities)capabilitiesMap.get(str);
        if (localObject != null)
        {
          if (isProfileLevelSupportedByCapacities((MediaCodecInfo.CodecCapabilities)localObject, paramInt1, paramInt2, str)) {
            bool1 = true;
          }
          for (;;)
          {
            break;
          }
        }
      }
    }
  }
  
  public static void PreloadCodecInfoList(String paramString)
  {
    if (Build.VERSION.SDK_INT <= 22) {
      return;
    }
    if (codecInfoList.isEmpty()) {
      getCodecInfos(paramString);
    }
    if (codecInfoList.isEmpty())
    {
      Log.w("MediaCodecCapabilities(j)", "no codeInfo for mime " + paramString);
      return;
    }
    int i = 0;
    while (i < codecInfoList.size())
    {
      MediaCodecInfo localMediaCodecInfo = (MediaCodecInfo)codecInfoList.get(i);
      try
      {
        MediaCodecInfo.CodecCapabilities localCodecCapabilities = localMediaCodecInfo.getCapabilitiesForType(paramString);
        capabilitiesMap.put(localMediaCodecInfo.getName(), localCodecCapabilities);
        i += 1;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          Log.w("MediaCodecCapabilities(j)", "caught exception");
        }
      }
    }
  }
  
  public static void PrintCodecList()
  {
    int k = MediaCodecList.getCodecCount();
    Log.w("MediaCodecCapabilities(j)", "PrintCodecList ---------");
    int i = 0;
    if (i < k)
    {
      Object localObject = MediaCodecList.getCodecInfoAt(i);
      if (((MediaCodecInfo)localObject).isEncoder()) {}
      for (;;)
      {
        i += 1;
        break;
        Log.w("MediaCodecCapabilities(j)", "    Name = [" + ((MediaCodecInfo)localObject).getName() + "]");
        localObject = ((MediaCodecInfo)localObject).getSupportedTypes();
        int j = 0;
        while (j < localObject.length)
        {
          Log.w("MediaCodecCapabilities(j)", "        SupportedType[" + j + "] = [" + localObject[j] + "]");
          j += 1;
        }
      }
    }
    Log.w("MediaCodecCapabilities(j)", "-------------------------------");
  }
  
  private static void getCodecInfos(String paramString)
  {
    int k = MediaCodecList.getCodecCount();
    int i = 0;
    if (i < k)
    {
      MediaCodecInfo localMediaCodecInfo = MediaCodecList.getCodecInfoAt(i);
      if (localMediaCodecInfo.isEncoder()) {}
      for (;;)
      {
        i += 1;
        break;
        String[] arrayOfString = localMediaCodecInfo.getSupportedTypes();
        int j = 0;
        while (j < arrayOfString.length)
        {
          if (arrayOfString[j].equalsIgnoreCase(paramString))
          {
            codecInfoList.add(localMediaCodecInfo);
            Log.w("MediaCodecCapabilities(j)", "info = " + localMediaCodecInfo.getName());
          }
          j += 1;
        }
      }
    }
  }
  
  private static boolean isProfileLevelSupportedByCapacities(MediaCodecInfo.CodecCapabilities paramCodecCapabilities, int paramInt1, int paramInt2, String paramString)
  {
    int i = 0;
    StringBuilder localStringBuilder = new StringBuilder();
    boolean bool2;
    for (boolean bool1 = false; i < profileLevels.length; bool1 = bool2)
    {
      if (i > 0) {
        localStringBuilder.append(", ");
      }
      localStringBuilder.append(profileLevels[i].profile + " / " + profileLevels[i].level);
      bool2 = bool1;
      if (profileLevels[i].profile >= paramInt1)
      {
        bool2 = bool1;
        if (profileLevels[i].level >= paramInt2)
        {
          Log.w("MediaCodecCapabilities(j)", "IsProfileLevelSupported suppported: caps.profileLevels[k].profile: " + profileLevels[i].profile + " >= profile: " + paramInt1 + " and caps.profileLevels[k].level: " + profileLevels[i].level + " >= level: " + paramInt2);
          bool2 = true;
        }
      }
      i += 1;
    }
    Log.d("MediaCodecCapabilities(j)", "codecName " + paramString + "    profiles/levels: " + localStringBuilder);
    return bool1;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.MediaCodecCapabilities
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */