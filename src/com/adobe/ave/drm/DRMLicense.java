package com.adobe.ave.drm;

import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class DRMLicense
{
  byte[] bytes;
  Map customProperties;
  Date licenseEndDate;
  String licenseID;
  Date licenseStartDate;
  Date offlineStorageEndDate;
  Date offlineStorageStartDate;
  DRMPlaybackTimeWindow playbackTimeWindow;
  String policyID;
  String serverURL;
  
  protected DRMLicense(byte[] paramArrayOfByte, Date paramDate1, Date paramDate2, Date paramDate3, Date paramDate4, String paramString1, String paramString2, String paramString3, DRMPlaybackTimeWindow paramDRMPlaybackTimeWindow, Map paramMap)
  {
    bytes = paramArrayOfByte;
    licenseStartDate = paramDate1;
    licenseEndDate = paramDate2;
    offlineStorageStartDate = paramDate3;
    offlineStorageEndDate = paramDate4;
    serverURL = paramString1;
    licenseID = paramString2;
    policyID = paramString3;
    playbackTimeWindow = paramDRMPlaybackTimeWindow;
    customProperties = paramMap;
  }
  
  private String printCustomProperties()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    Map localMap = getCustomProperties();
    if (localMap == null) {
      return "";
    }
    Iterator localIterator = localMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localStringBuffer.append('\t');
      localStringBuffer.append(str);
      localStringBuffer.append(": ");
      localStringBuffer.append(new String((byte[])localMap.get(str)));
    }
    return localStringBuffer.toString();
  }
  
  public Map getCustomProperties()
  {
    return customProperties;
  }
  
  public Date getLicenseEndDate()
  {
    return licenseEndDate;
  }
  
  public String getLicenseID()
  {
    return licenseID;
  }
  
  public Date getLicenseStartDate()
  {
    return licenseStartDate;
  }
  
  public Date getOfflineStorageEndDate()
  {
    return offlineStorageEndDate;
  }
  
  public Date getOfflineStorageStartDate()
  {
    return offlineStorageStartDate;
  }
  
  public DRMPlaybackTimeWindow getPlaybackTimeWindow()
  {
    return playbackTimeWindow;
  }
  
  public String getPolicyID()
  {
    return policyID;
  }
  
  public String getServerURL()
  {
    return serverURL;
  }
  
  public byte[] toBytes()
  {
    return bytes;
  }
  
  public String toString()
  {
    return "License: \n\tStart date: " + getLicenseStartDate() + "\n" + "\tEnd date: " + getLicenseEndDate() + "\n" + "\tOffline storage start date: " + getOfflineStorageStartDate() + "\n" + "\tOffline storage end date: " + getOfflineStorageEndDate() + "\n" + "\tPlayback window: " + getPlaybackTimeWindow() + "\n" + "\tServer URL: " + getServerURL() + "\n" + "\tLicense ID: " + getLicenseID() + "\n" + "\tPolicy ID: " + getPolicyID() + "\n" + printCustomProperties();
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMLicense
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */