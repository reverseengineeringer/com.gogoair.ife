package com.adobe.mobile;

import android.content.SharedPreferences.Editor;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

class VisitorIDService$2
  implements Runnable
{
  VisitorIDService$2(VisitorIDService paramVisitorIDService, HashMap paramHashMap) {}
  
  public void run()
  {
    if (!MobileConfig.getInstance().getVisitorIdServiceEnabled()) {
      return;
    }
    Object localObject2 = MobileConfig.getInstance().getMarketingCloudOrganizationId();
    int i;
    label42:
    int j;
    if (StaticMethods.getTimeSince1970() - VisitorIDService.access$400(this$0) > VisitorIDService.access$300(this$0))
    {
      i = 1;
      if (val$identifiersCopy == null) {
        break label345;
      }
      j = 1;
      label51:
      if ((VisitorIDService.access$000(this$0) != null) && (j == 0) && (i == 0)) {
        break label348;
      }
      if (!MobileConfig.getInstance().getSSL()) {
        break label350;
      }
    }
    label345:
    label348:
    label350:
    for (Object localObject1 = "https";; localObject1 = "http")
    {
      localObject1 = new StringBuilder((String)localObject1);
      ((StringBuilder)localObject1).append("://");
      ((StringBuilder)localObject1).append("dpm.demdex.net");
      ((StringBuilder)localObject1).append("/id?d_ver=2&d_orgid=");
      ((StringBuilder)localObject1).append((String)localObject2);
      if (VisitorIDService.access$000(this$0) != null)
      {
        ((StringBuilder)localObject1).append("&");
        ((StringBuilder)localObject1).append("d_mid");
        ((StringBuilder)localObject1).append("=");
        ((StringBuilder)localObject1).append(VisitorIDService.access$000(this$0));
      }
      if (VisitorIDService.access$200(this$0) != null)
      {
        ((StringBuilder)localObject1).append("&");
        ((StringBuilder)localObject1).append("d_blob");
        ((StringBuilder)localObject1).append("=");
        ((StringBuilder)localObject1).append(VisitorIDService.access$200(this$0));
      }
      if (VisitorIDService.access$100(this$0) != null)
      {
        ((StringBuilder)localObject1).append("&");
        ((StringBuilder)localObject1).append("dcs_region");
        ((StringBuilder)localObject1).append("=");
        ((StringBuilder)localObject1).append(VisitorIDService.access$100(this$0));
      }
      if (j == 0) {
        break label356;
      }
      localObject2 = val$identifiersCopy.entrySet().iterator();
      while (((Iterator)localObject2).hasNext())
      {
        Map.Entry localEntry = (Map.Entry)((Iterator)localObject2).next();
        ((StringBuilder)localObject1).append("&d_cid_ic=");
        ((StringBuilder)localObject1).append(StaticMethods.URLEncode((String)localEntry.getKey()));
        ((StringBuilder)localObject1).append("%01");
        ((StringBuilder)localObject1).append(StaticMethods.URLEncode((String)localEntry.getValue()));
      }
      i = 0;
      break label42;
      j = 0;
      break label51;
      break;
    }
    label356:
    localObject1 = ((StringBuilder)localObject1).toString();
    StaticMethods.logDebugFormat("ID Service - Sending id sync call (%s)", new Object[] { localObject1 });
    localObject1 = RequestHandler.retrieveData((String)localObject1, null, 2000, "ID Service");
    localObject1 = this$0.parseResponse((byte[])localObject1);
    if ((localObject1 != null) && (((JSONObject)localObject1).has("d_mid")) && (!((JSONObject)localObject1).has("error_msg"))) {}
    for (;;)
    {
      try
      {
        VisitorIDService.access$002(this$0, ((JSONObject)localObject1).getString("d_mid"));
        if (((JSONObject)localObject1).has("d_blob")) {
          VisitorIDService.access$202(this$0, ((JSONObject)localObject1).getString("d_blob"));
        }
        if (((JSONObject)localObject1).has("dcs_region")) {
          VisitorIDService.access$102(this$0, ((JSONObject)localObject1).getString("dcs_region"));
        }
        if (((JSONObject)localObject1).has("id_sync_ttl")) {
          VisitorIDService.access$302(this$0, ((JSONObject)localObject1).getInt("id_sync_ttl"));
        }
        StaticMethods.logDebugFormat("ID Service - Got ID Response (mid: %s, blob: %s, hint: %s, ttl: %d)", new Object[] { VisitorIDService.access$000(this$0), VisitorIDService.access$200(this$0), VisitorIDService.access$100(this$0), Long.valueOf(VisitorIDService.access$300(this$0)) });
      }
      catch (JSONException localJSONException1)
      {
        StaticMethods.logDebugFormat("ID Service - Error parsing response (%s)", new Object[] { localJSONException1.getLocalizedMessage() });
        continue;
      }
      VisitorIDService.access$402(this$0, StaticMethods.getTimeSince1970());
      WearableFunctionBridge.syncVidServiceToWearable(VisitorIDService.access$000(this$0), VisitorIDService.access$100(this$0), VisitorIDService.access$200(this$0), VisitorIDService.access$300(this$0), VisitorIDService.access$400(this$0));
      try
      {
        localObject1 = StaticMethods.getSharedPreferencesEditor();
        ((SharedPreferences.Editor)localObject1).putString("ADBMOBILE_PERSISTED_MID", VisitorIDService.access$000(this$0));
        ((SharedPreferences.Editor)localObject1).putString("ADBMOBILE_PERSISTED_MID_HINT", VisitorIDService.access$100(this$0));
        ((SharedPreferences.Editor)localObject1).putString("ADBMOBILE_PERSISTED_MID_BLOB", VisitorIDService.access$200(this$0));
        ((SharedPreferences.Editor)localObject1).putLong("ADBMOBILE_VISITORID_TTL", VisitorIDService.access$300(this$0));
        ((SharedPreferences.Editor)localObject1).putLong("ADBMOBILE_VISITORID_SYNC", VisitorIDService.access$400(this$0));
        ((SharedPreferences.Editor)localObject1).commit();
        return;
      }
      catch (StaticMethods.NullContextException localNullContextException)
      {
        StaticMethods.logErrorFormat("ID Service - Unable to persist identifiers to shared preferences(%s)", new Object[] { localNullContextException.getLocalizedMessage() });
        return;
      }
      if ((localJSONException1 != null) && (localJSONException1.has("error_msg"))) {}
      try
      {
        StaticMethods.logErrorFormat("ID Service - Service returned error (%s)", new Object[] { localJSONException1.getString("error_msg") });
        VisitorIDService.access$002(this$0, VisitorIDService.access$500(this$0));
        VisitorIDService.access$202(this$0, null);
        VisitorIDService.access$102(this$0, null);
        VisitorIDService.access$302(this$0, 600L);
        StaticMethods.logDebugFormat("ID Service - Did not return an ID, generating one locally (mid: %s, ttl: %d)", new Object[] { VisitorIDService.access$000(this$0), Long.valueOf(VisitorIDService.access$300(this$0)) });
      }
      catch (JSONException localJSONException2)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("ID Service - Unable to read error condition(%s)", new Object[] { localJSONException2.getLocalizedMessage() });
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.VisitorIDService.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */