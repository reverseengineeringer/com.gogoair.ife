package com.adobe.mediacore.videoanalytics;

import com.adobe.mediacore.utils.StringUtils;
import java.io.Serializable;
import java.util.HashMap;

public class VideoAnalyticsChapterData
  implements Serializable
{
  private Double _endTime = Double.valueOf(0.0D);
  private HashMap _metadata = null;
  private String _name = "default-chapter-name";
  private Double _startTime = Double.valueOf(0.0D);
  
  public VideoAnalyticsChapterData(double paramDouble1, double paramDouble2)
  {
    _startTime = Double.valueOf(paramDouble1);
    _endTime = Double.valueOf(paramDouble2);
  }
  
  public Double getEndTime()
  {
    return _endTime;
  }
  
  public String getName()
  {
    return _name;
  }
  
  public Double getStartTime()
  {
    return _startTime;
  }
  
  public void setEndTime(Double paramDouble)
  {
    _endTime = paramDouble;
  }
  
  public void setName(String paramString)
  {
    if (!StringUtils.isEmpty(paramString)) {
      _name = paramString;
    }
  }
  
  public void setStartTime(Double paramDouble)
  {
    _startTime = paramDouble;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getClass().getSimpleName()).append(" Object {");
    localStringBuilder.append(" name=").append(_name);
    localStringBuilder.append(" start time=").append(_startTime);
    localStringBuilder.append(" ,end time=").append(_endTime);
    localStringBuilder.append(" }");
    return localStringBuilder.toString();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsChapterData
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */