package com.adobe.mediacore.metadata;

import com.adobe.mediacore.utils.StringUtils;
import com.adobe.mediacore.utils.TimeRangeCollection;

public class AdvertisingMetadata
  extends MetadataNode
{
  public final AdBreakAsWatched getAdBreakAsWatched()
  {
    String str = getValue(DefaultMetadataKeys.AD_BREAK_AS_WATCHED_KEY.getValue());
    if (StringUtils.isEmpty(str)) {
      return AdBreakAsWatched.AD_BREAK_AS_WATCHED_ON_BEGIN;
    }
    return AdBreakAsWatched.createFrom(str);
  }
  
  public final String getEnableLivePreroll()
  {
    return getValue(DefaultMetadataKeys.ENABLE_LIVE_PRE_ROLL.getValue());
  }
  
  public final AdSignalingMode getSignalingMode()
  {
    String str = getValue(DefaultMetadataKeys.AD_SIGNALING_MODE_KEY.getValue());
    if (StringUtils.isEmpty(str)) {
      return AdSignalingMode.DEFAULT;
    }
    return AdSignalingMode.createFrom(str);
  }
  
  public final void setAdBreakAsWatched(AdBreakAsWatched paramAdBreakAsWatched)
  {
    setValue(DefaultMetadataKeys.AD_BREAK_AS_WATCHED_KEY.getValue(), paramAdBreakAsWatched.getValue());
  }
  
  public final void setEnableLivePreroll(String paramString)
  {
    setValue(DefaultMetadataKeys.ENABLE_LIVE_PRE_ROLL.getValue(), paramString);
  }
  
  public final void setSignalingMode(AdSignalingMode paramAdSignalingMode)
  {
    setValue(DefaultMetadataKeys.AD_SIGNALING_MODE_KEY.getValue(), paramAdSignalingMode.getValue());
  }
  
  public final void setTimeRanges(TimeRangeCollection paramTimeRangeCollection, Metadata paramMetadata)
  {
    setNode(DefaultMetadataKeys.TIME_RANGES_METADATA_KEY.getValue(), paramTimeRangeCollection.toMetadata(paramMetadata));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.metadata.AdvertisingMetadata
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */