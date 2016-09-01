package com.auditude.ads.network.vast.repackaging;

public class VastAssetRepackagerInfo
{
  public String domain = null;
  public Boolean repackaginEnabled = Boolean.valueOf(false);
  public String requiredFormat = null;
  public int zoneId = 0;
  
  public VastAssetRepackagerInfo(Boolean paramBoolean, String paramString1, String paramString2, int paramInt)
  {
    repackaginEnabled = paramBoolean;
    requiredFormat = paramString1;
    domain = paramString2;
    zoneId = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.repackaging.VastAssetRepackagerInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */