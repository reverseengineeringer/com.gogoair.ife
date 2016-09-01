package com.auditude.ads.model.smil;

import com.auditude.ads.event.AdPluginEvent;
import com.auditude.ads.model.Ad;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.OnPageAsset;
import com.auditude.ads.network.INetworkAdLoader;
import com.auditude.ads.network.NetworkAdLoaderFactory;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.event.Event;
import com.auditude.ads.util.event.EventDispatcher;
import com.auditude.ads.util.event.IEventListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class Par
  extends EventDispatcher
  implements ISMILIterator, IEventListener
{
  private int enumeratorIndex = -1;
  private boolean isResolved = false;
  private INetworkAdLoader networkAdLoader;
  private ParResoultionCompleteListener parListener;
  private int priority = 0;
  private ArrayList refList = new ArrayList();
  private Sequence sequence;
  private HashMap state;
  
  public Par()
  {
    this(null);
  }
  
  public Par(Sequence paramSequence)
  {
    sequence = paramSequence;
  }
  
  private void notifyResolutionComplete()
  {
    isResolved = true;
    if (parListener != null) {
      parListener.onParResolutionComplete();
    }
  }
  
  public final void addRef(Ref paramRef)
  {
    if (paramRef != null)
    {
      paramRef.setPar(this);
      refList.add(paramRef);
    }
  }
  
  public final void addState(String paramString1, String paramString2)
  {
    if ((StringUtil.isNotNullOrEmpty(paramString1)) && (StringUtil.isNotNullOrEmpty(paramString2)))
    {
      if (state == null) {
        state = new HashMap();
      }
      state.put(paramString1, paramString2);
    }
  }
  
  public final void dispose()
  {
    Iterator localIterator = refList.iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        refList = null;
        return;
      }
      ((Ref)localIterator.next()).dispose();
    }
  }
  
  public final Ref getCurrent()
  {
    if ((enumeratorIndex < 0) || (enumeratorIndex >= refList.size())) {
      return null;
    }
    return (Ref)refList.get(enumeratorIndex);
  }
  
  public final Ref getNext()
  {
    int i = enumeratorIndex + 1;
    if ((i < 0) || (i >= refList.size()) || (!sequence.hasAvailableSlot())) {
      return null;
    }
    return (Ref)refList.get(i);
  }
  
  public final Ad getPrimaryAd()
  {
    if (refList.size() > 0) {
      return ((Ref)refList.get(0)).getAd();
    }
    return null;
  }
  
  public final int getPriority()
  {
    return priority;
  }
  
  public final ArrayList getRefList()
  {
    return refList;
  }
  
  public final Sequence getSequence()
  {
    return sequence;
  }
  
  public final HashMap getState()
  {
    return state;
  }
  
  public final SmilElementType getType()
  {
    if (sequence != null) {
      return sequence.getType();
    }
    return SmilElementType.UNKNOWN;
  }
  
  public final boolean isResolved()
  {
    return isResolved;
  }
  
  public final boolean moveNext()
  {
    enumeratorIndex += 1;
    if (enumeratorIndex < refList.size()) {
      return sequence.hasAvailableSlot();
    }
    return false;
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if (paramString.equalsIgnoreCase("error")) {
      if ((paramObject instanceof AdPluginEvent)) {
        dispatchEvent(paramString, paramObject);
      }
    }
    while (!paramString.equalsIgnoreCase("complete")) {
      return;
    }
    if (((paramObject instanceof Event)) && ((((Event)paramObject).getOwner() instanceof INetworkAdLoader))) {
      paramObject = (INetworkAdLoader)((Event)paramObject).getOwner();
    }
    for (paramString = ((INetworkAdLoader)paramObject).getAd();; paramString = null)
    {
      if (paramString != null)
      {
        refList = new ArrayList();
        paramObject = ((INetworkAdLoader)paramObject).getResult();
        if ((paramObject == null) || (!(paramObject instanceof ArrayList))) {
          break label274;
        }
        paramObject = ((ArrayList)paramObject).iterator();
        if (((Iterator)paramObject).hasNext()) {
          break label125;
        }
      }
      for (;;)
      {
        notifyResolutionComplete();
        return;
        label125:
        Object localObject = (ArrayList)((Iterator)paramObject).next();
        Ref localRef = new Ref(this);
        localRef.setAd(paramString);
        ArrayList localArrayList = new ArrayList();
        if (((ArrayList)localObject).size() > 0) {
          localObject = ((ArrayList)localObject).iterator();
        }
        for (;;)
        {
          if (!((Iterator)localObject).hasNext())
          {
            localRef.setAssets((Asset[])localArrayList.toArray(new Asset[0]));
            addRef(localRef);
            break;
          }
          Asset localAsset1 = (Asset)((Iterator)localObject).next();
          Asset localAsset2 = paramString.getTrackingAssetByType(localAsset1.getType());
          if (localAsset2 != null)
          {
            localAsset2.Reset();
            localAsset2.CopyTo(localAsset1);
          }
          localArrayList.add(localAsset1);
          if ((localAsset1 instanceof OnPageAsset)) {
            Ad.consolidateOnPageAsset(localArrayList, localAsset1);
          }
        }
        label274:
        paramObject = new Ref(this);
        ((Ref)paramObject).setAd(paramString);
        ((Ref)paramObject).setAssets(null);
        addRef((Ref)paramObject);
      }
      paramObject = null;
    }
  }
  
  public final void reset()
  {
    enumeratorIndex = -1;
    isResolved = false;
  }
  
  public final void resetAds()
  {
    Iterator localIterator = refList.iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      Object localObject1 = (Ref)localIterator.next();
      ((Ref)localObject1).setWatched(false);
      localObject1 = ((Ref)localObject1).getAssets();
      if ((localObject1 != null) && (localObject1.length > 0))
      {
        int j = localObject1.length;
        int i = 0;
        while (i < j)
        {
          Object localObject2 = localObject1[i];
          if (localObject2 != null) {
            ((Asset)localObject2).Reset();
          }
          i += 1;
        }
      }
    }
  }
  
  public final void resolve(HashMap paramHashMap)
  {
    if (isResolved)
    {
      notifyResolutionComplete();
      return;
    }
    if (refList.size() > 0)
    {
      Ad localAd = ((Ref)refList.get(0)).getAd();
      if ((localAd != null) && (localAd.getIsNetworkAd()))
      {
        networkAdLoader = NetworkAdLoaderFactory.getLoaderForType(localAd.getNetworkAdType());
        if (networkAdLoader != null)
        {
          networkAdLoader.addEventListener("error", this);
          networkAdLoader.addEventListener("complete", this);
          networkAdLoader.setCustomParams(paramHashMap);
          networkAdLoader.setSource(localAd.getNetworkAdSource());
          networkAdLoader.setAd(localAd);
          networkAdLoader.load();
          return;
        }
        notifyResolutionComplete();
        return;
      }
      notifyResolutionComplete();
      return;
    }
    notifyResolutionComplete();
  }
  
  public void setParResolutionCompleteListener(ParResoultionCompleteListener paramParResoultionCompleteListener)
  {
    parListener = paramParResoultionCompleteListener;
  }
  
  public final void setPriority(int paramInt)
  {
    priority = paramInt;
  }
  
  public void setSequence(Sequence paramSequence)
  {
    sequence = paramSequence;
  }
  
  public static abstract interface ParResoultionCompleteListener
  {
    public abstract void onParResolutionComplete();
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.smil.Par
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */