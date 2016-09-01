package com.gogoair.ife.views;

import android.app.Activity;
import android.app.ProgressDialog;
import android.app.TaskStackBuilder;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.content.LocalBroadcastManager;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.storage.MediaDb;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.GVLogger;
import com.gogoair.ife.utils.GVNetworkManager;
import com.gogoair.ife.utils.GVNetworkManager.GVNetworkType;

public class LauncherActivity
  extends Activity
{
  private static final String APP_DATA_URL_PARAM = "app-data";
  private static final String TAG = "LauncherActivity";
  private String appDataJson;
  private final BroadcastReceiver launcherActivityBroadcastReceiver = new LauncherActivity.1(this);
  private ProgressDialog progressDialog;
  
  private void cancelProgressDialog()
  {
    progressDialog.cancel();
  }
  
  private void goToLandingActivity(@NonNull Context paramContext, @NonNull Constants.GVErrorCode paramGVErrorCode)
  {
    paramContext = new Intent(paramContext, LandingActivity.class);
    paramContext.putExtra("LANDING_STATE_INTENT_EXTRA", paramGVErrorCode);
    startActivity(paramContext);
    finish();
  }
  
  private void goToPlayMovieActivity(@NonNull Context paramContext, @NonNull GVLibraryEntry paramGVLibraryEntry)
  {
    paramContext = new Intent(paramContext, PlayerActivity.class);
    paramContext.putExtra("INTENT_EXTRA_GV_LIBRARY_ENTRY", paramGVLibraryEntry);
    paramGVLibraryEntry = TaskStackBuilder.create(this);
    paramGVLibraryEntry.addNextIntentWithParentStack(paramContext);
    paramGVLibraryEntry.startActivities();
    finish();
  }
  
  /* Error */
  private void handleInAirNetwork(@NonNull Context paramContext)
  {
    // Byte code:
    //   0: new 94	com/gogoair/ife/storage/MediaDb
    //   3: dup
    //   4: aload_1
    //   5: invokespecial 96	com/gogoair/ife/storage/MediaDb:<init>	(Landroid/content/Context;)V
    //   8: astore 4
    //   10: aload_0
    //   11: invokespecial 98	com/gogoair/ife/views/LauncherActivity:cancelProgressDialog	()V
    //   14: new 100	com/gogoair/ife/gogo_vision/model/GVLibraryEntry
    //   17: dup
    //   18: new 102	org/json/JSONObject
    //   21: dup
    //   22: aload_0
    //   23: getfield 104	com/gogoair/ife/views/LauncherActivity:appDataJson	Ljava/lang/String;
    //   26: ldc 106
    //   28: invokestatic 112	java/net/URLDecoder:decode	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   31: invokespecial 115	org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   34: invokespecial 118	com/gogoair/ife/gogo_vision/model/GVLibraryEntry:<init>	(Lorg/json/JSONObject;)V
    //   37: astore_2
    //   38: aload 4
    //   40: aload_2
    //   41: invokevirtual 122	com/gogoair/ife/gogo_vision/model/GVLibraryEntry:getLogicalMediaId	()Ljava/lang/String;
    //   44: invokevirtual 126	com/gogoair/ife/storage/MediaDb:getVideoV2LibraryEntry	(Ljava/lang/String;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    //   47: astore_3
    //   48: aload_3
    //   49: ifnonnull +30 -> 79
    //   52: aload 4
    //   54: aload_2
    //   55: invokevirtual 130	com/gogoair/ife/storage/MediaDb:addV2LibraryEntry	(Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V
    //   58: aload_2
    //   59: invokevirtual 134	com/gogoair/ife/gogo_vision/model/GVLibraryEntry:hasExpired	()Z
    //   62: ifeq +22 -> 84
    //   65: aload_0
    //   66: aload_1
    //   67: getstatic 140	com/gogoair/ife/utils/Constants$GVErrorCode:EXPIRED	Lcom/gogoair/ife/utils/Constants$GVErrorCode;
    //   70: invokespecial 142	com/gogoair/ife/views/LauncherActivity:goToLandingActivity	(Landroid/content/Context;Lcom/gogoair/ife/utils/Constants$GVErrorCode;)V
    //   73: aload 4
    //   75: invokevirtual 145	com/gogoair/ife/storage/MediaDb:close	()V
    //   78: return
    //   79: aload_3
    //   80: astore_2
    //   81: goto -23 -> 58
    //   84: aload_0
    //   85: aload_1
    //   86: aload_2
    //   87: invokespecial 147	com/gogoair/ife/views/LauncherActivity:goToPlayMovieActivity	(Landroid/content/Context;Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V
    //   90: goto -17 -> 73
    //   93: astore_1
    //   94: aload_1
    //   95: invokevirtual 150	java/lang/Exception:printStackTrace	()V
    //   98: aload_0
    //   99: new 47	android/content/Intent
    //   102: dup
    //   103: aload_0
    //   104: ldc -104
    //   106: invokespecial 52	android/content/Intent:<init>	(Landroid/content/Context;Ljava/lang/Class;)V
    //   109: invokevirtual 62	com/gogoair/ife/views/LauncherActivity:startActivity	(Landroid/content/Intent;)V
    //   112: aload_0
    //   113: invokevirtual 65	com/gogoair/ife/views/LauncherActivity:finish	()V
    //   116: aload 4
    //   118: invokevirtual 145	com/gogoair/ife/storage/MediaDb:close	()V
    //   121: return
    //   122: astore_1
    //   123: aload 4
    //   125: invokevirtual 145	com/gogoair/ife/storage/MediaDb:close	()V
    //   128: aload_1
    //   129: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	130	0	this	LauncherActivity
    //   0	130	1	paramContext	Context
    //   37	50	2	localObject	Object
    //   47	33	3	localGVLibraryEntry	GVLibraryEntry
    //   8	116	4	localMediaDb	MediaDb
    // Exception table:
    //   from	to	target	type
    //   14	48	93	java/lang/Exception
    //   52	58	93	java/lang/Exception
    //   58	73	93	java/lang/Exception
    //   84	90	93	java/lang/Exception
    //   14	48	122	finally
    //   52	58	122	finally
    //   58	73	122	finally
    //   84	90	122	finally
    //   94	116	122	finally
  }
  
  private void handleNetworkType(GVNetworkManager.GVNetworkType paramGVNetworkType, @NonNull Context paramContext)
  {
    if (paramGVNetworkType == GVNetworkManager.GVNetworkType.in_air)
    {
      handleInAirNetwork(paramContext);
      return;
    }
    if (paramGVNetworkType == GVNetworkManager.GVNetworkType.ground)
    {
      cancelProgressDialog();
      startActivity(new Intent(this, MainActivity.class));
      return;
    }
    if (paramGVNetworkType == GVNetworkManager.GVNetworkType.off)
    {
      cancelProgressDialog();
      goToLandingActivity(paramContext, Constants.GVErrorCode.NOWIFI);
      return;
    }
    showProgressDialog(getString(2131034140), getString(2131034138));
  }
  
  private void parseUrlData()
  {
    if (getIntent().getData() != null) {
      appDataJson = getIntent().getData().getQueryParameter("app-data");
    }
  }
  
  private void showProgressDialog(String paramString1, String paramString2)
  {
    progressDialog.setIndeterminate(true);
    progressDialog.setMessage(paramString2);
    progressDialog.setTitle(paramString1);
    progressDialog.setProgressStyle(0);
    progressDialog.setCancelable(false);
    progressDialog.show();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    GVLogger.getDefaultLogger().d("LauncherActivity", "LAUNCHING PLAYER");
    paramBundle = new IntentFilter();
    paramBundle.addAction("GVNETWORK_ON_NETWORK_CHANGED");
    LocalBroadcastManager.getInstance(this).registerReceiver(launcherActivityBroadcastReceiver, paramBundle);
    progressDialog = new ProgressDialog(this);
    paramBundle = new MediaDb(this);
    paramBundle.removeV2ExpiredContents();
    paramBundle.close();
    parseUrlData();
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    LocalBroadcastManager.getInstance(this).unregisterReceiver(launcherActivityBroadcastReceiver);
  }
  
  protected void onResume()
  {
    super.onResume();
    GVNetworkManager.GVNetworkType localGVNetworkType = GVNetworkManager.getCurrentNetwork();
    if (localGVNetworkType == GVNetworkManager.GVNetworkType.unknown) {
      new GVNetworkManager().findCurrentNetwork(this);
    }
    handleNetworkType(localGVNetworkType, this);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.LauncherActivity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */