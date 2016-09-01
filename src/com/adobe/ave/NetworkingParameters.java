package com.adobe.ave;

public class NetworkingParameters
{
  public String cookieHeader;
  public boolean useCookieHeaderForAllRequests;
  
  public NetworkingParameters()
  {
    cookieHeader = "";
    useCookieHeaderForAllRequests = false;
  }
  
  public NetworkingParameters(String paramString, boolean paramBoolean)
  {
    cookieHeader = paramString;
    useCookieHeaderForAllRequests = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.NetworkingParameters
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */