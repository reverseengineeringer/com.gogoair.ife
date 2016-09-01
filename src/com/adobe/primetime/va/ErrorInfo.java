package com.adobe.primetime.va;

public final class ErrorInfo
{
  private final String _details;
  private final String _message;
  
  public ErrorInfo(String paramString1, String paramString2)
  {
    _message = paramString1;
    _details = paramString2;
  }
  
  public String getDetails()
  {
    return _details;
  }
  
  public String getMessage()
  {
    return _message;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.ErrorInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */