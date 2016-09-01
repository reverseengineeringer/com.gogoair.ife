package com.auditude.ads.response;

import com.auditude.ads.exception.AssetException;

public abstract interface IResponseParser$ResponseParserListener
{
  public abstract void onRequestComplete(AssetException paramAssetException);
  
  public abstract void onRequestFailed(Throwable paramThrowable);
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.IResponseParser.ResponseParserListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */