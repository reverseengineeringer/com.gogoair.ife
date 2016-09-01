package com.auditude.ads.exception;

import com.auditude.ads.util.StringUtil;
import java.util.HashMap;

public class AssetException
  extends PlayerException
{
  private static final long serialVersionUID = 1L;
  public String adId;
  public String assetId;
  
  public AssetException(int paramInt, String paramString)
  {
    super(paramInt, paramString);
  }
  
  public HashMap toParams()
  {
    HashMap localHashMap = super.toParams();
    if (StringUtil.isNotNullOrEmpty(adId)) {
      localHashMap.put("a", adId);
    }
    if (StringUtil.isNotNullOrEmpty(assetId)) {
      localHashMap.put("a1", assetId);
    }
    return localHashMap;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.exception.AssetException
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */