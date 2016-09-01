package com.auditude.ads.model.smil;

import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.event.SMILEvent;
import com.auditude.ads.event.SMILEvent.SMILEventType;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.BaseElement;
import com.auditude.ads.model.LinearAsset;
import com.auditude.ads.model.NonLinearAsset;
import com.auditude.ads.util.StringUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class Sequence
  extends BaseElement
  implements ISMILIterator
{
  public static String PLAYABLE_AD_COUNT = "playableAdCount";
  public static String PLAYABLE_DURATION = "playableDuration";
  public static String PLAYABLE_REFS = "playableRefs";
  private int count = -1;
  private int creativeMaxDuration = -1;
  private int duration = -1;
  private int enumeratorIndex = -1;
  private boolean isWatched = false;
  private int maxCount = -1;
  private int maxDuration = -1;
  private ArrayList pars = new ArrayList();
  private String submissionId;
  private SmilElementType type = SmilElementType.values()[0];
  
  public Sequence(BaseElement paramBaseElement, SmilElementType paramSmilElementType)
  {
    super(paramBaseElement);
    type = paramSmilElementType;
  }
  
  private void prioritizePars() {}
  
  private void resetAds()
  {
    Iterator localIterator = pars.iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      ((Par)localIterator.next()).resetAds();
    }
  }
  
  public final void addPar(Par paramPar)
  {
    if (paramPar != null)
    {
      paramPar.setSequence(this);
      pars.add(paramPar);
    }
  }
  
  public final void addState(String paramString1, String paramString2)
  {
    if ((StringUtil.isNotNullOrEmpty(paramString1)) && (StringUtil.isNotNullOrEmpty(paramString2)))
    {
      HashMap localHashMap2 = super.getState();
      HashMap localHashMap1 = localHashMap2;
      if (localHashMap2 == null) {
        localHashMap1 = new HashMap();
      }
      localHashMap1.put(paramString1, paramString2);
      super.setState(localHashMap1);
    }
  }
  
  public final void begin()
  {
    isWatched = true;
    if (isLinear()) {
      resetAds();
    }
    prioritizePars();
    AuditudeEnv.getInstance().getAPI().dispatchEvent("smilEvent", new SMILEvent(AuditudeEnv.getInstance().getAPI(), SMILEvent.SMILEventType.SEQUENCE_BEGIN, this, null, shouldAdvanceAdPatternOnBegin()));
  }
  
  public final void dispose()
  {
    super.dispose();
    Iterator localIterator = pars.iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        pars = null;
        return;
      }
      ((Par)localIterator.next()).dispose();
    }
  }
  
  public final void end(boolean paramBoolean)
  {
    isWatched = true;
    APIBridge localAPIBridge1 = AuditudeEnv.getInstance().getAPI();
    APIBridge localAPIBridge2 = AuditudeEnv.getInstance().getAPI();
    SMILEvent.SMILEventType localSMILEventType = SMILEvent.SMILEventType.SEQUENCE_END;
    if (paramBoolean) {}
    for (paramBoolean = shouldAdvanceAdPatternOnEnd();; paramBoolean = false)
    {
      localAPIBridge1.dispatchEvent("smilEvent", new SMILEvent(localAPIBridge2, localSMILEventType, this, null, paramBoolean));
      return;
    }
  }
  
  public final int getCount()
  {
    return count;
  }
  
  public final int getCreativeMaxDuration()
  {
    return creativeMaxDuration;
  }
  
  public final Par getCurrent()
  {
    if ((enumeratorIndex < 0) || (enumeratorIndex >= pars.size())) {
      return null;
    }
    return (Par)pars.get(enumeratorIndex);
  }
  
  public final int getDuration()
  {
    return duration;
  }
  
  public final int getMaxCount()
  {
    if (maxCount < 0) {
      return count;
    }
    return maxCount;
  }
  
  public final int getMaxDuration()
  {
    if (maxDuration < 0) {
      return duration;
    }
    return maxDuration;
  }
  
  public final Par getNext()
  {
    int i = enumeratorIndex + 1;
    if ((i < 0) || (i >= pars.size()) || (!hasAvailableSlot())) {
      return null;
    }
    return (Par)pars.get(i);
  }
  
  public final ArrayList getPars()
  {
    return pars;
  }
  
  public final HashMap getPlayableMetrics()
  {
    ArrayList localArrayList = new ArrayList();
    Object localObject1 = new RefIterator(pars);
    int j = 0;
    int i = 0;
    Object localObject2 = ((RefIterator)localObject1).next();
    int m;
    int k;
    if (localObject2 == null)
    {
      m = i;
      k = j;
    }
    for (;;)
    {
      localObject1 = new HashMap();
      ((HashMap)localObject1).put(PLAYABLE_DURATION, Integer.valueOf(m));
      ((HashMap)localObject1).put(PLAYABLE_AD_COUNT, Integer.valueOf(k));
      ((HashMap)localObject1).put(PLAYABLE_REFS, localArrayList);
      return (HashMap)localObject1;
      Asset localAsset = ((Ref)localObject2).getPrimaryAsset();
      if (!(localAsset instanceof LinearAsset)) {
        break;
      }
      if (getMaxCount() >= 0)
      {
        k = j;
        m = i;
        if (j >= getMaxCount()) {}
      }
      else
      {
        if (((getMaxDuration() >= 0) && (((LinearAsset)localAsset).getDurationInMillis() + i > getMaxDuration())) || ((getCreativeMaxDuration() >= 0) && (localAsset.getDurationInMillis() > getCreativeMaxDuration()))) {
          break;
        }
        k = j + 1;
        m = i + ((LinearAsset)localAsset).getDurationInMillis();
        localArrayList.add(localObject2);
        localObject2 = localAsset.getAuditudeParams();
        j = k;
        i = m;
        if (localObject2 == null) {
          break;
        }
        j = k;
        i = m;
        if (!((HashMap)localObject2).containsKey("daisy_chaining")) {
          break;
        }
        j = k;
        i = m;
        if (!((String)((HashMap)localObject2).get("daisy_chaining")).equalsIgnoreCase("never")) {
          break;
        }
      }
    }
  }
  
  public final ArrayList getRefs()
  {
    return (ArrayList)getPlayableMetrics().get(PLAYABLE_REFS);
  }
  
  public final int getRemainingMaxAdDuration()
  {
    RefIterator localRefIterator = new RefIterator(pars);
    Object localObject;
    for (int i = 0;; i = ((LinearAsset)localObject).getDurationInMillis() + i) {
      do
      {
        localObject = localRefIterator.next();
        if (localObject == null) {
          return getMaxDuration() - i;
        }
        localObject = ((Ref)localObject).getPrimaryAsset();
      } while ((!(localObject instanceof LinearAsset)) || (!((Asset)localObject).isDisplayed()));
    }
  }
  
  public final String getSubmissionId()
  {
    return submissionId;
  }
  
  public SmilElementType getType()
  {
    return type;
  }
  
  public final boolean hasAvailableSlot()
  {
    RefIterator localRefIterator = new RefIterator(pars);
    int i = 0;
    for (;;)
    {
      Object localObject = localRefIterator.next();
      if (localObject == null)
      {
        if ((getMaxCount() < 0) || (i < getMaxCount())) {
          break;
        }
        return false;
      }
      localObject = ((Ref)localObject).getPrimaryAsset();
      if (isLinear())
      {
        if (((localObject instanceof LinearAsset)) && (((Asset)localObject).isDisplayed())) {
          i += 1;
        }
      }
      else if (((localObject instanceof NonLinearAsset)) && (((Asset)localObject).isDisplayed())) {
        i += 1;
      }
    }
    return true;
  }
  
  public final boolean isEmpty()
  {
    return pars.isEmpty();
  }
  
  public final boolean isLinear()
  {
    return type == SmilElementType.LINEAR;
  }
  
  public final boolean isWatched()
  {
    return isWatched;
  }
  
  public final boolean moveNext()
  {
    enumeratorIndex += 1;
    if (enumeratorIndex < pars.size()) {
      return hasAvailableSlot();
    }
    return false;
  }
  
  public final void reset()
  {
    enumeratorIndex = -1;
    Iterator localIterator = pars.iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      ((Par)localIterator.next()).reset();
    }
  }
  
  public final void setCount(int paramInt)
  {
    count = paramInt;
  }
  
  public final void setCreativeMaxDuration(int paramInt)
  {
    creativeMaxDuration = paramInt;
  }
  
  public final void setDuration(int paramInt)
  {
    duration = paramInt;
  }
  
  public final void setIsWatched(boolean paramBoolean)
  {
    isWatched = paramBoolean;
  }
  
  public final void setMaxCount(int paramInt)
  {
    maxCount = paramInt;
  }
  
  public final void setMaxDuration(int paramInt)
  {
    maxDuration = paramInt;
  }
  
  public final void setSubmissionId(String paramString)
  {
    submissionId = paramString;
  }
  
  public void setType(SmilElementType paramSmilElementType)
  {
    type = paramSmilElementType;
  }
  
  public final boolean shouldAdvanceAdPatternOnBegin()
  {
    if (isLinear()) {}
    while (getInstanceshouldPauseAdPatterns.booleanValue()) {
      return false;
    }
    return true;
  }
  
  public final boolean shouldAdvanceAdPatternOnEnd()
  {
    return (isLinear()) && (!getInstanceshouldPauseAdPatterns.booleanValue());
  }
  
  class RefIterator
    implements Iterable, Iterator
  {
    private int index = 0;
    private ArrayList refs = new ArrayList();
    
    public RefIterator(ArrayList paramArrayList)
    {
      if (paramArrayList != null) {
        this$1 = paramArrayList.iterator();
      }
      for (;;)
      {
        if (!Sequence.this.hasNext()) {
          return;
        }
        paramArrayList = ((Par)Sequence.this.next()).getRefList();
        if ((paramArrayList != null) && (paramArrayList.size() > 0))
        {
          paramArrayList = paramArrayList.iterator();
          while (paramArrayList.hasNext())
          {
            Ref localRef = (Ref)paramArrayList.next();
            if (localRef.getPrimaryAsset() != null) {
              refs.add(localRef);
            }
          }
        }
      }
    }
    
    public boolean hasNext()
    {
      return true;
    }
    
    public Iterator iterator()
    {
      return this;
    }
    
    public Ref next()
    {
      if (refs.size() > index)
      {
        ArrayList localArrayList = refs;
        int i = index;
        index = (i + 1);
        return (Ref)localArrayList.get(i);
      }
      return null;
    }
    
    public void remove() {}
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.smil.Sequence
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */