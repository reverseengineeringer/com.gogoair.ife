package com.auditude.ads.model;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.model.media.MediaFile;
import com.auditude.ads.model.media.MediaStreamSet;
import com.auditude.ads.util.StringUtil;

public class LinearAsset
  extends Asset
  implements ILinearAsset
{
  public LinearAsset(BaseElement paramBaseElement)
  {
    super(paramBaseElement);
  }
  
  public void CopyTo(Asset paramAsset)
  {
    super.CopyTo(paramAsset);
    if (paramAsset != null)
    {
      copyTrackingEventsTo(paramAsset, "start", null);
      copyTrackingEventsTo(paramAsset, "firstquartile", null);
      copyTrackingEventsTo(paramAsset, "midpoint", null);
      copyTrackingEventsTo(paramAsset, "thirdquartile", null);
      copyTrackingEventsTo(paramAsset, "complete", null);
    }
  }
  
  public String getType()
  {
    return "linear";
  }
  
  public String getUrl()
  {
    if ((!StringUtil.isNullOrEmpty(getApiFramework())) && (getApiFramework().toLowerCase().equals("vpaid"))) {
      return super.getUrl();
    }
    MediaFile localMediaFile = MediaStreamSet.Search(getMediaFiles(), AuditudeEnv.getInstance().getAdSettings().getBitRate());
    if ((localMediaFile != null) && (!StringUtil.isNullOrEmpty(source))) {
      return source;
    }
    return super.getUrl();
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.LinearAsset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */