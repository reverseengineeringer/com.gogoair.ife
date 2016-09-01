package com.auditude.ads.response;

import java.util.ArrayList;

public abstract interface AdResponse$AdResponseListener
{
  public abstract void onRequestComplete(ArrayList paramArrayList);
  
  public abstract void onRequestFailed(Throwable paramThrowable);
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.AdResponse.AdResponseListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */