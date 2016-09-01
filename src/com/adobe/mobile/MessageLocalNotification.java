package com.adobe.mobile;

import org.json.JSONException;
import org.json.JSONObject;

final class MessageLocalNotification
  extends Message
{
  private static final String JSON_CONFIG_CONTENT = "content";
  private static final String JSON_CONFIG_WAIT = "wait";
  protected String content;
  protected Integer localNotificationDelay;
  
  protected boolean initWithPayloadObject(JSONObject paramJSONObject)
  {
    if ((paramJSONObject == null) || (paramJSONObject.length() <= 0)) {}
    while (!super.initWithPayloadObject(paramJSONObject)) {
      return false;
    }
    try
    {
      paramJSONObject = paramJSONObject.getJSONObject("payload");
      if (paramJSONObject.length() <= 0)
      {
        StaticMethods.logDebugFormat("Messages - Unable to create local notification message \"%s\", payload is empty", new Object[] { messageId });
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logDebugFormat("Messages - Unable to create local notification message \"%s\", payload is required", new Object[] { messageId });
      return false;
    }
    try
    {
      content = paramJSONObject.getString("content");
      if (content.length() <= 0)
      {
        StaticMethods.logDebugFormat("Messages - Unable to create local notification message \"%s\", content is empty", new Object[] { messageId });
        return false;
      }
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logDebugFormat("Messages - Unable to create local notification message \"%s\", content is required", new Object[] { messageId });
      return false;
    }
    try
    {
      localNotificationDelay = Integer.valueOf(paramJSONObject.getInt("wait"));
      return true;
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logDebugFormat("Messages - Unable to create local notification message \"%s\", localNotificationDelay is required", new Object[] { messageId });
    }
    return false;
  }
  
  /* Error */
  protected void show()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 85	com/adobe/mobile/Message:show	()V
    //   4: invokestatic 89	com/adobe/mobile/StaticMethods:getCurrentActivity	()Landroid/app/Activity;
    //   7: astore_3
    //   8: new 91	java/security/SecureRandom
    //   11: dup
    //   12: invokespecial 92	java/security/SecureRandom:<init>	()V
    //   15: invokevirtual 95	java/security/SecureRandom:nextInt	()I
    //   18: istore_1
    //   19: invokestatic 101	java/util/Calendar:getInstance	()Ljava/util/Calendar;
    //   22: astore_2
    //   23: aload_2
    //   24: bipush 13
    //   26: aload_0
    //   27: getfield 76	com/adobe/mobile/MessageLocalNotification:localNotificationDelay	Ljava/lang/Integer;
    //   30: invokevirtual 104	java/lang/Integer:intValue	()I
    //   33: invokevirtual 108	java/util/Calendar:add	(II)V
    //   36: new 110	android/content/Intent
    //   39: dup
    //   40: invokespecial 111	android/content/Intent:<init>	()V
    //   43: astore 4
    //   45: aload 4
    //   47: aload_3
    //   48: ldc 113
    //   50: invokevirtual 117	android/content/Intent:setClass	(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;
    //   53: pop
    //   54: aload 4
    //   56: ldc 119
    //   58: aload_0
    //   59: getfield 57	com/adobe/mobile/MessageLocalNotification:content	Ljava/lang/String;
    //   62: invokevirtual 123	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   65: pop
    //   66: aload 4
    //   68: ldc 125
    //   70: getstatic 130	com/adobe/mobile/Messages:MESSAGE_LOCAL_IDENTIFIER	Ljava/lang/Integer;
    //   73: invokevirtual 133	android/content/Intent:putExtra	(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;
    //   76: pop
    //   77: aload 4
    //   79: ldc -121
    //   81: iload_1
    //   82: invokevirtual 138	android/content/Intent:putExtra	(Ljava/lang/String;I)Landroid/content/Intent;
    //   85: pop
    //   86: invokestatic 142	com/adobe/mobile/StaticMethods:getSharedContext	()Landroid/content/Context;
    //   89: iload_1
    //   90: aload 4
    //   92: ldc -113
    //   94: invokestatic 149	android/app/PendingIntent:getBroadcast	(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;
    //   97: astore_3
    //   98: invokestatic 142	com/adobe/mobile/StaticMethods:getSharedContext	()Landroid/content/Context;
    //   101: ldc -105
    //   103: invokevirtual 157	android/content/Context:getSystemService	(Ljava/lang/String;)Ljava/lang/Object;
    //   106: checkcast 159	android/app/AlarmManager
    //   109: iconst_0
    //   110: aload_2
    //   111: invokevirtual 163	java/util/Calendar:getTimeInMillis	()J
    //   114: aload_3
    //   115: invokevirtual 167	android/app/AlarmManager:set	(IJLandroid/app/PendingIntent;)V
    //   118: aload_0
    //   119: invokevirtual 170	com/adobe/mobile/MessageLocalNotification:viewed	()V
    //   122: return
    //   123: astore_2
    //   124: aload_2
    //   125: invokevirtual 174	com/adobe/mobile/StaticMethods$NullActivityException:getMessage	()Ljava/lang/String;
    //   128: iconst_0
    //   129: anewarray 40	java/lang/Object
    //   132: invokestatic 177	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   135: return
    //   136: astore_2
    //   137: ldc -77
    //   139: iconst_1
    //   140: anewarray 40	java/lang/Object
    //   143: dup
    //   144: iconst_0
    //   145: aload_2
    //   146: invokevirtual 180	com/adobe/mobile/StaticMethods$NullContextException:getMessage	()Ljava/lang/String;
    //   149: aastore
    //   150: invokestatic 177	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   153: goto -35 -> 118
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	156	0	this	MessageLocalNotification
    //   18	72	1	i	int
    //   22	89	2	localCalendar	java.util.Calendar
    //   123	2	2	localNullActivityException	StaticMethods.NullActivityException
    //   136	10	2	localNullContextException	StaticMethods.NullContextException
    //   7	108	3	localObject	Object
    //   43	48	4	localIntent	android.content.Intent
    // Exception table:
    //   from	to	target	type
    //   4	8	123	com/adobe/mobile/StaticMethods$NullActivityException
    //   86	118	136	com/adobe/mobile/StaticMethods$NullContextException
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageLocalNotification
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */