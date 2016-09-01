package com.auditude.ads.model.smil;

import com.auditude.ads.model.Ad;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.ILinearAsset;
import com.auditude.ads.model.INonLinearAsset;
import com.auditude.ads.model.OnPageAsset;
import java.util.ArrayList;

public class Ref
{
  private Ad ad;
  private Asset[] assets;
  private OnPageAsset[] companions;
  private String id;
  private boolean isWatched = false;
  private Par par;
  private Asset primaryAsset;
  private SmilElementType type = SmilElementType.LINEAR;
  
  public Ref()
  {
    this(null);
  }
  
  public Ref(Par paramPar)
  {
    par = paramPar;
  }
  
  private void mapAssets()
  {
    if (ad == null) {
      return;
    }
    ArrayList localArrayList = new ArrayList();
    primaryAsset = null;
    int i;
    if ((assets != null) && (assets.length > 0))
    {
      i = 0;
      if (i < assets.length) {}
    }
    else
    {
      companions = ((OnPageAsset[])localArrayList.toArray(new OnPageAsset[0]));
      return;
    }
    Asset localAsset = assets[i];
    if (((localAsset instanceof ILinearAsset)) && (type == SmilElementType.LINEAR)) {
      primaryAsset = localAsset;
    }
    label124:
    do
    {
      for (;;)
      {
        i += 1;
        break;
        if ((!(localAsset instanceof INonLinearAsset)) || (type != SmilElementType.NON_LINEAR)) {
          break label124;
        }
        primaryAsset = localAsset;
      }
    } while (!(localAsset instanceof OnPageAsset));
    if ((localAsset instanceof OnPageAsset)) {}
    for (;;)
    {
      localArrayList.add((OnPageAsset)localAsset);
      break;
      localAsset = null;
    }
  }
  
  public final void dispose() {}
  
  public final Ad getAd()
  {
    return ad;
  }
  
  public final Asset[] getAssets()
  {
    return assets;
  }
  
  public final OnPageAsset[] getCompanions()
  {
    return companions;
  }
  
  public final String getID()
  {
    return id;
  }
  
  public final Par getPar()
  {
    return par;
  }
  
  public final Asset getPrimaryAsset()
  {
    return primaryAsset;
  }
  
  public final SmilElementType getType()
  {
    if (par != null) {
      return par.getType();
    }
    return SmilElementType.UNKNOWN;
  }
  
  public final boolean isWatched()
  {
    return isWatched;
  }
  
  public final void setAd(Ad paramAd)
  {
    ad = paramAd;
  }
  
  public final void setAssets(Asset[] paramArrayOfAsset)
  {
    assets = paramArrayOfAsset;
    mapAssets();
  }
  
  public final void setID(String paramString)
  {
    id = paramString;
  }
  
  public void setPar(Par paramPar)
  {
    par = paramPar;
  }
  
  public final void setWatched(boolean paramBoolean)
  {
    isWatched = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.smil.Ref
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */