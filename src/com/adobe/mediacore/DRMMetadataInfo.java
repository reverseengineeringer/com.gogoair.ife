package com.adobe.mediacore;

import com.adobe.ave.drm.DRMManager;
import com.adobe.ave.drm.DRMMetadata;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.utils.TimeRange;

public class DRMMetadataInfo
{
  public static final long INVALID_TIME_RANGE_START_POSITION_AVE = -1000L;
  public static final long INVALID_TIME_RANGE_START_POSITION_PSDK = -1L;
  private static final String LOG_TAG = "[PSDK]::" + DRMMetadataInfo.class.getSimpleName();
  private static Logger _logger = Log.getLogger(LOG_TAG);
  private final DRMMetadata _drmMetadata;
  private final long _prefetchDeadline;
  private TimeRange _timeRange;
  
  protected DRMMetadataInfo(DRMMetadata paramDRMMetadata, TimeRange paramTimeRange, long paramLong)
  {
    _drmMetadata = paramDRMMetadata;
    _timeRange = paramTimeRange;
    _prefetchDeadline = paramLong;
  }
  
  public static DRMMetadataInfo createDRMMetadataInfo(DRMManager paramDRMManager, byte[] paramArrayOfByte, int paramInt, long paramLong, boolean paramBoolean)
  {
    if (paramDRMManager == null)
    {
      _logger.e(LOG_TAG + "#createDRMMetadataInfo", "DRMManager is null.");
      return null;
    }
    paramArrayOfByte = paramDRMManager.createMetadataFromBytes(paramArrayOfByte, new DRMMetadataInfo.1());
    if (paramArrayOfByte == null)
    {
      _logger.e(LOG_TAG + "#createDRMMetadataInfo", "DRMMetadata is null.");
      return null;
    }
    if (paramLong == -1000L)
    {
      paramDRMManager = TimeRange.createRange(-1L, 0L);
      paramLong = -1L;
    }
    for (;;)
    {
      return new DRMMetadataInfo(paramArrayOfByte, paramDRMManager, paramLong);
      paramDRMManager = TimeRange.createRange(paramLong, 2147483647L);
    }
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    if ((paramObject == null) || (!(paramObject instanceof DRMMetadataInfo))) {
      return false;
    }
    paramObject = (DRMMetadataInfo)paramObject;
    return getDRMMetadata().getLicenseId().equals(((DRMMetadataInfo)paramObject).getDRMMetadata().getLicenseId());
  }
  
  public DRMMetadata getDRMMetadata()
  {
    return _drmMetadata;
  }
  
  public long getPrefetchTimestamp()
  {
    return _prefetchDeadline;
  }
  
  public TimeRange getTimeRange()
  {
    return _timeRange;
  }
  
  public int hashCode()
  {
    return getDRMMetadata().getLicenseId().hashCode();
  }
  
  public void setTimeRange(TimeRange paramTimeRange)
  {
    _timeRange = paramTimeRange;
  }
  
  public String toString()
  {
    return "DRMMetadataInfo { range begin: " + getTimeRange().getBegin() + ", " + "end: " + getTimeRange().getEnd() + ", " + "prefetchDeadline: " + getPrefetchTimestamp() + ", " + " }";
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DRMMetadataInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */