package com.crittercism.app;

import android.app.AlertDialog;
import android.content.Context;
import android.location.Location;
import android.os.Build.VERSION;
import android.os.ConditionVariable;
import crittercism.android.az;
import crittercism.android.az.1;
import crittercism.android.az.7;
import crittercism.android.bb;
import crittercism.android.bc;
import crittercism.android.bg;
import crittercism.android.bn.a;
import crittercism.android.cf;
import crittercism.android.cf.a;
import crittercism.android.dh;
import crittercism.android.dl;
import crittercism.android.dr;
import crittercism.android.du;
import crittercism.android.dx;
import crittercism.android.dy;
import java.net.URL;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import org.json.JSONException;
import org.json.JSONObject;

public class Crittercism
{
  private static void a(String paramString)
  {
    dy.b("Crittercism cannot be initialized", new NullPointerException(paramString + " was null"));
  }
  
  private static void b(String paramString)
  {
    dy.b("Must initialize Crittercism before calling " + Crittercism.class.getName() + "." + paramString + "().  Request is being ignored...", new IllegalStateException());
  }
  
  public static void beginTransaction(String paramString)
  {
    try
    {
      az localaz = az.A();
      if (t)
      {
        dy.c("Transactions are not supported for services. Ignoring Crittercism.beginTransaction() call for " + paramString + ".");
        return;
      }
      Transaction localTransaction1 = Transaction.a(paramString);
      if ((localTransaction1 instanceof bg)) {
        synchronized (z)
        {
          Transaction localTransaction2 = (Transaction)z.remove(paramString);
          if (localTransaction2 != null) {
            ((bg)localTransaction2).h();
          }
          if (z.size() > 50)
          {
            dy.c("Crittercism only supports a maximum of 50 concurrent transactions. Ignoring Crittercism.beginTransaction() call for " + paramString + ".");
            return;
          }
        }
      }
      return;
    }
    catch (ThreadDeath paramString)
    {
      throw paramString;
      z.put(paramString, localTransaction1);
      localTransaction1.a();
      return;
    }
    catch (Throwable paramString)
    {
      dy.a(paramString);
    }
  }
  
  public static boolean didCrashOnLastLoad()
  {
    try
    {
      az localaz = az.A();
      if (!b)
      {
        b("didCrashOnLoad");
        return false;
      }
      if (!localaz.B())
      {
        e.block();
        boolean bool = dr.a;
        return bool;
      }
    }
    catch (ThreadDeath localThreadDeath)
    {
      throw localThreadDeath;
    }
    catch (Throwable localThrowable)
    {
      dy.a(localThrowable);
    }
    return false;
  }
  
  public static void endTransaction(String paramString)
  {
    try
    {
      az localaz = az.A();
      if (t)
      {
        dy.c("Transactions are not supported for services. Ignoring Crittercism.endTransaction() call for " + paramString + ".");
        return;
      }
      return;
    }
    catch (ThreadDeath paramString)
    {
      synchronized (z)
      {
        paramString = (Transaction)z.remove(paramString);
        if (paramString != null)
        {
          paramString.b();
          return;
          paramString = paramString;
          throw paramString;
        }
      }
    }
    catch (Throwable paramString)
    {
      dy.a(paramString);
    }
  }
  
  public static void failTransaction(String paramString)
  {
    try
    {
      az localaz = az.A();
      if (t)
      {
        dy.c("Transactions are not supported for services. Ignoring Crittercism.failTransaction() call for " + paramString + ".");
        return;
      }
      return;
    }
    catch (ThreadDeath paramString)
    {
      synchronized (z)
      {
        paramString = (Transaction)z.remove(paramString);
        if (paramString != null)
        {
          paramString.c();
          return;
          paramString = paramString;
          throw paramString;
        }
      }
    }
    catch (Throwable paramString)
    {
      dy.a(paramString);
    }
  }
  
  public static AlertDialog generateRateMyAppAlertDialog(Context paramContext)
  {
    for (;;)
    {
      try
      {
        az localaz = az.A();
        localObject = A;
        if (A != null)
        {
          str = A.b();
          localObject = A.c();
          paramContext = localaz.a(paramContext, (String)localObject, str);
          return paramContext;
        }
      }
      catch (ThreadDeath paramContext)
      {
        throw paramContext;
      }
      catch (Throwable paramContext)
      {
        dy.a(paramContext);
        return null;
      }
      Object localObject = null;
      String str = null;
    }
  }
  
  public static AlertDialog generateRateMyAppAlertDialog(Context paramContext, String paramString1, String paramString2)
  {
    try
    {
      paramContext = az.A().a(paramContext, paramString1, paramString2);
      return paramContext;
    }
    catch (ThreadDeath paramContext)
    {
      throw paramContext;
    }
    catch (Throwable paramContext)
    {
      dy.a(paramContext);
    }
    return null;
  }
  
  public static boolean getOptOutStatus()
  {
    try
    {
      az localaz = az.A();
      if (!b)
      {
        b("getOptOutStatus");
        return false;
      }
      boolean bool = localaz.B();
      return bool;
    }
    catch (ThreadDeath localThreadDeath)
    {
      throw localThreadDeath;
    }
    catch (Throwable localThrowable)
    {
      dy.a(localThrowable);
    }
    return false;
  }
  
  public static int getTransactionValue(String paramString)
  {
    try
    {
      int i = az.A().b(paramString);
      return i;
    }
    catch (ThreadDeath paramString)
    {
      throw paramString;
    }
    catch (Throwable paramString)
    {
      dy.a(paramString);
    }
    return -1;
  }
  
  public static void initialize(Context paramContext, String paramString)
  {
    try
    {
      initialize(paramContext, paramString, new CrittercismConfig());
      return;
    }
    finally
    {
      paramContext = finally;
      throw paramContext;
    }
  }
  
  public static void initialize(Context paramContext, String paramString, CrittercismConfig paramCrittercismConfig)
  {
    try
    {
      if (bn.a.a(paramString) == null) {
        throw new IllegalArgumentException("Invalid appID '" + paramString + "'. Crittercism cannot be initialized");
      }
    }
    finally {}
    if (paramString == null) {}
    try
    {
      a(String.class.getCanonicalName());
      for (;;)
      {
        return;
        if (paramContext != null) {
          break;
        }
        a(Context.class.getCanonicalName());
      }
    }
    catch (ThreadDeath paramContext)
    {
      for (;;)
      {
        throw paramContext;
        if (paramCrittercismConfig != null) {
          break;
        }
        a(CrittercismConfig.class.getCanonicalName());
      }
    }
    catch (Throwable paramContext)
    {
      for (;;)
      {
        dy.a(paramContext);
        continue;
        boolean bool = Ab;
        if (!bool) {
          try
          {
            long l = System.nanoTime();
            az.A().a(paramContext, paramString, paramCrittercismConfig);
            l = (System.nanoTime() - l) / 1000000L;
            new StringBuilder("Crittercism finished initializing in ").append(l).append("ms");
            dy.b();
          }
          catch (Exception paramContext)
          {
            new StringBuilder("Exception in init > getInstance().initialize(..): ").append(paramContext.getClass().getName());
            dy.b();
          }
        }
      }
    }
  }
  
  public static void leaveBreadcrumb(String paramString)
  {
    try
    {
      if (!Ab)
      {
        b("leaveBreadcrumb");
        return;
      }
      if (paramString == null)
      {
        dy.b("Cannot leave null breadcrumb", new NullPointerException());
        return;
      }
    }
    catch (ThreadDeath paramString)
    {
      throw paramString;
      az localaz = az.A();
      if (!f.b())
      {
        az.7 local7 = new az.7(localaz, new cf(paramString, cf.a.a));
        if (!q.a(local7))
        {
          new StringBuilder("SENDING ").append(paramString).append(" TO EXECUTOR");
          dy.b();
          s.execute(local7);
          return;
        }
      }
    }
    catch (Throwable paramString)
    {
      dy.a(paramString);
    }
  }
  
  public static void logHandledException(Throwable paramThrowable)
  {
    try
    {
      if (!Ab)
      {
        b("logHandledException");
        return;
      }
      if (!Af.b())
      {
        az.A().b(paramThrowable);
        return;
      }
    }
    catch (ThreadDeath paramThrowable)
    {
      throw paramThrowable;
    }
    catch (Throwable paramThrowable)
    {
      dy.a(paramThrowable);
    }
  }
  
  public static void logNetworkRequest(String paramString, URL paramURL, long paramLong1, long paramLong2, long paramLong3, int paramInt, Exception paramException)
  {
    try
    {
      long l = System.currentTimeMillis();
      if (!Ab)
      {
        b("logEndpoint");
        return;
      }
      if (!Af.b())
      {
        az.A().a(paramString, paramURL, paramLong1, paramLong2, paramLong3, paramInt, paramException, l - paramLong1);
        return;
      }
    }
    catch (ThreadDeath paramString)
    {
      throw paramString;
    }
    catch (Throwable paramString)
    {
      dy.a(paramString);
    }
  }
  
  public static void performRateMyAppButtonAction(CritterRateMyAppButtons paramCritterRateMyAppButtons)
  {
    az localaz;
    String str;
    try
    {
      if (Af.b())
      {
        dy.c("User has opted out of crittercism.  performRateMyAppButtonAction exiting.");
        return;
      }
      localaz = az.A();
      if (Build.VERSION.SDK_INT < 5)
      {
        dy.c("Rate my app not supported below api level 5");
        return;
      }
    }
    catch (ThreadDeath paramCritterRateMyAppButtons)
    {
      throw paramCritterRateMyAppButtons;
      str = localaz.D();
      if (str == null)
      {
        dy.b("Cannot create proper URI to open app market.  Returning null.");
        return;
      }
    }
    catch (Throwable paramCritterRateMyAppButtons)
    {
      dy.a(paramCritterRateMyAppButtons);
      return;
    }
    int i = crittercism.android.az.4.a[paramCritterRateMyAppButtons.ordinal()];
    switch (i)
    {
    default: 
      return;
    case 1: 
      try
      {
        localaz.a(str);
        return;
      }
      catch (Exception paramCritterRateMyAppButtons)
      {
        dy.c("performRateMyAppButtonAction(CritterRateMyAppButtons.YES) failed.  Email support@crittercism.com.");
        dy.c();
        return;
      }
    }
    try
    {
      localaz.C();
      return;
    }
    catch (Exception paramCritterRateMyAppButtons)
    {
      dy.c("performRateMyAppButtonAction(CritterRateMyAppButtons.NO) failed.  Email support@crittercism.com.");
    }
  }
  
  public static void sendAppLoadData()
  {
    try
    {
      Object localObject = Au;
      if (localObject == null)
      {
        b("sendAppLoadData");
        return;
      }
      if (((CrittercismConfig)localObject).delaySendingAppLoad())
      {
        if (Af.b()) {
          return;
        }
        localObject = az.A();
        if (!u.delaySendingAppLoad())
        {
          dy.c("CrittercismConfig instance not set to delay sending app loads.");
          return;
        }
      }
    }
    catch (ThreadDeath localThreadDeath)
    {
      throw localThreadDeath;
      if ((t) || (C)) {
        return;
      }
      C = true;
      az.1 local1 = new az.1(localThreadDeath);
      if (q.a(local1)) {
        return;
      }
      s.execute(local1);
      return;
    }
    catch (Throwable localThrowable)
    {
      dy.a(localThrowable);
      return;
    }
    dy.a("sendAppLoadData() will only send data to Crittercism if \"delaySendingAppLoad\" is set to true in the configuration settings you include in the init call.");
  }
  
  public static void setMetadata(JSONObject paramJSONObject)
  {
    try
    {
      if (!Ab)
      {
        b("setMetadata");
        return;
      }
      az.A().a(paramJSONObject);
      return;
    }
    catch (ThreadDeath paramJSONObject)
    {
      throw paramJSONObject;
    }
    catch (Throwable paramJSONObject)
    {
      dy.a(paramJSONObject);
    }
  }
  
  public static void setOptOutStatus(boolean paramBoolean)
  {
    try
    {
      if (!Ab)
      {
        b("setOptOutStatus");
        return;
      }
      az localaz = az.A();
      dl localdl = new dl(c, localaz, paramBoolean);
      if (!q.a(localdl))
      {
        s.execute(localdl);
        return;
      }
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
  
  public static void setTransactionValue(String paramString, int paramInt)
  {
    try
    {
      az localaz = az.A();
      if (t)
      {
        dy.c("Transactions are not supported for services. Ignoring Crittercism.setTransactionValue() call for " + paramString + ".");
        return;
      }
      synchronized (z)
      {
        paramString = (Transaction)z.get(paramString);
        if (paramString != null) {
          paramString.a(paramInt);
        }
        return;
      }
      return;
    }
    catch (ThreadDeath paramString)
    {
      throw paramString;
    }
    catch (Throwable paramString)
    {
      dy.a(paramString);
    }
  }
  
  public static void setUsername(String paramString)
  {
    try
    {
      if (!Ab)
      {
        b("setUsername");
        return;
      }
      if (paramString == null)
      {
        dy.c("Crittercism.setUsername() given invalid parameter: null");
        return;
      }
    }
    catch (ThreadDeath paramString)
    {
      throw paramString;
      localJSONObject = new JSONObject();
    }
    catch (Throwable paramString)
    {
      try
      {
        JSONObject localJSONObject;
        localJSONObject.putOpt("username", paramString);
        az.A().a(localJSONObject);
        return;
      }
      catch (JSONException paramString)
      {
        dy.b("Crittercism.setUsername()", paramString);
      }
      paramString = paramString;
      dy.a(paramString);
      return;
    }
  }
  
  public static void updateLocation(Location paramLocation)
  {
    if (!Ab)
    {
      b("updateLocation");
      return;
    }
    if (paramLocation == null)
    {
      dy.b("Cannot leave null location", new NullPointerException());
      return;
    }
    bc.a(paramLocation);
  }
}

/* Location:
 * Qualified Name:     com.crittercism.app.Crittercism
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */