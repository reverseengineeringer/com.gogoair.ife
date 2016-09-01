package com.adobe.mobile;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.content.res.AssetManager;
import android.content.res.Resources;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class MobileConfig
{
  private static final String CONFIG_FILE_NAME = "ADBMobileConfig.json";
  private static final String CONFIG_PRIVACY_OPTED_IN = "optedin";
  private static final String CONFIG_PRIVACY_OPTED_OUT = "optedout";
  private static final String CONFIG_PRIVACY_UNKNOWN = "optunknown";
  private static final boolean DEFAULT_BACKDATE_SESSION_INFO = true;
  private static final int DEFAULT_BATCH_LIMIT = 0;
  private static final String DEFAULT_CHARSET = "UTF-8";
  private static final int DEFAULT_LIFECYCLE_TIMEOUT = 300;
  private static final int DEFAULT_LOCATION_TIMEOUT = 2;
  private static final boolean DEFAULT_OFFLINE_TRACKING = false;
  private static final MobilePrivacyStatus DEFAULT_PRIVACY_STATUS = MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_IN;
  private static final int DEFAULT_REFERRER_TIMEOUT = 0;
  private static final boolean DEFAULT_SSL = false;
  private static final String JSON_CONFIG_AAM_KEY = "audienceManager";
  private static final String JSON_CONFIG_ANALYTICS_KEY = "analytics";
  private static final String JSON_CONFIG_BACKDATE_SESSION_INFO_KEY = "backdateSessionInfo";
  private static final String JSON_CONFIG_BATCH_LIMIT_KEY = "batchLimit";
  private static final String JSON_CONFIG_CHAR_SET_KEY = "charset";
  private static final String JSON_CONFIG_CLIENT_CODE_KEY = "clientCode";
  private static final String JSON_CONFIG_LIFECYCLE_TIMEOUT_KEY = "lifecycleTimeout";
  private static final String JSON_CONFIG_MARKETINGCLOUD_KEY = "marketingCloud";
  private static final String JSON_CONFIG_MESSAGES_KEY = "messages";
  private static final String JSON_CONFIG_MESSAGES_URL_KEY = "messages";
  private static final String JSON_CONFIG_OFFLINE_TRACKING_KEY = "offlineEnabled";
  private static final String JSON_CONFIG_ORGID_KEY = "org";
  private static final String JSON_CONFIG_POINTS_OF_INTEREST_KEY = "poi";
  private static final String JSON_CONFIG_POI_REMOTES_KEY = "analytics.poi";
  private static final String JSON_CONFIG_PRIVACY_DEFAULT_KEY = "privacyDefault";
  private static final String JSON_CONFIG_REFERRER_TIMEOUT_KEY = "referrerTimeout";
  private static final String JSON_CONFIG_REMOTES_KEY = "remotes";
  private static final String JSON_CONFIG_REPORT_SUITES_KEY = "rsids";
  private static final String JSON_CONFIG_SERVER_KEY = "server";
  private static final String JSON_CONFIG_SSL_KEY = "ssl";
  private static final String JSON_CONFIG_TARGET_KEY = "target";
  private static final String JSON_CONFIG_TIMEOUT_KEY = "timeout";
  private static MobileConfig _instance = null;
  private static final Object _instanceMutex = new Object();
  private static InputStream _userDefinedInputStream = null;
  private static final Object _userDefinedInputStreamMutex = new Object();
  private static final Object _usingAnalyticsMutex = new Object();
  private static final Object _usingAudienceManagerMutex;
  private static final Object _usingGooglePlayServicesMutex = new Object();
  private static final Object _usingTargetMutex;
  private String _aamServer;
  private boolean _backdateSessionInfoEnabled;
  private int _batchLimit;
  private String _characterSet;
  private String _clientCode;
  private int _defaultLocationTimeout;
  private ArrayList _inAppMessages;
  private int _lifecycleTimeout;
  private String _marketingCloudOrganizationId;
  private String _messagesURL;
  private boolean _offlineTrackingEnabled;
  private List _pointsOfInterest;
  private String _pointsOfInterestURL;
  private MobilePrivacyStatus _privacyStatus;
  private int _referrerTimeout;
  private String _reportSuiteIds;
  private boolean _ssl;
  private String _trackingServer;
  private Boolean _usingAnalytics;
  private Boolean _usingAudienceManager;
  private Boolean _usingGooglePlayServices;
  private Boolean _usingTarget;
  
  static
  {
    _usingAudienceManagerMutex = new Object();
    _usingTargetMutex = new Object();
  }
  
  /* Error */
  private MobileConfig()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 149	java/lang/Object:<init>	()V
    //   4: aload_0
    //   5: aconst_null
    //   6: putfield 170	com/adobe/mobile/MobileConfig:_reportSuiteIds	Ljava/lang/String;
    //   9: aload_0
    //   10: aconst_null
    //   11: putfield 172	com/adobe/mobile/MobileConfig:_trackingServer	Ljava/lang/String;
    //   14: aload_0
    //   15: ldc 26
    //   17: putfield 174	com/adobe/mobile/MobileConfig:_characterSet	Ljava/lang/String;
    //   20: aload_0
    //   21: iconst_0
    //   22: putfield 176	com/adobe/mobile/MobileConfig:_ssl	Z
    //   25: aload_0
    //   26: iconst_0
    //   27: putfield 178	com/adobe/mobile/MobileConfig:_offlineTrackingEnabled	Z
    //   30: aload_0
    //   31: iconst_1
    //   32: putfield 180	com/adobe/mobile/MobileConfig:_backdateSessionInfoEnabled	Z
    //   35: aload_0
    //   36: sipush 300
    //   39: putfield 182	com/adobe/mobile/MobileConfig:_lifecycleTimeout	I
    //   42: aload_0
    //   43: iconst_0
    //   44: putfield 184	com/adobe/mobile/MobileConfig:_referrerTimeout	I
    //   47: aload_0
    //   48: iconst_0
    //   49: putfield 186	com/adobe/mobile/MobileConfig:_batchLimit	I
    //   52: aload_0
    //   53: getstatic 144	com/adobe/mobile/MobileConfig:DEFAULT_PRIVACY_STATUS	Lcom/adobe/mobile/MobilePrivacyStatus;
    //   56: putfield 188	com/adobe/mobile/MobileConfig:_privacyStatus	Lcom/adobe/mobile/MobilePrivacyStatus;
    //   59: aload_0
    //   60: aconst_null
    //   61: putfield 190	com/adobe/mobile/MobileConfig:_pointsOfInterest	Ljava/util/List;
    //   64: aload_0
    //   65: aconst_null
    //   66: putfield 192	com/adobe/mobile/MobileConfig:_pointsOfInterestURL	Ljava/lang/String;
    //   69: aload_0
    //   70: aconst_null
    //   71: putfield 194	com/adobe/mobile/MobileConfig:_clientCode	Ljava/lang/String;
    //   74: aload_0
    //   75: iconst_2
    //   76: putfield 196	com/adobe/mobile/MobileConfig:_defaultLocationTimeout	I
    //   79: aload_0
    //   80: aconst_null
    //   81: putfield 198	com/adobe/mobile/MobileConfig:_aamServer	Ljava/lang/String;
    //   84: aload_0
    //   85: aconst_null
    //   86: putfield 200	com/adobe/mobile/MobileConfig:_messagesURL	Ljava/lang/String;
    //   89: aload_0
    //   90: aconst_null
    //   91: putfield 202	com/adobe/mobile/MobileConfig:_inAppMessages	Ljava/util/ArrayList;
    //   94: aload_0
    //   95: aconst_null
    //   96: putfield 204	com/adobe/mobile/MobileConfig:_marketingCloudOrganizationId	Ljava/lang/String;
    //   99: aload_0
    //   100: aconst_null
    //   101: putfield 206	com/adobe/mobile/MobileConfig:_usingAnalytics	Ljava/lang/Boolean;
    //   104: aload_0
    //   105: aconst_null
    //   106: putfield 208	com/adobe/mobile/MobileConfig:_usingGooglePlayServices	Ljava/lang/Boolean;
    //   109: aload_0
    //   110: aconst_null
    //   111: putfield 210	com/adobe/mobile/MobileConfig:_usingAudienceManager	Ljava/lang/Boolean;
    //   114: aload_0
    //   115: aconst_null
    //   116: putfield 212	com/adobe/mobile/MobileConfig:_usingTarget	Ljava/lang/Boolean;
    //   119: aload_0
    //   120: invokespecial 216	com/adobe/mobile/MobileConfig:loadBundleConfig	()Lorg/json/JSONObject;
    //   123: astore_3
    //   124: aload_3
    //   125: ifnonnull +4 -> 129
    //   128: return
    //   129: aload_3
    //   130: ldc 41
    //   132: invokevirtual 222	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   135: astore_1
    //   136: aload_1
    //   137: ifnull +135 -> 272
    //   140: aload_0
    //   141: aload_1
    //   142: ldc 90
    //   144: invokevirtual 226	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   147: putfield 172	com/adobe/mobile/MobileConfig:_trackingServer	Ljava/lang/String;
    //   150: aload_0
    //   151: aload_1
    //   152: ldc 87
    //   154: invokevirtual 226	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   157: putfield 170	com/adobe/mobile/MobileConfig:_reportSuiteIds	Ljava/lang/String;
    //   160: aload_0
    //   161: aload_1
    //   162: ldc 50
    //   164: invokevirtual 226	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   167: putfield 174	com/adobe/mobile/MobileConfig:_characterSet	Ljava/lang/String;
    //   170: aload_0
    //   171: aload_1
    //   172: ldc 93
    //   174: invokevirtual 230	org/json/JSONObject:getBoolean	(Ljava/lang/String;)Z
    //   177: putfield 176	com/adobe/mobile/MobileConfig:_ssl	Z
    //   180: aload_0
    //   181: aload_1
    //   182: ldc 66
    //   184: invokevirtual 230	org/json/JSONObject:getBoolean	(Ljava/lang/String;)Z
    //   187: putfield 178	com/adobe/mobile/MobileConfig:_offlineTrackingEnabled	Z
    //   190: aload_0
    //   191: aload_1
    //   192: ldc 44
    //   194: invokevirtual 230	org/json/JSONObject:getBoolean	(Ljava/lang/String;)Z
    //   197: putfield 180	com/adobe/mobile/MobileConfig:_backdateSessionInfoEnabled	Z
    //   200: aload_0
    //   201: aload_1
    //   202: ldc 56
    //   204: invokevirtual 234	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   207: putfield 182	com/adobe/mobile/MobileConfig:_lifecycleTimeout	I
    //   210: aload_0
    //   211: aload_1
    //   212: ldc 81
    //   214: invokevirtual 234	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   217: putfield 184	com/adobe/mobile/MobileConfig:_referrerTimeout	I
    //   220: aload_0
    //   221: aload_1
    //   222: ldc 47
    //   224: invokevirtual 234	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   227: putfield 186	com/adobe/mobile/MobileConfig:_batchLimit	I
    //   230: invokestatic 240	com/adobe/mobile/StaticMethods:getSharedPreferences	()Landroid/content/SharedPreferences;
    //   233: ldc -14
    //   235: invokeinterface 247 2 0
    //   240: ifeq +286 -> 526
    //   243: aload_0
    //   244: invokestatic 251	com/adobe/mobile/MobilePrivacyStatus:values	()[Lcom/adobe/mobile/MobilePrivacyStatus;
    //   247: invokestatic 240	com/adobe/mobile/StaticMethods:getSharedPreferences	()Landroid/content/SharedPreferences;
    //   250: ldc -14
    //   252: iconst_0
    //   253: invokeinterface 254 3 0
    //   258: aaload
    //   259: putfield 188	com/adobe/mobile/MobileConfig:_privacyStatus	Lcom/adobe/mobile/MobilePrivacyStatus;
    //   262: aload_0
    //   263: aload_1
    //   264: ldc 72
    //   266: invokevirtual 258	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   269: invokespecial 262	com/adobe/mobile/MobileConfig:loadPoiFromJsonArray	(Lorg/json/JSONArray;)V
    //   272: aload_3
    //   273: ldc 96
    //   275: invokevirtual 222	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   278: astore_1
    //   279: aload_1
    //   280: ifnull +23 -> 303
    //   283: aload_0
    //   284: aload_1
    //   285: ldc 53
    //   287: invokevirtual 226	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   290: putfield 194	com/adobe/mobile/MobileConfig:_clientCode	Ljava/lang/String;
    //   293: aload_0
    //   294: aload_1
    //   295: ldc 99
    //   297: invokevirtual 234	org/json/JSONObject:getInt	(Ljava/lang/String;)I
    //   300: putfield 196	com/adobe/mobile/MobileConfig:_defaultLocationTimeout	I
    //   303: aload_3
    //   304: ldc 38
    //   306: invokevirtual 222	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   309: astore_1
    //   310: aload_1
    //   311: ifnull +13 -> 324
    //   314: aload_0
    //   315: aload_1
    //   316: ldc 90
    //   318: invokevirtual 226	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   321: putfield 198	com/adobe/mobile/MobileConfig:_aamServer	Ljava/lang/String;
    //   324: aload_3
    //   325: ldc 84
    //   327: invokevirtual 222	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   330: astore_1
    //   331: aload_1
    //   332: ifnull +23 -> 355
    //   335: aload_0
    //   336: aload_1
    //   337: ldc 62
    //   339: invokevirtual 226	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   342: putfield 200	com/adobe/mobile/MobileConfig:_messagesURL	Ljava/lang/String;
    //   345: aload_0
    //   346: aload_1
    //   347: ldc 75
    //   349: invokevirtual 226	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   352: putfield 192	com/adobe/mobile/MobileConfig:_pointsOfInterestURL	Ljava/lang/String;
    //   355: invokestatic 266	com/adobe/mobile/StaticMethods:isWearableApp	()Z
    //   358: ifne +26 -> 384
    //   361: aload_3
    //   362: ldc 62
    //   364: invokevirtual 258	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   367: astore_1
    //   368: aload_1
    //   369: ifnull +15 -> 384
    //   372: aload_1
    //   373: invokevirtual 272	org/json/JSONArray:length	()I
    //   376: ifle +8 -> 384
    //   379: aload_0
    //   380: aload_1
    //   381: invokespecial 275	com/adobe/mobile/MobileConfig:loadMessagesFromJsonArray	(Lorg/json/JSONArray;)V
    //   384: aload_3
    //   385: ldc 59
    //   387: invokevirtual 222	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   390: astore_1
    //   391: aload_1
    //   392: ifnull +13 -> 405
    //   395: aload_0
    //   396: aload_1
    //   397: ldc 69
    //   399: invokevirtual 226	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   402: putfield 204	com/adobe/mobile/MobileConfig:_marketingCloudOrganizationId	Ljava/lang/String;
    //   405: invokestatic 266	com/adobe/mobile/StaticMethods:isWearableApp	()Z
    //   408: ifne +7 -> 415
    //   411: aload_0
    //   412: invokevirtual 278	com/adobe/mobile/MobileConfig:loadCachedRemotes	()V
    //   415: aload_0
    //   416: invokespecial 281	com/adobe/mobile/MobileConfig:updateBlacklist	()V
    //   419: return
    //   420: astore_1
    //   421: ldc_w 283
    //   424: iconst_0
    //   425: anewarray 4	java/lang/Object
    //   428: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   431: aconst_null
    //   432: astore_1
    //   433: goto -297 -> 136
    //   436: astore_2
    //   437: aload_0
    //   438: aconst_null
    //   439: putfield 172	com/adobe/mobile/MobileConfig:_trackingServer	Ljava/lang/String;
    //   442: aload_0
    //   443: aconst_null
    //   444: putfield 170	com/adobe/mobile/MobileConfig:_reportSuiteIds	Ljava/lang/String;
    //   447: ldc_w 289
    //   450: iconst_0
    //   451: anewarray 4	java/lang/Object
    //   454: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   457: goto -297 -> 160
    //   460: astore_2
    //   461: aload_0
    //   462: ldc 26
    //   464: putfield 174	com/adobe/mobile/MobileConfig:_characterSet	Ljava/lang/String;
    //   467: goto -297 -> 170
    //   470: astore_2
    //   471: aload_0
    //   472: iconst_0
    //   473: putfield 176	com/adobe/mobile/MobileConfig:_ssl	Z
    //   476: goto -296 -> 180
    //   479: astore_2
    //   480: aload_0
    //   481: iconst_0
    //   482: putfield 178	com/adobe/mobile/MobileConfig:_offlineTrackingEnabled	Z
    //   485: goto -295 -> 190
    //   488: astore_2
    //   489: aload_0
    //   490: iconst_1
    //   491: putfield 180	com/adobe/mobile/MobileConfig:_backdateSessionInfoEnabled	Z
    //   494: goto -294 -> 200
    //   497: astore_2
    //   498: aload_0
    //   499: sipush 300
    //   502: putfield 182	com/adobe/mobile/MobileConfig:_lifecycleTimeout	I
    //   505: goto -295 -> 210
    //   508: astore_2
    //   509: aload_0
    //   510: iconst_0
    //   511: putfield 184	com/adobe/mobile/MobileConfig:_referrerTimeout	I
    //   514: goto -294 -> 220
    //   517: astore_2
    //   518: aload_0
    //   519: iconst_0
    //   520: putfield 186	com/adobe/mobile/MobileConfig:_batchLimit	I
    //   523: goto -293 -> 230
    //   526: aload_1
    //   527: ldc 78
    //   529: invokevirtual 226	org/json/JSONObject:getString	(Ljava/lang/String;)Ljava/lang/String;
    //   532: astore_2
    //   533: aload_2
    //   534: ifnull +42 -> 576
    //   537: aload_0
    //   538: aload_2
    //   539: invokespecial 293	com/adobe/mobile/MobileConfig:privacyStatusFromString	(Ljava/lang/String;)Lcom/adobe/mobile/MobilePrivacyStatus;
    //   542: astore_2
    //   543: aload_0
    //   544: aload_2
    //   545: putfield 188	com/adobe/mobile/MobileConfig:_privacyStatus	Lcom/adobe/mobile/MobilePrivacyStatus;
    //   548: goto -286 -> 262
    //   551: astore_1
    //   552: ldc_w 295
    //   555: iconst_1
    //   556: anewarray 4	java/lang/Object
    //   559: dup
    //   560: iconst_0
    //   561: aload_1
    //   562: invokevirtual 299	com/adobe/mobile/StaticMethods$NullContextException:getMessage	()Ljava/lang/String;
    //   565: aastore
    //   566: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   569: return
    //   570: astore_2
    //   571: aconst_null
    //   572: astore_2
    //   573: goto -40 -> 533
    //   576: getstatic 144	com/adobe/mobile/MobileConfig:DEFAULT_PRIVACY_STATUS	Lcom/adobe/mobile/MobilePrivacyStatus;
    //   579: astore_2
    //   580: goto -37 -> 543
    //   583: astore_1
    //   584: ldc_w 304
    //   587: iconst_1
    //   588: anewarray 4	java/lang/Object
    //   591: dup
    //   592: iconst_0
    //   593: aload_1
    //   594: invokevirtual 307	org/json/JSONException:getLocalizedMessage	()Ljava/lang/String;
    //   597: aastore
    //   598: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   601: goto -329 -> 272
    //   604: astore_1
    //   605: ldc_w 309
    //   608: iconst_0
    //   609: anewarray 4	java/lang/Object
    //   612: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   615: aconst_null
    //   616: astore_1
    //   617: goto -338 -> 279
    //   620: astore_2
    //   621: aload_0
    //   622: aconst_null
    //   623: putfield 194	com/adobe/mobile/MobileConfig:_clientCode	Ljava/lang/String;
    //   626: ldc_w 309
    //   629: iconst_0
    //   630: anewarray 4	java/lang/Object
    //   633: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   636: goto -343 -> 293
    //   639: astore_1
    //   640: aload_0
    //   641: iconst_2
    //   642: putfield 196	com/adobe/mobile/MobileConfig:_defaultLocationTimeout	I
    //   645: goto -342 -> 303
    //   648: astore_1
    //   649: ldc_w 311
    //   652: iconst_0
    //   653: anewarray 4	java/lang/Object
    //   656: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   659: aconst_null
    //   660: astore_1
    //   661: goto -351 -> 310
    //   664: astore_1
    //   665: aload_0
    //   666: aconst_null
    //   667: putfield 198	com/adobe/mobile/MobileConfig:_aamServer	Ljava/lang/String;
    //   670: ldc_w 311
    //   673: iconst_0
    //   674: anewarray 4	java/lang/Object
    //   677: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   680: goto -356 -> 324
    //   683: astore_1
    //   684: ldc_w 313
    //   687: iconst_0
    //   688: anewarray 4	java/lang/Object
    //   691: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   694: aconst_null
    //   695: astore_1
    //   696: goto -365 -> 331
    //   699: astore_2
    //   700: ldc_w 315
    //   703: iconst_1
    //   704: anewarray 4	java/lang/Object
    //   707: dup
    //   708: iconst_0
    //   709: aload_2
    //   710: invokevirtual 307	org/json/JSONException:getLocalizedMessage	()Ljava/lang/String;
    //   713: aastore
    //   714: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   717: goto -372 -> 345
    //   720: astore_1
    //   721: ldc_w 317
    //   724: iconst_1
    //   725: anewarray 4	java/lang/Object
    //   728: dup
    //   729: iconst_0
    //   730: aload_1
    //   731: invokevirtual 307	org/json/JSONException:getLocalizedMessage	()Ljava/lang/String;
    //   734: aastore
    //   735: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   738: goto -383 -> 355
    //   741: astore_1
    //   742: ldc_w 319
    //   745: iconst_0
    //   746: anewarray 4	java/lang/Object
    //   749: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   752: aconst_null
    //   753: astore_1
    //   754: goto -386 -> 368
    //   757: astore_1
    //   758: ldc_w 321
    //   761: iconst_0
    //   762: anewarray 4	java/lang/Object
    //   765: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   768: aconst_null
    //   769: astore_1
    //   770: goto -379 -> 391
    //   773: astore_1
    //   774: aload_0
    //   775: aconst_null
    //   776: putfield 204	com/adobe/mobile/MobileConfig:_marketingCloudOrganizationId	Ljava/lang/String;
    //   779: ldc_w 323
    //   782: iconst_0
    //   783: anewarray 4	java/lang/Object
    //   786: invokestatic 287	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   789: goto -384 -> 405
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	792	0	this	MobileConfig
    //   135	262	1	localObject1	Object
    //   420	1	1	localJSONException1	JSONException
    //   432	95	1	localObject2	Object
    //   551	11	1	localNullContextException	StaticMethods.NullContextException
    //   583	11	1	localJSONException2	JSONException
    //   604	1	1	localJSONException3	JSONException
    //   616	1	1	localObject3	Object
    //   639	1	1	localJSONException4	JSONException
    //   648	1	1	localJSONException5	JSONException
    //   660	1	1	localObject4	Object
    //   664	1	1	localJSONException6	JSONException
    //   683	1	1	localJSONException7	JSONException
    //   695	1	1	localObject5	Object
    //   720	11	1	localJSONException8	JSONException
    //   741	1	1	localJSONException9	JSONException
    //   753	1	1	localObject6	Object
    //   757	1	1	localJSONException10	JSONException
    //   769	1	1	localObject7	Object
    //   773	1	1	localJSONException11	JSONException
    //   436	1	2	localJSONException12	JSONException
    //   460	1	2	localJSONException13	JSONException
    //   470	1	2	localJSONException14	JSONException
    //   479	1	2	localJSONException15	JSONException
    //   488	1	2	localJSONException16	JSONException
    //   497	1	2	localJSONException17	JSONException
    //   508	1	2	localJSONException18	JSONException
    //   517	1	2	localJSONException19	JSONException
    //   532	13	2	localObject8	Object
    //   570	1	2	localJSONException20	JSONException
    //   572	8	2	localMobilePrivacyStatus	MobilePrivacyStatus
    //   620	1	2	localJSONException21	JSONException
    //   699	11	2	localJSONException22	JSONException
    //   123	262	3	localJSONObject	JSONObject
    // Exception table:
    //   from	to	target	type
    //   129	136	420	org/json/JSONException
    //   140	160	436	org/json/JSONException
    //   160	170	460	org/json/JSONException
    //   170	180	470	org/json/JSONException
    //   180	190	479	org/json/JSONException
    //   190	200	488	org/json/JSONException
    //   200	210	497	org/json/JSONException
    //   210	220	508	org/json/JSONException
    //   220	230	517	org/json/JSONException
    //   230	262	551	com/adobe/mobile/StaticMethods$NullContextException
    //   526	533	551	com/adobe/mobile/StaticMethods$NullContextException
    //   537	543	551	com/adobe/mobile/StaticMethods$NullContextException
    //   543	548	551	com/adobe/mobile/StaticMethods$NullContextException
    //   576	580	551	com/adobe/mobile/StaticMethods$NullContextException
    //   526	533	570	org/json/JSONException
    //   262	272	583	org/json/JSONException
    //   272	279	604	org/json/JSONException
    //   283	293	620	org/json/JSONException
    //   293	303	639	org/json/JSONException
    //   303	310	648	org/json/JSONException
    //   314	324	664	org/json/JSONException
    //   324	331	683	org/json/JSONException
    //   335	345	699	org/json/JSONException
    //   345	355	720	org/json/JSONException
    //   361	368	741	org/json/JSONException
    //   384	391	757	org/json/JSONException
    //   395	405	773	org/json/JSONException
  }
  
  protected static MobileConfig getInstance()
  {
    synchronized (_instanceMutex)
    {
      if (_instance == null) {
        _instance = new MobileConfig();
      }
      MobileConfig localMobileConfig = _instance;
      return localMobileConfig;
    }
  }
  
  private JSONObject loadBundleConfig()
  {
    Object localObject4 = null;
    InputStream localInputStream;
    synchronized (_userDefinedInputStreamMutex)
    {
      localInputStream = _userDefinedInputStream;
      ??? = localObject4;
      if (localInputStream == null) {}
    }
    Object localObject3;
    try
    {
      StaticMethods.logDebugFormat("Config - Attempting to load config file from override stream", new Object[0]);
      ??? = loadConfigFromStream(_userDefinedInputStream);
      localObject4 = ???;
      if (??? == null)
      {
        if (localInputStream != null) {
          StaticMethods.logDebugFormat("Config - Failed attempting to load custom config, will fall back to standard config location.", new Object[0]);
        }
        StaticMethods.logDebugFormat("Config - Attempting to load config file from default location", new Object[0]);
      }
      try
      {
        localObject4 = loadConfigFromStream(StaticMethods.getSharedContext().getResources().getAssets().open("ADBMobileConfig.json"));
        return (JSONObject)localObject4;
      }
      catch (IOException localIOException2)
      {
        Object localObject2;
        StaticMethods.logErrorFormat("Config - Exception loading config file (%s)", new Object[] { localIOException2.getMessage() });
        return (JSONObject)localObject3;
      }
      catch (JSONException localJSONException2)
      {
        StaticMethods.logErrorFormat("Config - Exception parsing config file (%s)", new Object[] { localJSONException2.getMessage() });
        return (JSONObject)localObject3;
      }
      catch (StaticMethods.NullContextException localNullContextException)
      {
        StaticMethods.logErrorFormat("Config - Null context when attempting to read config file (%s)", new Object[] { localNullContextException.getMessage() });
      }
      localObject5 = finally;
      throw ((Throwable)localObject5);
    }
    catch (IOException localIOException1)
    {
      for (;;)
      {
        StaticMethods.logDebugFormat("Config - Error loading user defined config (%s)", new Object[] { localIOException1.getMessage() });
        localObject2 = localObject5;
      }
    }
    catch (JSONException localJSONException1)
    {
      for (;;)
      {
        StaticMethods.logDebugFormat("Config - Error parsing user defined config (%s)", new Object[] { localJSONException1.getMessage() });
        localObject3 = localObject5;
      }
    }
    return (JSONObject)localObject3;
  }
  
  private JSONObject loadConfigFromStream(InputStream paramInputStream)
    throws JSONException, IOException
  {
    if (paramInputStream == null) {
      return null;
    }
    try
    {
      Object localObject1 = new byte[paramInputStream.available()];
      paramInputStream.read((byte[])localObject1);
      localObject1 = new JSONObject(new String((byte[])localObject1, "UTF-8"));
      try
      {
        paramInputStream.close();
        return (JSONObject)localObject1;
      }
      catch (IOException paramInputStream)
      {
        StaticMethods.logErrorFormat("Config - Unable to close stream (%s)", new Object[] { paramInputStream.getMessage() });
        return (JSONObject)localObject1;
      }
      try
      {
        paramInputStream.close();
        throw ((Throwable)localObject2);
      }
      catch (IOException paramInputStream)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("Config - Unable to close stream (%s)", new Object[] { paramInputStream.getMessage() });
        }
      }
    }
    catch (IOException localIOException)
    {
      localIOException = localIOException;
      StaticMethods.logErrorFormat("Config - Exception when reading config (%s)", new Object[] { localIOException.getMessage() });
      try
      {
        paramInputStream.close();
        return new JSONObject();
      }
      catch (IOException paramInputStream)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("Config - Unable to close stream (%s)", new Object[] { paramInputStream.getMessage() });
        }
      }
    }
    catch (NullPointerException localNullPointerException)
    {
      for (;;)
      {
        localNullPointerException = localNullPointerException;
        StaticMethods.logErrorFormat("Config - Stream closed when attempting to load config (%s)", new Object[] { localNullPointerException.getMessage() });
        try
        {
          paramInputStream.close();
        }
        catch (IOException paramInputStream)
        {
          StaticMethods.logErrorFormat("Config - Unable to close stream (%s)", new Object[] { paramInputStream.getMessage() });
        }
      }
    }
    finally {}
  }
  
  private void loadMessageImages()
  {
    StaticMethods.getMessageImageCachingExecutor().execute(new MobileConfig.6(this));
  }
  
  private void loadMessagesDataFromRemote(JSONObject paramJSONObject)
  {
    if (paramJSONObject == null)
    {
      StaticMethods.logDebugFormat("Messages - Remote messages config was null, falling back to bundled messages", new Object[0]);
      RemoteDownload.deleteFilesInDirectory("messageImages");
      return;
    }
    try
    {
      paramJSONObject = paramJSONObject.getJSONArray("messages");
      StaticMethods.logDebugFormat("Messages - Using remote definition for messages", new Object[0]);
      if ((paramJSONObject == null) || (paramJSONObject.length() <= 0))
      {
        RemoteDownload.deleteFilesInDirectory("messageImages");
        _inAppMessages = null;
        return;
      }
    }
    catch (JSONException paramJSONObject)
    {
      for (;;)
      {
        StaticMethods.logDebugFormat("Messages - Remote messages not configured, falling back to bundled messages", new Object[0]);
        paramJSONObject = null;
      }
      loadMessagesFromJsonArray(paramJSONObject);
    }
  }
  
  private void loadMessagesFromJsonArray(JSONArray paramJSONArray)
  {
    for (;;)
    {
      int i;
      try
      {
        ArrayList localArrayList = new ArrayList();
        int j = paramJSONArray.length();
        i = 0;
        if (i < j)
        {
          Message localMessage = Message.messageWithJsonObject(paramJSONArray.getJSONObject(i));
          if (localMessage != null)
          {
            StaticMethods.logDebugFormat("Messages - loaded message - %s", new Object[] { localMessage.description() });
            localArrayList.add(localMessage);
          }
        }
        else
        {
          _inAppMessages = localArrayList;
          return;
        }
      }
      catch (JSONException paramJSONArray)
      {
        StaticMethods.logErrorFormat("Messages - Unable to parse messages JSON (%s)", new Object[] { paramJSONArray.getMessage() });
        return;
      }
      i += 1;
    }
  }
  
  private void loadPoiFromJsonArray(JSONArray paramJSONArray)
  {
    if (paramJSONArray == null) {}
    for (;;)
    {
      return;
      try
      {
        _pointsOfInterest = new ArrayList();
        int j = paramJSONArray.length();
        int i = 0;
        while (i < j)
        {
          JSONArray localJSONArray = paramJSONArray.getJSONArray(i);
          ArrayList localArrayList = new ArrayList(4);
          localArrayList.add(localJSONArray.getString(0));
          localArrayList.add(Double.valueOf(localJSONArray.getDouble(1)));
          localArrayList.add(Double.valueOf(localJSONArray.getDouble(2)));
          localArrayList.add(Double.valueOf(localJSONArray.getDouble(3)));
          _pointsOfInterest.add(localArrayList);
          i += 1;
        }
        return;
      }
      catch (JSONException paramJSONArray)
      {
        StaticMethods.logErrorFormat("Messages - Unable to parse remote points of interest JSON (%s)", new Object[] { paramJSONArray.getMessage() });
      }
    }
  }
  
  private MobilePrivacyStatus privacyStatusFromString(String paramString)
  {
    if (paramString != null)
    {
      if (paramString.equalsIgnoreCase("optedin")) {
        return MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_IN;
      }
      if (paramString.equalsIgnoreCase("optedout")) {
        return MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_OUT;
      }
      if (paramString.equalsIgnoreCase("optunknown")) {
        return MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_UNKNOWN;
      }
    }
    return DEFAULT_PRIVACY_STATUS;
  }
  
  public static void setUserDefinedConfigPath(InputStream paramInputStream)
  {
    synchronized (_userDefinedInputStreamMutex)
    {
      if (_userDefinedInputStream == null) {
        _userDefinedInputStream = paramInputStream;
      }
      return;
    }
  }
  
  private void updateBlacklist()
  {
    if (_inAppMessages == null) {}
    for (;;)
    {
      return;
      Iterator localIterator = _inAppMessages.iterator();
      while (localIterator.hasNext())
      {
        Message localMessage = (Message)localIterator.next();
        HashMap localHashMap = localMessage.loadBlacklist();
        if ((localMessage.isBlacklisted()) && (showRule.getValue() != ((Integer)localHashMap.get(messageId)).intValue())) {
          localMessage.removeFromBlacklist();
        }
      }
    }
  }
  
  protected void downloadRemoteConfigs()
  {
    StaticMethods.getMessagesExecutor().execute(new MobileConfig.4(this));
    if ((_pointsOfInterestURL != null) && (_pointsOfInterestURL.length() > 0)) {
      RemoteDownload.remoteDownloadAsync(_pointsOfInterestURL, new MobileConfig.5(this));
    }
  }
  
  protected String getAamServer()
  {
    return _aamServer;
  }
  
  protected boolean getBackdateSessionInfoEnabled()
  {
    return _backdateSessionInfoEnabled;
  }
  
  protected int getBatchLimit()
  {
    return _batchLimit;
  }
  
  protected String getCharacterSet()
  {
    return _characterSet;
  }
  
  protected String getClientCode()
  {
    return _clientCode;
  }
  
  protected int getDefaultLocationTimeout()
  {
    return _defaultLocationTimeout;
  }
  
  protected String getInAppMessageURL()
  {
    return _messagesURL;
  }
  
  protected ArrayList getInAppMessages()
  {
    return _inAppMessages;
  }
  
  protected int getLifecycleTimeout()
  {
    return _lifecycleTimeout;
  }
  
  protected String getMarketingCloudOrganizationId()
  {
    return _marketingCloudOrganizationId;
  }
  
  protected boolean getOfflineTrackingEnabled()
  {
    return _offlineTrackingEnabled;
  }
  
  protected List getPointsOfInterest()
  {
    return _pointsOfInterest;
  }
  
  protected String getPointsOfInterestURL()
  {
    return _pointsOfInterestURL;
  }
  
  protected MobilePrivacyStatus getPrivacyStatus()
  {
    return _privacyStatus;
  }
  
  protected int getReferrerTimeout()
  {
    return _referrerTimeout;
  }
  
  protected String getReportSuiteIds()
  {
    return _reportSuiteIds;
  }
  
  protected boolean getSSL()
  {
    return _ssl;
  }
  
  protected String getTrackingServer()
  {
    return _trackingServer;
  }
  
  protected boolean getVisitorIdServiceEnabled()
  {
    return (_marketingCloudOrganizationId != null) && (_marketingCloudOrganizationId.length() > 0);
  }
  
  protected void loadCachedRemotes()
  {
    if ((_messagesURL != null) && (_messagesURL.length() > 0)) {
      updateMessagesData(RemoteDownload.getFileForCachedURL(_messagesURL));
    }
    if ((_pointsOfInterestURL != null) && (_pointsOfInterestURL.length() > 0)) {
      updatePOIData(RemoteDownload.getFileForCachedURL(_pointsOfInterestURL));
    }
  }
  
  protected boolean mobileUsingAnalytics()
  {
    boolean bool2 = false;
    synchronized (_usingAnalyticsMutex)
    {
      if (_usingAnalytics == null)
      {
        bool1 = bool2;
        if (getReportSuiteIds() != null)
        {
          bool1 = bool2;
          if (getReportSuiteIds().length() > 0)
          {
            bool1 = bool2;
            if (getTrackingServer() != null)
            {
              bool1 = bool2;
              if (getTrackingServer().length() > 0) {
                bool1 = true;
              }
            }
          }
        }
        _usingAnalytics = Boolean.valueOf(bool1);
        if (!_usingAnalytics.booleanValue()) {
          StaticMethods.logDebugFormat("Analytics - Your config file is not set up to use Analytics(missing report suite id(s) or tracking server information)", new Object[0]);
        }
      }
      boolean bool1 = _usingAnalytics.booleanValue();
      return bool1;
    }
  }
  
  protected boolean mobileUsingAudienceManager()
  {
    boolean bool2 = false;
    if (StaticMethods.isWearableApp()) {
      return false;
    }
    synchronized (_usingAudienceManagerMutex)
    {
      if (_usingAudienceManager == null)
      {
        bool1 = bool2;
        if (getAamServer() != null)
        {
          bool1 = bool2;
          if (getAamServer().length() > 0) {
            bool1 = true;
          }
        }
        _usingAudienceManager = Boolean.valueOf(bool1);
        if (!_usingAudienceManager.booleanValue()) {
          StaticMethods.logDebugFormat("Audience Manager - Your config file is not set up to use Audience Manager(missing audience manager server information)", new Object[0]);
        }
      }
      boolean bool1 = _usingAudienceManager.booleanValue();
      return bool1;
    }
  }
  
  protected boolean mobileUsingGooglePlayServices()
  {
    synchronized (_usingGooglePlayServicesMutex)
    {
      if (_usingGooglePlayServices == null) {
        _usingGooglePlayServices = Boolean.valueOf(WearableFunctionBridge.isGooglePlayServicesEnabled());
      }
      boolean bool = _usingGooglePlayServices.booleanValue();
      return bool;
    }
  }
  
  protected boolean mobileUsingTarget()
  {
    boolean bool2 = false;
    if (StaticMethods.isWearableApp()) {
      return false;
    }
    synchronized (_usingTargetMutex)
    {
      if (_usingTarget == null)
      {
        bool1 = bool2;
        if (getClientCode() != null)
        {
          bool1 = bool2;
          if (getClientCode().length() > 0) {
            bool1 = true;
          }
        }
        _usingTarget = Boolean.valueOf(bool1);
        if (!_usingTarget.booleanValue()) {
          StaticMethods.logDebugFormat("TargetWorker - Your config file is not set up to use Target(missing client code information)", new Object[0]);
        }
      }
      boolean bool1 = _usingTarget.booleanValue();
      return bool1;
    }
  }
  
  protected void setPrivacyStatus(MobilePrivacyStatus paramMobilePrivacyStatus)
  {
    if (paramMobilePrivacyStatus == null) {
      return;
    }
    if ((paramMobilePrivacyStatus == MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_UNKNOWN) && (!_offlineTrackingEnabled))
    {
      StaticMethods.logWarningFormat("Analytics - Cannot set privacy status to unknown when offline tracking is disabled", new Object[0]);
      return;
    }
    if (paramMobilePrivacyStatus == MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_IN) {
      StaticMethods.getAnalyticsExecutor().execute(new MobileConfig.1(this));
    }
    if (paramMobilePrivacyStatus == MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_OUT)
    {
      StaticMethods.getAnalyticsExecutor().execute(new MobileConfig.2(this));
      StaticMethods.getAudienceExecutor().execute(new MobileConfig.3(this));
    }
    _privacyStatus = paramMobilePrivacyStatus;
    WearableFunctionBridge.syncPrivacyStatusToWearable(paramMobilePrivacyStatus.getValue());
    try
    {
      SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
      localEditor.putInt("PrivacyStatus", paramMobilePrivacyStatus.getValue());
      localEditor.commit();
      return;
    }
    catch (StaticMethods.NullContextException paramMobilePrivacyStatus)
    {
      StaticMethods.logErrorFormat("Config - Error persisting privacy status (%s).", new Object[] { paramMobilePrivacyStatus.getMessage() });
    }
  }
  
  /* Error */
  protected void updateMessagesData(java.io.File paramFile)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +35 -> 36
    //   4: iconst_0
    //   5: ifeq +11 -> 16
    //   8: new 384	java/lang/NullPointerException
    //   11: dup
    //   12: invokespecial 667	java/lang/NullPointerException:<init>	()V
    //   15: athrow
    //   16: return
    //   17: astore_1
    //   18: ldc_w 669
    //   21: iconst_1
    //   22: anewarray 4	java/lang/Object
    //   25: dup
    //   26: iconst_0
    //   27: aload_1
    //   28: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   31: aastore
    //   32: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   35: return
    //   36: new 672	java/io/FileInputStream
    //   39: dup
    //   40: aload_1
    //   41: invokespecial 674	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   44: astore_2
    //   45: aload_2
    //   46: astore_1
    //   47: aload_0
    //   48: aload_0
    //   49: aload_2
    //   50: invokespecial 344	com/adobe/mobile/MobileConfig:loadConfigFromStream	(Ljava/io/InputStream;)Lorg/json/JSONObject;
    //   53: invokespecial 676	com/adobe/mobile/MobileConfig:loadMessagesDataFromRemote	(Lorg/json/JSONObject;)V
    //   56: aload_2
    //   57: ifnull -41 -> 16
    //   60: aload_2
    //   61: invokevirtual 677	java/io/FileInputStream:close	()V
    //   64: return
    //   65: astore_1
    //   66: ldc_w 669
    //   69: iconst_1
    //   70: anewarray 4	java/lang/Object
    //   73: dup
    //   74: iconst_0
    //   75: aload_1
    //   76: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   79: aastore
    //   80: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   83: return
    //   84: astore_3
    //   85: aconst_null
    //   86: astore_2
    //   87: aload_2
    //   88: astore_1
    //   89: ldc_w 679
    //   92: iconst_1
    //   93: anewarray 4	java/lang/Object
    //   96: dup
    //   97: iconst_0
    //   98: aload_3
    //   99: invokevirtual 307	org/json/JSONException:getLocalizedMessage	()Ljava/lang/String;
    //   102: aastore
    //   103: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   106: aload_2
    //   107: ifnull -91 -> 16
    //   110: aload_2
    //   111: invokevirtual 677	java/io/FileInputStream:close	()V
    //   114: return
    //   115: astore_1
    //   116: ldc_w 669
    //   119: iconst_1
    //   120: anewarray 4	java/lang/Object
    //   123: dup
    //   124: iconst_0
    //   125: aload_1
    //   126: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   129: aastore
    //   130: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   133: return
    //   134: astore_3
    //   135: aconst_null
    //   136: astore_2
    //   137: aload_2
    //   138: astore_1
    //   139: ldc_w 681
    //   142: iconst_1
    //   143: anewarray 4	java/lang/Object
    //   146: dup
    //   147: iconst_0
    //   148: aload_3
    //   149: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   152: aastore
    //   153: invokestatic 632	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   156: aload_2
    //   157: ifnull -141 -> 16
    //   160: aload_2
    //   161: invokevirtual 677	java/io/FileInputStream:close	()V
    //   164: return
    //   165: astore_1
    //   166: ldc_w 669
    //   169: iconst_1
    //   170: anewarray 4	java/lang/Object
    //   173: dup
    //   174: iconst_0
    //   175: aload_1
    //   176: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   179: aastore
    //   180: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   183: return
    //   184: astore_2
    //   185: aconst_null
    //   186: astore_1
    //   187: aload_1
    //   188: ifnull +7 -> 195
    //   191: aload_1
    //   192: invokevirtual 677	java/io/FileInputStream:close	()V
    //   195: aload_2
    //   196: athrow
    //   197: astore_1
    //   198: ldc_w 669
    //   201: iconst_1
    //   202: anewarray 4	java/lang/Object
    //   205: dup
    //   206: iconst_0
    //   207: aload_1
    //   208: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   211: aastore
    //   212: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   215: goto -20 -> 195
    //   218: astore_2
    //   219: goto -32 -> 187
    //   222: astore_3
    //   223: goto -86 -> 137
    //   226: astore_3
    //   227: goto -140 -> 87
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	230	0	this	MobileConfig
    //   0	230	1	paramFile	java.io.File
    //   44	117	2	localFileInputStream	java.io.FileInputStream
    //   184	12	2	localObject1	Object
    //   218	1	2	localObject2	Object
    //   84	15	3	localJSONException1	JSONException
    //   134	15	3	localIOException1	IOException
    //   222	1	3	localIOException2	IOException
    //   226	1	3	localJSONException2	JSONException
    // Exception table:
    //   from	to	target	type
    //   8	16	17	java/io/IOException
    //   60	64	65	java/io/IOException
    //   36	45	84	org/json/JSONException
    //   110	114	115	java/io/IOException
    //   36	45	134	java/io/IOException
    //   160	164	165	java/io/IOException
    //   36	45	184	finally
    //   191	195	197	java/io/IOException
    //   47	56	218	finally
    //   89	106	218	finally
    //   139	156	218	finally
    //   47	56	222	java/io/IOException
    //   47	56	226	org/json/JSONException
  }
  
  /* Error */
  protected void updatePOIData(java.io.File paramFile)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +35 -> 36
    //   4: iconst_0
    //   5: ifeq +11 -> 16
    //   8: new 384	java/lang/NullPointerException
    //   11: dup
    //   12: invokespecial 667	java/lang/NullPointerException:<init>	()V
    //   15: athrow
    //   16: return
    //   17: astore_1
    //   18: ldc_w 683
    //   21: iconst_1
    //   22: anewarray 4	java/lang/Object
    //   25: dup
    //   26: iconst_0
    //   27: aload_1
    //   28: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   31: aastore
    //   32: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   35: return
    //   36: new 672	java/io/FileInputStream
    //   39: dup
    //   40: aload_1
    //   41: invokespecial 674	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   44: astore_2
    //   45: aload_2
    //   46: astore_1
    //   47: aload_0
    //   48: aload_2
    //   49: invokespecial 344	com/adobe/mobile/MobileConfig:loadConfigFromStream	(Ljava/io/InputStream;)Lorg/json/JSONObject;
    //   52: astore_3
    //   53: aload_3
    //   54: ifnull +20 -> 74
    //   57: aload_2
    //   58: astore_1
    //   59: aload_0
    //   60: aload_3
    //   61: ldc 41
    //   63: invokevirtual 222	org/json/JSONObject:getJSONObject	(Ljava/lang/String;)Lorg/json/JSONObject;
    //   66: ldc 72
    //   68: invokevirtual 258	org/json/JSONObject:getJSONArray	(Ljava/lang/String;)Lorg/json/JSONArray;
    //   71: invokespecial 262	com/adobe/mobile/MobileConfig:loadPoiFromJsonArray	(Lorg/json/JSONArray;)V
    //   74: aload_2
    //   75: ifnull -59 -> 16
    //   78: aload_2
    //   79: invokevirtual 677	java/io/FileInputStream:close	()V
    //   82: return
    //   83: astore_1
    //   84: ldc_w 683
    //   87: iconst_1
    //   88: anewarray 4	java/lang/Object
    //   91: dup
    //   92: iconst_0
    //   93: aload_1
    //   94: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   97: aastore
    //   98: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   101: return
    //   102: astore_3
    //   103: aconst_null
    //   104: astore_2
    //   105: aload_2
    //   106: astore_1
    //   107: ldc_w 685
    //   110: iconst_1
    //   111: anewarray 4	java/lang/Object
    //   114: dup
    //   115: iconst_0
    //   116: aload_3
    //   117: invokevirtual 307	org/json/JSONException:getLocalizedMessage	()Ljava/lang/String;
    //   120: aastore
    //   121: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   124: aload_2
    //   125: ifnull -109 -> 16
    //   128: aload_2
    //   129: invokevirtual 677	java/io/FileInputStream:close	()V
    //   132: return
    //   133: astore_1
    //   134: ldc_w 683
    //   137: iconst_1
    //   138: anewarray 4	java/lang/Object
    //   141: dup
    //   142: iconst_0
    //   143: aload_1
    //   144: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   147: aastore
    //   148: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   151: return
    //   152: astore_3
    //   153: aconst_null
    //   154: astore_2
    //   155: aload_2
    //   156: astore_1
    //   157: ldc_w 687
    //   160: iconst_1
    //   161: anewarray 4	java/lang/Object
    //   164: dup
    //   165: iconst_0
    //   166: aload_3
    //   167: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   170: aastore
    //   171: invokestatic 632	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   174: aload_2
    //   175: ifnull -159 -> 16
    //   178: aload_2
    //   179: invokevirtual 677	java/io/FileInputStream:close	()V
    //   182: return
    //   183: astore_1
    //   184: ldc_w 683
    //   187: iconst_1
    //   188: anewarray 4	java/lang/Object
    //   191: dup
    //   192: iconst_0
    //   193: aload_1
    //   194: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   197: aastore
    //   198: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   201: return
    //   202: astore_2
    //   203: aconst_null
    //   204: astore_1
    //   205: aload_1
    //   206: ifnull +7 -> 213
    //   209: aload_1
    //   210: invokevirtual 677	java/io/FileInputStream:close	()V
    //   213: aload_2
    //   214: athrow
    //   215: astore_1
    //   216: ldc_w 683
    //   219: iconst_1
    //   220: anewarray 4	java/lang/Object
    //   223: dup
    //   224: iconst_0
    //   225: aload_1
    //   226: invokevirtual 670	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   229: aastore
    //   230: invokestatic 302	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   233: goto -20 -> 213
    //   236: astore_2
    //   237: goto -32 -> 205
    //   240: astore_3
    //   241: goto -86 -> 155
    //   244: astore_3
    //   245: goto -140 -> 105
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	248	0	this	MobileConfig
    //   0	248	1	paramFile	java.io.File
    //   44	135	2	localFileInputStream	java.io.FileInputStream
    //   202	12	2	localObject1	Object
    //   236	1	2	localObject2	Object
    //   52	9	3	localJSONObject	JSONObject
    //   102	15	3	localJSONException1	JSONException
    //   152	15	3	localIOException1	IOException
    //   240	1	3	localIOException2	IOException
    //   244	1	3	localJSONException2	JSONException
    // Exception table:
    //   from	to	target	type
    //   8	16	17	java/io/IOException
    //   78	82	83	java/io/IOException
    //   36	45	102	org/json/JSONException
    //   128	132	133	java/io/IOException
    //   36	45	152	java/io/IOException
    //   178	182	183	java/io/IOException
    //   36	45	202	finally
    //   209	213	215	java/io/IOException
    //   47	53	236	finally
    //   59	74	236	finally
    //   107	124	236	finally
    //   157	174	236	finally
    //   47	53	240	java/io/IOException
    //   59	74	240	java/io/IOException
    //   47	53	244	org/json/JSONException
    //   59	74	244	org/json/JSONException
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.MobileConfig
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */