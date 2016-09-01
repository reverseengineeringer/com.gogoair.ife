package com.auditude.ads.model.smil;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.event.AdPluginEvent;
import com.auditude.ads.model.Ad;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.media.MediaFile;
import com.auditude.ads.repackaging.AssetRepackager;
import com.auditude.ads.repackaging.AssetRepackager.AssetRepackagingCompletionListener;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.event.IEventListener;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public class Group
  implements ISMILIterator, Par.ParResoultionCompleteListener, AssetRepackager.AssetRepackagingCompletionListener, IEventListener
{
  private ArrayList adPluginEvents;
  private AdSettings adSettings;
  private Sequence currentSequence;
  private int duration = 0;
  private int index = 0;
  private boolean isWatched = false;
  private int maxDuration = 0;
  private PrefetchCompleteListener prefetchListener;
  private int prefetchParCount = 0;
  private int repackageAssetCount = 0;
  private boolean repackageCreatives = false;
  private ArrayList repackagerArray;
  private int sequenceIteratorIndex = -1;
  private ArrayList sequenceList = new ArrayList();
  private boolean skipCurrentSequence = false;
  private int startTime = 0;
  private SmilElementType type = SmilElementType.values()[0];
  
  public Group(SmilElementType paramSmilElementType, int paramInt, AdSettings paramAdSettings)
  {
    type = paramSmilElementType;
    index = paramInt;
    adSettings = paramAdSettings;
  }
  
  private void notifyPrefetchComplete()
  {
    if (prefetchListener != null)
    {
      prefetchListener.onPrefetchComplete(adPluginEvents);
      prefetchListener = null;
    }
    if (adPluginEvents != null)
    {
      adPluginEvents.clear();
      adPluginEvents = null;
    }
  }
  
  private void repackageIncompatibleCreatives()
  {
    if (type != SmilElementType.LINEAR) {
      return;
    }
    repackagerArray = null;
    Object localObject2 = getRefs();
    if ((localObject2 != null) && (((ArrayList)localObject2).size() > 0)) {
      if (adSettings.getProperty("repackageCreativeEnabled") == null) {
        break label356;
      }
    }
    label341:
    label356:
    for (boolean bool = Boolean.valueOf(adSettings.getProperty("repackageCreativeEnabled").toString()).booleanValue();; bool = false)
    {
      Object localObject1 = "";
      if (adSettings.getProperty("repackageCreativeFormat") != null) {
        localObject1 = adSettings.getProperty("repackageCreativeFormat").toString();
      }
      if ((StringUtil.isNotNullOrEmpty((String)localObject1)) && (bool))
      {
        repackagerArray = new ArrayList();
        Iterator localIterator1 = ((ArrayList)localObject2).iterator();
        do
        {
          if (!localIterator1.hasNext())
          {
            if (repackagerArray.size() <= 0) {
              break label341;
            }
            repackageAssetCount = repackagerArray.size();
            localObject1 = repackagerArray.iterator();
            while (((Iterator)localObject1).hasNext()) {
              ((AssetRepackager)((Iterator)localObject1).next()).repackage();
            }
            break;
          }
          localObject2 = (Ref)localIterator1.next();
        } while (((Ref)localObject2).getPrimaryAsset() == null);
        Asset localAsset = ((Ref)localObject2).getPrimaryAsset();
        Iterator localIterator2 = localAsset.getMediaFiles().iterator();
        for (localObject2 = Boolean.valueOf(false);; localObject2 = Boolean.valueOf(true))
        {
          MediaFile localMediaFile;
          do
          {
            if (!localIterator2.hasNext())
            {
              if ((((Boolean)localObject2).booleanValue()) || (!((Ad)localAsset.getParent()).isRepackagingEnabled())) {
                break;
              }
              localObject2 = new AssetRepackager(this, localAsset, (String)localObject1, adSettings.getDomain(), adSettings.getZoneId());
              repackagerArray.add(localObject2);
              break;
            }
            localMediaFile = (MediaFile)localIterator2.next();
          } while ((localMediaFile == null) || (!StringUtil.isNotNullOrEmpty(mimeType)) || (!((String)localObject1).toLowerCase().equalsIgnoreCase(mimeType)));
        }
        notifyPrefetchComplete();
        return;
      }
      notifyPrefetchComplete();
      return;
      notifyPrefetchComplete();
      return;
    }
  }
  
  public final void addSequence(Sequence paramSequence)
  {
    if (paramSequence != null)
    {
      sequenceList.add(paramSequence);
      if (paramSequence.getMaxDuration() >= 0) {
        maxDuration += paramSequence.getMaxDuration();
      }
      if (paramSequence.getDuration() >= 0) {
        duration += paramSequence.getDuration();
      }
    }
  }
  
  public final void begin()
  {
    reset();
    isWatched = true;
    skipCurrentSequence = false;
    currentSequence = null;
  }
  
  public final void dispose()
  {
    currentSequence = null;
    Iterator localIterator = sequenceList.iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        sequenceList = null;
        return;
      }
      ((Sequence)localIterator.next()).dispose();
    }
  }
  
  public final void end()
  {
    end(true);
  }
  
  public final void end(boolean paramBoolean)
  {
    isWatched = true;
    skipCurrentSequence = false;
    if (currentSequence != null)
    {
      currentSequence.end(paramBoolean);
      currentSequence = null;
    }
  }
  
  public final Par getCurrent()
  {
    if (currentSequence != null) {
      return currentSequence.getCurrent();
    }
    return null;
  }
  
  public final HashMap getDescription()
  {
    Object localObject = sequenceList.iterator();
    int i = 0;
    int j = 0;
    for (;;)
    {
      if (!((Iterator)localObject).hasNext())
      {
        localObject = new HashMap();
        ((HashMap)localObject).put("startTime", Integer.valueOf(startTime));
        ((HashMap)localObject).put("isEmpty", Boolean.valueOf(isEmpty()));
        ((HashMap)localObject).put("breakDuration", Integer.valueOf(j));
        ((HashMap)localObject).put("breakIndex", Integer.valueOf(index));
        ((HashMap)localObject).put("adCount", Integer.valueOf(i));
        return (HashMap)localObject;
      }
      HashMap localHashMap = ((Sequence)((Iterator)localObject).next()).getPlayableMetrics();
      j += ((Integer)localHashMap.get(Sequence.PLAYABLE_DURATION)).intValue();
      i = ((Integer)localHashMap.get(Sequence.PLAYABLE_AD_COUNT)).intValue() + i;
    }
  }
  
  public final int getDuration()
  {
    return duration;
  }
  
  public final int getIndex()
  {
    return index;
  }
  
  public final int getMaxDuration()
  {
    return maxDuration;
  }
  
  public final Par getNext()
  {
    Object localObject = currentSequence;
    if (localObject != null)
    {
      localObject = ((Sequence)localObject).getNext();
      if (localObject != null) {
        return (Par)localObject;
      }
    }
    int i = sequenceIteratorIndex + 1;
    for (;;)
    {
      if (i >= sequenceList.size()) {
        return null;
      }
      Par localPar = ((Sequence)sequenceList.get(i)).getNext();
      localObject = localPar;
      if (localPar != null) {
        break;
      }
      i += 1;
    }
  }
  
  public final ArrayList getPars()
  {
    ArrayList localArrayList = new ArrayList();
    int i;
    if (sequenceList != null) {
      i = 0;
    }
    for (;;)
    {
      if (i >= sequenceList.size()) {
        return localArrayList;
      }
      localArrayList.addAll(((Sequence)sequenceList.get(i)).getPars());
      i += 1;
    }
  }
  
  public final int getPlayableDuration()
  {
    Iterator localIterator = sequenceList.iterator();
    for (int i = 0;; i = ((Integer)((Sequence)localIterator.next()).getPlayableMetrics().get(Sequence.PLAYABLE_DURATION)).intValue() + i) {
      if (!localIterator.hasNext()) {
        return i;
      }
    }
  }
  
  public final ArrayList getRefs()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = sequenceList.iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return localArrayList;
      }
      Object localObject = (Sequence)localIterator.next();
      if (localObject != null)
      {
        localObject = ((Sequence)localObject).getRefs();
        if ((localObject != null) && (((ArrayList)localObject).size() > 0)) {
          localArrayList.addAll((Collection)localObject);
        }
      }
    }
  }
  
  public final ArrayList getSequenceList()
  {
    return sequenceList;
  }
  
  public final boolean getSkipCurrentSequence()
  {
    return skipCurrentSequence;
  }
  
  public final int getStartTime()
  {
    return startTime;
  }
  
  public final SmilElementType getType()
  {
    return type;
  }
  
  public final boolean isEmpty()
  {
    boolean bool2 = false;
    boolean bool1;
    if (sequenceList.isEmpty())
    {
      bool1 = true;
      return bool1;
    }
    int i = 0;
    for (;;)
    {
      if (i >= sequenceList.size()) {
        return true;
      }
      Sequence localSequence = (Sequence)sequenceList.get(i);
      if (localSequence != null)
      {
        bool1 = bool2;
        if (!localSequence.isEmpty()) {
          break;
        }
      }
      i += 1;
    }
  }
  
  public final boolean isLinear()
  {
    return type == SmilElementType.LINEAR;
  }
  
  public final boolean isWatched()
  {
    return isWatched;
  }
  
  public final void load(PrefetchCompleteListener paramPrefetchCompleteListener, Boolean paramBoolean, HashMap paramHashMap)
  {
    prefetchListener = paramPrefetchCompleteListener;
    repackageCreatives = paramBoolean.booleanValue();
    paramPrefetchCompleteListener = getPars();
    prefetchParCount = paramPrefetchCompleteListener.size();
    if (prefetchParCount > 0)
    {
      paramPrefetchCompleteListener = paramPrefetchCompleteListener.iterator();
      for (;;)
      {
        if (!paramPrefetchCompleteListener.hasNext()) {
          return;
        }
        paramBoolean = (Par)paramPrefetchCompleteListener.next();
        paramBoolean.addEventListener("error", this);
        paramBoolean.setParResolutionCompleteListener(this);
        paramBoolean.resolve(paramHashMap);
      }
    }
    onParResolutionComplete();
  }
  
  public final void load(PrefetchCompleteListener paramPrefetchCompleteListener, HashMap paramHashMap)
  {
    load(paramPrefetchCompleteListener, Boolean.valueOf(false), paramHashMap);
  }
  
  public final boolean moveNext()
  {
    if (currentSequence != null)
    {
      if ((!skipCurrentSequence) && (currentSequence.moveNext())) {
        return true;
      }
      if (currentSequence.getType() == SmilElementType.LINEAR)
      {
        currentSequence.end(true);
        currentSequence = null;
      }
    }
    skipCurrentSequence = false;
    for (sequenceIteratorIndex += 1;; sequenceIteratorIndex += 1)
    {
      if (sequenceIteratorIndex >= sequenceList.size()) {
        return false;
      }
      currentSequence = ((Sequence)sequenceList.get(sequenceIteratorIndex));
      currentSequence.begin();
      if (currentSequence.moveNext()) {
        return true;
      }
      if (currentSequence.getType() == SmilElementType.LINEAR)
      {
        currentSequence.end(true);
        currentSequence = null;
      }
    }
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if ((paramObject instanceof AdPluginEvent))
    {
      if (adPluginEvents == null) {
        adPluginEvents = new ArrayList();
      }
      adPluginEvents.add((AdPluginEvent)paramObject);
    }
  }
  
  public void onParResolutionComplete()
  {
    prefetchParCount -= 1;
    if ((prefetchParCount <= 0) && (prefetchListener != null))
    {
      if (repackageCreatives) {
        repackageIncompatibleCreatives();
      }
    }
    else {
      return;
    }
    notifyPrefetchComplete();
  }
  
  public void onRepackagingComplete(Asset paramAsset, boolean paramBoolean)
  {
    repackageAssetCount -= 1;
    if (repackageAssetCount <= 0)
    {
      repackagerArray = null;
      notifyPrefetchComplete();
    }
  }
  
  public final void reset()
  {
    sequenceIteratorIndex = -1;
    int i = 0;
    for (;;)
    {
      if (i >= sequenceList.size()) {
        return;
      }
      Sequence localSequence = (Sequence)sequenceList.get(i);
      if (localSequence != null) {
        localSequence.reset();
      }
      i += 1;
    }
  }
  
  public final void setSkipCurrentSequence(boolean paramBoolean)
  {
    skipCurrentSequence = paramBoolean;
  }
  
  public final void setStartTime(int paramInt)
  {
    startTime = paramInt;
  }
  
  public final void setWatched(boolean paramBoolean)
  {
    isWatched = paramBoolean;
  }
  
  public static abstract interface PrefetchCompleteListener
  {
    public abstract void onPrefetchComplete(ArrayList paramArrayList);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.smil.Group
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */