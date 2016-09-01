package com.auditude.ads.model.smil;

import java.util.ArrayList;
import java.util.Iterator;

class Sequence$RefIterator
  implements Iterable, Iterator
{
  private int index = 0;
  private ArrayList refs = new ArrayList();
  
  public Sequence$RefIterator(Sequence paramSequence, ArrayList paramArrayList)
  {
    if (paramArrayList != null) {
      paramSequence = paramArrayList.iterator();
    }
    for (;;)
    {
      if (!paramSequence.hasNext()) {
        return;
      }
      paramArrayList = ((Par)paramSequence.next()).getRefList();
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

/* Location:
 * Qualified Name:     com.auditude.ads.model.smil.Sequence.RefIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */