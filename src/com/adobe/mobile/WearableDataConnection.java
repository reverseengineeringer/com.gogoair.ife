package com.adobe.mobile;

import android.content.Context;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.Builder;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.wearable.DataApi;
import com.google.android.gms.wearable.DataApi.DataListener;
import com.google.android.gms.wearable.DataEvent;
import com.google.android.gms.wearable.DataEventBuffer;
import com.google.android.gms.wearable.DataItem;
import com.google.android.gms.wearable.DataMap;
import com.google.android.gms.wearable.DataMapItem;
import com.google.android.gms.wearable.NodeApi;
import com.google.android.gms.wearable.NodeApi.GetConnectedNodesResult;
import com.google.android.gms.wearable.PutDataMapRequest;
import com.google.android.gms.wearable.PutDataRequest;
import com.google.android.gms.wearable.Wearable;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

final class WearableDataConnection
  implements GoogleApiClient.OnConnectionFailedListener, DataApi.DataListener
{
  protected DataMap mDataMap;
  private final GoogleApiClient mGoogleApiClient;
  private CountDownLatch mInTimeCountDownLatch;
  protected String requestID;
  
  protected WearableDataConnection(Context paramContext)
  {
    mGoogleApiClient = new GoogleApiClient.Builder(paramContext).addOnConnectionFailedListener(this).addApi(Wearable.API).build();
  }
  
  private boolean connect(int paramInt)
  {
    mGoogleApiClient.connect();
    if (!waitForConnect(paramInt))
    {
      StaticMethods.logWarningFormat("Wearable - Timeout setup connection", new Object[0]);
      return false;
    }
    if (!hasNodes())
    {
      StaticMethods.logWarningFormat("Wearable - No connected Node found", new Object[0]);
      return false;
    }
    return true;
  }
  
  private boolean hasNodes()
  {
    NodeApi.GetConnectedNodesResult localGetConnectedNodesResult = (NodeApi.GetConnectedNodesResult)Wearable.NodeApi.getConnectedNodes(mGoogleApiClient).await();
    return (localGetConnectedNodesResult != null) && (localGetConnectedNodesResult.getNodes() != null) && (localGetConnectedNodesResult.getNodes().size() > 0);
  }
  
  private boolean waitForConnect(int paramInt)
  {
    if (mGoogleApiClient.isConnected()) {
      return true;
    }
    return mGoogleApiClient.blockingConnect(paramInt, TimeUnit.MILLISECONDS).isSuccess();
  }
  
  protected WearableDataResponse getResponse()
  {
    if (mDataMap == null) {
      return null;
    }
    return WearableDataResponse.createResponseFromDataMap(mDataMap, mGoogleApiClient);
  }
  
  public void onConnectionFailed(ConnectionResult paramConnectionResult) {}
  
  public void onDataChanged(DataEventBuffer paramDataEventBuffer)
  {
    paramDataEventBuffer = paramDataEventBuffer.iterator();
    Object localObject1;
    do
    {
      Object localObject2;
      do
      {
        do
        {
          if (paramDataEventBuffer.hasNext())
          {
            localObject1 = (DataEvent)paramDataEventBuffer.next();
            if (((DataEvent)localObject1).getType() == 1) {}
          }
          else
          {
            return;
          }
          localObject2 = ((DataEvent)localObject1).getDataItem();
        } while (localObject2 == null);
        localObject2 = ((DataItem)localObject2).getUri();
      } while ((localObject2 == null) || (((Uri)localObject2).getPath() == null) || (((Uri)localObject2).getPath().compareTo("/abdmobile/data/response") != 0));
      localObject1 = DataMapItem.fromDataItem(((DataEvent)localObject1).getDataItem()).getDataMap();
    } while ((localObject1 == null) || (!((DataMap)localObject1).containsKey("ID")) || (!((DataMap)localObject1).getString("ID").equals(requestID)));
    mDataMap = ((DataMap)localObject1);
    mInTimeCountDownLatch.countDown();
  }
  
  protected WearableDataResponse send(WearableDataRequest paramWearableDataRequest)
  {
    if (!connect(paramWearableDataRequest.getTimeOut())) {
      return null;
    }
    Wearable.DataApi.addListener(mGoogleApiClient, this);
    requestID = paramWearableDataRequest.getUUID();
    Object localObject = PutDataMapRequest.create("/abdmobile/data/request");
    ((PutDataMapRequest)localObject).getDataMap().putAll(paramWearableDataRequest.getDataMap());
    localObject = ((PutDataMapRequest)localObject).asPutDataRequest();
    mInTimeCountDownLatch = new CountDownLatch(1);
    Wearable.DataApi.putDataItem(mGoogleApiClient, (PutDataRequest)localObject);
    try
    {
      if (!mInTimeCountDownLatch.await(paramWearableDataRequest.getTimeOut(), TimeUnit.MILLISECONDS))
      {
        StaticMethods.logWarningFormat("Wearable - Failed to get data from handheld app", new Object[0]);
        return null;
      }
      paramWearableDataRequest = getResponse();
      return paramWearableDataRequest;
    }
    catch (InterruptedException paramWearableDataRequest)
    {
      StaticMethods.logWarningFormat("Wearable - Failed to get data from handheld app", new Object[0]);
      return null;
    }
    finally
    {
      Wearable.DataApi.removeListener(mGoogleApiClient, this);
      mGoogleApiClient.disconnect();
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableDataConnection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */