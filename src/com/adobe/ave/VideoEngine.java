package com.adobe.ave;

import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.view.SurfaceHolder;
import com.adobe.ave.drm.DRMError;
import com.adobe.ave.drm.DRMManager;
import java.util.Set;

public class VideoEngine
{
  private static final String TAG = "VideoEngine(j)";
  private static final int kCTBackgroundManifestError = 16384;
  private static final int kCTBackgroundManifestWarning = 32768;
  private static final int kCTDRMError = 8192;
  private static final int kCTDRMMetadata = 16;
  private static final int kCTData = 64;
  private static final int kCTDictionaryData = 1024;
  private static final int kCTError = 1;
  private static final int kCTLoadInfo = 2048;
  private static final int kCTManifestLoad = 128;
  private static final int kCTPauseAtPeriodEnd = 65536;
  private static final int kCTPlayState = 2;
  private static final int kCTSeekComplete = 256;
  private static final int kCTStreamMetadata = 8;
  private static final int kCTStreamSwitch = 4;
  private static final int kCTTimeline = 32;
  private static final int kCTTrickPlayEnded = 4096;
  private static final int kCTWarning = 512;
  private boolean mEnableCaption = false;
  private EventHandler mEventHandler;
  private VideoEngineListener mListener;
  private Set mListenerTypeSet;
  private long mNativeContext;
  private VideoEngineView mVideoView = null;
  
  static
  {
    System.loadLibrary("AVEAndroid");
    nativeInitVideoEngine();
  }
  
  public VideoEngine()
    throws VideoEngineException
  {
    failIfNotUIThread();
    Looper localLooper = Looper.myLooper();
    if (localLooper != null) {
      mEventHandler = new EventHandler(this, localLooper);
    }
    for (;;)
    {
      nativeCreateVideoEngine();
      return;
      localLooper = Looper.getMainLooper();
      if (localLooper != null) {
        mEventHandler = new EventHandler(this, localLooper);
      } else {
        mEventHandler = null;
      }
    }
  }
  
  private void failIfNotUIThread()
    throws VideoEngineException
  {
    if (Looper.myLooper() != Looper.getMainLooper()) {
      throw new VideoEngineException(MediaErrorCode.CALLED_FROM_WRONG_THREAD, "Method must be called from the application's main thread");
    }
  }
  
  public static String getVersionString()
  {
    return nativeGetVersionString();
  }
  
  private native void nativeAddCustomHeader(String paramString, String[] paramArrayOfString, int paramInt)
    throws VideoEngineException;
  
  private native void nativeAddListener(int paramInt, VideoEngineListener paramVideoEngineListener)
    throws VideoEngineException;
  
  private native void nativeCreateVideoEngine();
  
  private native void nativeEnableCaptions(boolean paramBoolean)
    throws VideoEngineException;
  
  private native void nativeFastForward(float paramFloat)
    throws VideoEngineException;
  
  private native void nativeFinalize();
  
  private native Object nativeGetARCorrectedOutputRectangle()
    throws VideoEngineException;
  
  private native Timeline nativeGetBackgroundTimeline()
    throws VideoEngineException;
  
  private native long nativeGetBufferLength()
    throws VideoEngineException;
  
  private native long nativeGetClientLivePoint()
    throws VideoEngineException;
  
  private native long nativeGetLocalTime(int paramInt)
    throws VideoEngineException;
  
  private native int nativeGetPlayState()
    throws VideoEngineException;
  
  private native int nativeGetQosBufferUnderrunCount()
    throws VideoEngineException;
  
  private native int nativeGetQosDroppedFrameCount()
    throws VideoEngineException;
  
  private native long nativeGetQosFileDuration()
    throws VideoEngineException;
  
  private native int nativeGetQosFileSize()
    throws VideoEngineException;
  
  private native float nativeGetQosFrameRate()
    throws VideoEngineException;
  
  private native long nativeGetQosLoadTime()
    throws VideoEngineException;
  
  private native long nativeGetQosTimeToFirstByte()
    throws VideoEngineException;
  
  private native long nativeGetTime()
    throws VideoEngineException;
  
  private native Timeline nativeGetTimeline()
    throws VideoEngineException;
  
  private static native String nativeGetVersionString();
  
  private static final native void nativeInitVideoEngine();
  
  private native void nativeInjectData(int paramInt1, long paramLong, byte[] paramArrayOfByte, int paramInt2)
    throws VideoEngineException;
  
  private native void nativeLoad(String paramString, int paramInt1, int paramInt2)
    throws VideoEngineException;
  
  private native void nativeLoadWithBackgroundManifest(String paramString1, int paramInt1, int paramInt2, String paramString2)
    throws VideoEngineException;
  
  private native void nativePause()
    throws VideoEngineException;
  
  private native void nativePlay()
    throws VideoEngineException;
  
  private native void nativePrepareBuffer()
    throws VideoEngineException;
  
  private native void nativeRelease();
  
  private native void nativeReleaseGPUResources()
    throws VideoEngineException;
  
  private native void nativeRemoveListener(VideoEngineListener paramVideoEngineListener)
    throws VideoEngineException;
  
  private native void nativeReset()
    throws VideoEngineException;
  
  private native void nativeRewind(float paramFloat)
    throws VideoEngineException;
  
  private native void nativeSeek(long paramLong, boolean paramBoolean)
    throws VideoEngineException;
  
  private native void nativeSeekToKeyFrame(long paramLong, boolean paramBoolean)
    throws VideoEngineException;
  
  private native void nativeSeekToLivePoint()
    throws VideoEngineException;
  
  private native void nativeSeekToLocalTime(int paramInt, long paramLong)
    throws VideoEngineException;
  
  private native int nativeSelectTrack(int paramInt1, int paramInt2, int paramInt3)
    throws VideoEngineException;
  
  private native void nativeSetABRParameters(ABRParameters paramABRParameters);
  
  private native void nativeSetBandwidth(int paramInt);
  
  private native void nativeSetBufferTime(long paramLong)
    throws VideoEngineException;
  
  private native void nativeSetCaptionStyle(String[] paramArrayOfString1, String[] paramArrayOfString2, int paramInt)
    throws VideoEngineException;
  
  private native void nativeSetCuePointTags(String[] paramArrayOfString, int paramInt)
    throws VideoEngineException;
  
  private native void nativeSetCustomConfiguration(String paramString)
    throws VideoEngineException;
  
  private native void nativeSetDRMManager(DRMManager paramDRMManager)
    throws VideoEngineException;
  
  private native void nativeSetInitialBufferTime(long paramLong)
    throws VideoEngineException;
  
  private native void nativeSetMasterUpdateInterval(int paramInt)
    throws VideoEngineException;
  
  private native void nativeSetNetworkingParameters(NetworkingParameters paramNetworkingParameters);
  
  private native void nativeSetPlaySpeed(float paramFloat, boolean paramBoolean)
    throws VideoEngineException;
  
  private native void nativeSetSourceViewport(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws VideoEngineException;
  
  private native void nativeSetSubscribedTags(String[] paramArrayOfString, int paramInt)
    throws VideoEngineException;
  
  private native void nativeSetSubscribedTagsForBackgroundManifest(String[] paramArrayOfString, int paramInt)
    throws VideoEngineException;
  
  private native void nativeSetSurface(Object paramObject)
    throws VideoEngineException;
  
  private native void nativeSetVolume(int paramInt)
    throws VideoEngineException;
  
  private native void nativeUseRedirectedUrl(boolean paramBoolean)
    throws VideoEngineException;
  
  private native void nativesetLocalStoragePath(String paramString)
    throws VideoEngineException;
  
  private static void postEventFromNative(Object paramObject1, int paramInt1, int paramInt2, int paramInt3, Object paramObject2)
  {
    int j = 1;
    paramObject1 = (VideoEngine)paramObject1;
    int i;
    if (paramObject1 != null)
    {
      i = 1;
      if (mEventHandler == null) {
        break label61;
      }
    }
    for (;;)
    {
      if ((i & j) != 0)
      {
        paramObject2 = mEventHandler.obtainMessage(paramInt1, paramInt2, paramInt3, paramObject2);
        mEventHandler.sendMessage((Message)paramObject2);
      }
      return;
      i = 0;
      break;
      label61:
      j = 0;
    }
  }
  
  private static void postEventFromNativeEx(Object paramObject1, int paramInt1, int paramInt2, int paramInt3, long paramLong1, long paramLong2, Object paramObject2)
  {
    paramObject1 = (VideoEngine)paramObject1;
    int i;
    if (paramObject1 != null)
    {
      i = 1;
      if (mEventHandler == null) {
        break label79;
      }
    }
    label79:
    for (int j = 1;; j = 0)
    {
      if ((i & j) != 0)
      {
        paramObject2 = new customMessage(paramInt2, paramInt3, paramLong1, paramLong2, paramObject2, null);
        paramObject2 = mEventHandler.obtainMessage(paramInt1, 0, 0, paramObject2);
        mEventHandler.sendMessage((Message)paramObject2);
      }
      return;
      i = 0;
      break;
    }
  }
  
  public void addCustomHeader(String paramString, String[] paramArrayOfString, int paramInt)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeAddCustomHeader(paramString, paramArrayOfString, paramInt);
  }
  
  public void addListener(Set paramSet, VideoEngineListener paramVideoEngineListener)
    throws VideoEngineException
  {
    int j = 0;
    mListenerTypeSet = paramSet;
    if (paramSet.contains(ListenerType.ERROR)) {
      j = 0x0 | ListenerType.ERROR.getValue();
    }
    int i = j;
    if (paramSet.contains(ListenerType.PLAY_STATE)) {
      i = j | ListenerType.PLAY_STATE.getValue();
    }
    j = i;
    if (paramSet.contains(ListenerType.STREAM_SWITCH)) {
      j = i | ListenerType.STREAM_SWITCH.getValue();
    }
    i = j;
    if (paramSet.contains(ListenerType.STREAM_METADATA)) {
      i = j | ListenerType.STREAM_METADATA.getValue();
    }
    j = i;
    if (paramSet.contains(ListenerType.DRM_METADATA)) {
      j = i | ListenerType.DRM_METADATA.getValue();
    }
    i = j;
    if (paramSet.contains(ListenerType.TIMELINE)) {
      i = j | ListenerType.TIMELINE.getValue();
    }
    j = i;
    if (paramSet.contains(ListenerType.DATA)) {
      j = i | ListenerType.DATA.getValue();
    }
    i = j;
    if (paramSet.contains(ListenerType.MANIFEST_LOAD)) {
      i = j | ListenerType.MANIFEST_LOAD.getValue();
    }
    j = i;
    if (paramSet.contains(ListenerType.SEEK_COMPLETE)) {
      j = i | ListenerType.SEEK_COMPLETE.getValue();
    }
    i = j;
    if (paramSet.contains(ListenerType.WARNING)) {
      i = j | ListenerType.WARNING.getValue();
    }
    j = i;
    if (paramSet.contains(ListenerType.DICTIONARY_DATA)) {
      j = i | ListenerType.DICTIONARY_DATA.getValue();
    }
    i = j;
    if (paramSet.contains(ListenerType.LOAD_INFO)) {
      i = j | ListenerType.LOAD_INFO.getValue();
    }
    j = i;
    if (paramSet.contains(ListenerType.TRICK_PLAY_ENDED)) {
      j = i | ListenerType.TRICK_PLAY_ENDED.getValue();
    }
    i = j;
    if (paramSet.contains(ListenerType.DRM_ERROR)) {
      i = j | ListenerType.DRM_ERROR.getValue();
    }
    j = i;
    if (paramSet.contains(ListenerType.BACKGROUND_MANIFEST_ERROR)) {
      j = i | ListenerType.BACKGROUND_MANIFEST_ERROR.getValue();
    }
    i = j;
    if (paramSet.contains(ListenerType.BACKGROUND_MANIFEST_WARNING)) {
      i = j | ListenerType.BACKGROUND_MANIFEST_WARNING.getValue();
    }
    j = i;
    if (paramSet.contains(ListenerType.PAUSE_AT_PERIOD_END)) {
      j = i | ListenerType.PAUSE_AT_PERIOD_END.getValue();
    }
    if (mListener != null) {
      nativeRemoveListener(paramVideoEngineListener);
    }
    mListener = paramVideoEngineListener;
    nativeAddListener(j, paramVideoEngineListener);
  }
  
  public void enableCaptions(boolean paramBoolean)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeEnableCaptions(paramBoolean);
    mEnableCaption = paramBoolean;
    if (mVideoView != null)
    {
      if (mEnableCaption == true) {
        mVideoView.setWillNotDrawCaption(false);
      }
    }
    else {
      return;
    }
    mVideoView.setWillNotDrawCaption(true);
  }
  
  public void fastForward(float paramFloat)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeFastForward(paramFloat);
  }
  
  protected void finalize()
  {
    nativeFinalize();
  }
  
  public Rect getARCorrectedOutputRectangle()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return (Rect)nativeGetARCorrectedOutputRectangle();
  }
  
  public Timeline getBackgroundTimeline()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetBackgroundTimeline();
  }
  
  public long getBufferLength()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetBufferLength();
  }
  
  public long getClientLivePoint()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetClientLivePoint();
  }
  
  public long getLocalTime(int paramInt)
    throws VideoEngineException
  {
    return nativeGetLocalTime(paramInt);
  }
  
  public PlayState getPlayState()
    throws VideoEngineException
  {
    failIfNotUIThread();
    PlayState localPlayState1 = PlayState.UNINITIALIZED;
    int j = nativeGetPlayState();
    PlayState[] arrayOfPlayState = PlayState.values();
    int k = arrayOfPlayState.length;
    int i = 0;
    while (i < k)
    {
      PlayState localPlayState2 = arrayOfPlayState[i];
      if (localPlayState2.getValue() == j) {
        return localPlayState2;
      }
      i += 1;
    }
    return localPlayState1;
  }
  
  public int getQosBufferUnderrunCount()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetQosBufferUnderrunCount();
  }
  
  public int getQosDroppedFrameCount()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetQosDroppedFrameCount();
  }
  
  public long getQosFileDuration()
    throws VideoEngineException
  {
    return nativeGetQosFileDuration();
  }
  
  public int getQosFileSize()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetQosFileSize();
  }
  
  public float getQosFrameRate()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetQosFrameRate();
  }
  
  public long getQosLoadTime()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetQosLoadTime();
  }
  
  public long getQosTimeToFirstByte()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetQosTimeToFirstByte();
  }
  
  public long getTime()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetTime();
  }
  
  public Timeline getTimeline()
    throws VideoEngineException
  {
    failIfNotUIThread();
    return nativeGetTimeline();
  }
  
  public void injectData(DataType paramDataType, long paramLong, byte[] paramArrayOfByte, int paramInt)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeInjectData(paramDataType.getValue(), paramLong, paramArrayOfByte, paramInt);
  }
  
  public void load(String paramString, ContainerType paramContainerType, int paramInt)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeLoad(paramString, paramContainerType.getValue(), paramInt);
  }
  
  public void loadWithBackgroundManifest(String paramString1, ContainerType paramContainerType, int paramInt, String paramString2)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeLoadWithBackgroundManifest(paramString1, paramContainerType.getValue(), paramInt, paramString2);
  }
  
  public void pause()
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativePause();
  }
  
  public void play()
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativePlay();
  }
  
  public void prepareBuffer()
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativePrepareBuffer();
  }
  
  public void release()
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeRelease();
  }
  
  public void releaseGPUResources()
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeReleaseGPUResources();
  }
  
  public void removeListener(VideoEngineListener paramVideoEngineListener)
    throws VideoEngineException
  {
    nativeRemoveListener(paramVideoEngineListener);
    mListener = null;
    mListenerTypeSet = null;
  }
  
  public void reset()
    throws VideoEngineException
  {
    failIfNotUIThread();
    enableCaptions(false);
    nativeReset();
  }
  
  public void rewind(float paramFloat)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeRewind(paramFloat);
  }
  
  public void seek(long paramLong, boolean paramBoolean)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSeek(paramLong, paramBoolean);
  }
  
  public void seekToKeyFrame(long paramLong, boolean paramBoolean)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSeekToKeyFrame(paramLong, paramBoolean);
  }
  
  public void seekToLivePoint()
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSeekToLivePoint();
  }
  
  public void seekToLocalTime(int paramInt, long paramLong)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSeekToLocalTime(paramInt, paramLong);
  }
  
  public MediaErrorCode selectTrack(int paramInt1, PayloadType paramPayloadType, int paramInt2)
    throws VideoEngineException
  {
    failIfNotUIThread();
    paramInt2 = nativeSelectTrack(paramInt1, paramPayloadType.getValue(), paramInt2);
    paramPayloadType = MediaErrorCode.GENERIC_ERROR;
    MediaErrorCode[] arrayOfMediaErrorCode = MediaErrorCode.values();
    int i = arrayOfMediaErrorCode.length;
    paramInt1 = 0;
    while (paramInt1 < i)
    {
      MediaErrorCode localMediaErrorCode = arrayOfMediaErrorCode[paramInt1];
      if (localMediaErrorCode.getValue() == paramInt2) {
        return localMediaErrorCode;
      }
      paramInt1 += 1;
    }
    return paramPayloadType;
  }
  
  public void setABRParameters(ABRParameters paramABRParameters)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetABRParameters(paramABRParameters);
  }
  
  public void setBandwidth(int paramInt)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetBandwidth(paramInt);
  }
  
  public void setBufferTime(long paramLong)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetBufferTime(paramLong);
  }
  
  public void setCaptionStyle(String[] paramArrayOfString1, String[] paramArrayOfString2, int paramInt)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetCaptionStyle(paramArrayOfString1, paramArrayOfString2, paramInt);
  }
  
  public void setCuePointTags(String[] paramArrayOfString, int paramInt)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetCuePointTags(paramArrayOfString, paramInt);
  }
  
  public void setCustomConfiguration(String paramString)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetCustomConfiguration(paramString);
  }
  
  public void setDRMManager(DRMManager paramDRMManager)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetDRMManager(paramDRMManager);
  }
  
  public void setInitialBufferTime(long paramLong)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetInitialBufferTime(paramLong);
  }
  
  public void setLocalStoragePath(String paramString)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativesetLocalStoragePath(paramString);
  }
  
  public void setMasterUpdateInterval(int paramInt)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetMasterUpdateInterval(paramInt);
  }
  
  public void setNetworkingParameters(NetworkingParameters paramNetworkingParameters)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetNetworkingParameters(paramNetworkingParameters);
  }
  
  public void setPlaySpeed(float paramFloat, boolean paramBoolean)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetPlaySpeed(paramFloat, paramBoolean);
  }
  
  public void setScreenOnWhilePlaying(boolean paramBoolean)
    throws VideoEngineException
  {
    failIfNotUIThread();
    if (mVideoView != null) {
      mVideoView.getHolder().setKeepScreenOn(paramBoolean);
    }
  }
  
  public void setSourceViewport(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetSourceViewport(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public void setSubscribedTags(String[] paramArrayOfString, int paramInt)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetSubscribedTags(paramArrayOfString, paramInt);
  }
  
  public void setSubscribedTagsForBackgroundManifest(String[] paramArrayOfString, int paramInt)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetSubscribedTagsForBackgroundManifest(paramArrayOfString, paramInt);
  }
  
  public void setView(VideoEngineView paramVideoEngineView)
    throws VideoEngineException
  {
    nativeSetSurface(paramVideoEngineView);
    if (paramVideoEngineView == null) {
      mVideoView.setNativeInstance(0L);
    }
    mVideoView = paramVideoEngineView;
    if (mVideoView != null)
    {
      if (mEnableCaption == true) {
        mVideoView.setWillNotDrawCaption(false);
      }
    }
    else {
      return;
    }
    mVideoView.setWillNotDrawCaption(true);
  }
  
  public void setVolume(int paramInt)
    throws VideoEngineException
  {
    failIfNotUIThread();
    nativeSetVolume(paramInt);
  }
  
  public void useRedirectedUrl(boolean paramBoolean)
    throws VideoEngineException
  {
    boolean bool = true;
    failIfNotUIThread();
    if (paramBoolean == true) {}
    for (paramBoolean = bool;; paramBoolean = false)
    {
      nativeUseRedirectedUrl(paramBoolean);
      return;
    }
  }
  
  private class EventHandler
    extends Handler
  {
    private VideoEngine mVideoEngine;
    
    public EventHandler(VideoEngine paramVideoEngine, Looper paramLooper)
    {
      super();
      mVideoEngine = paramVideoEngine;
    }
    
    public void handleMessage(Message paramMessage)
    {
      int j = 0;
      int k = 0;
      int m = 0;
      int n = 0;
      int i1 = 0;
      int i2 = 0;
      int i3 = 0;
      int i4 = 0;
      int i5 = 0;
      int i6 = 0;
      int i = 0;
      if (mVideoEngine.mNativeContext == 0L) {
        break label43;
      }
      label43:
      Object localObject2;
      do
      {
        do
        {
          do
          {
            return;
          } while (mVideoEngine.mListener == null);
          switch (what)
          {
          default: 
            return;
          }
        } while (!mVideoEngine.mListenerTypeSet.contains(ListenerType.ERROR));
        localObject2 = MediaErrorCode.GENERIC_ERROR;
        localObject3 = MediaErrorCode.values();
        j = localObject3.length;
        for (;;)
        {
          localObject1 = localObject2;
          if (i < j)
          {
            localObject1 = localObject3[i];
            if (((MediaErrorCode)localObject1).getValue() != arg1) {}
          }
          else
          {
            mVideoEngine.mListener.onError(mVideoEngine, (MediaErrorCode)localObject1, (String)obj);
            return;
          }
          i += 1;
        }
      } while (!mVideoEngine.mListenerTypeSet.contains(ListenerType.PLAY_STATE));
      Object localObject1 = PlayState.UNINITIALIZED;
      Object localObject3 = PlayState.values();
      k = localObject3.length;
      i = j;
      label330:
      if (i < k)
      {
        localObject2 = localObject3[i];
        if (((PlayState)localObject2).getValue() != arg1) {}
      }
      for (paramMessage = (Message)localObject2;; paramMessage = (Message)localObject1)
      {
        mVideoEngine.mListener.onPlayState(mVideoEngine, paramMessage);
        return;
        i += 1;
        break label330;
        if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.STREAM_SWITCH)) {
          break label43;
        }
        localObject2 = (VideoEngine.customMessage)obj;
        paramMessage = SwitchInfo.ABR;
        localObject3 = SwitchInfo.values();
        j = localObject3.length;
        i = k;
        label423:
        if (i < j)
        {
          localObject1 = localObject3[i];
          if (((SwitchInfo)localObject1).getValue() == m_n1) {
            paramMessage = (Message)localObject1;
          }
        }
        for (;;)
        {
          mVideoEngine.mListener.onStreamSwitch(mVideoEngine, m_l1, paramMessage, m_n2, (int)m_l2);
          return;
          i += 1;
          break label423;
          if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.STREAM_METADATA)) {
            break label43;
          }
          mVideoEngine.mListener.onStreamMetadata(mVideoEngine, (StreamMetadata)obj);
          return;
          if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.DRM_METADATA)) {
            break label43;
          }
          paramMessage = (VideoEngine.customMessage)obj;
          mVideoEngine.mListener.onDRMMetadata(mVideoEngine, (byte[])m_obj, m_n1, m_l1);
          return;
          if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.TIMELINE)) {
            break label43;
          }
          localObject1 = UpdateType.INITIAL;
          localObject3 = UpdateType.values();
          j = localObject3.length;
          i = m;
          label623:
          if (i < j)
          {
            localObject2 = localObject3[i];
            if (((UpdateType)localObject2).getValue() != arg1) {}
          }
          for (paramMessage = (Message)localObject2;; paramMessage = (Message)localObject1)
          {
            mVideoEngine.mListener.onTimeline(mVideoEngine, paramMessage);
            return;
            i += 1;
            break label623;
            if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.DATA)) {
              break label43;
            }
            localObject2 = (VideoEngine.customMessage)obj;
            paramMessage = DataType.DT_3GPP_CAPTION_METADATA;
            localObject3 = DataType.values();
            j = localObject3.length;
            i = n;
            label715:
            if (i < j)
            {
              localObject1 = localObject3[i];
              if (((DataType)localObject1).getValue() == m_n1) {
                paramMessage = (Message)localObject1;
              }
            }
            for (;;)
            {
              mVideoEngine.mListener.onData(mVideoEngine, m_l1, paramMessage, (byte[])m_obj, m_n2);
              return;
              i += 1;
              break label715;
              if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.MANIFEST_LOAD)) {
                break label43;
              }
              localObject2 = (VideoEngine.customMessage)obj;
              paramMessage = MediaErrorCode.GENERIC_ERROR;
              localObject3 = MediaErrorCode.values();
              j = localObject3.length;
              i = i1;
              label829:
              if (i < j)
              {
                localObject1 = localObject3[i];
                if (((MediaErrorCode)localObject1).getValue() == m_n1) {
                  paramMessage = (Message)localObject1;
                }
              }
              for (;;)
              {
                mVideoEngine.mListener.onManifestLoad(mVideoEngine, paramMessage, m_n2, (int)m_l1, m_l2);
                return;
                i += 1;
                break label829;
                if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.SEEK_COMPLETE)) {
                  break label43;
                }
                localObject1 = MediaErrorCode.GENERIC_ERROR;
                localObject3 = MediaErrorCode.values();
                j = localObject3.length;
                i = i2;
                label930:
                if (i < j)
                {
                  localObject2 = localObject3[i];
                  if (((MediaErrorCode)localObject2).getValue() != arg1) {}
                }
                for (paramMessage = (Message)localObject2;; paramMessage = (Message)localObject1)
                {
                  mVideoEngine.mListener.onSeekComplete(mVideoEngine, paramMessage);
                  return;
                  i += 1;
                  break label930;
                  if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.WARNING)) {
                    break label43;
                  }
                  localObject2 = MediaErrorCode.GENERIC_ERROR;
                  localObject3 = MediaErrorCode.values();
                  j = localObject3.length;
                  i = i3;
                  for (;;)
                  {
                    localObject1 = localObject2;
                    if (i < j)
                    {
                      localObject1 = localObject3[i];
                      if (((MediaErrorCode)localObject1).getValue() != arg1) {}
                    }
                    else
                    {
                      mVideoEngine.mListener.onWarning(mVideoEngine, (MediaErrorCode)localObject1, (String)obj);
                      return;
                    }
                    i += 1;
                  }
                  if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.DICTIONARY_DATA)) {
                    break label43;
                  }
                  paramMessage = (VideoEngine.customMessage)obj;
                  mVideoEngine.mListener.onDictionaryData(mVideoEngine, (Dictionary)m_obj, m_l1);
                  return;
                  if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.LOAD_INFO)) {
                    break label43;
                  }
                  mVideoEngine.mListener.onLoadInfo(mVideoEngine, (String)obj);
                  return;
                  if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.TRICK_PLAY_ENDED)) {
                    break label43;
                  }
                  localObject1 = MediaErrorCode.GENERIC_ERROR;
                  localObject3 = MediaErrorCode.values();
                  j = localObject3.length;
                  i = i4;
                  label1199:
                  if (i < j)
                  {
                    localObject2 = localObject3[i];
                    if (((MediaErrorCode)localObject2).getValue() != arg1) {}
                  }
                  for (paramMessage = (Message)localObject2;; paramMessage = (Message)localObject1)
                  {
                    mVideoEngine.mListener.onTrickPlayEnded(mVideoEngine, paramMessage);
                    return;
                    i += 1;
                    break label1199;
                    Log.w("VideoEngine(j)", "Handler : kCTDRMError!!!");
                    paramMessage = (DRMError)obj;
                    if (mVideoEngine.mListenerTypeSet.contains(ListenerType.DRM_ERROR)) {
                      mVideoEngine.mListener.onDRMError(mVideoEngine, paramMessage);
                    }
                    if (((paramMessage.getMajorError() < MediaErrorCode.AAXS_UnknownConnectionType.getValue()) || (paramMessage.getMajorError() > MediaErrorCode.AAXS_NoDigitalProtectionAvail.getValue())) && ((paramMessage.getMajorError() < MediaErrorCode.AAXS_NoOPConstraintInPixelConstraints.getValue()) || (paramMessage.getMajorError() > MediaErrorCode.AAXS_MinorErr_DisplayResolutionLargerThanConstraint.getValue()))) {
                      break label43;
                    }
                    try
                    {
                      mVideoEngine.reset();
                      return;
                    }
                    catch (VideoEngineException paramMessage)
                    {
                      Log.w("VideoEngine(j)", "Error while calling VideoEngine.reset() for output protection error: " + paramMessage);
                      return;
                    }
                    if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.BACKGROUND_MANIFEST_ERROR)) {
                      break label43;
                    }
                    localObject2 = MediaErrorCode.GENERIC_ERROR;
                    localObject3 = MediaErrorCode.values();
                    j = localObject3.length;
                    i = i5;
                    for (;;)
                    {
                      localObject1 = localObject2;
                      if (i < j)
                      {
                        localObject1 = localObject3[i];
                        if (((MediaErrorCode)localObject1).getValue() != arg1) {}
                      }
                      else
                      {
                        mVideoEngine.mListener.onBackgroundManifestError(mVideoEngine, (MediaErrorCode)localObject1, (String)obj);
                        return;
                      }
                      i += 1;
                    }
                    if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.BACKGROUND_MANIFEST_WARNING)) {
                      break label43;
                    }
                    localObject2 = MediaErrorCode.GENERIC_ERROR;
                    localObject3 = MediaErrorCode.values();
                    j = localObject3.length;
                    i = i6;
                    for (;;)
                    {
                      localObject1 = localObject2;
                      if (i < j)
                      {
                        localObject1 = localObject3[i];
                        if (((MediaErrorCode)localObject1).getValue() != arg1) {}
                      }
                      else
                      {
                        mVideoEngine.mListener.onBackgroundManifestWarning(mVideoEngine, (MediaErrorCode)localObject1, (String)obj);
                        return;
                      }
                      i += 1;
                    }
                    Log.w("VideoEngine(j)", "Handler : kCTPauseAtPeriodEnd!!!");
                    if (!mVideoEngine.mListenerTypeSet.contains(ListenerType.PAUSE_AT_PERIOD_END)) {
                      break;
                    }
                    paramMessage = (VideoEngine.customMessage)obj;
                    mVideoEngine.mListener.onPauseAtPeriodEnd(mVideoEngine, m_n1);
                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  
  private static class customMessage
  {
    long m_l1;
    long m_l2;
    int m_n1;
    int m_n2;
    Object m_obj;
    
    private customMessage(int paramInt1, int paramInt2, long paramLong1, long paramLong2, Object paramObject)
    {
      m_n1 = paramInt1;
      m_n2 = paramInt2;
      m_l1 = paramLong1;
      m_l2 = paramLong2;
      m_obj = paramObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.ave.VideoEngine
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */