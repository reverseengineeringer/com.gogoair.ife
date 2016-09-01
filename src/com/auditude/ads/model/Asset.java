package com.auditude.ads.model;

import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.model.media.MediaFile;
import com.auditude.ads.reporting.ReportingHelper;
import com.auditude.ads.util.AuditudeUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class Asset
  extends BaseElement
  implements IAsset
{
  public static final String TYPE_COMPANION = "companion";
  public static final String TYPE_LINEAR = "linear";
  public static final String TYPE_NONLINEAR = "nonlinear";
  public static final String TYPE_UNKNOWN = "unknown";
  private String adParameters;
  private String apiFramework;
  private HashMap auditudeParams = new HashMap();
  private IClick click;
  private String companionRequired = "none";
  private String creativeType;
  private HashMap customData;
  private String description;
  private int duration;
  private String format;
  private int height;
  private boolean isDisplayed;
  private int leadTime;
  private ArrayList mediaFiles = new ArrayList();
  private String networkAdId;
  private String resourceType;
  private int skipOffset = -1;
  private String title;
  private int width;
  
  public Asset(BaseElement paramBaseElement)
  {
    super(paramBaseElement);
  }
  
  public final void AddMediaFile(MediaFile paramMediaFile)
  {
    if (mediaFiles == null) {
      mediaFiles = new ArrayList();
    }
    mediaFiles.add(paramMediaFile);
  }
  
  public void CopyTo(Asset paramAsset)
  {
    if (paramAsset == null) {
      return;
    }
    auditudeParams = auditudeParams;
    customData = customData;
    if ((click == null) && (click != null)) {
      paramAsset.setClick(new Click(paramAsset));
    }
    Click localClick;
    if ((click != null) && (click != null))
    {
      localClick = (Click)click;
      if (!(click instanceof Click)) {
        break label115;
      }
    }
    label115:
    for (IClick localIClick = click;; localIClick = null)
    {
      localClick.copyTrackingEventsTo((Click)localIClick, "click", click.getUrl());
      copyTrackingEventsTo(paramAsset, "creativeview", paramAsset.getUrl());
      return;
    }
  }
  
  public final void Reset()
  {
    isDisplayed = false;
    resetTrackingEvents();
  }
  
  public final void Show()
  {
    isDisplayed = true;
  }
  
  public final String getAdParameters()
  {
    return adParameters;
  }
  
  public final String getApiFramework()
  {
    return apiFramework;
  }
  
  public final HashMap getAuditudeParams()
  {
    return auditudeParams;
  }
  
  public final MediaFile getBestMediaFile()
  {
    String[] arrayOfString = new String[5];
    arrayOfString[0] = "application/x-mpegurl";
    arrayOfString[1] = "video/mp4";
    arrayOfString[2] = "video/m4v";
    arrayOfString[3] = "video/x-flv";
    arrayOfString[4] = "video/webm";
    int[] arrayOfInt = new int[5];
    int[] tmp43_41 = arrayOfInt;
    tmp43_41[0] = 50;
    int[] tmp48_43 = tmp43_41;
    tmp48_43[1] = 40;
    int[] tmp53_48 = tmp48_43;
    tmp53_48[2] = 30;
    int[] tmp58_53 = tmp53_48;
    tmp58_53[3] = 20;
    int[] tmp63_58 = tmp58_53;
    tmp63_58[4] = 10;
    tmp63_58;
    Object localObject1 = null;
    MediaFile localMediaFile = null;
    int j;
    int m;
    if (mediaFiles != null)
    {
      j = 0;
      m = 0;
    }
    int k;
    Object localObject2;
    for (localObject1 = localMediaFile;; localObject1 = localObject2)
    {
      if (j >= mediaFiles.size()) {
        return (MediaFile)localObject1;
      }
      localMediaFile = (MediaFile)mediaFiles.get(j);
      if (mimeType.toLowerCase().equalsIgnoreCase(arrayOfString[0]))
      {
        i = arrayOfInt[0];
        return localMediaFile;
      }
      k = 1;
      localObject2 = localObject1;
      if (k < arrayOfString.length) {
        break;
      }
      j += 1;
    }
    int i = m;
    localObject1 = localObject2;
    if (mimeType.toLowerCase().equalsIgnoreCase(arrayOfString[k]))
    {
      i = m;
      localObject1 = localObject2;
      if (m < arrayOfInt[(k - 1)])
      {
        if (localObject2 == null) {
          break label294;
        }
        if ((!mimeType.toLowerCase().equalsIgnoreCase(mimeType)) || (bitrate <= bitrate))
        {
          i = m;
          localObject1 = localObject2;
          if (mimeType.equalsIgnoreCase(mimeType)) {}
        }
        else
        {
          i = arrayOfInt[k];
        }
      }
    }
    for (localObject1 = localMediaFile;; localObject1 = localMediaFile)
    {
      k += 1;
      m = i;
      localObject2 = localObject1;
      break;
      label294:
      i = arrayOfInt[k];
    }
  }
  
  public IClick getClick()
  {
    return click;
  }
  
  public final String getCompanionRequired()
  {
    return companionRequired;
  }
  
  public final String getCreativeType()
  {
    return creativeType;
  }
  
  public final HashMap getCustomData()
  {
    return customData;
  }
  
  public final String getDescription()
  {
    return description;
  }
  
  public final int getDurationInMillis()
  {
    return duration;
  }
  
  public final String getFormat()
  {
    return format;
  }
  
  public final int getHeight()
  {
    if (getMediaFile() != null) {
      return getMediaFileheight;
    }
    return height;
  }
  
  public final Boolean getIsSkippable()
  {
    if (skipOffset >= 0) {
      return Boolean.valueOf(true);
    }
    return Boolean.valueOf(false);
  }
  
  public final int getLeadTimeInMillis()
  {
    return leadTime;
  }
  
  public final MediaFile getMediaFile()
  {
    if (mediaFiles.size() > 0) {
      return (MediaFile)mediaFiles.get(0);
    }
    return null;
  }
  
  public final ArrayList getMediaFiles()
  {
    return mediaFiles;
  }
  
  public final String getNetworkAdId()
  {
    return networkAdId;
  }
  
  public String getResourceType()
  {
    return resourceType;
  }
  
  public final int getSkipOffset()
  {
    return skipOffset;
  }
  
  public final String getTitle()
  {
    return title;
  }
  
  public String getType()
  {
    return "unknown";
  }
  
  public String getUrl()
  {
    if (getMediaFile() != null)
    {
      String str = getMediaFilesource;
      if (!isNetworkAd()) {
        str = AuditudeUtil.getUrlWithState(getMediaFilesource, AuditudeEnv.getInstance().getReportingHelper().currentAdState());
      }
      return str;
    }
    return null;
  }
  
  public final int getWidth()
  {
    if (getMediaFile() != null) {
      return getMediaFilewidth;
    }
    return width;
  }
  
  public final Boolean hasAssetsWithMimeType(ArrayList paramArrayList)
  {
    if (paramArrayList != null) {}
    MediaFile localMediaFile;
    String str;
    do
    {
      Iterator localIterator1 = mediaFiles.iterator();
      Iterator localIterator2;
      while (!localIterator2.hasNext())
      {
        if (!localIterator1.hasNext()) {
          return Boolean.valueOf(false);
        }
        localMediaFile = (MediaFile)localIterator1.next();
        localIterator2 = paramArrayList.iterator();
      }
      str = (String)localIterator2.next();
    } while ((localMediaFile == null) || (mimeType == null) || (!mimeType.toLowerCase().equalsIgnoreCase(str)));
    return Boolean.valueOf(true);
  }
  
  public final boolean isDisplayed()
  {
    return isDisplayed;
  }
  
  public final boolean isNetworkAd()
  {
    return (getParent() != null) && ((getParent() instanceof Ad)) && (((Ad)getParent()).getIsNetworkAd());
  }
  
  public final void setAdParameters(String paramString)
  {
    adParameters = paramString;
  }
  
  public final void setApiFramework(String paramString)
  {
    apiFramework = paramString;
  }
  
  public final void setAuditudeParams(HashMap paramHashMap)
  {
    auditudeParams = paramHashMap;
  }
  
  public void setClick(IClick paramIClick)
  {
    click = paramIClick;
  }
  
  public final void setCompanionRequired(String paramString)
  {
    companionRequired = paramString;
  }
  
  public final void setCreativeType(String paramString)
  {
    creativeType = paramString;
  }
  
  public final void setCustomData(HashMap paramHashMap)
  {
    customData = paramHashMap;
  }
  
  public final void setDescription(String paramString)
  {
    description = paramString;
  }
  
  public final void setDurationInMillis(int paramInt)
  {
    duration = paramInt;
  }
  
  public final void setFormat(String paramString)
  {
    format = paramString;
  }
  
  public final void setHeight(int paramInt)
  {
    height = paramInt;
  }
  
  public final void setLeadTimeInMillis(int paramInt)
  {
    leadTime = paramInt;
  }
  
  public final void setMediaFiles(ArrayList paramArrayList)
  {
    mediaFiles = paramArrayList;
  }
  
  public void setMimeType(String paramString)
  {
    if (getMediaFile() != null) {
      getMediaFilemimeType = paramString;
    }
  }
  
  public final void setNetworkAdId(String paramString)
  {
    networkAdId = paramString;
  }
  
  public void setResourceType(String paramString)
  {
    resourceType = paramString;
  }
  
  public final void setSkipOffset(int paramInt)
  {
    skipOffset = paramInt;
  }
  
  public final void setTitle(String paramString)
  {
    title = paramString;
  }
  
  public void setUrl(String paramString)
  {
    if (getMediaFile() != null) {
      getMediaFilesource = paramString;
    }
  }
  
  public final void setWidth(int paramInt)
  {
    width = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.Asset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */