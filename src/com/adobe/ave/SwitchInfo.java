package com.adobe.ave;

public enum SwitchInfo
{
  ABR(0),  PERIOD(1);
  
  private final int value;
  
  private SwitchInfo(int paramInt1)
  {
    value = paramInt1;
  }
  
  final int getValue()
  {
    return value;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.SwitchInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */