package com.auditude.ads.network;

import com.auditude.ads.network.vast.VASTAdLoader;
import com.auditude.ads.util.StringUtil;

public class NetworkAdLoaderFactory
{
  public static INetworkAdLoader getLoaderForType(String paramString)
  {
    if (StringUtil.isNullOrEmpty(paramString)) {}
    do
    {
      return null;
      if (paramString.toLowerCase().equals("vast")) {
        return new VASTAdLoader();
      }
    } while (!paramString.toLowerCase().equals("vpaid"));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.NetworkAdLoaderFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */