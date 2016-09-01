package com.auditude.ads.response;

import com.auditude.ads.exception.AssetException;
import com.auditude.ads.loader.AdRequest;

public abstract interface IResponseParser
{
  public abstract void cancel();
  
  public abstract void loadAdRequest(AdResponse paramAdResponse, AdRequest paramAdRequest, int paramInt);
  
  public abstract void setResponseParserListener(ResponseParserListener paramResponseParserListener);
  
  public static abstract interface ResponseParserListener
  {
    public abstract void onRequestComplete(AssetException paramAssetException);
    
    public abstract void onRequestFailed(Throwable paramThrowable);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.IResponseParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */