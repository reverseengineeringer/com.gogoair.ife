package com.adobe.mobile;

import android.content.Context;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.wearable.DataApi;
import com.google.android.gms.wearable.DataEvent;
import com.google.android.gms.wearable.DataEventBuffer;
import com.google.android.gms.wearable.DataItem;
import com.google.android.gms.wearable.DataMap;
import com.google.android.gms.wearable.DataMapItem;
import com.google.android.gms.wearable.PutDataMapRequest;
import com.google.android.gms.wearable.Wearable;
import java.util.Iterator;
import java.util.concurrent.TimeUnit;

public final class DataListenerHandheld
{
  private static void handleRequest(DataMap paramDataMap, GoogleApiClient paramGoogleApiClient, Context paramContext)
  {
    if ((paramGoogleApiClient == null) || (paramContext == null) || (paramDataMap == null))
    {
      StaticMethods.logDebugFormat("Wearable - GoogleApiClient or Context or DataMap is null", new Object[0]);
      return;
    }
    WearableDataRequest localWearableDataRequest = WearableDataRequest.createRequestFromDataMap(paramDataMap);
    if (localWearableDataRequest == null)
    {
      StaticMethods.logDebugFormat("Wearable - Invalid data request (%s)", new Object[] { paramDataMap.toString() });
      return;
    }
    if (!paramGoogleApiClient.blockingConnect(15000L, TimeUnit.SECONDS).isSuccess())
    {
      StaticMethods.logDebugFormat("Wearable - Failed to setup connection", new Object[0]);
      return;
    }
    paramDataMap = localWearableDataRequest.handle(paramContext);
    paramContext = PutDataMapRequest.create("/abdmobile/data/response");
    paramContext.getDataMap().putAll(paramDataMap);
    Wearable.DataApi.putDataItem(paramGoogleApiClient, paramContext.asPutDataRequest());
  }
  
  public static void onDataChanged(DataEventBuffer paramDataEventBuffer, GoogleApiClient paramGoogleApiClient, Context paramContext)
  {
    if (paramDataEventBuffer == null) {}
    for (;;)
    {
      return;
      paramDataEventBuffer = paramDataEventBuffer.iterator();
      while (paramDataEventBuffer.hasNext())
      {
        Object localObject = (DataEvent)paramDataEventBuffer.next();
        if (((DataEvent)localObject).getType() == 1)
        {
          localObject = ((DataEvent)localObject).getDataItem();
          if (localObject != null)
          {
            Uri localUri = ((DataItem)localObject).getUri();
            if ((localUri != null) && (localUri.getPath() != null) && (localUri.getPath().startsWith("/abdmobile/data/request"))) {
              handleRequest(DataMapItem.fromDataItem((DataItem)localObject).getDataMap(), paramGoogleApiClient, paramContext);
            }
          }
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.DataListenerHandheld
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */