package crittercism.android;

import java.util.Map;
import org.json.JSONObject;

final class az$3
  extends dj
{
  az$3(az paramaz1, az paramaz2) {}
  
  public final void a()
  {
    if (a.f.b()) {
      return;
    }
    cv localcv = new cv(a);
    JSONObject localJSONObject = a.x.a();
    a.put("metadata", localJSONObject);
    new dk(localcv, new dd(new dc(b.u.b(), "/android_v2/update_user_metadata").a()), new de(a.x)).run();
  }
}

/* Location:
 * Qualified Name:     crittercism.android.az.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */