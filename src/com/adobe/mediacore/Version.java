package com.adobe.mediacore;

import com.adobe.ave.VideoEngine;

public class Version
{
  private static final String FIELD_SEPARATOR = ".";
  private static final int VERSION = 1;
  private static final int _apiVersion = 1;
  private static final String _aveVersion;
  private static final String _buildChangeList = "1318290";
  private static final String _major = "1";
  private static final String _minor = "4.18";
  private static final String _psdkDescription;
  private static final String _psdkVersion;
  private static final String _revision = "1503";
  private static final String _type = "release";
  
  static
  {
    System.loadLibrary("AVEAndroid");
    _aveVersion = VideoEngine.getVersionString();
    _psdkVersion = "1.4.18.1503";
    _psdkDescription = "1.4.18.1503 ( release, 1318290)";
  }
  
  public static String getAVEVersion()
  {
    return _aveVersion;
  }
  
  public static int getApiVersion()
  {
    return _apiVersion;
  }
  
  public static String getDescription()
  {
    return _psdkDescription;
  }
  
  public static String getMajor()
  {
    return "1";
  }
  
  public static String getMinor()
  {
    return "4.18";
  }
  
  public static String getRevision()
  {
    return "1503";
  }
  
  public static String getType()
  {
    return "release";
  }
  
  public static String getVersion()
  {
    return _psdkVersion;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.Version
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */