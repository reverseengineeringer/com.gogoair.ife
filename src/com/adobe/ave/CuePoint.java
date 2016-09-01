package com.adobe.ave;

public class CuePoint
{
  public Dictionary dictionary;
  public long localTime;
  
  private CuePoint(long paramLong, Dictionary paramDictionary)
  {
    localTime = paramLong;
    dictionary = paramDictionary;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.CuePoint
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */