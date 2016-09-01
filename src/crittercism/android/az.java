package crittercism.android;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ActivityManager.RunningServiceInfo;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.ConditionVariable;
import android.os.Looper;
import android.os.MessageQueue;
import android.os.MessageQueue.IdleHandler;
import android.os.Process;
import com.crittercism.app.CrittercismConfig;
import com.crittercism.app.Transaction;
import java.io.File;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONObject;

public final class az
  implements au, aw, ax, f
{
  static az a;
  public du A = null;
  int B = 0;
  public boolean C = false;
  private String D = null;
  private bs E;
  private bs F;
  private g G = null;
  private at H;
  private boolean I = false;
  private String J = "";
  public boolean b = false;
  public Context c = null;
  public final ConditionVariable d = new ConditionVariable(false);
  public final ConditionVariable e = new ConditionVariable(false);
  public dx f = new dx();
  bs g;
  bs h;
  bs i;
  bs j;
  bs k;
  bs l;
  bs m;
  bs n;
  bs o;
  cw p = null;
  public dh q = null;
  ExecutorService r = Executors.newCachedThreadPool(new ea());
  public ExecutorService s = Executors.newSingleThreadExecutor(new ea());
  public boolean t = false;
  public bb u;
  protected e v = new e(s);
  public ds w;
  dw x = null;
  public bi y;
  public Map z = new HashMap();
  
  public static az A()
  {
    if (a == null) {
      a = new az();
    }
    return a;
  }
  
  private static boolean F()
  {
    boolean bool2 = false;
    StackTraceElement[] arrayOfStackTraceElement = Thread.currentThread().getStackTrace();
    int i1 = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i1 < arrayOfStackTraceElement.length)
      {
        StackTraceElement localStackTraceElement = arrayOfStackTraceElement[i1];
        if ((localStackTraceElement.getMethodName().equals("onCreate")) || (localStackTraceElement.getMethodName().equals("onResume"))) {
          bool1 = true;
        }
      }
      else
      {
        return bool1;
      }
      i1 += 1;
    }
  }
  
  private void G()
  {
    int i2 = Process.myUid();
    int i3 = Process.myPid();
    Object localObject = (ActivityManager)c.getSystemService("activity");
    Iterator localIterator = ((ActivityManager)localObject).getRunningAppProcesses().iterator();
    int i1 = 0;
    if (localIterator.hasNext())
    {
      if (nextuid != i2) {
        break label128;
      }
      i1 += 1;
    }
    label128:
    for (;;)
    {
      break;
      if (i1 <= 1) {
        t = false;
      }
      do
      {
        return;
        while (!((Iterator)localObject).hasNext()) {
          localObject = ((ActivityManager)localObject).getRunningServices(Integer.MAX_VALUE).iterator();
        }
      } while (nextpid != i3);
      t = true;
      return;
    }
  }
  
  private String H()
  {
    try
    {
      if ((J == null) || (J.equals(""))) {
        J = c.getPackageName();
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        dy.c("Call to getPackageName() failed.  Please contact us at support@crittercism.com.");
        J = new String();
      }
    }
    return J;
  }
  
  public final boolean B()
  {
    d.block();
    return f.b();
  }
  
  @TargetApi(5)
  public final void C()
  {
    du localdu = A;
    if (A != null) {
      A.d();
    }
  }
  
  @TargetApi(5)
  public final String D()
  {
    PackageManager localPackageManager = c.getPackageManager();
    String str = H();
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (str != null)
    {
      localObject1 = localObject2;
      if (str.length() > 0)
      {
        localObject1 = dq.a(localPackageManager.getInstallerPackageName(str));
        if (localObject1 == null) {
          break label58;
        }
        localObject1 = ((do)localObject1).a(str).a();
      }
    }
    return (String)localObject1;
    label58:
    dy.c("Could not find app market for this app.  Will try rate-my-app test target in config.");
    return u.getRateMyAppTestTarget();
  }
  
  public final void E()
  {
    if (t) {}
    az.3 local3;
    do
    {
      return;
      local3 = new az.3(this, this);
    } while (q.a(local3));
    r.execute(local3);
  }
  
  public final AlertDialog a(Context paramContext, String paramString1, String paramString2)
  {
    int i1 = 0;
    if (f.b()) {
      dy.b("User has opted out of crittercism.  generateRateMyAppAlertDialog returning null.");
    }
    while (i1 == 0)
    {
      return null;
      if (!(paramContext instanceof Activity)) {
        dy.b("Context object must be an instance of Activity for AlertDialog to form correctly.  generateRateMyAppAlertDialog returning null.");
      } else if ((paramString2 == null) || ((paramString2 != null) && (paramString2.length() == 0))) {
        dy.b("Message has to be a non-empty string.  generateRateMyAppAlertDialog returning null.");
      } else if (Build.VERSION.SDK_INT < 5) {
        dy.b("Rate my app not supported below api level 5");
      } else {
        i1 = 1;
      }
    }
    String str = D();
    if (str == null)
    {
      dy.b("Cannot create proper URI to open app market.  Returning null.");
      return null;
    }
    paramContext = new AlertDialog.Builder(paramContext);
    paramContext.setTitle(paramString1).setMessage(paramString2);
    try
    {
      paramContext = paramContext.create();
      paramContext.setButton(-1, "Yes", new az.10(this, str));
      paramContext.setButton(-2, "No", new az.11(this));
      paramContext.setButton(-3, "Maybe Later", new az.12(this));
      return paramContext;
    }
    catch (Exception paramContext)
    {
      dy.b("Failed to create AlertDialog instance from AlertDialog.Builder.  Did you remember to call Looper.prepare() before calling Crittercism.generateRateMyAppAlertDialog()?");
    }
    return null;
  }
  
  public final String a()
  {
    String str2 = D;
    String str1 = str2;
    if (str2 == null) {
      str1 = "";
    }
    return str1;
  }
  
  public final String a(String paramString1, String paramString2)
  {
    Object localObject = null;
    SharedPreferences localSharedPreferences = c.getSharedPreferences(paramString1, 0);
    paramString1 = (String)localObject;
    if (localSharedPreferences != null) {
      paramString1 = localSharedPreferences.getString(paramString2, null);
    }
    return paramString1;
  }
  
  public final void a(Context paramContext, String paramString, CrittercismConfig paramCrittercismConfig)
  {
    dy.a("Initializing Crittercism 5.0.6 for App ID " + paramString);
    D = paramString;
    u = new bb(paramString, paramCrittercismConfig);
    c = paramContext;
    H = new at(c, u);
    J = paramContext.getPackageName();
    w = new ds(paramContext);
    G();
    long l1 = 60000000000L;
    if (t) {
      l1 = 12000000000L;
    }
    p = new cw(l1);
    if (!F()) {
      dy.c("Crittercism should be initialized in onCreate() of MainActivity");
    }
    bx.a(H);
    bx.a(c);
    bx.a(new cc());
    bx.a(new bf(c, u));
    for (;;)
    {
      try
      {
        v.a(u.a());
        v.b(u.getPreserveQueryStringPatterns());
        G = new g(this, new URL(u.c() + "/api/apm/network"));
        v.a(G);
        v.a(this);
        new dz(G, "OPTMZ").start();
        if (!h.a(c).exists())
        {
          boolean bool = u.isServiceMonitoringEnabled();
          if (bool) {
            continue;
          }
        }
      }
      catch (Exception paramString)
      {
        new StringBuilder("Exception in startApm: ").append(paramString.getClass().getName());
        dy.b();
        dy.c();
        continue;
        dy.b();
        ((Application)c).registerActivityLifecycleCallbacks(new av(c, this));
        continue;
        dy.a("API Level is less than 14. Automatic breadcrumbs are not supported.");
        continue;
      }
      q = new dh(u, paramContext, this, this, this);
      if (!t) {
        dy.a(new ed(this, s, q, f));
      }
      paramContext = Thread.getDefaultUncaughtExceptionHandler();
      if (!(paramContext instanceof ay)) {
        Thread.setDefaultUncaughtExceptionHandler(new ay(this, paramContext));
      }
      if (Build.VERSION.SDK_INT < 14) {
        continue;
      }
      if ((c instanceof Application)) {
        continue;
      }
      dy.c("Application context not provided. Automatic breadcrumbs will not be recorded.");
      if (!t)
      {
        bg.b(this);
        if (Looper.myLooper() == Looper.getMainLooper()) {
          Looper.myQueue().addIdleHandler(new a((byte)0));
        }
      }
      new dz(q).start();
      b = true;
      return;
      paramString = new d(c);
      I = new i(v, paramString).a();
      new StringBuilder("installedApm = ").append(I);
      dy.b();
    }
  }
  
  public final void a(bh parambh)
  {
    bi localbi = y;
    if (y == null) {}
    do
    {
      return;
      bg.a(parambh);
      bg.i();
    } while (!a);
    y.a(b, TimeUnit.SECONDS);
    y.b();
  }
  
  public final void a(c paramc)
  {
    paramc = new az.8(this, paramc);
    if (!q.a(paramc)) {
      s.execute(paramc);
    }
  }
  
  public final void a(ci paramci)
  {
    if (f.b()) {}
    do
    {
      return;
      paramci = new az.9(this, paramci);
    } while (q.a(paramci));
    s.execute(paramci);
  }
  
  public final void a(h paramh)
  {
    if (G == null) {}
    while ((!a) || (c)) {
      return;
    }
    dy.a("Enabling OPTMZ");
    G.a(d, TimeUnit.SECONDS);
    G.a();
  }
  
  @TargetApi(5)
  public final void a(String paramString)
  {
    Object localObject = A;
    if (A != null) {
      A.d();
    }
    localObject = new Intent("android.intent.action.VIEW");
    ((Intent)localObject).setFlags(268435456);
    ((Intent)localObject).setData(Uri.parse(paramString));
    c.startActivity((Intent)localObject);
  }
  
  public final void a(String paramString1, String paramString2, int paramInt)
  {
    paramString1 = c.getSharedPreferences(paramString1, 0);
    if (paramString1 != null)
    {
      paramString1 = paramString1.edit();
      if (paramString1 != null)
      {
        paramString1.remove(paramString2);
        paramString1.putInt(paramString2, paramInt);
        paramString1.commit();
      }
    }
  }
  
  public final void a(String paramString1, String paramString2, String paramString3)
  {
    paramString1 = c.getSharedPreferences(paramString1, 0);
    if (paramString1 != null)
    {
      paramString1 = paramString1.edit();
      if (paramString1 != null)
      {
        paramString1.remove(paramString2);
        paramString1.putString(paramString2, paramString3);
        paramString1.commit();
      }
    }
  }
  
  public final void a(String paramString, URL paramURL, long paramLong1, long paramLong2, long paramLong3, int paramInt, Exception paramException, long paramLong4)
  {
    if (paramString == null)
    {
      dy.b("Null HTTP request method provided. Endpoint will not be logged.");
      return;
    }
    String str = paramString.toUpperCase(Locale.US);
    Object localObject = new HashSet();
    ((Set)localObject).add("GET");
    ((Set)localObject).add("POST");
    ((Set)localObject).add("HEAD");
    ((Set)localObject).add("PUT");
    ((Set)localObject).add("DELETE");
    ((Set)localObject).add("TRACE");
    ((Set)localObject).add("OPTIONS");
    ((Set)localObject).add("CONNECT");
    ((Set)localObject).add("PATCH");
    if (!((Set)localObject).contains(str)) {
      dy.c("Logging endpoint with invalid HTTP request method: " + paramString);
    }
    if (paramURL == null)
    {
      dy.b("Null URL provided. Endpoint will not be logged");
      return;
    }
    if ((paramLong2 < 0L) || (paramLong3 < 0L))
    {
      dy.b("Invalid byte values. Bytes need to be non-negative. Endpoint will not be logged.");
      return;
    }
    if (paramInt != 0) {
      if ((paramInt < 100) || (paramInt >= 600)) {
        dy.c("Logging endpoint with invalid HTTP response code: " + Integer.toString(paramInt));
      }
    }
    for (;;)
    {
      paramString = new d(c).a();
      if (paramLong1 >= 0L) {
        break;
      }
      dy.b("Invalid latency. Endpoint will not be logged.");
      return;
      if (paramException == null) {
        dy.c("Logging endpoint with null error and response code of 0.");
      }
    }
    if (paramLong4 < 0L)
    {
      dy.b("Invalid start time. Endpoint will not be logged.");
      return;
    }
    localObject = new c();
    f = str;
    ((c)localObject).a(paramURL.toExternalForm());
    ((c)localObject).b(paramLong2);
    ((c)localObject).d(paramLong3);
    e = paramInt;
    j = paramString;
    ((c)localObject).e(paramLong4);
    ((c)localObject).f(paramLong4 + paramLong1);
    if (bc.b()) {
      ((c)localObject).a(bc.a());
    }
    ((c)localObject).a(paramException);
    v.a((c)localObject, c.a.l);
  }
  
  final void a(Throwable paramThrowable)
  {
    List localList = bg.a(this, paramThrowable instanceof cq);
    paramThrowable = new bk(paramThrowable, Thread.currentThread().getId());
    paramThrowable.a("crashed_session", k);
    if (F.b() > 0) {
      paramThrowable.a("previous_session", F);
    }
    paramThrowable.a(l);
    b = bom).a;
    e = new JSONArray();
    Iterator localIterator = Thread.getAllStackTraces().entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      HashMap localHashMap = new HashMap();
      Thread localThread = (Thread)localEntry.getKey();
      if (localThread.getId() != a)
      {
        localHashMap.put("name", localThread.getName());
        localHashMap.put("id", Long.valueOf(localThread.getId()));
        localHashMap.put("state", localThread.getState().name());
        localHashMap.put("stacktrace", new JSONArray(Arrays.asList((Object[])localEntry.getValue())));
        e.put(new JSONObject(localHashMap));
      }
    }
    paramThrowable.a(localList);
    j.a(paramThrowable);
    paramThrowable = new dg(c);
    paramThrowable.a(g, new db.a(), u.e(), "/v0/appload/", null, this, new ct.b());
    paramThrowable.a(h, new db.a(), u.b(), "/android_v2/handle_exceptions", null, this, new cv.a());
    paramThrowable.a(i, new db.a(), u.b(), "/android_v2/handle_ndk_crashes", null, this, new cv.a());
    paramThrowable.a(j, new db.a(), u.b(), "/android_v2/handle_crashes", null, this, new cv.a());
    try
    {
      paramThrowable.a();
      return;
    }
    catch (InterruptedException paramThrowable)
    {
      new StringBuilder("InterruptedException in logCrashException: ").append(paramThrowable.getMessage());
      dy.b();
      dy.c();
      return;
    }
    catch (Throwable paramThrowable)
    {
      new StringBuilder("Unexpected throwable in logCrashException: ").append(paramThrowable.getMessage());
      dy.b();
      dy.c();
    }
  }
  
  public final void a(JSONObject paramJSONObject)
  {
    if (t) {}
    do
    {
      return;
      paramJSONObject = new az.2(this, this, paramJSONObject);
    } while (q.a(paramJSONObject));
    s.execute(paramJSONObject);
  }
  
  public final int b(String paramString)
  {
    if (t)
    {
      dy.c("Transactions are not supported for services. Returning default value of -1 for " + paramString + ".");
      return -1;
    }
    for (;;)
    {
      synchronized (z)
      {
        paramString = (Transaction)z.get(paramString);
        if (paramString != null)
        {
          i1 = paramString.d();
          return i1;
        }
      }
      int i1 = -1;
    }
  }
  
  public final int b(String paramString1, String paramString2)
  {
    int i1 = 0;
    paramString1 = c.getSharedPreferences(paramString1, 0);
    if (paramString1 != null) {
      i1 = paramString1.getInt(paramString2, 0);
    }
    return i1;
  }
  
  public final String b()
  {
    return H.a;
  }
  
  public final void b(Throwable paramThrowable)
  {
    if (paramThrowable == null) {}
    for (;;)
    {
      try
      {
        dy.c("Calling logHandledException with a null java.lang.Throwable. Nothing will be reported to Crittercism");
        return;
      }
      finally {}
      if (t)
      {
        paramThrowable = new az.5(this, paramThrowable, Thread.currentThread().getId());
        if (!q.a(paramThrowable)) {
          s.execute(paramThrowable);
        }
      }
      else
      {
        paramThrowable = new az.6(this, paramThrowable, Thread.currentThread().getId());
        if (!q.a(paramThrowable)) {
          s.execute(paramThrowable);
        }
      }
    }
  }
  
  public final String c()
  {
    String str = "";
    if (w != null) {
      str = w.a();
    }
    return str;
  }
  
  public final boolean c(String paramString1, String paramString2)
  {
    boolean bool = false;
    paramString1 = c.getSharedPreferences(paramString1, 0);
    if (paramString1 != null) {
      bool = paramString1.getBoolean(paramString2, false);
    }
    return bool;
  }
  
  public final String d()
  {
    return "5.0.6";
  }
  
  public final int e()
  {
    int i1 = -1;
    if (f != null) {
      i1 = Integer.valueOf(f.a().a).intValue();
    }
    return i1;
  }
  
  public final String f()
  {
    return bx.fa;
  }
  
  public final int g()
  {
    return bx.oa.intValue();
  }
  
  public final int h()
  {
    return bx.pa.intValue();
  }
  
  public final String i()
  {
    return "Android";
  }
  
  public final String j()
  {
    return Build.MODEL;
  }
  
  public final String k()
  {
    return Build.VERSION.RELEASE;
  }
  
  public final dx l()
  {
    return f;
  }
  
  public final du m()
  {
    return A;
  }
  
  public final bs n()
  {
    return g;
  }
  
  public final bs o()
  {
    return h;
  }
  
  public final bs p()
  {
    return E;
  }
  
  public final bs q()
  {
    return i;
  }
  
  public final bs r()
  {
    return j;
  }
  
  public final bs s()
  {
    return k;
  }
  
  public final bs t()
  {
    return l;
  }
  
  public final bs u()
  {
    return F;
  }
  
  public final bs v()
  {
    return m;
  }
  
  public final bs w()
  {
    return n;
  }
  
  public final bs x()
  {
    return o;
  }
  
  public final dw y()
  {
    return x;
  }
  
  public final void z()
  {
    if (t) {}
    for (k = new bs(c, br.f).a(c);; k = new bs(c, br.f))
    {
      F = new bs(c, br.h);
      l = new bs(c, br.g);
      m = new bs(c, br.k);
      g = new bs(c, br.a);
      h = new bs(c, br.b);
      E = new bs(c, br.c);
      i = new bs(c, br.d);
      j = new bs(c, br.e);
      n = new bs(c, br.i);
      o = new bs(c, br.j);
      if (!t) {
        x = new dw(c, D);
      }
      return;
    }
  }
  
  static final class a
    implements MessageQueue.IdleHandler
  {
    private boolean a = false;
    
    public final boolean queueIdle()
    {
      try
      {
        if (!a)
        {
          a = true;
          bg.g();
        }
        return true;
      }
      finally {}
    }
  }
}

/* Location:
 * Qualified Name:     crittercism.android.az
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */