package com.adobe.ave.drm;

public class DRMMetadata
{
  protected String licenseId;
  protected long peerObject;
  protected DRMPolicy[] policies;
  protected String serverURL;
  
  private DRMMetadata() {}
  
  protected DRMMetadata(DRMManager paramDRMManager, byte[] paramArrayOfByte, DRMOperationErrorCallback paramDRMOperationErrorCallback)
  {
    if ((paramArrayOfByte == null) || (paramDRMOperationErrorCallback == null) || (paramDRMManager == null)) {
      throw new NullPointerException();
    }
    init(paramDRMManager, paramArrayOfByte, paramDRMOperationErrorCallback, new DRMMetadata.1(this));
  }
  
  protected static DRMMetadata createFromData(DRMManager paramDRMManager, byte[] paramArrayOfByte, DRMOperationErrorCallback paramDRMOperationErrorCallback)
  {
    paramArrayOfByte = new DRMMetadata(paramDRMManager, paramArrayOfByte, paramDRMOperationErrorCallback);
    paramDRMManager = paramArrayOfByte;
    if (peerObject == 0L) {
      paramDRMManager = null;
    }
    return paramDRMManager;
  }
  
  private native void init(DRMManager paramDRMManager, byte[] paramArrayOfByte, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMMetadataCreatedCallback paramDRMMetadataCreatedCallback);
  
  protected native void finalize();
  
  public native String getLicenseId();
  
  public native DRMPolicy[] getPolicies();
  
  public native String getServerURL();
  
  public String toString()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    if (getServerURL() != null) {
      localStringBuffer.append("License server URL: " + getServerURL() + "\n");
    }
    if (getLicenseId() != null) {
      localStringBuffer.append("License id: " + getLicenseId() + "\n");
    }
    for (;;)
    {
      DRMPolicy[] arrayOfDRMPolicy = getPolicies();
      if (arrayOfDRMPolicy == null) {
        break;
      }
      int i = 0;
      while (i < arrayOfDRMPolicy.length)
      {
        localStringBuffer.append("Policy #: " + i + "\n");
        localStringBuffer.append(arrayOfDRMPolicy[i]);
        i += 1;
      }
      localStringBuffer.append("Invalid metadata file\n");
    }
    return localStringBuffer.toString();
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMMetadata
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */