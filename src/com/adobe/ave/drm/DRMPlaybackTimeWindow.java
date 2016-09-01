package com.adobe.ave.drm;

import java.util.Date;

public class DRMPlaybackTimeWindow
{
  private Date endDate;
  private long periodInSeconds;
  private Date startDate;
  
  protected DRMPlaybackTimeWindow(long paramLong, Date paramDate1, Date paramDate2)
  {
    periodInSeconds = paramLong;
    startDate = paramDate1;
    endDate = paramDate2;
  }
  
  public Date getPlaybackEndDate()
  {
    return endDate;
  }
  
  public long getPlaybackPeriodInSeconds()
  {
    return periodInSeconds;
  }
  
  public Date getPlaybackStartDate()
  {
    return startDate;
  }
  
  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    if (getPlaybackPeriodInSeconds() > 0L) {
      localStringBuffer.append("period in seconds " + getPlaybackPeriodInSeconds() + " ");
    }
    if (getPlaybackStartDate() != null) {
      localStringBuffer.append("start date " + getPlaybackStartDate());
    }
    if (getPlaybackEndDate() != null) {
      localStringBuffer.append("end date " + getPlaybackEndDate());
    }
    return localStringBuffer.toString();
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMPlaybackTimeWindow
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */