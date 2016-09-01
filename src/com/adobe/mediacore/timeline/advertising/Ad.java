package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.MediaResource;
import com.adobe.mediacore.MediaResource.Type;
import com.adobe.mediacore.utils.StringUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public final class Ad
{
  private final List _companionAssets;
  private final ContentTracker _contentTracker;
  private final long _duration;
  private final int _id;
  private final boolean _isCustomAdMarker;
  private final AdAsset _primaryAsset;
  private final MediaResource.Type _type;
  
  private Ad(int paramInt, MediaResource.Type paramType, ContentTracker paramContentTracker, long paramLong, boolean paramBoolean, AdAsset paramAdAsset, List paramList)
  {
    _id = paramInt;
    _type = paramType;
    _contentTracker = paramContentTracker;
    _duration = paramLong;
    _isCustomAdMarker = paramBoolean;
    _primaryAsset = paramAdAsset;
    _companionAssets = paramList;
  }
  
  public static Ad cloneAd(Ad paramAd, long paramLong, int paramInt)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramAd.getCompanionAssets().iterator();
    while (localIterator.hasNext()) {
      localArrayList.add(AdAsset.newInstance((AdAsset)localIterator.next()));
    }
    return new Ad(paramInt, paramAd.getType(), paramAd.getContentTracker(), paramLong, paramAd.isCustomAdMarker(), AdAsset.newInstance(paramAd.getPrimaryAsset()), localArrayList);
  }
  
  public static Ad createAd(MediaResource.Type paramType, long paramLong, int paramInt, AdAsset paramAdAsset, List paramList, ContentTracker paramContentTracker, boolean paramBoolean)
  {
    return new Ad(paramInt, paramType, paramContentTracker, paramLong, paramBoolean, paramAdAsset, paramList);
  }
  
  public static Ad createCustomAdMarker(MediaResource.Type paramType, long paramLong, int paramInt, AdAsset paramAdAsset)
  {
    return new Ad(paramInt, paramType, null, paramLong, true, paramAdAsset, new ArrayList());
  }
  
  public boolean equals(Ad paramAd)
  {
    return (paramAd != null) && (_id == paramAd.getId()) && (_primaryAsset.getId() == paramAd.getPrimaryAsset().getId()) && (super.equals(paramAd));
  }
  
  public final List getCompanionAssets()
  {
    return _companionAssets;
  }
  
  public ContentTracker getContentTracker()
  {
    return _contentTracker;
  }
  
  public final long getDuration()
  {
    return _duration;
  }
  
  public int getId()
  {
    return _id;
  }
  
  public final AdAsset getPrimaryAsset()
  {
    return _primaryAsset;
  }
  
  public final MediaResource.Type getType()
  {
    return _type;
  }
  
  public boolean isClickable()
  {
    return (_primaryAsset != null) && (_primaryAsset.getAdClick() != null) && (!StringUtils.isEmpty(_primaryAsset.getAdClick().getUrl()));
  }
  
  public boolean isCustomAdMarker()
  {
    return _isCustomAdMarker;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getClass().getSimpleName()).append(" Object {");
    localStringBuilder.append(" resource=").append(getPrimaryAsset().getMediaResource().toString());
    localStringBuilder.append(" ,duration=").append(getDuration());
    localStringBuilder.append(" ,id=").append(_id);
    localStringBuilder.append(" }");
    return localStringBuilder.toString();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.Ad
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */