package crittercism.android;

import android.os.Build.VERSION;
import android.os.Process;
import com.crittercism.app.Transaction;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class bg
  extends Transaction
  implements ch
{
  private static ExecutorService b = Executors.newSingleThreadExecutor(new ea());
  private static ScheduledExecutorService c = Executors.newScheduledThreadPool(1, new ea());
  private static List o = new LinkedList();
  private static volatile long p = 0L;
  private static volatile long q = 0L;
  private static final int[] r = { 32, 544, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 8224 };
  private static bg s = null;
  private static bh t = new bh();
  private String d;
  private long e = -1L;
  private int f = -1;
  private long g;
  private long h;
  private long i;
  private a j;
  private Map k;
  private String l;
  private long m;
  private ScheduledFuture n = null;
  
  public bg(az paramaz, String paramString)
  {
    if (paramString.length() > 255) {
      dy.c("Transaction name exceeds 255 characters! Truncating to first 255 characters.");
    }
    for (d = paramString.substring(0, 255);; d = paramString)
    {
      j = a.a;
      k = new HashMap();
      a = paramaz;
      l = cg.a.a();
      e = -1L;
      paramaz = td.optJSONObject(paramString);
      if (paramaz != null) {
        i1 = paramaz.optInt("value", -1);
      }
      f = i1;
      return;
    }
  }
  
  private bg(bg parambg)
  {
    d = d;
    e = e;
    f = f;
    g = g;
    h = h;
    j = j;
    k = k;
    l = l;
    i = i;
    m = m;
  }
  
  public bg(JSONArray paramJSONArray)
  {
    d = paramJSONArray.getString(0);
    j = a.values()[paramJSONArray.getInt(1)];
    e = ((int)(paramJSONArray.getDouble(2) * 1000.0D));
    f = paramJSONArray.optInt(3, -1);
    k = new HashMap();
    JSONObject localJSONObject = paramJSONArray.getJSONObject(4);
    Iterator localIterator = localJSONObject.keys();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      k.put(str, localJSONObject.getString(str));
    }
    g = ee.a.a(paramJSONArray.getString(5));
    h = ee.a.a(paramJSONArray.getString(6));
    i = ((paramJSONArray.optDouble(7, 0.0D) * Math.pow(10.0D, 9.0D)));
    l = cg.a.a();
  }
  
  public static List a(az paramaz, boolean paramBoolean)
  {
    LinkedList localLinkedList = new LinkedList();
    for (;;)
    {
      long l1;
      long l2;
      int i1;
      synchronized (o)
      {
        localLinkedList.addAll(o);
        l1 = System.currentTimeMillis();
        l2 = System.nanoTime();
        i1 = localLinkedList.size() - 1;
        if (i1 < 0) {
          break;
        }
      }
      synchronized ((bg)localLinkedList.get(i1))
      {
        if (j == a.b)
        {
          h = l1;
          j = a.g;
          if (l()) {
            i = (l2 - Math.max(p, m) + i);
          }
          ((bg)???).r();
          i1 -= 1;
          continue;
          paramaz = finally;
          throw paramaz;
        }
        else
        {
          localLinkedList.remove(i1);
        }
      }
    }
    FutureTask localFutureTask = new FutureTask(new bg.2(paramaz), null);
    synchronized (b)
    {
      b.execute(localFutureTask);
      if (!paramBoolean) {
        b.shutdown();
      }
      try
      {
        localFutureTask.get();
        return localLinkedList;
      }
      catch (InterruptedException paramaz)
      {
        dy.a(paramaz);
        return localLinkedList;
      }
      catch (ExecutionException paramaz)
      {
        dy.a(paramaz);
      }
      z.clear();
    }
    return localLinkedList;
  }
  
  private void a(long paramLong)
  {
    if (l()) {
      n = c.schedule(new bg.5(this), paramLong, TimeUnit.MILLISECONDS);
    }
  }
  
  public static void a(aw paramaw)
  {
    bs localbs;
    try
    {
      localbs = paramaw.w();
      Object localObject1 = localbs.c();
      l1 = System.currentTimeMillis();
      localObject1 = ((List)localObject1).iterator();
      do
      {
        if (!((Iterator)localObject1).hasNext()) {
          break;
        }
        localObject2 = (JSONArray)((bz)((Iterator)localObject1).next()).a();
      } while (localObject2 == null);
    }
    catch (ThreadDeath paramaw)
    {
      for (;;)
      {
        try
        {
          long l1;
          Object localObject2 = new bg((JSONArray)localObject2);
          h = l1;
          j = a.h;
          paramaw.x().a((ch)localObject2);
        }
        catch (JSONException localJSONException)
        {
          dy.a(localJSONException);
          continue;
          paramaw = paramaw;
          throw paramaw;
        }
        catch (ParseException localParseException)
        {
          dy.a(localParseException);
        }
      }
    }
    catch (Throwable paramaw)
    {
      dy.a(paramaw);
      return;
    }
    localbs.a();
  }
  
  public static void a(az arg0)
  {
    q = System.nanoTime();
    Object localObject1 = new LinkedList();
    for (;;)
    {
      synchronized (o)
      {
        ((List)localObject1).addAll(o);
        Iterator localIterator = ((List)localObject1).iterator();
        if (!localIterator.hasNext()) {
          break;
        }
        synchronized ((bg)localIterator.next())
        {
          if (j == a.b)
          {
            if (m < p) {
              break label128;
            }
            if (m <= q) {
              i += q - m;
            }
          }
          ((bg)???).r();
        }
      }
      label128:
      i += q - p;
    }
    localObject1 = new FutureTask(new bg.1((List)localObject1, ???), null);
    synchronized (b)
    {
      b.execute((Runnable)localObject1);
    }
    try
    {
      ((FutureTask)localObject1).get();
      return;
    }
    catch (InterruptedException ???)
    {
      dy.a(???);
      return;
    }
    catch (ExecutionException ???)
    {
      dy.a(???);
    }
    localObject2 = finally;
    throw ((Throwable)localObject2);
  }
  
  private void a(a parama)
  {
    if ((parama != a.c) && (parama != a.e)) {
      a locala = a.i;
    }
    if (j == a.b)
    {
      r();
      b(parama);
    }
    while (j == a.f) {
      return;
    }
    dy.b("Transaction " + d + " is not running. Either it has not been started or it has been stopped.", new IllegalStateException("Transaction is not running"));
  }
  
  public static void a(bh parambh)
  {
    t = parambh;
  }
  
  private void b(int paramInt)
  {
    if (paramInt < 0) {}
    for (;;)
    {
      try
      {
        dy.c("Ignoring Transaction.setValue(int) call. Negative parameter provided.");
        return;
      }
      finally {}
      if (j == a.a)
      {
        f = paramInt;
      }
      else
      {
        if (j == a.b)
        {
          f = paramInt;
          bg.7 local7 = new bg.7(this, new bg(this));
          synchronized (b)
          {
            b.execute(local7);
          }
        }
        dy.b("Transaction " + d + " no longer in progress. Ignoring setValue(int) call.", new IllegalStateException("Transaction no longer in progress"));
      }
    }
  }
  
  /* Error */
  public static void b(az arg0)
  {
    // Byte code:
    //   0: new 2	crittercism/android/bg
    //   3: dup
    //   4: aload_0
    //   5: ldc_w 416
    //   8: invokespecial 418	crittercism/android/bg:<init>	(Lcrittercism/android/az;Ljava/lang/String;)V
    //   11: astore 5
    //   13: aload 5
    //   15: putstatic 74	crittercism/android/bg:s	Lcrittercism/android/bg;
    //   18: aload 5
    //   20: monitorenter
    //   21: invokestatic 420	crittercism/android/bg:m	()J
    //   24: lstore_1
    //   25: lload_1
    //   26: ldc2_w 83
    //   29: lcmp
    //   30: ifeq +165 -> 195
    //   33: getstatic 74	crittercism/android/bg:s	Lcrittercism/android/bg;
    //   36: getstatic 258	crittercism/android/bg$a:b	Lcrittercism/android/bg$a;
    //   39: putfield 113	crittercism/android/bg:j	Lcrittercism/android/bg$a;
    //   42: getstatic 74	crittercism/android/bg:s	Lcrittercism/android/bg;
    //   45: astore 6
    //   47: invokestatic 425	android/os/SystemClock:elapsedRealtime	()J
    //   50: lstore_3
    //   51: aload 6
    //   53: invokestatic 246	java/lang/System:currentTimeMillis	()J
    //   56: lload_3
    //   57: lload_1
    //   58: lsub
    //   59: lsub
    //   60: putfield 149	crittercism/android/bg:g	J
    //   63: getstatic 74	crittercism/android/bg:s	Lcrittercism/android/bg;
    //   66: astore 6
    //   68: getstatic 428	java/util/concurrent/TimeUnit:NANOSECONDS	Ljava/util/concurrent/TimeUnit;
    //   71: lload_1
    //   72: getstatic 314	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   75: invokevirtual 432	java/util/concurrent/TimeUnit:convert	(JLjava/util/concurrent/TimeUnit;)J
    //   78: lstore_1
    //   79: getstatic 428	java/util/concurrent/TimeUnit:NANOSECONDS	Ljava/util/concurrent/TimeUnit;
    //   82: invokestatic 425	android/os/SystemClock:elapsedRealtime	()J
    //   85: getstatic 314	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   88: invokevirtual 432	java/util/concurrent/TimeUnit:convert	(JLjava/util/concurrent/TimeUnit;)J
    //   91: lstore_3
    //   92: aload 6
    //   94: invokestatic 249	java/lang/System:nanoTime	()J
    //   97: lload_3
    //   98: lload_1
    //   99: lsub
    //   100: lsub
    //   101: putfield 155	crittercism/android/bg:m	J
    //   104: getstatic 74	crittercism/android/bg:s	Lcrittercism/android/bg;
    //   107: getstatic 79	crittercism/android/bg:t	Lcrittercism/android/bh;
    //   110: getstatic 74	crittercism/android/bg:s	Lcrittercism/android/bg;
    //   113: getfield 109	crittercism/android/bg:d	Ljava/lang/String;
    //   116: invokevirtual 433	crittercism/android/bh:a	(Ljava/lang/String;)J
    //   119: putfield 86	crittercism/android/bg:e	J
    //   122: getstatic 66	crittercism/android/bg:o	Ljava/util/List;
    //   125: astore 6
    //   127: aload 6
    //   129: monitorenter
    //   130: getstatic 66	crittercism/android/bg:o	Ljava/util/List;
    //   133: getstatic 74	crittercism/android/bg:s	Lcrittercism/android/bg;
    //   136: invokeinterface 437 2 0
    //   141: pop
    //   142: aload 6
    //   144: monitorexit
    //   145: new 439	crittercism/android/bg$3
    //   148: dup
    //   149: aload_0
    //   150: new 2	crittercism/android/bg
    //   153: dup
    //   154: getstatic 74	crittercism/android/bg:s	Lcrittercism/android/bg;
    //   157: invokespecial 407	crittercism/android/bg:<init>	(Lcrittercism/android/bg;)V
    //   160: invokespecial 442	crittercism/android/bg$3:<init>	(Lcrittercism/android/az;Lcrittercism/android/bg;)V
    //   163: astore 6
    //   165: getstatic 55	crittercism/android/bg:b	Ljava/util/concurrent/ExecutorService;
    //   168: astore_0
    //   169: aload_0
    //   170: monitorenter
    //   171: getstatic 55	crittercism/android/bg:b	Ljava/util/concurrent/ExecutorService;
    //   174: aload 6
    //   176: invokeinterface 287 2 0
    //   181: getstatic 74	crittercism/android/bg:s	Lcrittercism/android/bg;
    //   184: getstatic 74	crittercism/android/bg:s	Lcrittercism/android/bg;
    //   187: getfield 86	crittercism/android/bg:e	J
    //   190: invokespecial 444	crittercism/android/bg:a	(J)V
    //   193: aload_0
    //   194: monitorexit
    //   195: aload 5
    //   197: monitorexit
    //   198: return
    //   199: astore_0
    //   200: aload 6
    //   202: monitorexit
    //   203: aload_0
    //   204: athrow
    //   205: astore_0
    //   206: aload 5
    //   208: monitorexit
    //   209: aload_0
    //   210: athrow
    //   211: astore_0
    //   212: aload_0
    //   213: athrow
    //   214: astore 6
    //   216: aload_0
    //   217: monitorexit
    //   218: aload 6
    //   220: athrow
    //   221: astore_0
    //   222: aload_0
    //   223: invokestatic 303	crittercism/android/dy:a	(Ljava/lang/Throwable;)V
    //   226: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   24	75	1	l1	long
    //   50	48	3	l2	long
    //   11	196	5	localbg	bg
    //   214	5	6	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   130	145	199	finally
    //   21	25	205	finally
    //   33	130	205	finally
    //   145	171	205	finally
    //   195	198	205	finally
    //   200	205	205	finally
    //   216	221	205	finally
    //   0	21	211	java/lang/ThreadDeath
    //   206	211	211	java/lang/ThreadDeath
    //   171	195	214	finally
    //   0	21	221	java/lang/Throwable
    //   206	211	221	java/lang/Throwable
  }
  
  private void b(a arg1)
  {
    j = ???;
    h = System.currentTimeMillis();
    long l1 = System.nanoTime();
    if (l()) {
      i = (l1 - Math.max(p, m) + i);
    }
    bg.6 local6;
    synchronized (o)
    {
      o.remove(this);
      local6 = new bg.6(this, new bg(this));
    }
    synchronized (b)
    {
      b.execute(local6);
      return;
      localObject1 = finally;
      throw ((Throwable)localObject1);
    }
  }
  
  public static void f()
  {
    p = System.nanoTime();
    ??? = new LinkedList();
    synchronized (o)
    {
      ((List)???).addAll(o);
      if ((s == null) || (q != 0L)) {}
    }
    for (;;)
    {
      synchronized (s)
      {
        bg localbg = s;
        i += p - sm;
        ??? = ((List)???).iterator();
        if (!((Iterator)???).hasNext()) {
          break;
        }
        synchronized ((bg)((Iterator)???).next())
        {
          if (j == a.b)
          {
            if ((n == null) || (!n.isCancelled())) {
              break label176;
            }
            ((bg)???).a(e - TimeUnit.MILLISECONDS.convert(i, TimeUnit.NANOSECONDS));
          }
        }
        localObject2 = finally;
        throw ((Throwable)localObject2);
      }
      label176:
      if (n == null) {
        ((bg)localObject3).a(e);
      }
    }
  }
  
  public static void g()
  {
    try
    {
      if (s != null) {
        s.b();
      }
      return;
    }
    catch (ThreadDeath localThreadDeath)
    {
      throw localThreadDeath;
    }
    catch (Throwable localThrowable)
    {
      dy.a(localThrowable);
    }
  }
  
  public static void i()
  {
    Object localObject2 = new LinkedList();
    synchronized (o)
    {
      ((List)localObject2).addAll(o);
      localObject2 = ((List)localObject2).iterator();
      while (((Iterator)localObject2).hasNext()) {
        synchronized ((bg)((Iterator)localObject2).next())
        {
          if (j == a.b)
          {
            e = t.a(d);
            ((bg)???).r();
            ((bg)???).a(e);
          }
        }
      }
    }
  }
  
  private static boolean l()
  {
    return p > q;
  }
  
  private static long m()
  {
    long[] arrayOfLong = new long[1];
    int i1 = Process.myPid();
    String str = "/proc/" + i1 + "/stat";
    try
    {
      boolean bool = ((Boolean)Process.class.getDeclaredMethod("readProcFile", new Class[] { String.class, int[].class, String[].class, long[].class, float[].class }).invoke(null, new Object[] { str, r, null, arrayOfLong, null })).booleanValue();
      if (!bool) {
        return -1L;
      }
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      dy.a(localNoSuchMethodException);
      return -1L;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      dy.a(localIllegalArgumentException);
      return -1L;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      dy.a(localIllegalAccessException);
      return -1L;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      dy.a(localInvocationTargetException);
      return -1L;
    }
    return localInvocationTargetException[0] * 10L;
  }
  
  /* Error */
  private void n()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 113	crittercism/android/bg:j	Lcrittercism/android/bg$a;
    //   6: getstatic 111	crittercism/android/bg$a:a	Lcrittercism/android/bg$a;
    //   9: if_acmpne +116 -> 125
    //   12: aload_0
    //   13: getstatic 258	crittercism/android/bg$a:b	Lcrittercism/android/bg$a;
    //   16: putfield 113	crittercism/android/bg:j	Lcrittercism/android/bg$a;
    //   19: aload_0
    //   20: invokestatic 246	java/lang/System:currentTimeMillis	()J
    //   23: putfield 149	crittercism/android/bg:g	J
    //   26: aload_0
    //   27: invokestatic 249	java/lang/System:nanoTime	()J
    //   30: putfield 155	crittercism/android/bg:m	J
    //   33: aload_0
    //   34: getstatic 79	crittercism/android/bg:t	Lcrittercism/android/bh;
    //   37: aload_0
    //   38: getfield 109	crittercism/android/bg:d	Ljava/lang/String;
    //   41: invokevirtual 433	crittercism/android/bh:a	(Ljava/lang/String;)J
    //   44: putfield 86	crittercism/android/bg:e	J
    //   47: getstatic 66	crittercism/android/bg:o	Ljava/util/List;
    //   50: astore_1
    //   51: aload_1
    //   52: monitorenter
    //   53: getstatic 66	crittercism/android/bg:o	Ljava/util/List;
    //   56: aload_0
    //   57: invokeinterface 437 2 0
    //   62: pop
    //   63: aload_1
    //   64: monitorexit
    //   65: new 511	crittercism/android/bg$4
    //   68: dup
    //   69: aload_0
    //   70: new 2	crittercism/android/bg
    //   73: dup
    //   74: aload_0
    //   75: invokespecial 407	crittercism/android/bg:<init>	(Lcrittercism/android/bg;)V
    //   78: invokespecial 512	crittercism/android/bg$4:<init>	(Lcrittercism/android/bg;Lcrittercism/android/bg;)V
    //   81: astore_2
    //   82: getstatic 55	crittercism/android/bg:b	Ljava/util/concurrent/ExecutorService;
    //   85: astore_1
    //   86: aload_1
    //   87: monitorenter
    //   88: getstatic 55	crittercism/android/bg:b	Ljava/util/concurrent/ExecutorService;
    //   91: aload_2
    //   92: invokeinterface 287 2 0
    //   97: aload_0
    //   98: aload_0
    //   99: getfield 86	crittercism/android/bg:e	J
    //   102: invokespecial 444	crittercism/android/bg:a	(J)V
    //   105: aload_1
    //   106: monitorexit
    //   107: aload_0
    //   108: monitorexit
    //   109: return
    //   110: astore_2
    //   111: aload_1
    //   112: monitorexit
    //   113: aload_2
    //   114: athrow
    //   115: astore_1
    //   116: aload_0
    //   117: monitorexit
    //   118: aload_1
    //   119: athrow
    //   120: astore_2
    //   121: aload_1
    //   122: monitorexit
    //   123: aload_2
    //   124: athrow
    //   125: new 379	java/lang/StringBuilder
    //   128: dup
    //   129: ldc_w 381
    //   132: invokespecial 383	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   135: aload_0
    //   136: getfield 109	crittercism/android/bg:d	Ljava/lang/String;
    //   139: invokevirtual 387	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: ldc_w 514
    //   145: invokevirtual 387	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   148: invokevirtual 392	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   151: new 394	java/lang/IllegalStateException
    //   154: dup
    //   155: ldc_w 516
    //   158: invokespecial 397	java/lang/IllegalStateException:<init>	(Ljava/lang/String;)V
    //   161: invokestatic 400	crittercism/android/dy:b	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   164: goto -57 -> 107
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	167	0	this	bg
    //   115	7	1	localObject2	Object
    //   81	11	2	local4	bg.4
    //   110	4	2	localObject3	Object
    //   120	4	2	localObject4	Object
    // Exception table:
    //   from	to	target	type
    //   53	65	110	finally
    //   2	53	115	finally
    //   65	88	115	finally
    //   111	115	115	finally
    //   121	125	115	finally
    //   125	164	115	finally
    //   88	107	120	finally
  }
  
  private void o()
  {
    try
    {
      a(a.c);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private void p()
  {
    try
    {
      a(a.e);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private void q()
  {
    try
    {
      a(a.i);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private void r()
  {
    try
    {
      if (n != null) {
        n.cancel(false);
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private void s()
  {
    try
    {
      if (j == a.b) {
        b(a.f);
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private int t()
  {
    try
    {
      int i1 = f;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public final void a()
  {
    try
    {
      n();
      return;
    }
    catch (ThreadDeath localThreadDeath)
    {
      throw localThreadDeath;
    }
    catch (Throwable localThrowable)
    {
      dy.a(localThrowable);
    }
  }
  
  public final void a(int paramInt)
  {
    try
    {
      b(paramInt);
      return;
    }
    catch (ThreadDeath localThreadDeath)
    {
      throw localThreadDeath;
    }
    catch (Throwable localThrowable)
    {
      dy.a(localThrowable);
    }
  }
  
  public final void a(OutputStream paramOutputStream)
  {
    Object localObject = null;
    try
    {
      JSONArray localJSONArray = j();
      localObject = localJSONArray;
    }
    catch (JSONException localJSONException)
    {
      for (;;) {}
    }
    if (localObject != null) {
      paramOutputStream.write(((JSONArray)localObject).toString().getBytes());
    }
  }
  
  public final void b()
  {
    try
    {
      o();
      return;
    }
    catch (ThreadDeath localThreadDeath)
    {
      throw localThreadDeath;
    }
    catch (Throwable localThrowable)
    {
      dy.a(localThrowable);
    }
  }
  
  public final void c()
  {
    try
    {
      p();
      return;
    }
    catch (ThreadDeath localThreadDeath)
    {
      throw localThreadDeath;
    }
    catch (Throwable localThrowable)
    {
      dy.a(localThrowable);
    }
  }
  
  public final int d()
  {
    try
    {
      int i1 = t();
      return i1;
    }
    catch (ThreadDeath localThreadDeath)
    {
      throw localThreadDeath;
    }
    catch (Throwable localThrowable)
    {
      dy.a(localThrowable);
    }
    return -1;
  }
  
  public final String e()
  {
    return l;
  }
  
  public final void h()
  {
    try
    {
      q();
      return;
    }
    catch (ThreadDeath localThreadDeath)
    {
      throw localThreadDeath;
    }
    catch (Throwable localThrowable)
    {
      dy.a(localThrowable);
    }
  }
  
  public final JSONArray j()
  {
    JSONArray localJSONArray = new JSONArray().put(d).put(j.ordinal()).put(e / 1000.0D);
    if (f == -1) {}
    for (Object localObject = JSONObject.NULL;; localObject = Integer.valueOf(f))
    {
      localObject = localJSONArray.put(localObject).put(new JSONObject(k)).put(ee.a.a(new Date(g))).put(ee.a.a(new Date(h)));
      if (Build.VERSION.SDK_INT < 14) {
        break;
      }
      ((JSONArray)localObject).put(Math.round(i / Math.pow(10.0D, 9.0D) * 1000.0D) / 1000.0D);
      return (JSONArray)localObject;
    }
    ((JSONArray)localObject).put(JSONObject.NULL);
    return (JSONArray)localObject;
  }
  
  public final a k()
  {
    return j;
  }
  
  static enum a {}
}

/* Location:
 * Qualified Name:     crittercism.android.bg
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */