package com.adobe.mobile;

import android.content.Context;
import com.google.android.gms.wearable.DataMap;

class WearableDataRequest$ShareConfig
  extends WearableDataRequest
{
  protected WearableDataRequest$ShareConfig(int paramInt)
  {
    super(paramInt);
  }
  
  protected WearableDataRequest$ShareConfig(DataMap paramDataMap)
  {
    uuid = paramDataMap.getString("ID");
  }
  
  protected DataMap getDataMap()
  {
    DataMap localDataMap = new DataMap();
    localDataMap.putString("Type", "Config");
    localDataMap.putString("ID", uuid);
    return localDataMap;
  }
  
  protected DataMap handle(Context paramContext)
  {
    paramContext = new DataMap();
    paramContext.putString("ID", uuid);
    paramContext.putString("Type", "Config");
    paramContext.putAll(ConfigSynchronizer.getSharedConfig());
    return paramContext;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableDataRequest.ShareConfig
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */