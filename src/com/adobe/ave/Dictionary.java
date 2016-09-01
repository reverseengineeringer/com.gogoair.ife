package com.adobe.ave;

public class Dictionary
{
  private long mNativeContext;
  
  private Dictionary(long paramLong)
  {
    mNativeContext = paramLong;
    nativeCreateDictionary(paramLong);
  }
  
  private native void nativeCreateDictionary(long paramLong);
  
  private native void nativeFinalize();
  
  private native byte[] nativeGetByteArrayByKey(String paramString)
    throws VideoEngineException;
  
  private native int nativeGetCount()
    throws VideoEngineException;
  
  private native String nativeGetKeyByIndex(int paramInt)
    throws VideoEngineException;
  
  private native String nativeGetValueByKey(String paramString)
    throws VideoEngineException;
  
  private native void nativeRelease();
  
  protected void finalize()
  {
    nativeFinalize();
  }
  
  public byte[] getByteArrayByKey(String paramString)
    throws VideoEngineException
  {
    return nativeGetByteArrayByKey(paramString);
  }
  
  public int getCount()
    throws VideoEngineException
  {
    return nativeGetCount();
  }
  
  public String getKeyByIndex(int paramInt)
    throws VideoEngineException
  {
    return nativeGetKeyByIndex(paramInt);
  }
  
  public String getValueByKey(String paramString)
    throws VideoEngineException
  {
    return nativeGetValueByKey(paramString);
  }
  
  public void release()
    throws VideoEngineException
  {
    nativeRelease();
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.Dictionary
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */