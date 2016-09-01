package com.auditude.ads.response;

import java.util.Comparator;

public class VMAPParser$sortOnStartTime
  implements Comparator
{
  public VMAPParser$sortOnStartTime(VMAPParser paramVMAPParser) {}
  
  public int compare(VMAPAdBreak paramVMAPAdBreak1, VMAPAdBreak paramVMAPAdBreak2)
  {
    return paramVMAPAdBreak1.getStartTime() - paramVMAPAdBreak2.getStartTime();
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.response.VMAPParser.sortOnStartTime
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */