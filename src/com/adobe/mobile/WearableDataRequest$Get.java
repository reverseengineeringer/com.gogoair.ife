package com.adobe.mobile;

import android.content.Context;
import com.google.android.gms.wearable.DataMap;

class WearableDataRequest$Get
  extends WearableDataRequest
{
  protected String url;
  
  protected WearableDataRequest$Get(DataMap paramDataMap)
  {
    url = paramDataMap.getString("URL");
    uuid = paramDataMap.getString("ID");
  }
  
  protected WearableDataRequest$Get(String paramString, int paramInt)
  {
    super(paramInt);
    url = paramString;
  }
  
  protected DataMap getDataMap()
  {
    DataMap localDataMap = new DataMap();
    localDataMap.putString("ID", uuid);
    localDataMap.putString("Type", "GET");
    localDataMap.putString("URL", url);
    return localDataMap;
  }
  
  protected String getURL()
  {
    return url;
  }
  
  protected DataMap handle(Context paramContext)
  {
    paramContext = new DataMap();
    paramContext.putByteArray("Result", RequestHandler.retrieveData(url, null, timeOut, "Wearable Request Forward"));
    paramContext.putString("ID", uuid);
    paramContext.putString("Type", "GET");
    return paramContext;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableDataRequest.Get
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */