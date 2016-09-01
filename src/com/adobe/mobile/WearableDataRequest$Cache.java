package com.adobe.mobile;

import android.content.Context;
import com.google.android.gms.wearable.Asset;
import com.google.android.gms.wearable.DataMap;
import java.io.File;

class WearableDataRequest$Cache
  extends WearableDataRequest
{
  protected String fileName;
  protected String url;
  
  protected WearableDataRequest$Cache(DataMap paramDataMap)
  {
    uuid = paramDataMap.getString("ID");
    fileName = paramDataMap.getString("FileName");
    url = paramDataMap.getString("URL");
  }
  
  protected WearableDataRequest$Cache(String paramString1, String paramString2, int paramInt)
  {
    super(paramInt);
    url = paramString1;
    fileName = paramString2;
  }
  
  protected DataMap getDataMap()
  {
    DataMap localDataMap = new DataMap();
    localDataMap.putString("Type", "File");
    localDataMap.putString("ID", uuid);
    localDataMap.putString("URL", url);
    localDataMap.putString("FileName", fileName);
    return localDataMap;
  }
  
  protected DataMap handle(Context paramContext)
  {
    paramContext = new DataMap();
    paramContext.putString("ID", uuid);
    paramContext.putString("Type", "File");
    Object localObject = RemoteDownload.getFileForCachedURL(url);
    if (localObject == null) {
      paramContext.putBoolean("FileFound", false);
    }
    do
    {
      return paramContext;
      paramContext.putBoolean("FileFound", true);
      if (((File)localObject).getName().equals(fileName))
      {
        paramContext.putBoolean("Updated", false);
        return paramContext;
      }
      paramContext.putBoolean("Updated", true);
      paramContext.putString("FileName", ((File)localObject).getName());
      localObject = WearableDataRequest.access$000((File)localObject);
    } while ((localObject == null) || (localObject.length <= 0));
    paramContext.putAsset("FileContent", Asset.createFromBytes((byte[])localObject));
    return paramContext;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableDataRequest.Cache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */