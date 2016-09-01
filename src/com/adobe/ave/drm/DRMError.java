package com.adobe.ave.drm;

public class DRMError
{
  long major;
  long minor;
  String serverErrorString;
  String serverErrorUrl;
  
  protected DRMError(long paramLong1, long paramLong2, String paramString)
  {
    major = paramLong1;
    minor = paramLong2;
    if (paramString != null)
    {
      serverErrorString = paramString;
      return;
    }
    serverErrorString = new String("");
  }
  
  public long getMajorError()
  {
    return major;
  }
  
  public long getMinorError()
  {
    return minor;
  }
  
  public String getServerErrorString()
  {
    return serverErrorString;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMError
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */