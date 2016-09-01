package com.adobe.mobile;

import com.google.android.gms.wearable.DataMap;

class WearableDataResponse$PostResponse
  extends WearableDataResponse
{
  protected WearableDataResponse$PostResponse(DataMap paramDataMap)
  {
    success = paramDataMap.getBoolean("Result");
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableDataResponse.PostResponse
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */