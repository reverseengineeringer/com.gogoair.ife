package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMManager;
import com.adobe.ave.drm.DRMMetadata;
import com.adobe.ave.drm.DRMPolicy;
import com.gogoair.ife.utils.GVLogger;

final class DRMHelper$2
  extends Thread
{
  DRMHelper$2(DRMMetadata paramDRMMetadata, String paramString1, String paramString2, DRMHelper.DRMAuthenticationListener paramDRMAuthenticationListener, DRMManager paramDRMManager, String paramString3) {}
  
  public void run()
  {
    DRMPolicy localDRMPolicy = val$drmMetadata.getPolicies()[0];
    Object localObject = localDRMPolicy.getAuthenticationMethod();
    switch (DRMHelper.5.$SwitchMap$com$adobe$ave$drm$DRMAuthenticationMethod[localObject.ordinal()])
    {
    }
    do
    {
      do
      {
        do
        {
          return;
        } while (DRMHelper.access$200().booleanValue());
        GVLogger.getDefaultLogger().i("[DRMPLAYER]::DRMHelper", " username = " + val$authUser + " pwd = " + val$authPass);
        val$authenticationListener.onAuthenticationStart();
        val$drmManager.authenticate(val$drmMetadata, val$drmMetadata.getServerURL(), localDRMPolicy.getAuthenticationDomain(), val$authUser, val$authPass, new DRMHelper.2.1(this), new DRMHelper.2.2(this));
        return;
      } while (!DRMHelper.access$200().booleanValue());
      localObject = val$authToken.getBytes();
      try
      {
        val$drmManager.setAuthenticationToken(val$drmMetadata, localDRMPolicy.getAuthenticationDomain(), (byte[])localObject, new DRMHelper.2.3(this), new DRMHelper.2.4(this, (byte[])localObject));
        return;
      }
      catch (RuntimeException localRuntimeException1)
      {
        GVLogger.getDefaultLogger().e("[DRMPLAYER]::DRMHelper", "An error setting the authentication token, perhaps you didn't load metadata yet, or it didn't have any policies? " + localRuntimeException1);
        return;
      }
    } while (DRMHelper.access$200().booleanValue());
    localObject = val$authToken.getBytes();
    try
    {
      val$drmManager.setAuthenticationToken(val$drmMetadata, localRuntimeException1.getAuthenticationDomain(), (byte[])localObject, new DRMHelper.2.5(this), new DRMHelper.2.6(this, (byte[])localObject));
      return;
    }
    catch (RuntimeException localRuntimeException2)
    {
      GVLogger.getDefaultLogger().e("[DRMPLAYER]::DRMHelper", "An error setting the authentication token, perhaps you didn't load metadata yet, or it didn't have any policies? " + localRuntimeException2);
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */