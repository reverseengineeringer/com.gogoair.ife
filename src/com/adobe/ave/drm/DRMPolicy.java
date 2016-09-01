package com.adobe.ave.drm;

public class DRMPolicy
{
  String authDomain;
  DRMAuthenticationMethod authMethod;
  String dispName;
  DRMLicenseDomain licenseDomain;
  
  protected DRMPolicy(String paramString1, int paramInt, String paramString2, DRMLicenseDomain paramDRMLicenseDomain)
  {
    dispName = paramString1;
    authMethod = DRMAuthenticationMethod.values()[paramInt];
    authDomain = paramString2;
    licenseDomain = paramDRMLicenseDomain;
  }
  
  public String getAuthenticationDomain()
  {
    return authDomain;
  }
  
  public DRMAuthenticationMethod getAuthenticationMethod()
  {
    return authMethod;
  }
  
  public String getDisplayName()
  {
    return dispName;
  }
  
  public DRMLicenseDomain getLicenseDomain()
  {
    return licenseDomain;
  }
  
  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    if (getDisplayName() != null) {
      localStringBuffer.append("Display name: " + getDisplayName() + "\n");
    }
    localStringBuffer.append("Authentication method: " + getAuthenticationMethod() + "\n");
    if (getLicenseDomain() != null) {
      localStringBuffer.append(getLicenseDomain());
    }
    return localStringBuffer.toString();
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMPolicy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */