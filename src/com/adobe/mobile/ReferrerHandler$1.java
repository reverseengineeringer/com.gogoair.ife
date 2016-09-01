package com.adobe.mobile;

import java.util.HashMap;

final class ReferrerHandler$1
  implements Runnable
{
  ReferrerHandler$1(HashMap paramHashMap) {}
  
  public void run()
  {
    Lifecycle.addReferralDataToSavedLifecycle(val$referrerFields);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.ReferrerHandler.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */