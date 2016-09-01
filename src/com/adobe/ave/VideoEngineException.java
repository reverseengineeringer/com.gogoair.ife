package com.adobe.ave;

public class VideoEngineException
  extends Exception
{
  private static final long serialVersionUID = 1L;
  private MediaErrorCode errorCode;
  private String errorMessage;
  
  VideoEngineException(int paramInt)
  {
    errorCode = MediaErrorCode.GENERIC_ERROR;
    MediaErrorCode[] arrayOfMediaErrorCode = MediaErrorCode.values();
    int j = arrayOfMediaErrorCode.length;
    int i = 0;
    for (;;)
    {
      if (i < j)
      {
        MediaErrorCode localMediaErrorCode = arrayOfMediaErrorCode[i];
        if (localMediaErrorCode.getValue() == paramInt) {
          errorCode = localMediaErrorCode;
        }
      }
      else
      {
        return;
      }
      i += 1;
    }
  }
  
  VideoEngineException(int paramInt, String paramString)
  {
    super(paramString);
    errorCode = MediaErrorCode.GENERIC_ERROR;
    MediaErrorCode[] arrayOfMediaErrorCode = MediaErrorCode.values();
    int j = arrayOfMediaErrorCode.length;
    int i = 0;
    for (;;)
    {
      if (i < j)
      {
        MediaErrorCode localMediaErrorCode = arrayOfMediaErrorCode[i];
        if (localMediaErrorCode.getValue() == paramInt) {
          errorCode = localMediaErrorCode;
        }
      }
      else
      {
        errorMessage = paramString;
        return;
      }
      i += 1;
    }
  }
  
  VideoEngineException(MediaErrorCode paramMediaErrorCode, String paramString)
  {
    super(paramString);
    errorCode = paramMediaErrorCode;
    errorMessage = paramString;
  }
  
  public String getDetailMessage()
  {
    return errorMessage;
  }
  
  public MediaErrorCode getErrorCode()
  {
    return errorCode;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.VideoEngineException
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */