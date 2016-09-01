package android.support.v4.media;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.media.session.MediaSessionCompat.Token;
import android.support.v4.util.ArrayMap;
import android.text.TextUtils;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.List;

class MediaBrowserCompat$MediaBrowserImplBase
{
  private static final int CONNECT_STATE_CONNECTED = 2;
  private static final int CONNECT_STATE_CONNECTING = 1;
  private static final int CONNECT_STATE_DISCONNECTED = 0;
  private static final int CONNECT_STATE_SUSPENDED = 3;
  private static final boolean DBG = false;
  private static final String TAG = "MediaBrowserCompat";
  private final MediaBrowserCompat.ConnectionCallback mCallback;
  private final Context mContext;
  private Bundle mExtras;
  private final Handler mHandler = new Handler();
  private MediaSessionCompat.Token mMediaSessionToken;
  private final Bundle mRootHints;
  private String mRootId;
  private IMediaBrowserServiceCompat mServiceBinder;
  private IMediaBrowserServiceCompatCallbacks mServiceCallbacks;
  private final ComponentName mServiceComponent;
  private MediaServiceConnection mServiceConnection;
  private int mState = 0;
  private final ArrayMap mSubscriptions = new ArrayMap();
  
  public MediaBrowserCompat$MediaBrowserImplBase(Context paramContext, ComponentName paramComponentName, MediaBrowserCompat.ConnectionCallback paramConnectionCallback, Bundle paramBundle)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("context must not be null");
    }
    if (paramComponentName == null) {
      throw new IllegalArgumentException("service component must not be null");
    }
    if (paramConnectionCallback == null) {
      throw new IllegalArgumentException("connection callback must not be null");
    }
    mContext = paramContext;
    mServiceComponent = paramComponentName;
    mCallback = paramConnectionCallback;
    mRootHints = paramBundle;
  }
  
  private void forceCloseConnection()
  {
    if (mServiceConnection != null) {
      mContext.unbindService(mServiceConnection);
    }
    mState = 0;
    mServiceConnection = null;
    mServiceBinder = null;
    mServiceCallbacks = null;
    mRootId = null;
    mMediaSessionToken = null;
  }
  
  private ServiceCallbacks getNewServiceCallbacks()
  {
    return new ServiceCallbacks(this);
  }
  
  private static String getStateLabel(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return "UNKNOWN/" + paramInt;
    case 0: 
      return "CONNECT_STATE_DISCONNECTED";
    case 1: 
      return "CONNECT_STATE_CONNECTING";
    case 2: 
      return "CONNECT_STATE_CONNECTED";
    }
    return "CONNECT_STATE_SUSPENDED";
  }
  
  private boolean isCurrent(IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks, String paramString)
  {
    if (mServiceCallbacks != paramIMediaBrowserServiceCompatCallbacks)
    {
      if (mState != 0) {
        Log.i("MediaBrowserCompat", paramString + " for " + mServiceComponent + " with mServiceConnection=" + mServiceCallbacks + " this=" + this);
      }
      return false;
    }
    return true;
  }
  
  private final void onConnectionFailed(IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks)
  {
    mHandler.post(new MediaBrowserCompat.MediaBrowserImplBase.6(this, paramIMediaBrowserServiceCompatCallbacks));
  }
  
  private final void onLoadChildren(IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks, String paramString, List paramList)
  {
    mHandler.post(new MediaBrowserCompat.MediaBrowserImplBase.7(this, paramIMediaBrowserServiceCompatCallbacks, paramList, paramString));
  }
  
  private final void onServiceConnected(IMediaBrowserServiceCompatCallbacks paramIMediaBrowserServiceCompatCallbacks, String paramString, MediaSessionCompat.Token paramToken, Bundle paramBundle)
  {
    mHandler.post(new MediaBrowserCompat.MediaBrowserImplBase.5(this, paramIMediaBrowserServiceCompatCallbacks, paramString, paramToken, paramBundle));
  }
  
  public void connect()
  {
    if (mState != 0) {
      throw new IllegalStateException("connect() called while not disconnected (state=" + getStateLabel(mState) + ")");
    }
    if (mServiceBinder != null) {
      throw new RuntimeException("mServiceBinder should be null. Instead it is " + mServiceBinder);
    }
    if (mServiceCallbacks != null) {
      throw new RuntimeException("mServiceCallbacks should be null. Instead it is " + mServiceCallbacks);
    }
    mState = 1;
    Intent localIntent = new Intent("android.media.browse.MediaBrowserServiceCompat");
    localIntent.setComponent(mServiceComponent);
    MediaServiceConnection localMediaServiceConnection = new MediaServiceConnection(null);
    mServiceConnection = localMediaServiceConnection;
    int i = 0;
    try
    {
      boolean bool = mContext.bindService(localIntent, mServiceConnection, 1);
      i = bool;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Log.e("MediaBrowserCompat", "Failed binding to service " + mServiceComponent);
      }
    }
    if (i == 0) {
      mHandler.post(new MediaBrowserCompat.MediaBrowserImplBase.1(this, localMediaServiceConnection));
    }
  }
  
  public void disconnect()
  {
    if (mServiceCallbacks != null) {}
    try
    {
      mServiceBinder.disconnect(mServiceCallbacks);
      forceCloseConnection();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        Log.w("MediaBrowserCompat", "RemoteException during connect for " + mServiceComponent);
      }
    }
  }
  
  void dump()
  {
    Log.d("MediaBrowserCompat", "MediaBrowserCompat...");
    Log.d("MediaBrowserCompat", "  mServiceComponent=" + mServiceComponent);
    Log.d("MediaBrowserCompat", "  mCallback=" + mCallback);
    Log.d("MediaBrowserCompat", "  mRootHints=" + mRootHints);
    Log.d("MediaBrowserCompat", "  mState=" + getStateLabel(mState));
    Log.d("MediaBrowserCompat", "  mServiceConnection=" + mServiceConnection);
    Log.d("MediaBrowserCompat", "  mServiceBinder=" + mServiceBinder);
    Log.d("MediaBrowserCompat", "  mServiceCallbacks=" + mServiceCallbacks);
    Log.d("MediaBrowserCompat", "  mRootId=" + mRootId);
    Log.d("MediaBrowserCompat", "  mMediaSessionToken=" + mMediaSessionToken);
  }
  
  @Nullable
  public Bundle getExtras()
  {
    if (!isConnected()) {
      throw new IllegalStateException("getExtras() called while not connected (state=" + getStateLabel(mState) + ")");
    }
    return mExtras;
  }
  
  public void getItem(@NonNull String paramString, @NonNull MediaBrowserCompat.ItemCallback paramItemCallback)
  {
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("mediaId is empty.");
    }
    if (paramItemCallback == null) {
      throw new IllegalArgumentException("cb is null.");
    }
    if (mState != 2)
    {
      Log.i("MediaBrowserCompat", "Not connected, unable to retrieve the MediaItem.");
      mHandler.post(new MediaBrowserCompat.MediaBrowserImplBase.2(this, paramItemCallback, paramString));
      return;
    }
    MediaBrowserCompat.MediaBrowserImplBase.3 local3 = new MediaBrowserCompat.MediaBrowserImplBase.3(this, mHandler, paramItemCallback, paramString);
    try
    {
      mServiceBinder.getMediaItem(paramString, local3);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.i("MediaBrowserCompat", "Remote error getting media item.");
      mHandler.post(new MediaBrowserCompat.MediaBrowserImplBase.4(this, paramItemCallback, paramString));
    }
  }
  
  @NonNull
  public String getRoot()
  {
    if (!isConnected()) {
      throw new IllegalStateException("getSessionToken() called while not connected(state=" + getStateLabel(mState) + ")");
    }
    return mRootId;
  }
  
  @NonNull
  public ComponentName getServiceComponent()
  {
    if (!isConnected()) {
      throw new IllegalStateException("getServiceComponent() called while not connected (state=" + mState + ")");
    }
    return mServiceComponent;
  }
  
  @NonNull
  public MediaSessionCompat.Token getSessionToken()
  {
    if (!isConnected()) {
      throw new IllegalStateException("getSessionToken() called while not connected(state=" + mState + ")");
    }
    return mMediaSessionToken;
  }
  
  public boolean isConnected()
  {
    return mState == 2;
  }
  
  public void subscribe(@NonNull String paramString, @NonNull MediaBrowserCompat.SubscriptionCallback paramSubscriptionCallback)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("parentId is null");
    }
    if (paramSubscriptionCallback == null) {
      throw new IllegalArgumentException("callback is null");
    }
    Subscription localSubscription = (Subscription)mSubscriptions.get(paramString);
    if (localSubscription == null) {}
    for (int i = 1;; i = 0)
    {
      if (i != 0)
      {
        localSubscription = new Subscription(paramString);
        mSubscriptions.put(paramString, localSubscription);
      }
      callback = paramSubscriptionCallback;
      if (mState == 2) {}
      try
      {
        mServiceBinder.addSubscription(paramString, mServiceCallbacks);
        return;
      }
      catch (RemoteException paramSubscriptionCallback)
      {
        Log.d("MediaBrowserCompat", "addSubscription failed with RemoteException parentId=" + paramString);
      }
    }
  }
  
  public void unsubscribe(@NonNull String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("parentId is empty.");
    }
    Subscription localSubscription = (Subscription)mSubscriptions.remove(paramString);
    if ((mState == 2) && (localSubscription != null)) {}
    try
    {
      mServiceBinder.removeSubscription(paramString, mServiceCallbacks);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.d("MediaBrowserCompat", "removeSubscription failed with RemoteException parentId=" + paramString);
    }
  }
  
  private class MediaServiceConnection
    implements ServiceConnection
  {
    private MediaServiceConnection() {}
    
    private boolean isCurrent(String paramString)
    {
      if (mServiceConnection != this)
      {
        if (mState != 0) {
          Log.i("MediaBrowserCompat", paramString + " for " + mServiceComponent + " with mServiceConnection=" + mServiceConnection + " this=" + this);
        }
        return false;
      }
      return true;
    }
    
    public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
    {
      if (!isCurrent("onServiceConnected")) {
        return;
      }
      MediaBrowserCompat.MediaBrowserImplBase.access$1302(MediaBrowserCompat.MediaBrowserImplBase.this, IMediaBrowserServiceCompat.Stub.asInterface(paramIBinder));
      MediaBrowserCompat.MediaBrowserImplBase.access$1202(MediaBrowserCompat.MediaBrowserImplBase.this, MediaBrowserCompat.MediaBrowserImplBase.this.getNewServiceCallbacks());
      MediaBrowserCompat.MediaBrowserImplBase.access$602(MediaBrowserCompat.MediaBrowserImplBase.this, 1);
      try
      {
        mServiceBinder.connect(mContext.getPackageName(), mRootHints, mServiceCallbacks);
        return;
      }
      catch (RemoteException paramComponentName)
      {
        Log.w("MediaBrowserCompat", "RemoteException during connect for " + mServiceComponent);
      }
    }
    
    public void onServiceDisconnected(ComponentName paramComponentName)
    {
      if (!isCurrent("onServiceDisconnected")) {
        return;
      }
      MediaBrowserCompat.MediaBrowserImplBase.access$1302(MediaBrowserCompat.MediaBrowserImplBase.this, null);
      MediaBrowserCompat.MediaBrowserImplBase.access$1202(MediaBrowserCompat.MediaBrowserImplBase.this, null);
      MediaBrowserCompat.MediaBrowserImplBase.access$602(MediaBrowserCompat.MediaBrowserImplBase.this, 3);
      mCallback.onConnectionSuspended();
    }
  }
  
  private static class ServiceCallbacks
    extends IMediaBrowserServiceCompatCallbacks.Stub
  {
    private WeakReference mMediaBrowser;
    
    public ServiceCallbacks(MediaBrowserCompat.MediaBrowserImplBase paramMediaBrowserImplBase)
    {
      mMediaBrowser = new WeakReference(paramMediaBrowserImplBase);
    }
    
    public void onConnect(String paramString, MediaSessionCompat.Token paramToken, Bundle paramBundle)
    {
      MediaBrowserCompat.MediaBrowserImplBase localMediaBrowserImplBase = (MediaBrowserCompat.MediaBrowserImplBase)mMediaBrowser.get();
      if (localMediaBrowserImplBase != null) {
        localMediaBrowserImplBase.onServiceConnected(this, paramString, paramToken, paramBundle);
      }
    }
    
    public void onConnectFailed()
    {
      MediaBrowserCompat.MediaBrowserImplBase localMediaBrowserImplBase = (MediaBrowserCompat.MediaBrowserImplBase)mMediaBrowser.get();
      if (localMediaBrowserImplBase != null) {
        localMediaBrowserImplBase.onConnectionFailed(this);
      }
    }
    
    public void onLoadChildren(String paramString, List paramList)
    {
      MediaBrowserCompat.MediaBrowserImplBase localMediaBrowserImplBase = (MediaBrowserCompat.MediaBrowserImplBase)mMediaBrowser.get();
      if (localMediaBrowserImplBase != null) {
        localMediaBrowserImplBase.onLoadChildren(this, paramString, paramList);
      }
    }
  }
  
  private static class Subscription
  {
    MediaBrowserCompat.SubscriptionCallback callback;
    final String id;
    
    Subscription(String paramString)
    {
      id = paramString;
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.MediaBrowserCompat.MediaBrowserImplBase
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */