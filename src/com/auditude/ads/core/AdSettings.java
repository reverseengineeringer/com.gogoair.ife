package com.auditude.ads.core;

import com.auditude.ads.util.ObjectUtil;
import com.auditude.ads.util.StringUtil;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.util.HashMap;

public class AdSettings
{
  public static final String PUBLISHER_VERSION = "publisherVersion";
  public static final String USE_SSL = "useSSL";
  private String[] aamSegments;
  private String aamUuid;
  private HashMap adProperties = new HashMap();
  private HashMap customParams;
  private String domain;
  PropertyChangeSupport pcs = new PropertyChangeSupport(this);
  private int zoneId;
  
  public AdSettings()
  {
    setProperty("bitrate", Integer.valueOf(0), false);
    setProperty("leftVolume", Float.valueOf(0.75F), false);
    setProperty("rightVolume", Float.valueOf(0.75F), false);
    setProperty("width", Integer.valueOf(0), false);
    setProperty("height", Integer.valueOf(0), false);
    setProperty("auditudeHandlesChapterBreaks", Boolean.valueOf(true), false);
    setProperty("auditudeHandlesLinearVideoAds", Boolean.valueOf(true), false);
    setProperty("userAgent", "", false);
    setProperty("useSSL", Boolean.valueOf(false), false);
  }
  
  public void addPropertyChangeListener(PropertyChangeListener paramPropertyChangeListener)
  {
    pcs.addPropertyChangeListener(paramPropertyChangeListener);
  }
  
  public final int getBitRate()
  {
    return ((Integer)getProperty("bitrate")).intValue();
  }
  
  public Object getCustomParamValue(String paramString)
  {
    if ((StringUtil.isNotNullOrEmpty(paramString)) && (customParams != null)) {
      return customParams.get(paramString);
    }
    return null;
  }
  
  public final HashMap getCustomParams()
  {
    return customParams;
  }
  
  public final String getDomain()
  {
    return domain;
  }
  
  public final double getHeight()
  {
    return ((Double)getProperty("height")).doubleValue();
  }
  
  public final float getLeftVolume()
  {
    return ObjectUtil.convertToFloat(getProperty("leftVolume"), 0.0F);
  }
  
  public final HashMap getPassThroughParams()
  {
    Object localObject3;
    Object localObject1;
    int i;
    if ((customParams != null) && (customParams.containsKey("auditudePassThroughParams")))
    {
      localObject3 = customParams.get("auditudePassThroughParams");
      if ((localObject3 == null) || (localObject3.getClass() != String.class)) {
        break label293;
      }
      localObject1 = new HashMap();
      localObject3 = ((String)localObject3).split(";");
      if ((localObject3 == null) || (localObject3.length <= 0)) {
        break label364;
      }
      int j = localObject3.length;
      i = 0;
      if (i < j) {
        break label244;
      }
    }
    label88:
    label244:
    label293:
    label358:
    label364:
    for (;;)
    {
      Object localObject4;
      if ((aamSegments == null) || (aamSegments.length <= 0))
      {
        localObject4 = localObject1;
        if (aamUuid != null)
        {
          localObject4 = localObject1;
          if (aamUuid.length() <= 0) {}
        }
      }
      else
      {
        localObject3 = localObject1;
        if (localObject1 == null) {
          localObject3 = new HashMap();
        }
        localObject1 = new StringBuilder();
        if ((aamSegments != null) && (aamSegments.length > 0)) {
          i = 0;
        }
      }
      for (;;)
      {
        if (i >= aamSegments.length)
        {
          ((HashMap)localObject3).put("aud_aam_segs", ((StringBuilder)localObject1).toString());
          localObject4 = localObject3;
          if (aamUuid != null)
          {
            localObject4 = localObject3;
            if (aamUuid.length() > 0)
            {
              ((HashMap)localObject3).put("aud_aam_uuid", aamUuid);
              localObject4 = localObject3;
            }
          }
          return (HashMap)localObject4;
          localObject3 = null;
          break;
          localObject4 = localObject3[i];
          int k = ((String)localObject4).indexOf("=");
          if (k <= 0) {}
          for (;;)
          {
            i += 1;
            break;
            ((HashMap)localObject1).put(((String)localObject4).substring(0, k), ((String)localObject4).substring(k + 1));
          }
          if (!(localObject3 instanceof HashMap)) {
            break label358;
          }
          try
          {
            localObject1 = (HashMap)localObject3;
          }
          catch (RuntimeException localRuntimeException)
          {
            localObject2 = null;
          }
          break label88;
        }
        ((StringBuilder)localObject2).append("aud_aam_segs=" + aamSegments[i] + ";");
        i += 1;
      }
      Object localObject2 = null;
    }
  }
  
  public final Object getProperty(String paramString)
  {
    if ((paramString != null) && (adProperties.containsKey(paramString))) {
      return adProperties.get(paramString);
    }
    return null;
  }
  
  public final boolean getPropertyAsBoolean(String paramString)
  {
    if ((paramString != null) && (adProperties.containsKey(paramString)))
    {
      paramString = adProperties.get(paramString);
      if (paramString != null) {
        return Boolean.getBoolean(paramString.toString());
      }
    }
    return false;
  }
  
  public final String getPublisherVersion()
  {
    Object localObject = getProperty("publisherVersion");
    if ((localObject instanceof String)) {}
    for (;;)
    {
      return (String)localObject;
      localObject = null;
    }
  }
  
  public final float getRightVolume()
  {
    return ObjectUtil.convertToFloat(getProperty("rightVolume"), 0.0F);
  }
  
  public final String getUserAgent()
  {
    return ObjectUtil.convertToString(getProperty("userAgent"), "");
  }
  
  public final Object getUserData()
  {
    if ((customParams != null) && (customParams.containsKey("userData"))) {
      return customParams.get("userData");
    }
    return null;
  }
  
  public final double getWidth()
  {
    return ((Double)getProperty("width")).doubleValue();
  }
  
  public final int getZoneId()
  {
    return zoneId;
  }
  
  public final boolean hasProperty(String paramString)
  {
    return (paramString != null) && (adProperties.containsKey(paramString));
  }
  
  public void removePropertyChangeListener(PropertyChangeListener paramPropertyChangeListener)
  {
    pcs.removePropertyChangeListener(paramPropertyChangeListener);
  }
  
  public final void setAamSegments(String[] paramArrayOfString)
  {
    aamSegments = paramArrayOfString;
  }
  
  public final void setAamUuid(String paramString)
  {
    aamUuid = paramString;
  }
  
  public final void setBitRate(int paramInt)
  {
    setProperty("bitrate", Integer.valueOf(paramInt));
  }
  
  public final void setCustomParams(HashMap paramHashMap)
  {
    customParams = paramHashMap;
  }
  
  public final void setDomain(String paramString)
  {
    domain = paramString;
  }
  
  public final void setHeight(double paramDouble)
  {
    setProperty("height", Double.valueOf(paramDouble));
  }
  
  public final void setProperty(String paramString, Object paramObject)
  {
    setProperty(paramString, paramObject, true);
  }
  
  public final void setProperty(String paramString, Object paramObject, boolean paramBoolean)
  {
    if (paramString == null) {}
    Object localObject;
    do
    {
      return;
      localObject = getProperty(paramString);
      adProperties.put(paramString, paramObject);
    } while ((paramObject == localObject) || (!paramBoolean));
    pcs.firePropertyChange(paramString, localObject, paramObject);
  }
  
  public final void setPublisherVersion(String paramString)
  {
    setProperty(getPublisherVersion(), paramString);
  }
  
  public final void setUserAgent(String paramString)
  {
    setProperty("userAgent", paramString);
  }
  
  public final void setVolume(float paramFloat1, float paramFloat2)
  {
    setProperty("leftVolume", Float.valueOf(paramFloat1));
    setProperty("rightVolume", Float.valueOf(paramFloat2));
  }
  
  public final void setWidth(double paramDouble)
  {
    setProperty("width", Double.valueOf(paramDouble));
  }
  
  public final void setZoneId(int paramInt)
  {
    zoneId = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.core.AdSettings
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */