package com.adobe.mobile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONException;
import org.json.JSONObject;

public class AudienceManagerWorker$SubmitSignalTask
  implements Runnable
{
  public final AudienceManager.AudienceManagerCallback callback;
  public final Map data;
  
  public AudienceManagerWorker$SubmitSignalTask(Map paramMap, AudienceManager.AudienceManagerCallback paramAudienceManagerCallback)
  {
    data = paramMap;
    callback = paramAudienceManagerCallback;
  }
  
  public void run()
  {
    localHashMap = new HashMap();
    do
    {
      do
      {
        try
        {
          boolean bool = MobileConfig.getInstance().mobileUsingAudienceManager();
          if (!bool) {
            return;
          }
        }
        catch (IOException localIOException)
        {
          Object localObject3;
          StringBuilder localStringBuilder;
          StaticMethods.logWarningFormat("Audience Manager - Unable to read response from server (%s)", new Object[] { localIOException.getLocalizedMessage() });
          return;
          ((BufferedReader)localObject3).close();
          Object localObject1 = new JSONObject(localIOException.toString());
          AudienceManagerWorker.access$500((JSONObject)localObject1);
          AudienceManagerWorker.access$600(((JSONObject)localObject1).getString("uuid"));
          localObject1 = AudienceManagerWorker.access$700((JSONObject)localObject1);
          if (((HashMap)localObject1).size() > 0) {
            break label383;
          }
          StaticMethods.logWarningFormat("Audience Manager - response was empty", new Object[0]);
          return;
          StaticMethods.logDebugFormat("Audience Manager - response (%s)", new Object[] { localObject1 });
          AudienceManagerWorker.access$800((Map)localObject1);
          localHashMap.putAll((Map)localObject1);
          return;
        }
        catch (JSONException localJSONException)
        {
          StaticMethods.logWarningFormat("Audience Manager - Unable to parse JSON data (%s)", new Object[] { localJSONException.getLocalizedMessage() });
          return;
        }
        catch (Exception localException)
        {
          StaticMethods.logWarningFormat("Audience Manager - Unexpected error parsing result (%s)", new Object[] { localException.getLocalizedMessage() });
          return;
        }
        finally
        {
          if (callback == null) {
            break label547;
          }
          new Thread(new AudienceManagerWorker.SubmitSignalTask.1(this, localHashMap)).start();
        }
        if (MobileConfig.getInstance().getPrivacyStatus() != MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_OUT) {
          break;
        }
        StaticMethods.logDebugFormat("Audience Manager - Privacy status is set to opt out, no signals will be submitted.", new Object[0]);
      } while (callback == null);
      new Thread(new AudienceManagerWorker.SubmitSignalTask.1(this, localHashMap)).start();
      return;
      localObject3 = AudienceManagerWorker.access$400(data);
      if (((String)localObject3).length() > 1) {
        break;
      }
      StaticMethods.logWarningFormat("Audience Manager - Unable to create URL object", new Object[0]);
    } while (callback == null);
    new Thread(new AudienceManagerWorker.SubmitSignalTask.1(this, localHashMap)).start();
    return;
    StaticMethods.logDebugFormat("Audience Manager - request (%s)", new Object[] { localObject3 });
    localStringBuilder = new StringBuilder();
    localObject3 = new DefaultHttpClient().execute(new HttpGet((String)localObject3));
    if (((HttpResponse)localObject3).getStatusLine().getStatusCode() == 200)
    {
      localObject3 = new BufferedReader(new InputStreamReader(((HttpResponse)localObject3).getEntity().getContent(), "UTF-8"));
      for (;;)
      {
        String str = ((BufferedReader)localObject3).readLine();
        if (str == null) {
          break;
        }
        localStringBuilder.append(str);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AudienceManagerWorker.SubmitSignalTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */