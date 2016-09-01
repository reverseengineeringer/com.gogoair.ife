package com.adobe.mobile;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;

public class MessageNotificationHandler
  extends BroadcastReceiver
{
  private String getAppName()
  {
    try
    {
      Object localObject = StaticMethods.getSharedContext().getPackageManager();
      if (localObject != null)
      {
        ApplicationInfo localApplicationInfo = ((PackageManager)localObject).getApplicationInfo(StaticMethods.getSharedContext().getPackageName(), 0);
        if (localApplicationInfo != null) {
          if (((PackageManager)localObject).getApplicationLabel(localApplicationInfo) != null) {
            localObject = (String)((PackageManager)localObject).getApplicationLabel(localApplicationInfo);
          } else {
            localObject = "";
          }
        }
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      StaticMethods.logDebugFormat("Messages - unable to retrieve app name for local notification (%s)", new Object[] { localNameNotFoundException.getMessage() });
      return "";
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      StaticMethods.logDebugFormat("Messages - unable to get app name (%s)", new Object[] { localNullContextException.getMessage() });
      return "";
    }
    String str = "";
    return str;
  }
  
  private Bitmap getLargeIcon()
  {
    Bitmap localBitmap = null;
    for (;;)
    {
      try
      {
        int i = Messages.getLargeIconResourceId();
        if (i != -1)
        {
          localObject1 = StaticMethods.getSharedContext().getResources().getDrawable(i);
          if (localObject1 != null) {
            localBitmap = ((BitmapDrawable)localObject1).getBitmap();
          }
          return localBitmap;
        }
        Object localObject1 = StaticMethods.getSharedContext().getApplicationInfo();
        if (localObject1 != null)
        {
          PackageManager localPackageManager = StaticMethods.getSharedContext().getPackageManager();
          if (localPackageManager != null)
          {
            localObject1 = localPackageManager.getApplicationIcon((ApplicationInfo)localObject1);
            continue;
          }
        }
        Object localObject2 = null;
      }
      catch (StaticMethods.NullContextException localNullContextException)
      {
        StaticMethods.logDebugFormat("Messages - Unable to pull bundle icon (%s)", new Object[] { localNullContextException.getMessage() });
        return null;
      }
    }
  }
  
  private int getSmallIcon()
  {
    if (Messages.getSmallIconResourceId() != -1) {
      return Messages.getSmallIconResourceId();
    }
    return 17301651;
  }
  
  /* Error */
  public void onReceive(Context paramContext, android.content.Intent paramIntent)
  {
    // Byte code:
    //   0: aload_2
    //   1: invokevirtual 111	android/content/Intent:getExtras	()Landroid/os/Bundle;
    //   4: astore_1
    //   5: aload_1
    //   6: ifnonnull +13 -> 19
    //   9: ldc 113
    //   11: iconst_0
    //   12: anewarray 48	java/lang/Object
    //   15: invokestatic 55	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   18: return
    //   19: aload_1
    //   20: ldc 115
    //   22: invokevirtual 121	android/os/Bundle:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   25: astore 7
    //   27: aload_1
    //   28: ldc 123
    //   30: invokevirtual 127	android/os/Bundle:getInt	(Ljava/lang/String;)I
    //   33: istore 4
    //   35: aload_1
    //   36: ldc -127
    //   38: invokevirtual 127	android/os/Bundle:getInt	(Ljava/lang/String;)I
    //   41: istore_3
    //   42: iload 4
    //   44: getstatic 133	com/adobe/mobile/Messages:MESSAGE_LOCAL_IDENTIFIER	Ljava/lang/Integer;
    //   47: invokevirtual 138	java/lang/Integer:intValue	()I
    //   50: if_icmpne -32 -> 18
    //   53: aload 7
    //   55: ifnonnull +31 -> 86
    //   58: ldc -116
    //   60: iconst_0
    //   61: anewarray 48	java/lang/Object
    //   64: invokestatic 55	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   67: return
    //   68: astore_1
    //   69: ldc -114
    //   71: iconst_1
    //   72: anewarray 48	java/lang/Object
    //   75: dup
    //   76: iconst_0
    //   77: aload_1
    //   78: invokevirtual 143	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   81: aastore
    //   82: invokestatic 55	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   85: return
    //   86: invokestatic 147	com/adobe/mobile/StaticMethods:getCurrentActivity	()Landroid/app/Activity;
    //   89: astore 6
    //   91: invokestatic 21	com/adobe/mobile/StaticMethods:getSharedContext	()Landroid/content/Context;
    //   94: astore 8
    //   96: aconst_null
    //   97: astore_1
    //   98: invokestatic 147	com/adobe/mobile/StaticMethods:getCurrentActivity	()Landroid/app/Activity;
    //   101: astore 5
    //   103: aload 5
    //   105: astore_1
    //   106: aload_1
    //   107: ifnull +8 -> 115
    //   110: aload_1
    //   111: invokevirtual 153	android/app/Activity:getIntent	()Landroid/content/Intent;
    //   114: astore_2
    //   115: aload_2
    //   116: ldc -102
    //   118: invokevirtual 158	android/content/Intent:setFlags	(I)Landroid/content/Intent;
    //   121: pop
    //   122: getstatic 164	android/os/Build$VERSION:SDK_INT	I
    //   125: istore 4
    //   127: aload 8
    //   129: iload_3
    //   130: aload_2
    //   131: ldc -91
    //   133: invokestatic 171	android/app/PendingIntent:getActivity	(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;
    //   136: astore_2
    //   137: aload_2
    //   138: ifnonnull +71 -> 209
    //   141: ldc -83
    //   143: iconst_0
    //   144: anewarray 48	java/lang/Object
    //   147: invokestatic 55	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   150: return
    //   151: astore_1
    //   152: ldc -81
    //   154: iconst_1
    //   155: anewarray 48	java/lang/Object
    //   158: dup
    //   159: iconst_0
    //   160: aload_1
    //   161: invokevirtual 176	java/lang/ClassNotFoundException:getMessage	()Ljava/lang/String;
    //   164: aastore
    //   165: invokestatic 179	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   168: return
    //   169: astore_1
    //   170: aload_1
    //   171: invokevirtual 180	com/adobe/mobile/StaticMethods$NullActivityException:getMessage	()Ljava/lang/String;
    //   174: iconst_0
    //   175: anewarray 48	java/lang/Object
    //   178: invokestatic 179	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   181: return
    //   182: astore_1
    //   183: aload_1
    //   184: invokevirtual 58	com/adobe/mobile/StaticMethods$NullContextException:getMessage	()Ljava/lang/String;
    //   187: iconst_0
    //   188: anewarray 48	java/lang/Object
    //   191: invokestatic 179	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   194: return
    //   195: astore 5
    //   197: ldc -74
    //   199: iconst_0
    //   200: anewarray 48	java/lang/Object
    //   203: invokestatic 179	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   206: goto -100 -> 106
    //   209: iload 4
    //   211: bipush 11
    //   213: if_icmplt +347 -> 560
    //   216: ldc 4
    //   218: invokevirtual 188	java/lang/Class:getClassLoader	()Ljava/lang/ClassLoader;
    //   221: ldc -66
    //   223: invokevirtual 196	java/lang/ClassLoader:loadClass	(Ljava/lang/String;)Ljava/lang/Class;
    //   226: astore_1
    //   227: aload_1
    //   228: iconst_1
    //   229: anewarray 184	java/lang/Class
    //   232: dup
    //   233: iconst_0
    //   234: ldc 23
    //   236: aastore
    //   237: invokevirtual 200	java/lang/Class:getConstructor	([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    //   240: astore 5
    //   242: aload 5
    //   244: iconst_1
    //   245: invokevirtual 206	java/lang/reflect/Constructor:setAccessible	(Z)V
    //   248: aload 5
    //   250: iconst_1
    //   251: anewarray 48	java/lang/Object
    //   254: dup
    //   255: iconst_0
    //   256: invokestatic 21	com/adobe/mobile/StaticMethods:getSharedContext	()Landroid/content/Context;
    //   259: aastore
    //   260: invokevirtual 210	java/lang/reflect/Constructor:newInstance	([Ljava/lang/Object;)Ljava/lang/Object;
    //   263: astore 5
    //   265: aload_1
    //   266: ldc -44
    //   268: iconst_1
    //   269: anewarray 184	java/lang/Class
    //   272: dup
    //   273: iconst_0
    //   274: getstatic 216	java/lang/Integer:TYPE	Ljava/lang/Class;
    //   277: aastore
    //   278: invokevirtual 220	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   281: aload 5
    //   283: iconst_1
    //   284: anewarray 48	java/lang/Object
    //   287: dup
    //   288: iconst_0
    //   289: aload_0
    //   290: invokespecial 222	com/adobe/mobile/MessageNotificationHandler:getSmallIcon	()I
    //   293: invokestatic 226	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   296: aastore
    //   297: invokevirtual 232	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   300: pop
    //   301: aload_1
    //   302: ldc -22
    //   304: iconst_1
    //   305: anewarray 184	java/lang/Class
    //   308: dup
    //   309: iconst_0
    //   310: ldc -20
    //   312: aastore
    //   313: invokevirtual 220	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   316: aload 5
    //   318: iconst_1
    //   319: anewarray 48	java/lang/Object
    //   322: dup
    //   323: iconst_0
    //   324: aload_0
    //   325: invokespecial 238	com/adobe/mobile/MessageNotificationHandler:getLargeIcon	()Landroid/graphics/Bitmap;
    //   328: aastore
    //   329: invokevirtual 232	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   332: pop
    //   333: aload_1
    //   334: ldc -16
    //   336: iconst_1
    //   337: anewarray 184	java/lang/Class
    //   340: dup
    //   341: iconst_0
    //   342: ldc -14
    //   344: aastore
    //   345: invokevirtual 220	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   348: aload 5
    //   350: iconst_1
    //   351: anewarray 48	java/lang/Object
    //   354: dup
    //   355: iconst_0
    //   356: aload_0
    //   357: invokespecial 244	com/adobe/mobile/MessageNotificationHandler:getAppName	()Ljava/lang/String;
    //   360: aastore
    //   361: invokevirtual 232	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   364: pop
    //   365: aload_1
    //   366: ldc -10
    //   368: iconst_1
    //   369: anewarray 184	java/lang/Class
    //   372: dup
    //   373: iconst_0
    //   374: ldc -14
    //   376: aastore
    //   377: invokevirtual 220	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   380: aload 5
    //   382: iconst_1
    //   383: anewarray 48	java/lang/Object
    //   386: dup
    //   387: iconst_0
    //   388: aload 7
    //   390: aastore
    //   391: invokevirtual 232	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   394: pop
    //   395: aload_1
    //   396: ldc -8
    //   398: iconst_1
    //   399: anewarray 184	java/lang/Class
    //   402: dup
    //   403: iconst_0
    //   404: ldc -89
    //   406: aastore
    //   407: invokevirtual 220	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   410: aload 5
    //   412: iconst_1
    //   413: anewarray 48	java/lang/Object
    //   416: dup
    //   417: iconst_0
    //   418: aload_2
    //   419: aastore
    //   420: invokevirtual 232	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   423: pop
    //   424: aload_1
    //   425: ldc -6
    //   427: iconst_1
    //   428: anewarray 184	java/lang/Class
    //   431: dup
    //   432: iconst_0
    //   433: getstatic 253	java/lang/Boolean:TYPE	Ljava/lang/Class;
    //   436: aastore
    //   437: invokevirtual 220	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   440: aload 5
    //   442: iconst_1
    //   443: anewarray 48	java/lang/Object
    //   446: dup
    //   447: iconst_0
    //   448: iconst_1
    //   449: invokestatic 256	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   452: aastore
    //   453: invokevirtual 232	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   456: pop
    //   457: iload 4
    //   459: bipush 16
    //   461: if_icmplt +75 -> 536
    //   464: aload_1
    //   465: ldc_w 258
    //   468: iconst_0
    //   469: anewarray 184	java/lang/Class
    //   472: invokevirtual 220	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   475: aload 5
    //   477: iconst_0
    //   478: anewarray 48	java/lang/Object
    //   481: invokevirtual 232	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   484: astore_1
    //   485: goto +151 -> 636
    //   488: aload 6
    //   490: ldc_w 260
    //   493: invokevirtual 264	android/app/Activity:getSystemService	(Ljava/lang/String;)Ljava/lang/Object;
    //   496: checkcast 266	android/app/NotificationManager
    //   499: new 268	java/security/SecureRandom
    //   502: dup
    //   503: invokespecial 269	java/security/SecureRandom:<init>	()V
    //   506: invokevirtual 272	java/security/SecureRandom:nextInt	()I
    //   509: aload_1
    //   510: checkcast 274	android/app/Notification
    //   513: invokevirtual 278	android/app/NotificationManager:notify	(ILandroid/app/Notification;)V
    //   516: return
    //   517: astore_1
    //   518: ldc_w 280
    //   521: iconst_1
    //   522: anewarray 48	java/lang/Object
    //   525: dup
    //   526: iconst_0
    //   527: aload_1
    //   528: invokevirtual 281	java/lang/NoSuchMethodException:getMessage	()Ljava/lang/String;
    //   531: aastore
    //   532: invokestatic 179	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   535: return
    //   536: aload_1
    //   537: ldc_w 283
    //   540: iconst_0
    //   541: anewarray 184	java/lang/Class
    //   544: invokevirtual 220	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   547: aload 5
    //   549: iconst_0
    //   550: anewarray 48	java/lang/Object
    //   553: invokevirtual 232	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   556: astore_1
    //   557: goto +79 -> 636
    //   560: new 274	android/app/Notification
    //   563: dup
    //   564: invokespecial 284	android/app/Notification:<init>	()V
    //   567: astore_1
    //   568: aload_1
    //   569: aload 8
    //   571: aload_0
    //   572: invokespecial 244	com/adobe/mobile/MessageNotificationHandler:getAppName	()Ljava/lang/String;
    //   575: aload 7
    //   577: aload_2
    //   578: invokevirtual 288	android/app/Notification:setLatestEventInfo	(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V
    //   581: aload_1
    //   582: aload_0
    //   583: invokespecial 222	com/adobe/mobile/MessageNotificationHandler:getSmallIcon	()I
    //   586: putfield 291	android/app/Notification:icon	I
    //   589: aload_1
    //   590: bipush 16
    //   592: putfield 294	android/app/Notification:flags	I
    //   595: goto -107 -> 488
    //   598: astore_1
    //   599: ldc_w 296
    //   602: iconst_1
    //   603: anewarray 48	java/lang/Object
    //   606: dup
    //   607: iconst_0
    //   608: aload_1
    //   609: invokevirtual 58	com/adobe/mobile/StaticMethods$NullContextException:getMessage	()Ljava/lang/String;
    //   612: aastore
    //   613: invokestatic 179	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   616: return
    //   617: astore_1
    //   618: ldc_w 298
    //   621: iconst_1
    //   622: anewarray 48	java/lang/Object
    //   625: dup
    //   626: iconst_0
    //   627: aload_1
    //   628: invokevirtual 143	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   631: aastore
    //   632: invokestatic 179	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   635: return
    //   636: aload_1
    //   637: ifnull -619 -> 18
    //   640: goto -152 -> 488
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	643	0	this	MessageNotificationHandler
    //   0	643	1	paramContext	Context
    //   0	643	2	paramIntent	android.content.Intent
    //   41	89	3	i	int
    //   33	429	4	j	int
    //   101	3	5	localActivity1	android.app.Activity
    //   195	1	5	localNullActivityException	StaticMethods.NullActivityException
    //   240	308	5	localObject	Object
    //   89	400	6	localActivity2	android.app.Activity
    //   25	551	7	str	String
    //   94	476	8	localContext	Context
    // Exception table:
    //   from	to	target	type
    //   19	42	68	java/lang/Exception
    //   127	137	151	java/lang/ClassNotFoundException
    //   141	150	151	java/lang/ClassNotFoundException
    //   216	457	151	java/lang/ClassNotFoundException
    //   464	485	151	java/lang/ClassNotFoundException
    //   488	516	151	java/lang/ClassNotFoundException
    //   536	557	151	java/lang/ClassNotFoundException
    //   560	595	151	java/lang/ClassNotFoundException
    //   86	91	169	com/adobe/mobile/StaticMethods$NullActivityException
    //   91	96	182	com/adobe/mobile/StaticMethods$NullContextException
    //   98	103	195	com/adobe/mobile/StaticMethods$NullActivityException
    //   127	137	517	java/lang/NoSuchMethodException
    //   141	150	517	java/lang/NoSuchMethodException
    //   216	457	517	java/lang/NoSuchMethodException
    //   464	485	517	java/lang/NoSuchMethodException
    //   488	516	517	java/lang/NoSuchMethodException
    //   536	557	517	java/lang/NoSuchMethodException
    //   560	595	517	java/lang/NoSuchMethodException
    //   127	137	598	com/adobe/mobile/StaticMethods$NullContextException
    //   141	150	598	com/adobe/mobile/StaticMethods$NullContextException
    //   216	457	598	com/adobe/mobile/StaticMethods$NullContextException
    //   464	485	598	com/adobe/mobile/StaticMethods$NullContextException
    //   488	516	598	com/adobe/mobile/StaticMethods$NullContextException
    //   536	557	598	com/adobe/mobile/StaticMethods$NullContextException
    //   560	595	598	com/adobe/mobile/StaticMethods$NullContextException
    //   127	137	617	java/lang/Exception
    //   141	150	617	java/lang/Exception
    //   216	457	617	java/lang/Exception
    //   464	485	617	java/lang/Exception
    //   488	516	617	java/lang/Exception
    //   536	557	617	java/lang/Exception
    //   560	595	617	java/lang/Exception
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageNotificationHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */