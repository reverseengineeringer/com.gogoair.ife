package com.adobe.ave;

import com.adobe.ave.drm.DRMError;

public class VideoEngineListener
{
  public void onBackgroundManifestError(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, String paramString) {}
  
  public void onBackgroundManifestWarning(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, String paramString) {}
  
  public void onDRMError(VideoEngine paramVideoEngine, DRMError paramDRMError) {}
  
  public void onDRMMetadata(VideoEngine paramVideoEngine, byte[] paramArrayOfByte, int paramInt, long paramLong) {}
  
  public void onData(VideoEngine paramVideoEngine, long paramLong, DataType paramDataType, byte[] paramArrayOfByte, int paramInt) {}
  
  public void onDictionaryData(VideoEngine paramVideoEngine, Dictionary paramDictionary, long paramLong) {}
  
  public void onError(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, String paramString) {}
  
  public void onLoadInfo(VideoEngine paramVideoEngine, String paramString) {}
  
  public void onManifestLoad(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, int paramInt1, int paramInt2, long paramLong) {}
  
  public void onPauseAtPeriodEnd(VideoEngine paramVideoEngine, int paramInt) {}
  
  public void onPlayState(VideoEngine paramVideoEngine, PlayState paramPlayState) {}
  
  public void onSeekComplete(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode) {}
  
  public void onStreamMetadata(VideoEngine paramVideoEngine, StreamMetadata paramStreamMetadata) {}
  
  public void onStreamSwitch(VideoEngine paramVideoEngine, long paramLong, SwitchInfo paramSwitchInfo, int paramInt1, int paramInt2) {}
  
  public void onTimeline(VideoEngine paramVideoEngine, UpdateType paramUpdateType) {}
  
  public void onTrickPlayEnded(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode) {}
  
  public void onWarning(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, String paramString) {}
}

/* Location:
 * Qualified Name:     com.adobe.ave.VideoEngineListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */