package com.adobe.mobile;

import java.util.ArrayList;
import java.util.Map;

abstract class MessageMatcher
{
  private static final String MESSAGE_JSON_KEY = "key";
  private static final String MESSAGE_JSON_MATCHES = "matches";
  private static final String MESSAGE_JSON_VALUES = "values";
  private static final String MESSAGE_MATCHER_STRING_CONTAINS = "co";
  private static final String MESSAGE_MATCHER_STRING_ENDS_WITH = "ew";
  private static final String MESSAGE_MATCHER_STRING_EQUALS = "eq";
  private static final String MESSAGE_MATCHER_STRING_EXISTS = "ex";
  private static final String MESSAGE_MATCHER_STRING_GREATER_THAN = "gt";
  private static final String MESSAGE_MATCHER_STRING_GREATER_THAN_OR_EQUALS = "ge";
  private static final String MESSAGE_MATCHER_STRING_LESS_THAN = "lt";
  private static final String MESSAGE_MATCHER_STRING_LESS_THAN_OR_EQUALS = "le";
  private static final String MESSAGE_MATCHER_STRING_NOT_CONTAINS = "nc";
  private static final String MESSAGE_MATCHER_STRING_NOT_EQUALS = "ne";
  private static final String MESSAGE_MATCHER_STRING_NOT_EXISTS = "nx";
  private static final String MESSAGE_MATCHER_STRING_STARTS_WITH = "sw";
  private static final Map _messageMatcherDictionary = new MessageMatcher.1();
  protected String key;
  protected ArrayList values;
  
  /* Error */
  protected static MessageMatcher messageMatcherWithJsonObject(org.json.JSONObject paramJSONObject)
  {
    // Byte code:
    //   0: aload_0
    //   1: ldc 11
    //   3: invokevirtual 80	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   6: astore 4
    //   8: aload 4
    //   10: ifnull +20 -> 30
    //   13: aload 4
    //   15: invokevirtual 86	java/lang/String:length	()I
    //   18: ifgt +12 -> 30
    //   21: ldc 88
    //   23: iconst_0
    //   24: anewarray 4	java/lang/Object
    //   27: invokestatic 94	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   30: getstatic 62	com/adobe/mobile/MessageMatcher:_messageMatcherDictionary	Ljava/util/Map;
    //   33: aload 4
    //   35: invokeinterface 100 2 0
    //   40: checkcast 102	java/lang/Class
    //   43: astore 6
    //   45: aload 6
    //   47: astore 5
    //   49: aload 6
    //   51: ifnonnull +21 -> 72
    //   54: ldc 104
    //   56: astore 5
    //   58: ldc 106
    //   60: iconst_1
    //   61: anewarray 4	java/lang/Object
    //   64: dup
    //   65: iconst_0
    //   66: aload 4
    //   68: aastore
    //   69: invokestatic 94	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   72: aload 5
    //   74: invokevirtual 110	java/lang/Class:newInstance	()Ljava/lang/Object;
    //   77: checkcast 2	com/adobe/mobile/MessageMatcher
    //   80: astore 4
    //   82: aload 4
    //   84: ifnull +67 -> 151
    //   87: aload 4
    //   89: aload_0
    //   90: ldc 8
    //   92: invokevirtual 80	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   95: invokevirtual 114	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   98: putfield 116	com/adobe/mobile/MessageMatcher:key	Ljava/lang/String;
    //   101: aload 4
    //   103: getfield 116	com/adobe/mobile/MessageMatcher:key	Ljava/lang/String;
    //   106: ifnull +23 -> 129
    //   109: aload 4
    //   111: getfield 116	com/adobe/mobile/MessageMatcher:key	Ljava/lang/String;
    //   114: invokevirtual 86	java/lang/String:length	()I
    //   117: ifgt +12 -> 129
    //   120: ldc 118
    //   122: iconst_0
    //   123: anewarray 4	java/lang/Object
    //   126: invokestatic 94	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   129: aload 4
    //   131: new 120	java/util/ArrayList
    //   134: dup
    //   135: invokespecial 121	java/util/ArrayList:<init>	()V
    //   138: putfield 123	com/adobe/mobile/MessageMatcher:values	Ljava/util/ArrayList;
    //   141: aload 4
    //   143: instanceof 125
    //   146: istore_3
    //   147: iload_3
    //   148: ifeq +102 -> 250
    //   151: aload 4
    //   153: areturn
    //   154: astore 4
    //   156: ldc 127
    //   158: iconst_0
    //   159: anewarray 4	java/lang/Object
    //   162: invokestatic 94	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   165: ldc -127
    //   167: astore 4
    //   169: goto -139 -> 30
    //   172: astore 4
    //   174: ldc -125
    //   176: iconst_1
    //   177: anewarray 4	java/lang/Object
    //   180: dup
    //   181: iconst_0
    //   182: aload 4
    //   184: invokevirtual 134	java/lang/InstantiationException:getMessage	()Ljava/lang/String;
    //   187: aastore
    //   188: invokestatic 137	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   191: aconst_null
    //   192: astore 4
    //   194: goto -112 -> 82
    //   197: astore 4
    //   199: ldc -125
    //   201: iconst_1
    //   202: anewarray 4	java/lang/Object
    //   205: dup
    //   206: iconst_0
    //   207: aload 4
    //   209: invokevirtual 138	java/lang/IllegalAccessException:getMessage	()Ljava/lang/String;
    //   212: aastore
    //   213: invokestatic 137	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   216: aconst_null
    //   217: astore 4
    //   219: goto -137 -> 82
    //   222: astore 5
    //   224: ldc -116
    //   226: iconst_0
    //   227: anewarray 4	java/lang/Object
    //   230: invokestatic 94	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   233: goto -104 -> 129
    //   236: astore 5
    //   238: ldc -116
    //   240: iconst_0
    //   241: anewarray 4	java/lang/Object
    //   244: invokestatic 94	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   247: goto -118 -> 129
    //   250: aload_0
    //   251: ldc 14
    //   253: invokevirtual 144	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   256: astore_0
    //   257: aload_0
    //   258: invokevirtual 147	org/json/JSONArray:length	()I
    //   261: istore_2
    //   262: iconst_0
    //   263: istore_1
    //   264: iload_1
    //   265: iload_2
    //   266: if_icmpge +24 -> 290
    //   269: aload 4
    //   271: getfield 123	com/adobe/mobile/MessageMatcher:values	Ljava/util/ArrayList;
    //   274: aload_0
    //   275: iload_1
    //   276: invokevirtual 150	org/json/JSONArray:get	(I)Ljava/lang/Object;
    //   279: invokevirtual 154	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   282: pop
    //   283: iload_1
    //   284: iconst_1
    //   285: iadd
    //   286: istore_1
    //   287: goto -23 -> 264
    //   290: aload 4
    //   292: getfield 123	com/adobe/mobile/MessageMatcher:values	Ljava/util/ArrayList;
    //   295: invokevirtual 157	java/util/ArrayList:size	()I
    //   298: ifne -147 -> 151
    //   301: ldc -97
    //   303: iconst_0
    //   304: anewarray 4	java/lang/Object
    //   307: invokestatic 94	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   310: aload 4
    //   312: areturn
    //   313: astore_0
    //   314: ldc -95
    //   316: iconst_0
    //   317: anewarray 4	java/lang/Object
    //   320: invokestatic 94	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   323: aload 4
    //   325: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	326	0	paramJSONObject	org.json.JSONObject
    //   263	24	1	i	int
    //   261	6	2	j	int
    //   146	2	3	bool	boolean
    //   6	146	4	localObject1	Object
    //   154	1	4	localJSONException1	org.json.JSONException
    //   167	1	4	str	String
    //   172	11	4	localInstantiationException	InstantiationException
    //   192	1	4	localObject2	Object
    //   197	11	4	localIllegalAccessException	IllegalAccessException
    //   217	107	4	localMessageMatcher	MessageMatcher
    //   47	26	5	localClass1	Class
    //   222	1	5	localJSONException2	org.json.JSONException
    //   236	1	5	localNullPointerException	NullPointerException
    //   43	7	6	localClass2	Class
    // Exception table:
    //   from	to	target	type
    //   0	8	154	org/json/JSONException
    //   13	30	154	org/json/JSONException
    //   72	82	172	java/lang/InstantiationException
    //   72	82	197	java/lang/IllegalAccessException
    //   87	129	222	org/json/JSONException
    //   87	129	236	java/lang/NullPointerException
    //   129	147	313	org/json/JSONException
    //   250	262	313	org/json/JSONException
    //   269	283	313	org/json/JSONException
    //   290	310	313	org/json/JSONException
  }
  
  protected boolean matches(Object paramObject)
  {
    return false;
  }
  
  protected boolean matchesInMaps(Map... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length <= 0)) {}
    Object localObject1;
    do
    {
      return false;
      Object localObject2 = null;
      int j = paramVarArgs.length;
      int i = 0;
      localObject1 = localObject2;
      if (i < j)
      {
        localObject1 = paramVarArgs[i];
        if (localObject1 == null) {}
        while (!((Map)localObject1).containsKey(key))
        {
          i += 1;
          break;
        }
        localObject1 = ((Map)localObject1).get(key);
      }
    } while ((localObject1 == null) || (!matches(localObject1)));
    return true;
  }
  
  protected Double tryParseDouble(Object paramObject)
  {
    try
    {
      paramObject = Double.valueOf(paramObject.toString());
      return (Double)paramObject;
    }
    catch (Exception paramObject) {}
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MessageMatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */