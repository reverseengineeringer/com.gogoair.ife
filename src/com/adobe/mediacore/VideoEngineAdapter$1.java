package com.adobe.mediacore;

import com.adobe.ave.DataType;
import com.adobe.ave.Dictionary;
import com.adobe.ave.MediaErrorCode;
import com.adobe.ave.PlayState;
import com.adobe.ave.StreamMetadata;
import com.adobe.ave.SwitchInfo;
import com.adobe.ave.UpdateType;
import com.adobe.ave.VideoEngine;
import com.adobe.ave.VideoEngineException;
import com.adobe.ave.VideoEngineListener;
import com.adobe.ave.drm.DRMError;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.qos.LoadInfo;
import com.adobe.mediacore.qos.LoadInfo.Type;
import com.adobe.mediacore.utils.StringUtils;
import com.adobe.mediacore.utils.TimeRange;

class VideoEngineAdapter$1
  extends VideoEngineListener
{
  VideoEngineAdapter$1(VideoEngineAdapter paramVideoEngineAdapter) {}
  
  private long getTimestamp(long paramLong)
  {
    VideoEngineAdapter.access$900(this$0).update();
    long l = VideoEngineAdapter.access$900(this$0).getTime();
    paramLong /= 1000000L;
    if (Math.abs(paramLong - l) >= 1000L) {
      return l;
    }
    return paramLong;
  }
  
  public void onBackgroundManifestError(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, String paramString)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      return;
      VideoEngineAdapter.access$200().e(VideoEngineAdapter.access$100() + "#onBackgroundManifestError", "[Error] >> " + String.valueOf(paramMediaErrorCode) + " - " + paramString);
      paramVideoEngine = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.BACKGROUND_MANIFEST_WARNING, "Native error received in background manifest.");
      MetadataNode localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("BACKGROUND_MANIFEST_WARNING_CODE", paramMediaErrorCode.getValue() + "");
      localMetadataNode.setValue("BACKGROUND_MANIFEST_WARNING_NAME", paramMediaErrorCode.name());
      localMetadataNode.setValue("DESCRIPTION", paramString);
      paramVideoEngine.setMetadata(localMetadataNode);
    } while (VideoEngineAdapter.access$600(this$0) == null);
    VideoEngineAdapter.access$600(this$0).dispatch(OperationFailedEvent.createEvent(paramVideoEngine));
  }
  
  public void onBackgroundManifestWarning(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, String paramString)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      do
      {
        return;
        paramVideoEngine = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.BACKGROUND_MANIFEST_WARNING, "Native warning received in background manifest.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("BACKGROUND_MANIFEST_WARNING_CODE", paramMediaErrorCode.getValue() + "");
        localMetadataNode.setValue("BACKGROUND_MANIFEST_WARNING_NAME", paramMediaErrorCode.name());
        localMetadataNode.setValue("DESCRIPTION", paramString);
        paramVideoEngine.setMetadata(localMetadataNode);
      } while (VideoEngineAdapter.access$600(this$0) == null);
      VideoEngineAdapter.access$600(this$0).dispatch(OperationFailedEvent.createEvent(paramVideoEngine));
    } while (paramMediaErrorCode != MediaErrorCode.CANNOT_LOAD_PLAYLIST);
    VideoEngineAdapter.access$600(this$0).dispatch(BlackoutEvent.createBlackoutEvent());
  }
  
  public void onDRMError(VideoEngine paramVideoEngine, DRMError paramDRMError)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      return;
      paramVideoEngine = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.NATIVE_ERROR, "Native error received.");
      MetadataNode localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("NATIVE_ERROR_CODE", paramDRMError.getMajorError() + "");
      localMetadataNode.setValue("DESCRIPTION", "");
      localMetadataNode.setValue("NATIVE_SUBERROR_CODE", paramDRMError.getMinorError() + "");
      localMetadataNode.setValue("DRM_ERROR_STRING", paramDRMError.getServerErrorString());
      paramVideoEngine.setMetadata(localMetadataNode);
    } while (VideoEngineAdapter.access$600(this$0) == null);
    VideoEngineAdapter.access$600(this$0).dispatch(ErrorEvent.createVideoErrorEvent(paramVideoEngine));
  }
  
  public void onDRMMetadata(VideoEngine paramVideoEngine, byte[] paramArrayOfByte, int paramInt, long paramLong)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    boolean bool1;
    do
    {
      return;
      VideoEngineAdapter.access$1902(this$0, true);
      VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onDRMMetadata", "DRM metadata event received for time [" + paramLong + "]");
      boolean bool2 = false;
      bool1 = bool2;
      if (VideoEngineAdapter.access$900(this$0) != null)
      {
        bool1 = bool2;
        if (VideoEngineAdapter.access$900(this$0).getPlaybackRange() != null) {
          bool1 = VideoEngineAdapter.access$900(this$0).getPlaybackRange().contains(paramLong);
        }
      }
      paramVideoEngine = DRMMetadataInfo.createDRMMetadataInfo(this$0.getDRMManager(), paramArrayOfByte, paramInt, paramLong, bool1);
      if (paramVideoEngine == null)
      {
        VideoEngineAdapter.access$200().e(VideoEngineAdapter.access$100() + "#onDRMMetadata", "Unable to convert bytes to DRMMetadataInfo.");
        return;
      }
      bool1 = VideoEngineAdapter.access$2000(this$0).addDRMMetadata(paramVideoEngine);
    } while ((VideoEngineAdapter.access$600(this$0) == null) || (!bool1));
    VideoEngineAdapter.access$600(this$0).dispatch(DRMMetadataEvent.createDRMMetadataEvent(paramVideoEngine));
  }
  
  public void onData(VideoEngine paramVideoEngine, long paramLong, DataType paramDataType, byte[] paramArrayOfByte, int paramInt)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    for (;;)
    {
      return;
      paramLong = getTimestamp(paramLong);
      paramVideoEngine = MetadataNode.fromByteArray(paramArrayOfByte);
      if (paramVideoEngine == null)
      {
        VideoEngineAdapter.access$200().e(VideoEngineAdapter.access$100() + "#onData", "Unable to deserialize data.");
        return;
      }
      VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onData", "Data event received at time [" + paramLong + "] " + paramVideoEngine);
      if (paramVideoEngine.containsKey(DefaultMetadataKeys.MARKER_KEY.getValue())) {
        try
        {
          paramInt = Integer.parseInt(paramVideoEngine.getValue(DefaultMetadataKeys.MARKER_CONTENT_ID_KEY.getValue()));
          if (VideoEngineAdapter.access$600(this$0) != null)
          {
            VideoEngineAdapter.access$600(this$0).dispatch(ContentMarkerEvent.createContentMarkerEvent(paramInt, paramLong));
            return;
          }
        }
        catch (NumberFormatException paramVideoEngine)
        {
          VideoEngineAdapter.access$200().e(VideoEngineAdapter.access$100() + "#onData", "Unable to parse content id.");
        }
      }
    }
  }
  
  public void onDictionaryData(VideoEngine paramVideoEngine, Dictionary paramDictionary, long paramLong)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      return;
      VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onDictionaryData", "Dictionary data event received");
      if (paramDictionary == null)
      {
        VideoEngineAdapter.access$200().w(VideoEngineAdapter.access$100() + "#onDictionaryData", "Dictionary received is null");
        return;
      }
    } while (!VideoEngineAdapter.access$3400(this$0, paramDictionary));
    for (;;)
    {
      int i;
      try
      {
        int j = paramDictionary.getCount();
        paramVideoEngine = new MetadataNode();
        i = 0;
        if (i < j)
        {
          String str = paramDictionary.getKeyByIndex(i);
          if ((StringUtils.isEmpty(str)) || (str.equals("_dictionaryType"))) {
            break label263;
          }
          Object localObject = paramDictionary.getValueByKey(str);
          if (!StringUtils.isEmpty((String)localObject)) {
            paramVideoEngine.setValue(str, (String)localObject);
          }
          localObject = paramDictionary.getByteArrayByKey(str);
          if (localObject.length <= 0) {
            break label263;
          }
          paramVideoEngine.setByteArray(str, (byte[])localObject);
        }
      }
      catch (VideoEngineException paramVideoEngine)
      {
        VideoEngineAdapter.access$200().e(VideoEngineAdapter.access$100() + "#onDictionaryData", "Video engine exception raised while accesing the dictionary", paramVideoEngine);
        return;
      }
      if (VideoEngineAdapter.access$600(this$0) == null) {
        break;
      }
      VideoEngineAdapter.access$600(this$0).dispatch(TimedMetadataAddedEvent.createAddedID3Event(paramVideoEngine, paramLong));
      return;
      label263:
      i += 1;
    }
  }
  
  public void onError(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, String paramString)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {
      break label11;
    }
    label11:
    label270:
    for (;;)
    {
      return;
      if (paramMediaErrorCode.getValue() <= MediaErrorCode.AAXS_InvalidVoucher.getValue())
      {
        VideoEngineAdapter.access$200().e(VideoEngineAdapter.access$100() + "#onError", "[Error] >> " + String.valueOf(paramMediaErrorCode) + " - " + paramString);
        paramVideoEngine = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.NATIVE_ERROR, "Native error received.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("NATIVE_ERROR_CODE", paramMediaErrorCode.getValue() + "");
        localMetadataNode.setValue("NATIVE_ERROR_NAME", paramMediaErrorCode.name());
        localMetadataNode.setValue("DESCRIPTION", paramString);
        paramVideoEngine.setMetadata(localMetadataNode);
        paramMediaErrorCode = VideoEngineAdapter.access$300(paramString);
        if ((paramMediaErrorCode != null) && (paramMediaErrorCode.getType() == LoadInfo.Type.MANIFEST)) {
          paramVideoEngine.setInnerNotification(VideoEngineAdapter.access$400(this$0, paramMediaErrorCode));
        }
        for (;;)
        {
          if (VideoEngineAdapter.access$600(this$0) == null) {
            break label270;
          }
          VideoEngineAdapter.access$600(this$0).dispatch(ErrorEvent.createVideoErrorEvent(paramVideoEngine));
          return;
          if (VideoEngineAdapter.access$500(this$0, paramMediaErrorCode)) {
            break;
          }
          if (paramMediaErrorCode != null) {
            VideoEngineAdapter.access$200().e(VideoEngineAdapter.access$100() + "#onError", "Unexpected event. Fragment error received as error instead of warning.");
          }
        }
      }
    }
  }
  
  public void onLoadInfo(VideoEngine paramVideoEngine, String paramString)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      return;
      VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onLoadInfo", "Description: " + paramString);
      paramVideoEngine = VideoEngineAdapter.access$300(paramString);
    } while ((VideoEngineAdapter.access$600(this$0) == null) || (paramVideoEngine == null) || (paramVideoEngine.getType() != LoadInfo.Type.FRAGMENT));
    VideoEngineAdapter.access$600(this$0).dispatch(LoadInfoEvent.createLoadInfoEvent(paramVideoEngine));
  }
  
  public void onManifestLoad(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, int paramInt1, int paramInt2, long paramLong)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      return;
      VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onManifestLoad", "Manifest load event received with code " + paramMediaErrorCode.toString() + " for content " + paramInt1);
    } while (VideoEngineAdapter.access$600(this$0) == null);
    if (paramMediaErrorCode == MediaErrorCode.SUCCESS)
    {
      VideoEngineAdapter.access$600(this$0).dispatch(AdManifestLoadEvent.createAdManifestLoadCompletedEvent(paramInt1, paramInt2, paramLong));
      return;
    }
    VideoEngineAdapter.access$600(this$0).dispatch(AdManifestLoadEvent.createAdManifestLoadFailedEvent(paramInt1));
  }
  
  public void onPauseAtPeriodEnd(VideoEngine paramVideoEngine, int paramInt)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      return;
      VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onPauseAtPeriodEnd", "VPAID Id: " + paramInt);
    } while (VideoEngineAdapter.access$600(this$0) == null);
    VideoEngineAdapter.access$600(this$0).dispatch(new PauseAtPeriodEndEvent(MediaPlayerEvent.Type.PAUSE_AT_PERIOD_END, paramInt));
  }
  
  public void onPlayState(VideoEngine paramVideoEngine, PlayState paramPlayState)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    long l;
    int i;
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onPlayState", "PlayState event: " + paramPlayState);
            VideoEngineAdapter.access$802(this$0, paramPlayState);
          } while (VideoEngineAdapter.access$600(this$0) == null);
          switch (VideoEngineAdapter.2.$SwitchMap$com$adobe$ave$PlayState[paramPlayState.ordinal()])
          {
          default: 
            return;
          case 1: 
            VideoEngineAdapter.access$900(this$0).update();
            VideoEngineAdapter.access$600(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.ITEM_READY));
            return;
          case 2: 
            VideoEngineAdapter.access$900(this$0).update();
            VideoEngineAdapter.access$600(this$0).dispatch(VideoStateChangedEvent.createChangedEvent(MediaPlayerState.COMPLETE, null));
            return;
          case 3: 
            VideoEngineAdapter.access$900(this$0).update();
            VideoEngineAdapter.access$1002(this$0, true);
            VideoEngineAdapter.access$1200(this$0, VideoEngineAdapter.access$1100(this$0).getInitialBufferTime());
            VideoEngineAdapter.access$1302(this$0, true);
            VideoEngineAdapter.access$600(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.BUFFERING_STARTED));
            return;
          }
        } while (VideoEngineAdapter.access$600(this$0) == null);
        VideoEngineAdapter.access$600(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.BUFFERING_COMPLETED));
        return;
        VideoEngineAdapter.access$1400(this$0);
        VideoEngineAdapter.access$900(this$0).update();
        VideoEngineAdapter.access$600(this$0).dispatch(VideoStateChangedEvent.createChangedEvent(MediaPlayerState.PLAY, null));
      } while (VideoEngineAdapter.access$1500(this$0) != -1);
      l = VideoEngineAdapter.access$900(this$0).getTime();
      i = VideoEngineAdapter.access$1600(this$0, l);
    } while (i == -1);
    if (VideoEngineAdapter.access$1700(this$0).containsMarkerForTime(l))
    {
      VideoEngineAdapter.access$1700(this$0).updateTimelineMarkers(l);
      return;
    }
    VideoEngineAdapter.access$1502(this$0, i);
    VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onPlayState", "Detected period-change at time [" + String.valueOf(l) + "].");
    VideoEngineAdapter.access$600(this$0).dispatch(ContentChangedEvent.createChangeEvent(VideoEngineAdapter.access$1500(this$0), l));
    return;
    VideoEngineAdapter.access$1400(this$0);
    VideoEngineAdapter.access$600(this$0).dispatch(VideoStateChangedEvent.createChangedEvent(MediaPlayerState.PAUSE, null));
    return;
    VideoEngineAdapter.access$600(this$0).dispatch(VideoStateChangedEvent.createChangedEvent(MediaPlayerState.SUSPENDED, null));
  }
  
  public void onSeekComplete(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      long l;
      do
      {
        return;
        VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onSeekComplete", "Seek complete event received.");
        VideoEngineAdapter.access$3002(this$0, true);
        VideoEngineAdapter.access$900(this$0).update();
        if ((VideoEngineAdapter.access$600(this$0) != null) && (VideoEngineAdapter.access$1000(this$0)))
        {
          VideoEngineAdapter.access$1002(this$0, false);
          VideoEngineAdapter.access$600(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.BUFFERING_COMPLETED));
        }
        VideoEngineAdapter.access$3102(this$0, false);
        VideoEngineAdapter.access$1400(this$0);
        if (VideoEngineAdapter.access$1300(this$0))
        {
          VideoEngineAdapter.access$1200(this$0, VideoEngineAdapter.access$1100(this$0).getPlayBufferTime());
          VideoEngineAdapter.access$1302(this$0, false);
        }
        if (paramMediaErrorCode != MediaErrorCode.SUCCESS) {
          break;
        }
        l = VideoEngineAdapter.access$3200(this$0).getTime();
        if (VideoEngineAdapter.access$3200(this$0).getPeriod() != -1) {
          l = VideoEngineAdapter.access$3300(this$0, VideoEngineAdapter.access$3200(this$0));
        }
      } while (VideoEngineAdapter.access$600(this$0) == null);
      VideoEngineAdapter.access$600(this$0).dispatch(SeekEvent.createSeekCompleted(l));
      return;
      paramVideoEngine = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.SEEK_ERROR, "Seeking operation has failed.");
      MetadataNode localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("NATIVE_ERROR_CODE", paramMediaErrorCode.name());
      localMetadataNode.setValue("DESIRED_SEEK_PERIOD", VideoEngineAdapter.access$3200(this$0).getPeriod() + "");
      localMetadataNode.setValue("DESIRED_SEEK_POSITION", VideoEngineAdapter.access$3200(this$0).getTime() + "");
      paramVideoEngine.setMetadata(localMetadataNode);
    } while (VideoEngineAdapter.access$600(this$0) == null);
    VideoEngineAdapter.access$600(this$0).dispatch(ErrorEvent.createVideoErrorEvent(paramVideoEngine));
  }
  
  public void onStreamMetadata(VideoEngine paramVideoEngine, StreamMetadata paramStreamMetadata)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      return;
      paramVideoEngine = null;
      if (paramStreamMetadata != null)
      {
        paramVideoEngine = new StringBuilder();
        paramVideoEngine.append("Width: ").append(outputWidth).append(" | ");
        paramVideoEngine.append("Height: ").append(outputHeight).append(" | ");
        paramVideoEngine.append("Frame rate: ").append(frameRate).append(" | ");
        paramVideoEngine.append("Profile: ").append(profile).append(" | ");
        paramVideoEngine.append("Level: ").append(level).append(".");
        paramVideoEngine = paramVideoEngine.toString();
      }
      VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onStreamMetadata", "StreamMetadata event received - " + paramVideoEngine);
    } while ((VideoEngineAdapter.access$600(this$0) == null) || (paramStreamMetadata == null) || (outputWidth == 0) || (outputHeight == 0));
    int i = outputWidth;
    int j = outputHeight;
    VideoEngineAdapter.access$600(this$0).dispatch(VideoSizeChangedEvent.createChangedEvent(j, i));
  }
  
  public void onStreamSwitch(VideoEngine paramVideoEngine, long paramLong, SwitchInfo paramSwitchInfo, int paramInt1, int paramInt2)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    label262:
    label367:
    for (;;)
    {
      return;
      VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onStreamSwitch", "Switch detected at time [" + String.valueOf(paramLong) + "].");
      int i;
      if (VideoEngineAdapter.access$1500(this$0) != paramInt2)
      {
        i = 1;
        if ((VideoEngineAdapter.access$600(this$0) != null) && (i != 0))
        {
          if (!VideoEngineAdapter.access$1700(this$0).containsMarkerForTime(paramLong)) {
            break label262;
          }
          VideoEngineAdapter.access$1700(this$0).updateTimelineMarkers(paramLong);
        }
      }
      for (;;)
      {
        if ((VideoEngineAdapter.access$600(this$0) == null) || (VideoEngineAdapter.access$1800(this$0) == paramInt1)) {
          break label367;
        }
        VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onStreamSwitch", "Detected bit rate change [" + String.valueOf(paramInt1) + " at time [" + String.valueOf(paramLong) + "].");
        VideoEngineAdapter.access$1802(this$0, paramInt1);
        VideoEngineAdapter.access$600(this$0).dispatch(ProfileChangedEvent.createProfileChangeEvent(VideoEngineAdapter.access$1800(this$0), paramLong));
        return;
        i = 0;
        break;
        VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onStreamSwitch", "Detected period change contentId [" + String.valueOf(paramInt2) + "] at time [" + String.valueOf(paramLong) + "].");
        VideoEngineAdapter.access$1502(this$0, paramInt2);
        VideoEngineAdapter.access$600(this$0).dispatch(ContentChangedEvent.createChangeEvent(VideoEngineAdapter.access$1500(this$0), paramLong));
      }
    }
  }
  
  public void onTimeline(VideoEngine paramVideoEngine, UpdateType paramUpdateType)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#onTimeline", "Timeline event received. Update type: " + paramUpdateType);
            if (!VideoEngineAdapter.access$2100(this$0))
            {
              VideoEngineAdapter.access$200().w(VideoEngineAdapter.access$100() + "#onTimeline", "AVE timeline is invalid. Ignoring event.");
              return;
            }
            switch (VideoEngineAdapter.2.$SwitchMap$com$adobe$ave$UpdateType[paramUpdateType.ordinal()])
            {
            default: 
              return;
            case 1: 
              VideoEngineAdapter.access$2202(this$0, false);
              VideoEngineAdapter.access$900(this$0).update();
              if (VideoEngineAdapter.access$600(this$0) != null) {
                VideoEngineAdapter.access$600(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.RESOURCE_LOADED));
              }
              VideoEngineAdapter.access$600(this$0).createNotificationHistory();
              VideoEngineAdapter.access$2302(this$0, new VideoEngineItem(VideoEngineAdapter.access$600(this$0), VideoEngineAdapter.access$2400(this$0), VideoEngineAdapter.access$2500(this$0), VideoEngineAdapter.access$2000(this$0), VideoEngineAdapter.access$2600(this$0)));
              VideoEngineAdapter.access$2300(this$0).update(VideoEngineAdapter.access$000(this$0));
              VideoEngineAdapter.access$2300(this$0).setIsProtected(VideoEngineAdapter.access$1900(this$0));
              if (VideoEngineAdapter.access$2700(this$0) != null)
              {
                VideoEngineAdapter.access$2802(this$0, new BackgroundVideoEngineItem(VideoEngineAdapter.access$600(this$0), VideoEngineAdapter.access$2700(this$0), VideoEngineAdapter.access$2000(this$0), VideoEngineAdapter.access$2600(this$0)));
                VideoEngineAdapter.access$2800(this$0).update(VideoEngineAdapter.access$000(this$0));
              }
              VideoEngineAdapter.access$1702(this$0, new VideoEngineTimeline(VideoEngineAdapter.access$600(this$0), this$0, VideoEngineAdapter.access$2400(this$0), VideoEngineAdapter.access$2500(this$0), VideoEngineAdapter.access$2900(this$0, VideoEngineAdapter.access$2400(this$0).getMetadata())));
            }
          } while (VideoEngineAdapter.access$600(this$0) == null);
          VideoEngineAdapter.access$600(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.ITEM_CREATED));
          return;
          VideoEngineAdapter.access$900(this$0).update();
          VideoEngineAdapter.access$2300(this$0).update(VideoEngineAdapter.access$000(this$0));
          VideoEngineAdapter.access$1700(this$0).update(VideoEngineAdapter.access$900(this$0).getTime());
        } while (VideoEngineAdapter.access$600(this$0) == null);
        VideoEngineAdapter.access$600(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.ITEM_UPDATED));
        return;
        VideoEngineAdapter.access$2300(this$0).refreshClosedCaptionsTracks(VideoEngineAdapter.access$000(this$0));
      } while (VideoEngineAdapter.access$600(this$0) == null);
      VideoEngineAdapter.access$600(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.ITEM_UPDATED));
      return;
    } while (VideoEngineAdapter.access$2800(this$0) == null);
    VideoEngineAdapter.access$2800(this$0).update(VideoEngineAdapter.access$000(this$0));
  }
  
  public void onWarning(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, String paramString)
  {
    if (paramVideoEngine != VideoEngineAdapter.access$000(this$0)) {}
    do
    {
      do
      {
        do
        {
          return;
          VideoEngineAdapter.access$200().w(VideoEngineAdapter.access$100() + "#onWarning", "[Warning] >> " + String.valueOf(paramMediaErrorCode) + " - " + paramString);
          if ((paramMediaErrorCode == MediaErrorCode.PERIOD_HOLD) && (VideoEngineAdapter.access$700(this$0) != null)) {
            VideoEngineAdapter.access$200().e(VideoEngineAdapter.access$100(), "Current hold position is: " + VideoEngineAdapter.access$700(this$0).getCurrentHoldTime() + ". Current time is: " + this$0.getCurrentTime());
          }
        } while (paramMediaErrorCode == MediaErrorCode.LIVE_HOLD);
        if ((paramMediaErrorCode != MediaErrorCode.RENDITION_M3U8_ERROR) && (paramMediaErrorCode != MediaErrorCode.FILE_NOT_FOUND) && (paramMediaErrorCode != MediaErrorCode.SEGMENT_SKIPPED_ON_FAILURE)) {
          break;
        }
        paramVideoEngine = VideoEngineAdapter.access$300(paramString);
      } while (VideoEngineAdapter.access$500(this$0, paramVideoEngine));
      paramVideoEngine = VideoEngineAdapter.access$400(this$0, paramVideoEngine);
      if ((VideoEngineAdapter.access$600(this$0) != null) && (paramVideoEngine != null))
      {
        VideoEngineAdapter.access$600(this$0).dispatch(ErrorEvent.createVideoErrorEvent(paramVideoEngine));
        return;
      }
      paramVideoEngine = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.NATIVE_WARNING, "Native warning received.");
      MetadataNode localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("NATIVE_ERROR_CODE", paramMediaErrorCode.getValue() + "");
      localMetadataNode.setValue("NATIVE_ERROR_NAME", paramMediaErrorCode.name());
      localMetadataNode.setValue("DESCRIPTION", paramString);
      paramVideoEngine.setMetadata(localMetadataNode);
    } while (VideoEngineAdapter.access$600(this$0) == null);
    VideoEngineAdapter.access$600(this$0).dispatch(OperationFailedEvent.createEvent(paramVideoEngine));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineAdapter.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */