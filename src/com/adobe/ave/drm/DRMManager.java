package com.adobe.ave.drm;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.io.File;

public class DRMManager
{
  static final String TAG = "DRMManager(j)";
  private static DRMMetadata sEmbeddedMetadata;
  private static DRMManager sManager = null;
  private Handler mHandler = new Handler(Looper.getMainLooper());
  protected long peerObject;
  
  static
  {
    System.loadLibrary("AVEAndroid");
  }
  
  private DRMManager(Context paramContext)
  {
    String str4 = "/data/local";
    String str5 = "<default-pubid>";
    String str6 = "<default-appid>";
    Object localObject1 = "1.0";
    String str3 = str4;
    String str2 = str5;
    String str1 = str6;
    try
    {
      Object localObject2 = paramContext.getPackageManager().getPackageInfo(paramContext.getPackageName(), 64);
      str3 = str4;
      str2 = str5;
      str1 = str6;
      str4 = paramContext.getFilesDir().getAbsolutePath();
      str3 = str4;
      str2 = str5;
      str1 = str6;
      str5 = toHexString(signatures[0].toByteArray());
      str3 = str4;
      str2 = str5;
      str1 = str6;
      str6 = packageName;
      str3 = str4;
      str2 = str5;
      str1 = str6;
      localObject2 = versionName;
      localObject1 = localObject2;
      str1 = str6;
      str2 = str5;
      str3 = str4;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
    peerObject = constructNative(paramContext, str3, str2, str1, (String)localObject1, false);
  }
  
  private native void acquireLicenseNative(DRMMetadata paramDRMMetadata, int paramInt, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMLicenseAcquiredCallback paramDRMLicenseAcquiredCallback);
  
  private native void acquirePreviewLicenseNative(DRMMetadata paramDRMMetadata, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMLicenseAcquiredCallback paramDRMLicenseAcquiredCallback);
  
  private native void authenticateNative(DRMMetadata paramDRMMetadata, String paramString1, String paramString2, String paramString3, String paramString4, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMAuthenticationCompleteCallback paramDRMAuthenticationCompleteCallback);
  
  private native long constructNative(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, boolean paramBoolean);
  
  private native byte[] getEmbeddedLicense();
  
  public static DRMManager getSharedManager(Context paramContext)
  {
    try
    {
      if (sManager == null) {
        sManager = new DRMManager(paramContext);
      }
      paramContext = sManager;
      return paramContext;
    }
    finally {}
  }
  
  private static void jobDoneNotify()
  {
    Log.w("DRMManager(j)", "DRMManager.jobDoneNotify()");
    if (sManager == null) {
      throw new NullPointerException();
    }
    sManagermHandler.post(new DRMManager.1());
  }
  
  private native void joinLicenseDomainNative(DRMLicenseDomain paramDRMLicenseDomain, boolean paramBoolean, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback);
  
  private native void leaveLicenseDomainNative(DRMLicenseDomain paramDRMLicenseDomain, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback);
  
  private native void needsCycles();
  
  private native void resetDRMNative(DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback);
  
  private native void returnLicenseNative(String paramString1, String paramString2, String paramString3, boolean paramBoolean, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMLicenseReturnCompleteCallback paramDRMLicenseReturnCompleteCallback);
  
  private native void setAuthenticationTokenNative(DRMMetadata paramDRMMetadata, String paramString, byte[] paramArrayOfByte, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback);
  
  private native void storeLicenseBytesNative(byte[] paramArrayOfByte, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback);
  
  private static String toHexString(byte[] paramArrayOfByte)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    int i = 0;
    while (i < paramArrayOfByte.length)
    {
      String str = Integer.toHexString(paramArrayOfByte[i] & 0xFF);
      if (str.length() == 1) {
        localStringBuffer.append('0');
      }
      localStringBuffer.append(str);
      i += 1;
    }
    return localStringBuffer.toString();
  }
  
  public void acquireLicense(DRMMetadata paramDRMMetadata, DRMAcquireLicenseSettings paramDRMAcquireLicenseSettings, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMLicenseAcquiredCallback paramDRMLicenseAcquiredCallback)
  {
    if ((paramDRMMetadata == null) || (paramDRMAcquireLicenseSettings == null) || (paramDRMOperationErrorCallback == null) || (paramDRMLicenseAcquiredCallback == null)) {
      throw new NullPointerException();
    }
    acquireLicenseNative(paramDRMMetadata, paramDRMAcquireLicenseSettings.ordinal(), new UIThreadErrorCB(paramDRMOperationErrorCallback), new UIThreadLicenseAcquiredCB(paramDRMLicenseAcquiredCallback));
  }
  
  public void acquirePreviewLicense(DRMMetadata paramDRMMetadata, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMLicenseAcquiredCallback paramDRMLicenseAcquiredCallback)
  {
    if ((paramDRMMetadata == null) || (paramDRMOperationErrorCallback == null) || (paramDRMLicenseAcquiredCallback == null)) {
      throw new NullPointerException();
    }
    acquirePreviewLicenseNative(paramDRMMetadata, new UIThreadErrorCB(paramDRMOperationErrorCallback), new UIThreadLicenseAcquiredCB(paramDRMLicenseAcquiredCallback));
  }
  
  public void authenticate(DRMMetadata paramDRMMetadata, String paramString1, String paramString2, String paramString3, String paramString4, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMAuthenticationCompleteCallback paramDRMAuthenticationCompleteCallback)
  {
    if ((paramDRMMetadata == null) || (paramString1 == null) || (paramString2 == null) || (paramString3 == null) || (paramString4 == null) || (paramDRMOperationErrorCallback == null) || (paramDRMAuthenticationCompleteCallback == null)) {
      throw new NullPointerException();
    }
    authenticateNative(paramDRMMetadata, paramString1, paramString2, paramString3, paramString4, new UIThreadErrorCB(paramDRMOperationErrorCallback), new UIThreadAuthCB(paramDRMAuthenticationCompleteCallback));
  }
  
  public DRMMetadata createMetadataFromBytes(byte[] paramArrayOfByte, DRMOperationErrorCallback paramDRMOperationErrorCallback)
  {
    return DRMMetadata.createFromData(this, paramArrayOfByte, paramDRMOperationErrorCallback);
  }
  
  public native long getMaxOperationTime();
  
  public void initialize(DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback)
  {
    if (sEmbeddedMetadata != null) {
      paramDRMOperationCompleteCallback.OperationComplete();
    }
    do
    {
      return;
      sEmbeddedMetadata = createMetadataFromBytes(getEmbeddedLicense(), paramDRMOperationErrorCallback);
    } while (sEmbeddedMetadata == null);
    acquireLicense(sEmbeddedMetadata, DRMAcquireLicenseSettings.LOCAL_ONLY, paramDRMOperationErrorCallback, new DRMManager.2(this, paramDRMOperationCompleteCallback));
  }
  
  public void joinLicenseDomain(DRMLicenseDomain paramDRMLicenseDomain, boolean paramBoolean, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback)
  {
    if ((paramDRMLicenseDomain == null) || (paramDRMOperationErrorCallback == null) || (paramDRMOperationCompleteCallback == null)) {
      throw new NullPointerException();
    }
    joinLicenseDomainNative(paramDRMLicenseDomain, paramBoolean, new UIThreadErrorCB(paramDRMOperationErrorCallback), new UIThreadCompleteCB(paramDRMOperationCompleteCallback));
  }
  
  public void leaveLicenseDomain(DRMLicenseDomain paramDRMLicenseDomain, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback)
  {
    if ((paramDRMLicenseDomain == null) || (paramDRMOperationErrorCallback == null) || (paramDRMOperationCompleteCallback == null)) {
      throw new NullPointerException();
    }
    leaveLicenseDomainNative(paramDRMLicenseDomain, new UIThreadErrorCB(paramDRMOperationErrorCallback), new UIThreadCompleteCB(paramDRMOperationCompleteCallback));
  }
  
  public void resetDRM(DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback)
  {
    if ((paramDRMOperationErrorCallback == null) || (paramDRMOperationCompleteCallback == null)) {
      throw new NullPointerException();
    }
    resetDRMNative(new UIThreadErrorCB(paramDRMOperationErrorCallback), new UIThreadCompleteCB(paramDRMOperationCompleteCallback));
  }
  
  public void returnLicense(String paramString1, String paramString2, String paramString3, boolean paramBoolean, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMLicenseReturnCompleteCallback paramDRMLicenseReturnCompleteCallback)
  {
    if ((paramString1 == null) || (paramDRMOperationErrorCallback == null) || (paramDRMLicenseReturnCompleteCallback == null)) {
      throw new NullPointerException();
    }
    returnLicenseNative(paramString1, paramString2, paramString3, paramBoolean, new UIThreadErrorCB(paramDRMOperationErrorCallback), new UIThreadLicenseReturnCompleteCB(paramDRMLicenseReturnCompleteCallback));
  }
  
  public void setAuthenticationToken(DRMMetadata paramDRMMetadata, String paramString, byte[] paramArrayOfByte, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback)
  {
    if ((paramDRMMetadata == null) || (paramString == null) || (paramDRMOperationErrorCallback == null) || (paramDRMOperationCompleteCallback == null)) {
      throw new NullPointerException();
    }
    setAuthenticationTokenNative(paramDRMMetadata, paramString, paramArrayOfByte, new UIThreadErrorCB(paramDRMOperationErrorCallback), new UIThreadCompleteCB(paramDRMOperationCompleteCallback));
  }
  
  public void setMaxOperationTime(long paramLong)
  {
    if ((paramLong <= 0L) || (paramLong > 2147483647L)) {
      throw new IllegalArgumentException();
    }
    setMaxOperationTimeNative(paramLong);
  }
  
  public native void setMaxOperationTimeNative(long paramLong);
  
  public void storeLicenseBytes(byte[] paramArrayOfByte, DRMOperationErrorCallback paramDRMOperationErrorCallback, DRMOperationCompleteCallback paramDRMOperationCompleteCallback)
  {
    int j = 1;
    int i;
    if (paramArrayOfByte != null)
    {
      if (paramDRMOperationErrorCallback != null) {
        break label34;
      }
      i = 1;
      if (paramDRMOperationCompleteCallback != null) {
        break label40;
      }
    }
    for (;;)
    {
      if ((j | i) == 0) {
        break label46;
      }
      throw new NullPointerException();
      label34:
      i = 0;
      break;
      label40:
      j = 0;
    }
    label46:
    storeLicenseBytesNative(paramArrayOfByte, new UIThreadErrorCB(paramDRMOperationErrorCallback), new UIThreadCompleteCB(paramDRMOperationCompleteCallback));
  }
  
  class UIThreadAuthCB
    implements DRMAuthenticationCompleteCallback
  {
    DRMAuthenticationCompleteCallback cb;
    
    public UIThreadAuthCB(DRMAuthenticationCompleteCallback paramDRMAuthenticationCompleteCallback)
    {
      cb = paramDRMAuthenticationCompleteCallback;
    }
    
    public void AuthenticationComplete(byte[] paramArrayOfByte)
    {
      mHandler.post(new DRMManager.UIThreadAuthCB.1(this, paramArrayOfByte));
    }
  }
  
  class UIThreadCompleteCB
    implements DRMOperationCompleteCallback
  {
    DRMOperationCompleteCallback cb;
    
    public UIThreadCompleteCB(DRMOperationCompleteCallback paramDRMOperationCompleteCallback)
    {
      cb = paramDRMOperationCompleteCallback;
    }
    
    public void OperationComplete()
    {
      mHandler.post(new DRMManager.UIThreadCompleteCB.1(this));
    }
  }
  
  class UIThreadErrorCB
    implements DRMOperationErrorWithErrorObjectCallback
  {
    DRMOperationErrorCallback cb;
    DRMError drmError;
    
    public UIThreadErrorCB(DRMOperationErrorCallback paramDRMOperationErrorCallback)
    {
      cb = paramDRMOperationErrorCallback;
    }
    
    public void OperationError(long paramLong1, long paramLong2, Exception paramException)
    {
      mHandler.post(new DRMManager.UIThreadErrorCB.2(this, paramLong1, paramLong2, paramException));
    }
    
    public void OperationError(DRMError paramDRMError)
    {
      drmError = paramDRMError;
      mHandler.post(new DRMManager.UIThreadErrorCB.1(this));
    }
  }
  
  class UIThreadLicenseAcquiredCB
    implements DRMLicenseAcquiredCallback
  {
    DRMLicenseAcquiredCallback cb;
    
    public UIThreadLicenseAcquiredCB(DRMLicenseAcquiredCallback paramDRMLicenseAcquiredCallback)
    {
      cb = paramDRMLicenseAcquiredCallback;
    }
    
    public void LicenseAcquired(DRMLicense paramDRMLicense)
    {
      mHandler.post(new DRMManager.UIThreadLicenseAcquiredCB.1(this, paramDRMLicense));
    }
  }
  
  class UIThreadLicenseReturnCompleteCB
    implements DRMLicenseReturnCompleteCallback
  {
    DRMLicenseReturnCompleteCallback cb;
    
    public UIThreadLicenseReturnCompleteCB(DRMLicenseReturnCompleteCallback paramDRMLicenseReturnCompleteCallback)
    {
      cb = paramDRMLicenseReturnCompleteCallback;
    }
    
    public void OperationComplete(long paramLong)
    {
      mHandler.post(new DRMManager.UIThreadLicenseReturnCompleteCB.1(this, paramLong));
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.drm.DRMManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */