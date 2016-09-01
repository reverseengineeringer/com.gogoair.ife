package com.auditude.ads.model;

import com.auditude.ads.model.tracking.TrackingEvent;
import com.auditude.ads.model.tracking.TrackingUrl;
import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.view.OnPageAssetUtil;
import java.util.ArrayList;
import java.util.Iterator;

public class OnPageAsset
  extends Asset
  implements IOnPageAsset
{
  private String altText;
  private String source;
  private IOnPageAsset staticAsset;
  
  public OnPageAsset(BaseElement paramBaseElement)
  {
    super(paramBaseElement);
    setFormat("onpage");
  }
  
  public void CopyTo(Asset paramAsset)
  {
    super.CopyTo(paramAsset);
    IClick localIClick;
    Click localClick;
    if ((paramAsset.getClick() != null) && (getClick() != null))
    {
      localIClick = getClick();
      localClick = (Click)paramAsset.getClick();
      if (!(localIClick instanceof Click)) {
        break label50;
      }
    }
    label50:
    for (paramAsset = localIClick;; paramAsset = null)
    {
      localClick.setBaseTrackingClick((Click)paramAsset);
      return;
    }
  }
  
  public final String[] ImpressionUrls()
  {
    ArrayList localArrayList = new ArrayList();
    Object localObject = getTrackingEventByType("creativeview");
    if ((localObject != null) && (((TrackingEvent)localObject).getTrackingUrls() != null)) {
      localObject = ((TrackingEvent)localObject).getTrackingUrls().iterator();
    }
    for (;;)
    {
      if (!((Iterator)localObject).hasNext()) {
        return (String[])localArrayList.toArray(new String[0]);
      }
      TrackingUrl localTrackingUrl = (TrackingUrl)((Iterator)localObject).next();
      if ((localTrackingUrl != null) && (!StringUtil.isNullOrEmpty(localTrackingUrl.getUrl()))) {
        localArrayList.add(AuditudeUtil.substituteTags(AuditudeUtil.substituteTags(localTrackingUrl.getUrl())));
      }
    }
  }
  
  public OnPageAsset clone()
  {
    OnPageAsset localOnPageAsset = new OnPageAsset(getParent());
    localOnPageAsset.setState(getState());
    localOnPageAsset.setID(getID());
    localOnPageAsset.setTrackingEvents(getTrackingEvents());
    localOnPageAsset.setTitle(getTitle());
    localOnPageAsset.setDescription(getDescription());
    localOnPageAsset.setFormat(getFormat());
    localOnPageAsset.setResourceType(getResourceType());
    localOnPageAsset.setCreativeType(getCreativeType());
    localOnPageAsset.setApiFramework(getApiFramework());
    localOnPageAsset.setAdParameters(getAdParameters());
    localOnPageAsset.setCustomData(getCustomData());
    localOnPageAsset.setAuditudeParams(getAuditudeParams());
    localOnPageAsset.setDurationInMillis(getDurationInMillis());
    localOnPageAsset.setLeadTimeInMillis(getLeadTimeInMillis());
    localOnPageAsset.setClick(getClick());
    localOnPageAsset.setMediaFiles(getMediaFiles());
    localOnPageAsset.setAltText(getAltText());
    source = source;
    return localOnPageAsset;
  }
  
  public final String getAltText()
  {
    return altText;
  }
  
  public final boolean getIsBanner()
  {
    return getFormat().equals("onpage");
  }
  
  public String getResourceType()
  {
    return super.getResourceType();
  }
  
  public String getSource()
  {
    Object localObject = null;
    if (super.getResourceType().equals("iframe")) {
      localObject = OnPageAssetUtil.GetHTMLForIFrameURL(AuditudeUtil.substituteTags(getUrl()), getWidth(), getHeight(), ImpressionUrls());
    }
    do
    {
      return (String)localObject;
      if (super.getResourceType().equals("static"))
      {
        String str = "";
        localObject = str;
        if (getClick() != null)
        {
          localObject = str;
          if (getClick().getUrl() != null) {
            localObject = getClick().getUrl();
          }
        }
        return OnPageAssetUtil.GetHTMLForImageURL(AuditudeUtil.substituteTags(getUrl()), (String)localObject, getWidth(), getHeight(), altText, ImpressionUrls());
      }
    } while (!super.getResourceType().equals("html"));
    return getUrl() + OnPageAssetUtil.GetTrackingPixels(ImpressionUrls());
  }
  
  public final IOnPageAsset getStaticAsset()
  {
    return staticAsset;
  }
  
  public String getType()
  {
    return "companion";
  }
  
  public final void setAltText(String paramString)
  {
    altText = paramString;
  }
  
  public void setResourceType(String paramString)
  {
    super.setResourceType(paramString);
  }
  
  public final void setStaticAsset(IOnPageAsset paramIOnPageAsset)
  {
    staticAsset = paramIOnPageAsset;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.OnPageAsset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */