package com.auditude.ads.model;

import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.reporting.ReportingHelper;
import com.auditude.ads.util.AuditudeUtil;

public class Click
  extends BaseElement
  implements IClick
{
  private String altText;
  private Click baseTrackingClick;
  private boolean shouldAppendParState = false;
  private String target;
  private String title;
  private String url;
  
  public Click(BaseElement paramBaseElement)
  {
    super(paramBaseElement);
  }
  
  public final String getAltText()
  {
    return altText;
  }
  
  public final IAsset getAsset()
  {
    if ((getParent() instanceof IAsset)) {
      return (IAsset)getParent();
    }
    return null;
  }
  
  public final Click getBaseTrackingClick()
  {
    return baseTrackingClick;
  }
  
  public final boolean getShouldAppendParState()
  {
    return shouldAppendParState;
  }
  
  public final String getTarget()
  {
    return target;
  }
  
  public final String getTitle()
  {
    return title;
  }
  
  public final String getUrl()
  {
    if (shouldAppendParState) {}
    for (String str = AuditudeUtil.getUrlWithState(url, AuditudeEnv.getInstance().getReportingHelper().currentAdState());; str = url) {
      return AuditudeUtil.substituteTags(str);
    }
  }
  
  public final boolean isNetworkElement()
  {
    return ((getParent() instanceof Asset)) && (((Asset)getParent()).isNetworkAd());
  }
  
  public final void setAltText(String paramString)
  {
    altText = paramString;
  }
  
  public final void setBaseTrackingClick(Click paramClick)
  {
    baseTrackingClick = paramClick;
  }
  
  public final void setShouldAppendParState(boolean paramBoolean)
  {
    shouldAppendParState = paramBoolean;
  }
  
  public final void setTarget(String paramString)
  {
    target = paramString;
  }
  
  public final void setTitle(String paramString)
  {
    title = paramString;
  }
  
  public final void setUrl(String paramString)
  {
    url = paramString;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.Click
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */