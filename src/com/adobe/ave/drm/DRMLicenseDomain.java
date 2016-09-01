package com.adobe.ave.drm;

public class DRMLicenseDomain
{
  private String authDomain;
  private DRMAuthenticationMethod authMethod = DRMAuthenticationMethod.values()[paramInt];
  private long peerObject;
  private String serverURL;
  
  protected DRMLicenseDomain(int paramInt, String paramString1, String paramString2, long paramLong)
  {
    authDomain = paramString1;
    serverURL = paramString2;
    peerObject = paramLong;
  }
  
  protected native void finalize();
  
  public String getAuthenticationDomain()
  {
    return authDomain;
  }
  
  public DRMAuthenticationMethod getAuthenticationMethod()
  {
    return authMethod;
  }
  
  public String getServerURL()
  {
    return serverURL;
  }
  
  public String toString()
  {
    return "License domain registration URL: " + getServerURL() + "\n" + "Authentication method: " + getAuthenticationMethod() + "\n" + "Authentication domain: " + getAuthenticationDomain() + "\n";
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMLicenseDomain
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */