package com.adobe.mobile;

import android.content.SharedPreferences;

class VisitorIDService$1
  implements Runnable
{
  VisitorIDService$1(VisitorIDService paramVisitorIDService) {}
  
  public void run()
  {
    try
    {
      VisitorIDService.access$002(this$0, StaticMethods.getSharedPreferences().getString("ADBMOBILE_PERSISTED_MID", null));
      VisitorIDService.access$102(this$0, StaticMethods.getSharedPreferences().getString("ADBMOBILE_PERSISTED_MID_HINT", null));
      VisitorIDService.access$202(this$0, StaticMethods.getSharedPreferences().getString("ADBMOBILE_PERSISTED_MID_BLOB", null));
      VisitorIDService.access$302(this$0, StaticMethods.getSharedPreferences().getLong("ADBMOBILE_VISITORID_TTL", 0L));
      VisitorIDService.access$402(this$0, StaticMethods.getSharedPreferences().getLong("ADBMOBILE_VISITORID_SYNC", 0L));
      return;
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      VisitorIDService.access$002(this$0, null);
      VisitorIDService.access$102(this$0, null);
      VisitorIDService.access$202(this$0, null);
      StaticMethods.logErrorFormat("Visitor - Unable to check for stored visitor ID due to context error (%s)", new Object[] { localNullContextException.getMessage() });
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.VisitorIDService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */