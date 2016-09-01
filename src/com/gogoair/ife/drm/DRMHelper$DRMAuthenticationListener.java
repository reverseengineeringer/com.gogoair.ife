package com.gogoair.ife.drm;

public abstract interface DRMHelper$DRMAuthenticationListener
{
  public abstract void onAuthenticationComplete(byte[] paramArrayOfByte);
  
  public abstract void onAuthenticationError(long paramLong1, long paramLong2, Exception paramException);
  
  public abstract void onAuthenticationStart();
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.DRMAuthenticationListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */