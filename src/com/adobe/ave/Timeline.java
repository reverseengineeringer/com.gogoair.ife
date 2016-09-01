package com.adobe.ave;

public class Timeline
{
  public int complete;
  public int firstPeriodIndex;
  public int firstSubscribedTagIndex;
  public int lastPeriodIndex;
  public int lastSubscribedTagIndex;
  private long mNativeContext;
  public ContainerType type;
  public long virtualDuration;
  public long virtualStartTime;
  
  private Timeline(long paramLong)
  {
    mNativeContext = paramLong;
    nativeCreateTimeline(paramLong);
  }
  
  private Timeline(long paramLong1, int paramInt1, int paramInt2, long paramLong2, long paramLong3, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    mNativeContext = paramLong1;
    Object localObject = ContainerType.UNDEFINED;
    ContainerType[] arrayOfContainerType = ContainerType.values();
    int j = arrayOfContainerType.length;
    int i = 0;
    if (i < j)
    {
      ContainerType localContainerType = arrayOfContainerType[i];
      if (localContainerType.getValue() == paramInt1) {
        localObject = localContainerType;
      }
    }
    for (;;)
    {
      type = ((ContainerType)localObject);
      complete = paramInt2;
      virtualStartTime = paramLong2;
      virtualDuration = paramLong3;
      firstPeriodIndex = paramInt3;
      lastPeriodIndex = paramInt4;
      firstSubscribedTagIndex = paramInt5;
      lastSubscribedTagIndex = paramInt6;
      nativeCreateTimeline(paramLong1);
      return;
      i += 1;
      break;
    }
  }
  
  private native void nativeClearPauseAtPeriodEnd(int paramInt)
    throws VideoEngineException;
  
  private native void nativeCreateTimeline(long paramLong);
  
  private native void nativeEraseByLocalTime(int paramInt, long paramLong1, long paramLong2, boolean paramBoolean)
    throws VideoEngineException;
  
  private native void nativeEraseByVirtualTime(long paramLong1, long paramLong2)
    throws VideoEngineException;
  
  private native int nativeGetABRProfileCount(int paramInt)
    throws VideoEngineException;
  
  private native ABRProfileInfo nativeGetABRProfileInfoAtIndex(int paramInt1, int paramInt2)
    throws VideoEngineException;
  
  private native CuePoint nativeGetCuePoint(int paramInt1, int paramInt2)
    throws VideoEngineException;
  
  private native TagData nativeGetMainManifestSubscribedTag(int paramInt);
  
  private native PeriodInfo nativeGetPeriodInfo(int paramInt)
    throws VideoEngineException;
  
  private native TagData nativeGetSubscribedTag(int paramInt1, int paramInt2);
  
  private native int nativeGetTrackCount(int paramInt1, int paramInt2)
    throws VideoEngineException;
  
  private native Object nativeGetTrackInfo(int paramInt1, int paramInt2, int paramInt3)
    throws VideoEngineException;
  
  private native InsertionResult nativeInsertByLocalTime(int paramInt1, long paramLong1, int paramInt2, int paramInt3, long paramLong2)
    throws VideoEngineException;
  
  private native InsertionResult nativeInsertByVirtualTime(long paramLong1, int paramInt1, int paramInt2, long paramLong2)
    throws VideoEngineException;
  
  private native void nativeLoadManifest(String paramString, int paramInt1, int paramInt2)
    throws VideoEngineException;
  
  private native void nativeReleaseManifest(int paramInt)
    throws VideoEngineException;
  
  private native void nativeSetHoldAt(long paramLong);
  
  private native void nativeSetPauseAtPeriodEnd(int paramInt1, int paramInt2)
    throws VideoEngineException;
  
  public void clearPauseAtPeriodEnd(int paramInt)
    throws VideoEngineException
  {
    nativeClearPauseAtPeriodEnd(paramInt);
  }
  
  public void eraseByLocalTime(int paramInt, long paramLong1, long paramLong2, boolean paramBoolean)
    throws VideoEngineException
  {
    nativeEraseByLocalTime(paramInt, paramLong1, paramLong2, paramBoolean);
  }
  
  public void eraseByVirtualTime(long paramLong1, long paramLong2)
    throws VideoEngineException
  {
    nativeEraseByVirtualTime(paramLong1, paramLong2);
  }
  
  public int getABRProfileCount(int paramInt)
    throws VideoEngineException
  {
    return nativeGetABRProfileCount(paramInt);
  }
  
  public ABRProfileInfo getABRProfileInfoAtIndex(int paramInt1, int paramInt2)
    throws VideoEngineException
  {
    return nativeGetABRProfileInfoAtIndex(paramInt1, paramInt2);
  }
  
  public CuePoint getCuePoint(int paramInt1, int paramInt2)
    throws VideoEngineException
  {
    return nativeGetCuePoint(paramInt1, paramInt2);
  }
  
  public TagData getMainManifestSubscribedTag(int paramInt)
    throws VideoEngineException
  {
    return nativeGetMainManifestSubscribedTag(paramInt);
  }
  
  public PeriodInfo getPeriodInfo(int paramInt)
    throws VideoEngineException
  {
    return nativeGetPeriodInfo(paramInt);
  }
  
  public TagData getSubscribedTag(int paramInt1, int paramInt2)
    throws VideoEngineException
  {
    return nativeGetSubscribedTag(paramInt1, paramInt2);
  }
  
  public int getTrackCount(int paramInt, PayloadType paramPayloadType)
    throws VideoEngineException
  {
    return nativeGetTrackCount(paramInt, paramPayloadType.getValue());
  }
  
  public Object getTrackInfo(int paramInt1, int paramInt2, PayloadType paramPayloadType)
    throws VideoEngineException
  {
    return nativeGetTrackInfo(paramInt1, paramInt2, paramPayloadType.getValue());
  }
  
  public InsertionResult insertByLocalTime(int paramInt1, long paramLong1, int paramInt2, int paramInt3, long paramLong2)
    throws VideoEngineException
  {
    return nativeInsertByLocalTime(paramInt1, paramLong1, paramInt2, paramInt3, paramLong2);
  }
  
  public InsertionResult insertByVirtualTime(long paramLong1, int paramInt1, int paramInt2, long paramLong2)
    throws VideoEngineException
  {
    return nativeInsertByVirtualTime(paramLong1, paramInt1, paramInt2, paramLong2);
  }
  
  public void loadManifest(String paramString, int paramInt, ContainerType paramContainerType)
    throws VideoEngineException
  {
    nativeLoadManifest(paramString, paramInt, paramContainerType.getValue());
  }
  
  public void releaseManifest(int paramInt)
    throws VideoEngineException
  {
    nativeReleaseManifest(paramInt);
  }
  
  public void setHoldAt(long paramLong)
    throws VideoEngineException
  {
    nativeSetHoldAt(paramLong);
  }
  
  public void setPauseAtPeriodEnd(int paramInt1, int paramInt2)
    throws VideoEngineException
  {
    nativeSetPauseAtPeriodEnd(paramInt1, paramInt2);
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.Timeline
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */