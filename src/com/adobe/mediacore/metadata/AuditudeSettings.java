package com.adobe.mediacore.metadata;

import java.util.ArrayList;

public class AuditudeSettings
  extends AdvertisingMetadata
{
  private static final long serialVersionUID = 1L;
  private final String AD_LOAD_TIMEOUT_KEY = "ad_load_timeout";
  private final String CREATIVE_REPACKAGING_ENABLED = "creative_repackaging_enabled";
  private final String CUSTOM_PARAMETERS_KEY = "custom_parameters";
  private final String CUSTOM_USER_AGENT = "custom_user_agent";
  private final String DEFAULT_MEDIA_ID_KEY = "default_mediaid";
  private final String DOMAIN_KEY = "domain";
  private final String FALLBACK_ON_INVALID_CREATIVE = "fallbackOnInvalidCreative";
  private final String MEDIA_ID_KEY = "mediaid";
  private final String TARGETING_KEY = "targeting";
  private final String VALID_MIME_TYPES = "validMimeTypes";
  private final String ZONE_ID_KEY = "zoneid";
  private Object data;
  
  public String getAdLoadTimeout()
  {
    return getValue("ad_load_timeout");
  }
  
  public Metadata getCustomParameters()
  {
    return getNode("custom_parameters");
  }
  
  public Object getData()
  {
    return data;
  }
  
  public String getDefaultMediaId()
  {
    return getValue("default_mediaid");
  }
  
  public String getDomain()
  {
    return getValue("domain");
  }
  
  public String getMediaId()
  {
    return getValue("mediaid");
  }
  
  public Metadata getTargetingParameters()
  {
    return getNode("targeting");
  }
  
  public String getUserAgent()
  {
    return getValue("custom_user_agent");
  }
  
  public ArrayList getValidMimeTypes()
  {
    return (ArrayList)getObject("validMimeTypes");
  }
  
  public String getZoneId()
  {
    return getValue("zoneid");
  }
  
  public boolean isCreativeRepackagingEnabled()
  {
    return Boolean.parseBoolean(getValue("creative_repackaging_enabled"));
  }
  
  public boolean isFallbackOnInvalidCreativeEnabled()
  {
    return Boolean.parseBoolean(getValue("fallbackOnInvalidCreative"));
  }
  
  public void setCreativeRepackagingEnabled(boolean paramBoolean)
  {
    setValue("creative_repackaging_enabled", String.valueOf(paramBoolean));
  }
  
  public void setCustomAdLoadTimeout(int paramInt)
  {
    setValue("ad_load_timeout", String.valueOf(paramInt));
  }
  
  public void setCustomParameters(Metadata paramMetadata)
  {
    setNode("custom_parameters", paramMetadata);
  }
  
  public void setData(Object paramObject)
  {
    data = paramObject;
  }
  
  public void setDefaultMediaId(String paramString)
  {
    setValue("default_mediaid", String.valueOf(paramString));
  }
  
  public void setDomain(String paramString)
  {
    setValue("domain", paramString);
  }
  
  public void setFallbackOnInvalidCreativeEnabled(boolean paramBoolean)
  {
    setValue("fallbackOnInvalidCreative", String.valueOf(paramBoolean));
  }
  
  public void setMediaId(String paramString)
  {
    setValue("mediaid", paramString);
  }
  
  public void setTargetingParameters(Metadata paramMetadata)
  {
    setNode("targeting", paramMetadata);
  }
  
  public void setUserAgent(String paramString)
  {
    setValue("custom_user_agent", String.valueOf(paramString));
  }
  
  public void setValidMimeTypes(ArrayList paramArrayList)
  {
    setObject("validMimeTypes", paramArrayList);
  }
  
  public void setZoneId(String paramString)
  {
    setValue("zoneid", paramString);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.metadata.AuditudeSettings
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */