package crittercism.android;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.ConditionVariable;
import com.crittercism.app.CrittercismNDK;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public final class dh
  extends dj
{
  public ConditionVariable a = new ConditionVariable();
  public bm b = null;
  private ConditionVariable c = new ConditionVariable();
  private bb d;
  private Context e;
  private aw f;
  private ax g;
  private au h;
  private List i = new ArrayList();
  private boolean j = false;
  private boolean k;
  private Exception l = null;
  
  public dh(bb parambb, Context paramContext, aw paramaw, ax paramax, au paramau)
  {
    d = parambb;
    e = paramContext;
    f = paramaw;
    g = paramax;
    h = paramau;
    k = false;
  }
  
  private void a(File paramFile)
  {
    Object localObject2 = e;
    Object localObject1 = new h((Context)localObject2);
    localObject2 = ((Context)localObject2).getSharedPreferences("com.crittercism.optmz.config", 0);
    if (((SharedPreferences)localObject2).contains("interval"))
    {
      d = ((SharedPreferences)localObject2).getInt("interval", 10);
      if (!((SharedPreferences)localObject2).contains("kill")) {
        break label519;
      }
      c = ((SharedPreferences)localObject2).getBoolean("kill", false);
      if (!((SharedPreferences)localObject2).contains("persist")) {
        break label524;
      }
      b = ((SharedPreferences)localObject2).getBoolean("persist", false);
      if (!((SharedPreferences)localObject2).contains("enabled")) {
        break label529;
      }
      a = ((SharedPreferences)localObject2).getBoolean("enabled", false);
    }
    for (;;)
    {
      if (localObject1 != null) {
        az.A().a((h)localObject1);
      }
      boolean bool = k;
      f.z();
      Object localObject3;
      bs localbs1;
      bs localbs2;
      if (!At)
      {
        localObject1 = bh.a(e);
        localObject2 = f.x();
        localObject3 = f.s();
        localbs1 = f.t();
        localbs2 = f.v();
        localObject2 = new bi(e, h, (bs)localObject2, (bs)localObject3, localbs1, localbs2, d.d());
        localObject3 = az.A();
        y = ((bi)localObject2);
        new dz((Runnable)localObject2, "TXN Thread").start();
        ((az)localObject3).a((bh)localObject1);
      }
      bool = k;
      localObject1 = az.A();
      if (!t)
      {
        if ((paramFile != null) && (paramFile.exists())) {
          paramFile.isFile();
        }
        localObject2 = f;
        localObject2 = f.s();
        localObject3 = f.t();
        localbs1 = f.u();
        localbs2 = f.v();
        bs localbs3 = f.q();
        if (paramFile != null)
        {
          dr.a = true;
          e.open();
          localbs3.a(new cd(paramFile, (bs)localObject2, localbs1, (bs)localObject3, localbs2));
          paramFile.delete();
          f.w().a();
          localbs1.a();
          ((bs)localObject3).a();
          localbs2.a();
          ((bs)localObject2).a(localbs1);
        }
      }
      else
      {
        a.open();
        f.s().a(cf.a);
        if ((!At) && (d.isNdkCrashReportingEnabled())) {
          dy.b();
        }
      }
      try
      {
        CrittercismNDK.installNdkLib(e, d.g());
        f();
        return;
        localObject1 = null;
        continue;
        label519:
        localObject1 = null;
        continue;
        label524:
        localObject1 = null;
        continue;
        label529:
        localObject1 = null;
        continue;
        e.open();
        bg.a(f);
      }
      catch (Throwable paramFile)
      {
        for (;;)
        {
          new StringBuilder("Exception installing ndk library: ").append(paramFile.getClass().getName());
          dy.b();
        }
      }
    }
  }
  
  private void c()
  {
    try
    {
      j = true;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private boolean d()
  {
    try
    {
      boolean bool = j;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  private File e()
  {
    int m = 0;
    Object localObject1 = new File(e.getFilesDir().getAbsolutePath() + "/" + d.g());
    if ((!((File)localObject1).exists()) || (!((File)localObject1).isDirectory())) {}
    for (;;)
    {
      return null;
      localObject1 = ((File)localObject1).listFiles();
      if (localObject1 != null) {
        if (localObject1.length == 1)
        {
          localObject1 = localObject1[0];
          ((File)localObject1).isFile();
          if (((File)localObject1).isFile()) {
            return (File)localObject1;
          }
        }
        else if (localObject1.length > 1)
        {
          int n = localObject1.length;
          while (m < n)
          {
            Object localObject2 = localObject1[m];
            ((File)localObject2).isFile();
            ((File)localObject2).delete();
            m += 1;
          }
        }
      }
    }
  }
  
  private void f()
  {
    if (At) {}
    dw localdw;
    do
    {
      return;
      boolean bool = k;
      bs localbs1 = f.n();
      bs localbs2 = f.o();
      bs localbs3 = f.p();
      bs localbs4 = f.q();
      bs localbs5 = f.r();
      localdw = f.y();
      d.b();
      b = new bm(h);
      if (!d.delaySendingAppLoad())
      {
        localbs1.a(b);
        dg localdg = new dg(e);
        localdg.a(localbs1, new cu.a(), d.e(), "/v0/appload/", d.b(), h, new ct.b());
        localdg.a(localbs2, new db.a(), d.b(), "/android_v2/handle_exceptions", null, h, new cv.a());
        localdg.a(localbs4, new db.a(), d.b(), "/android_v2/handle_ndk_crashes", null, h, new cv.a());
        localdg.a(localbs5, new db.a(), d.b(), "/android_v2/handle_crashes", null, h, new cv.a());
        localdg.a(localbs3, new db.a(), d.b(), "/android_v2/handle_exceptions", null, new ba(h, d), new cv.a());
        localdg.a();
      }
    } while (!localdw.b());
    az.A().E();
  }
  
  public final void a()
  {
    for (;;)
    {
      try
      {
        dy.b();
        Object localObject1 = new File(e.getFilesDir().getAbsolutePath() + "/com.crittercism/pending");
        if ((((File)localObject1).exists()) && (!((File)localObject1).isDirectory()))
        {
          dy.b();
          Object localObject2 = az.A();
          w.a();
          localObject1 = h.l();
          d.open();
          localObject2 = g;
          Context localContext = e;
          ((dx)localObject1).a((ax)localObject2);
          dr.a = dr.a(e).booleanValue();
          dr.a(e, false);
          if (!((dx)localObject1).b())
          {
            localObject2 = new du(e);
            int m = ((du)localObject2).a();
            a.edit().putInt("numAppLoads", m + 1).commit();
            AA = ((du)localObject2);
            ((dx)localObject1).a().a(g, cr.j.a(), cr.j.b());
          }
          k = ((dx)localObject1).b();
          localObject1 = e();
          if (!k) {
            break label526;
          }
          boolean bool = k;
          if (!At)
          {
            if ((localObject1 != null) && (((File)localObject1).exists())) {
              ((File)localObject1).isFile();
            }
            new bs(e, br.a).a();
            new bs(e, br.b).a();
            new bs(e, br.c).a();
            new bs(e, br.d).a();
            new bs(e, br.e).a();
            new bs(e, br.f).a();
            new bs(e, br.h).a();
            new bs(e, br.g).a();
            new bs(e, br.k).a();
            if (localObject1 != null) {
              ((File)localObject1).delete();
            }
          }
          h.b(e);
          c();
          localObject1 = i.iterator();
          if (!((Iterator)localObject1).hasNext()) {
            break;
          }
          ((Runnable)((Iterator)localObject1).next()).run();
          continue;
        }
      }
      catch (Exception localException)
      {
        new StringBuilder("Exception in run(): ").append(localException.getMessage());
        dy.b();
        dy.c();
        l = localException;
        return;
        ec.a(localException);
        continue;
      }
      finally
      {
        c.open();
      }
      label526:
      a(localFile);
    }
    c.open();
  }
  
  /* Error */
  public final boolean a(Runnable paramRunnable)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokespecial 493	crittercism/android/dh:d	()Z
    //   6: ifne +20 -> 26
    //   9: aload_0
    //   10: getfield 43	crittercism/android/dh:i	Ljava/util/List;
    //   13: aload_1
    //   14: invokeinterface 497 2 0
    //   19: pop
    //   20: iconst_1
    //   21: istore_2
    //   22: aload_0
    //   23: monitorexit
    //   24: iload_2
    //   25: ireturn
    //   26: iconst_0
    //   27: istore_2
    //   28: goto -6 -> 22
    //   31: astore_1
    //   32: aload_0
    //   33: monitorexit
    //   34: aload_1
    //   35: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	36	0	this	dh
    //   0	36	1	paramRunnable	Runnable
    //   21	7	2	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	20	31	finally
  }
  
  public final void b()
  {
    c.block();
  }
}

/* Location:
 * Qualified Name:     crittercism.android.dh
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */