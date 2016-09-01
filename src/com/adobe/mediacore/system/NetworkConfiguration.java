package com.adobe.mediacore.system;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import java.util.HashMap;

public class NetworkConfiguration
  extends MetadataNode
{
  private Metadata _cookieHeaders = null;
  private HashMap _customHeaders = null;
  private int _masterUpdateInterval = -1;
  private boolean _useCookieHeadersForAllRequests = false;
  private boolean _useRedirectedUrl = true;
  
  public void addCustomHeader(String paramString, String[] paramArrayOfString)
  {
    if (_customHeaders == null) {
      _customHeaders = new HashMap();
    }
    _customHeaders.put(paramString, paramArrayOfString);
  }
  
  public Metadata getCookieHeaders()
  {
    return _cookieHeaders;
  }
  
  public HashMap getCustomHeaders()
  {
    return _customHeaders;
  }
  
  public int getMasterUpdateInterval()
  {
    return _masterUpdateInterval;
  }
  
  public boolean getUseCookieHeadersForAllRequests()
  {
    return _useCookieHeadersForAllRequests;
  }
  
  public boolean getUseRedirectedUrl()
  {
    return _useRedirectedUrl;
  }
  
  public void setCookieHeaders(Metadata paramMetadata)
  {
    _cookieHeaders = paramMetadata;
  }
  
  public void setMasterUpdateInterval(int paramInt)
  {
    _masterUpdateInterval = paramInt;
  }
  
  public void setUseCookieHeadersForAllRequests(boolean paramBoolean)
  {
    _useCookieHeadersForAllRequests = paramBoolean;
  }
  
  public void setUseRedirectedUrl(boolean paramBoolean)
  {
    _useRedirectedUrl = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.system.NetworkConfiguration
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */