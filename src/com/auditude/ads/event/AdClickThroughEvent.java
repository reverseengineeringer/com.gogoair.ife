package com.auditude.ads.event;

import com.auditude.ads.model.IClick;
import java.util.HashMap;

public class AdClickThroughEvent
  extends AdPluginEvent
{
  public static final String AD_CLICK = "adClick";
  private IClick click;
  
  public AdClickThroughEvent(String paramString, IClick paramIClick)
  {
    this(paramString, paramIClick, null);
  }
  
  public AdClickThroughEvent(String paramString, IClick paramIClick, HashMap paramHashMap)
  {
    super(paramString, paramHashMap);
    click = paramIClick;
  }
  
  public final IClick getClick()
  {
    return click;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.event.AdClickThroughEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */