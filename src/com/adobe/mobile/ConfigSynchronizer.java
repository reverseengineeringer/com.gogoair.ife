package com.adobe.mobile;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.Builder;
import com.google.android.gms.wearable.DataApi;
import com.google.android.gms.wearable.DataItem;
import com.google.android.gms.wearable.DataMap;
import com.google.android.gms.wearable.DataMapItem;
import com.google.android.gms.wearable.PutDataMapRequest;
import com.google.android.gms.wearable.Wearable;
import java.io.File;
import java.util.concurrent.TimeUnit;

final class ConfigSynchronizer
{
  private static final Object _aidMutex;
  private static final Object _handheldInstallDateMutex = new Object();
  private static final Object _privacyStatusMutex = new Object();
  private static final Object _visServiceMutex;
  private static final Object _visitorIDMutex;
  
  static
  {
    _aidMutex = new Object();
    _visitorIDMutex = new Object();
    _visServiceMutex = new Object();
  }
  
  protected static DataMap getSharedConfig()
  {
    DataMap localDataMap = new DataMap();
    try
    {
      localDataMap.putLong("ADMS_InstallDate", StaticMethods.getSharedPreferences().getLong("ADMS_InstallDate", 0L));
      localDataMap.putBoolean("ADOBEMOBILE_STOREDDEFAULTS_IGNORE_AID", StaticMethods.getSharedPreferences().getBoolean("ADOBEMOBILE_STOREDDEFAULTS_IGNORE_AID", false));
      localDataMap.putString("ADOBEMOBILE_STOREDDEFAULTS_AID", StaticMethods.getSharedPreferences().getString("ADOBEMOBILE_STOREDDEFAULTS_AID", null));
      localDataMap.putBoolean("ADOBEMOBILE_STOREDDEFAULTS_AID_SYNCED", StaticMethods.getSharedPreferences().getBoolean("ADOBEMOBILE_STOREDDEFAULTS_AID_SYNCED", false));
      localDataMap.putString("APP_MEASUREMENT_VISITOR_ID", StaticMethods.getSharedPreferences().getString("APP_MEASUREMENT_VISITOR_ID", null));
      localDataMap.putString("ADBMOBILE_PERSISTED_MID", StaticMethods.getSharedPreferences().getString("ADBMOBILE_PERSISTED_MID", null));
      localDataMap.putString("ADBMOBILE_PERSISTED_MID_HINT", StaticMethods.getSharedPreferences().getString("ADBMOBILE_PERSISTED_MID_HINT", null));
      localDataMap.putString("ADBMOBILE_PERSISTED_MID_BLOB", StaticMethods.getSharedPreferences().getString("ADBMOBILE_PERSISTED_MID_BLOB", null));
      localDataMap.putLong("ADBMOBILE_VISITORID_TTL", StaticMethods.getSharedPreferences().getLong("ADBMOBILE_VISITORID_TTL", 0L));
      localDataMap.putLong("ADBMOBILE_VISITORID_SYNC", StaticMethods.getSharedPreferences().getLong("ADBMOBILE_VISITORID_SYNC", 0L));
      if (StaticMethods.getSharedPreferences().contains("PrivacyStatus")) {
        localDataMap.putInt("PrivacyStatus", StaticMethods.getSharedPreferences().getInt("PrivacyStatus", 0));
      }
      return localDataMap;
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      StaticMethods.logErrorFormat("Wearable - Error getting shared preferences", new Object[0]);
    }
    return localDataMap;
  }
  
  private static void restoreAid(DataMap paramDataMap)
  {
    synchronized (_aidMutex)
    {
      try
      {
        SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
        localEditor.putBoolean("ADOBEMOBILE_STOREDDEFAULTS_IGNORE_AID", paramDataMap.getBoolean("ADOBEMOBILE_STOREDDEFAULTS_IGNORE_AID"));
        localEditor.putString("ADOBEMOBILE_STOREDDEFAULTS_AID", paramDataMap.getString("ADOBEMOBILE_STOREDDEFAULTS_AID"));
        localEditor.putBoolean("ADOBEMOBILE_STOREDDEFAULTS_AID_SYNCED", paramDataMap.getBoolean("ADOBEMOBILE_STOREDDEFAULTS_AID_SYNCED"));
        localEditor.commit();
        return;
      }
      catch (StaticMethods.NullContextException paramDataMap)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("Wearable - Error saving Aid data to shared preferences", new Object[0]);
        }
      }
    }
  }
  
  protected static void restoreConfig(DataItem paramDataItem)
  {
    if ((paramDataItem == null) || (paramDataItem.getUri() == null) || (paramDataItem.getUri().getPath() == null)) {}
    DataMap localDataMap;
    do
    {
      do
      {
        return;
        localDataMap = DataMapItem.fromDataItem(paramDataItem).getDataMap();
      } while (localDataMap == null);
      paramDataItem = paramDataItem.getUri().getPath();
      if (paramDataItem.compareTo("/abdmobile/data/config/visitorId") == 0)
      {
        restoreVisitorID(localDataMap);
        return;
      }
      if (paramDataItem.compareTo("/abdmobile/data/config/vidService") == 0)
      {
        restoreVisitorID(localDataMap);
        return;
      }
    } while (paramDataItem.compareTo("/abdmobile/data/config/privacyStatus") != 0);
    restorePrivacyStatus(localDataMap);
  }
  
  private static void restoreHandheldInstallDate(DataMap paramDataMap)
  {
    synchronized (_handheldInstallDateMutex)
    {
      try
      {
        SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
        if (paramDataMap.containsKey("ADMS_InstallDate")) {
          localEditor.putLong("ADMS_Handheld_App_InstallDate", paramDataMap.getLong("ADMS_InstallDate", 0L));
        }
        localEditor.commit();
      }
      catch (StaticMethods.NullContextException paramDataMap)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("Wearable - Error saving Handheld App install date to shared preferences", new Object[0]);
        }
      }
      return;
    }
  }
  
  private static void restorePrivacyStatus(DataMap paramDataMap)
  {
    synchronized (_privacyStatusMutex)
    {
      if (paramDataMap.getInt("PrivacyStatus") >= MobilePrivacyStatus.values().length)
      {
        StaticMethods.logWarningFormat("Wearable - Invalid PrivacyStatus value (%d)", new Object[] { Integer.valueOf(paramDataMap.getInt("PrivacyStatus")) });
        return;
      }
      Config.setPrivacyStatus(MobilePrivacyStatus.values()[paramDataMap.getInt("PrivacyStatus")]);
      return;
    }
  }
  
  private static void restoreSharedConfig(DataMap paramDataMap)
  {
    restoreHandheldInstallDate(paramDataMap);
    restorePrivacyStatus(paramDataMap);
    restoreVisitorID(paramDataMap);
    restoreVidService(paramDataMap);
    restoreAid(paramDataMap);
  }
  
  private static void restoreVidService(DataMap paramDataMap)
  {
    synchronized (_visServiceMutex)
    {
      try
      {
        SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
        localEditor.putString("ADBMOBILE_PERSISTED_MID", paramDataMap.getString("ADBMOBILE_PERSISTED_MID"));
        localEditor.putString("ADBMOBILE_PERSISTED_MID_HINT", paramDataMap.getString("ADBMOBILE_PERSISTED_MID_HINT"));
        localEditor.putString("ADBMOBILE_PERSISTED_MID_BLOB", paramDataMap.getString("ADBMOBILE_PERSISTED_MID_BLOB"));
        localEditor.putLong("ADBMOBILE_VISITORID_TTL", paramDataMap.getLong("ADBMOBILE_VISITORID_TTL"));
        localEditor.putLong("ADBMOBILE_VISITORID_SYNC", paramDataMap.getLong("ADBMOBILE_VISITORID_SYNC"));
        localEditor.commit();
        VisitorIDService.sharedInstance().resetVariablesFromSharedPreferences();
        return;
      }
      catch (StaticMethods.NullContextException paramDataMap)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("Wearable - Error saving Visitor Id Service data to shared preferences", new Object[0]);
        }
      }
    }
  }
  
  private static void restoreVisitorID(DataMap paramDataMap)
  {
    synchronized (_visitorIDMutex)
    {
      Config.setUserIdentifier(paramDataMap.getString("APP_MEASUREMENT_VISITOR_ID"));
      return;
    }
  }
  
  protected static void syncConfigFromHandheld()
  {
    if (StaticMethods.isWearableApp()) {
      try
      {
        Context localContext = StaticMethods.getSharedContext().getApplicationContext();
        Object localObject = (WearableDataResponse.ShareConfigResponse)new WearableDataConnection(localContext).send(WearableDataRequest.createShareConfigRequest(15000));
        if ((localObject != null) && (((WearableDataResponse.ShareConfigResponse)localObject).getResult() != null)) {
          restoreSharedConfig(((WearableDataResponse.ShareConfigResponse)localObject).getResult());
        }
        String str = MobileConfig.getInstance().getPointsOfInterestURL();
        if (str == null) {
          return;
        }
        localObject = null;
        File localFile = RemoteDownload.getFileForCachedURL(str);
        if (localFile != null) {
          localObject = localFile.getName();
        }
        new WearableDataConnection(localContext).send(WearableDataRequest.createFileRequest(str, (String)localObject, 15000));
        MobileConfig.getInstance().loadCachedRemotes();
        return;
      }
      catch (StaticMethods.NullContextException localNullContextException)
      {
        StaticMethods.logErrorFormat("Analytics - Error sync config from handheld app to wearalbe app", new Object[0]);
      }
    }
  }
  
  private static void syncData(String paramString, DataMap paramDataMap)
  {
    try
    {
      GoogleApiClient localGoogleApiClient = new GoogleApiClient.Builder(StaticMethods.getSharedContext()).addApi(Wearable.API).build();
      localGoogleApiClient.connect();
      ConnectionResult localConnectionResult = localGoogleApiClient.blockingConnect(15000L, TimeUnit.MILLISECONDS);
      if ((localConnectionResult == null) || (!localConnectionResult.isSuccess()))
      {
        StaticMethods.logWarningFormat("Wearable - Failed to setup connection", new Object[0]);
        return;
      }
      paramString = PutDataMapRequest.create(paramString);
      paramString.getDataMap().putAll(paramDataMap);
      paramString = paramString.asPutDataRequest();
      Wearable.DataApi.putDataItem(localGoogleApiClient, paramString);
      return;
    }
    catch (StaticMethods.NullContextException paramString) {}
  }
  
  protected static void syncPrivacyStatus(int paramInt)
  {
    if (StaticMethods.isWearableApp()) {
      return;
    }
    DataMap localDataMap = new DataMap();
    localDataMap.putInt("PrivacyStatus", paramInt);
    syncData("/abdmobile/data/config/privacyStatus", localDataMap);
  }
  
  protected static void syncVidService(String paramString1, String paramString2, String paramString3, long paramLong1, long paramLong2)
  {
    if (StaticMethods.isWearableApp()) {
      return;
    }
    DataMap localDataMap = new DataMap();
    localDataMap.putString("ADBMOBILE_PERSISTED_MID", paramString1);
    localDataMap.putString("ADBMOBILE_PERSISTED_MID_BLOB", paramString3);
    localDataMap.putString("ADBMOBILE_PERSISTED_MID_HINT", paramString2);
    localDataMap.putLong("ADBMOBILE_VISITORID_TTL", paramLong1);
    localDataMap.putLong("ADBMOBILE_VISITORID_SYNC", paramLong2);
    syncData("/abdmobile/data/config/vidService", localDataMap);
  }
  
  protected static void syncVisitorID(String paramString)
  {
    if (StaticMethods.isWearableApp()) {
      return;
    }
    DataMap localDataMap = new DataMap();
    localDataMap.putString("APP_MEASUREMENT_VISITOR_ID", paramString);
    syncData("/abdmobile/data/config/visitorId", localDataMap);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.ConfigSynchronizer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */