package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.MediaResource;
import com.adobe.mediacore.metadata.Metadata;

public final class AdAsset
{
  private final AdClick _adClick;
  private final String _adParameters;
  private final long _duration;
  private final int _id;
  private final MediaResource _mediaResource;
  private final Metadata _metadata;
  
  public AdAsset(int paramInt, long paramLong, MediaResource paramMediaResource, AdClick paramAdClick, Metadata paramMetadata, String paramString)
  {
    _id = paramInt;
    _duration = paramLong;
    _mediaResource = paramMediaResource;
    _adClick = paramAdClick;
    _metadata = paramMetadata;
    _adParameters = paramString;
  }
  
  public static AdAsset newInstance(AdAsset paramAdAsset)
  {
    return new AdAsset(_id, _duration, _mediaResource, AdClick.newInstance(paramAdAsset.getAdClick()), _metadata, paramAdAsset.getAdParameters());
  }
  
  public AdClick getAdClick()
  {
    return _adClick;
  }
  
  public String getAdParameters()
  {
    return _adParameters;
  }
  
  public long getDuration()
  {
    return _duration;
  }
  
  public int getId()
  {
    return _id;
  }
  
  public MediaResource getMediaResource()
  {
    return _mediaResource;
  }
  
  public Metadata getMetadata()
  {
    return _metadata;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.AdAsset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */