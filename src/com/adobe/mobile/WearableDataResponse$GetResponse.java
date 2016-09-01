package com.adobe.mobile;

import com.google.android.gms.wearable.DataMap;

class WearableDataResponse$GetResponse
  extends WearableDataResponse
{
  protected byte[] result;
  
  protected WearableDataResponse$GetResponse(DataMap paramDataMap)
  {
    result = paramDataMap.getByteArray("Result");
    if (result != null) {
      success = true;
    }
  }
  
  protected byte[] getResult()
  {
    return result;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableDataResponse.GetResponse
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */