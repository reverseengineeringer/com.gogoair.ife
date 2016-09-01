package com.adobe.ave;

public class InsertionResult
{
  public boolean insertedBeforeReadHead;
  public int periodIndex;
  
  private InsertionResult(int paramInt, boolean paramBoolean)
  {
    periodIndex = paramInt;
    insertedBeforeReadHead = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.InsertionResult
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */