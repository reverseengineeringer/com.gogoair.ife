package com.auditude.ads.network;

import com.auditude.ads.model.Ad;
import com.auditude.ads.util.event.IEventDispatcher;
import java.util.HashMap;

public abstract interface INetworkAdLoader
  extends IEventDispatcher
{
  public abstract void cancel();
  
  public abstract Ad getAd();
  
  public abstract Object getResult();
  
  public abstract Object getSource();
  
  public abstract void load();
  
  public abstract void setAd(Ad paramAd);
  
  public abstract void setCustomParams(HashMap paramHashMap);
  
  public abstract void setSource(Object paramObject);
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.INetworkAdLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */