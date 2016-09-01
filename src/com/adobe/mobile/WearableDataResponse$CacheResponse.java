package com.adobe.mobile;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.wearable.Asset;
import com.google.android.gms.wearable.DataMap;
import java.io.File;

class WearableDataResponse$CacheResponse
  extends WearableDataResponse
{
  final boolean result;
  
  protected WearableDataResponse$CacheResponse(DataMap paramDataMap, GoogleApiClient paramGoogleApiClient)
  {
    if (!paramDataMap.getBoolean("FileFound"))
    {
      RemoteDownload.deleteFilesInDirectory("adbdownloadcache");
      result = false;
    }
    Asset localAsset;
    File localFile;
    do
    {
      do
      {
        return;
        result = paramDataMap.getBoolean("Updated");
      } while (!result);
      RemoteDownload.deleteFilesInDirectory("adbdownloadcache");
      localAsset = paramDataMap.getAsset("FileContent");
      paramDataMap = paramDataMap.getString("FileName");
      localFile = RemoteDownload.getDownloadCacheDirectory("adbdownloadcache");
    } while (localFile == null);
    RemoteDownload.deleteFilesInDirectory("adbdownloadcache");
    WearableDataResponse.access$000(localAsset, localFile.getPath() + File.separator + paramDataMap, paramGoogleApiClient);
  }
  
  protected boolean getResult()
  {
    return result;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableDataResponse.CacheResponse
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */