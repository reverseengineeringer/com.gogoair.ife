package android.support.v4.media;

import android.app.Service;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.media.session.MediaSessionCompat.Token;
import android.support.v4.os.ResultReceiver;
import android.support.v4.util.ArrayMap;
import android.text.TextUtils;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.HashSet;

public abstract class MediaBrowserServiceCompat
  extends Service
{
  private static final boolean DBG = false;
  public static final String KEY_MEDIA_ITEM = "media_item";
  public static final String SERVICE_INTERFACE = "android.media.browse.MediaBrowserServiceCompat";
  private static final String TAG = "MediaBrowserServiceCompat";
  private ServiceBinder mBinder;
  private final ArrayMap mConnections = new ArrayMap();
  private final Handler mHandler = new Handler();
  MediaSessionCompat.Token mSession;
  
  private void addSubscription(String paramString, ConnectionRecord paramConnectionRecord)
  {
    subscriptions.add(paramString);
    performLoadChildren(paramString, paramConnectionRecord);
  }
  
  private boolean isValidPackage(String paramString, int paramInt)
  {
    if (paramString == null) {}
    for (;;)
    {
      return false;
      String[] arrayOfString = getPackageManager().getPackagesForUid(paramInt);
      int i = arrayOfString.length;
      paramInt = 0;
      while (paramInt < i)
      {
        if (arrayOfString[paramInt].equals(paramString)) {
          return true;
        }
        paramInt += 1;
      }
    }
  }
  
  private void performLoadChildren(String paramString, ConnectionRecord paramConnectionRecord)
  {
    MediaBrowserServiceCompat.3 local3 = new MediaBrowserServiceCompat.3(this, paramString, paramString, paramConnectionRecord);
    onLoadChildren(paramString, local3);
    if (!local3.isDone()) {
      throw new IllegalStateException("onLoadChildren must call detach() or sendResult() before returning for package=" + pkg + " id=" + paramString);
    }
  }
  
  private void performLoadItem(String paramString, ResultReceiver paramResultReceiver)
  {
    paramResultReceiver = new MediaBrowserServiceCompat.4(this, paramString, paramResultReceiver);
    onLoadItem(paramString, paramResultReceiver);
    if (!paramResultReceiver.isDone()) {
      throw new IllegalStateException("onLoadItem must call detach() or sendResult() before returning for id=" + paramString);
    }
  }
  
  public void dump(FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString) {}
  
  @Nullable
  public MediaSessionCompat.Token getSessionToken()
  {
    return mSession;
  }
  
  public void notifyChildrenChanged(@NonNull String paramString)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("parentId cannot be null in notifyChildrenChanged");
    }
    mHandler.post(new MediaBrowserServiceCompat.2(this, paramString));
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    if ("android.media.browse.MediaBrowserServiceCompat".equals(paramIntent.getAction())) {
      return mBinder;
    }
    return null;
  }
  
  public void onCreate()
  {
    super.onCreate();
    mBinder = new ServiceBinder(null);
  }
  
  @Nullable
  public abstract BrowserRoot onGetRoot(@NonNull String paramString, int paramInt, @Nullable Bundle paramBundle);
  
  public abstract void onLoadChildren(@NonNull String paramString, @NonNull Result paramResult);
  
  public void onLoadItem(String paramString, Result paramResult)
  {
    paramResult.sendResult(null);
  }
  
  public void setSessionToken(MediaSessionCompat.Token paramToken)
  {
    if (paramToken == null) {
      throw new IllegalArgumentException("Session token may not be null.");
    }
    if (mSession != null) {
      throw new IllegalStateException("The session token has already been set.");
    }
    mSession = paramToken;
    mHandler.post(new MediaBrowserServiceCompat.1(this, paramToken));
  }
  
  public static final class BrowserRoot
  {
    private final Bundle mExtras;
    private final String mRootId;
    
    public BrowserRoot(@NonNull String paramString, @Nullable Bundle paramBundle)
    {
      if (paramString == null) {
        throw new IllegalArgumentException("The root id in BrowserRoot cannot be null. Use null for BrowserRoot instead.");
      }
      mRootId = paramString;
      mExtras = paramBundle;
    }
    
    public Bundle getExtras()
    {
      return mExtras;
    }
    
    public String getRootId()
    {
      return mRootId;
    }
  }
  
  private class ConnectionRecord
  {
    IMediaBrowserServiceCompatCallbacks callbacks;
    String pkg;
    MediaBrowserServiceCompat.BrowserRoot root;
    Bundle rootHints;
    HashSet subscriptions = new HashSet();
    
    private ConnectionRecord() {}
  }
  
  public class Result
  {
    private Object mDebug;
    private boolean mDetachCalled;
    private boolean mSendResultCalled;
    
    Result(Object paramObject)
    {
      mDebug = paramObject;
    }
    
    public void detach()
    {
      if (mDetachCalled) {
        throw new IllegalStateException("detach() called when detach() had already been called for: " + mDebug);
      }
      if (mSendResultCalled) {
        throw new IllegalStateException("detach() called when sendResult() had already been called for: " + mDebug);
      }
      mDetachCalled = true;
    }
    
    boolean isDone()
    {
      return (mDetachCalled) || (mSendResultCalled);
    }
    
    void onResultSent(Object paramObject) {}
    
    public void sendResult(Object paramObject)
    {
      if (mSendResultCalled) {
        throw new IllegalStateException("sendResult() called twice for: " + mDebug);
      }
      mSendResultCalled = true;
      onResultSent(paramObject);
    }
  }
  
  private class ServiceBinder
    extends IMediaBrowserServiceCompat.Stub
  {
    private ServiceBinder() {}
    
    public void addSubscription(String paramString, IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks)
    {
      mHandler.post(new MediaBrowserServiceCompat.ServiceBinder.3(this, paramIMediaBrowserServiceCompatCallbacks, paramString));
    }
    
    public void connect(String paramString, Bundle paramBundle, IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks)
    {
      int i = Binder.getCallingUid();
      if (!MediaBrowserServiceCompat.this.isValidPackage(paramString, i)) {
        throw new IllegalArgumentException("Package/uid mismatch: uid=" + i + " package=" + paramString);
      }
      mHandler.post(new MediaBrowserServiceCompat.ServiceBinder.1(this, paramIMediaBrowserServiceCompatCallbacks, paramString, paramBundle, i));
    }
    
    public void disconnect(IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks)
    {
      mHandler.post(new MediaBrowserServiceCompat.ServiceBinder.2(this, paramIMediaBrowserServiceCompatCallbacks));
    }
    
    public void getMediaItem(String paramString, ResultReceiver paramResultReceiver)
    {
      if ((TextUtils.isEmpty(paramString)) || (paramResultReceiver == null)) {
        return;
      }
      mHandler.post(new MediaBrowserServiceCompat.ServiceBinder.5(this, paramString, paramResultReceiver));
    }
    
    public void removeSubscription(String paramString, IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks)
    {
      mHandler.post(new MediaBrowserServiceCompat.ServiceBinder.4(this, paramIMediaBrowserServiceCompatCallbacks, paramString));
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.MediaBrowserServiceCompat
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */