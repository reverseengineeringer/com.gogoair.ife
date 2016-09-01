package com.adobe.mediacore;

import com.adobe.ave.PeriodInfo;
import com.adobe.ave.Timeline;
import com.adobe.ave.VideoEngine;
import com.adobe.ave.VideoEngineException;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.qos.metrics.PlaybackMetrics;
import com.adobe.mediacore.utils.TimeRange;

public class VideoEngineAdapter$VideoEnginePlaybackMetrics
  extends PlaybackMetrics
{
  private static final int DEFAULT_TARGET_DURATION = 10000;
  private static final long READ_HEAD_DELTA = 0L;
  private long _clientLivePoint;
  private boolean _dispatchedBufferFull;
  private long _readHead;
  private long _savedBufferLength;
  
  protected VideoEngineAdapter$VideoEnginePlaybackMetrics(VideoEngineAdapter paramVideoEngineAdapter) {}
  
  private void checkAndDispatchBufferFullEvent()
  {
    if ((_dispatchedBufferFull) && (!this$0.hasAllDataBuffered()) && (_bufferLength <= VideoEngineAdapter.access$1100(this$0).getPlayBufferTime()) && (_savedBufferLength != _bufferLength)) {
      _dispatchedBufferFull = false;
    }
    if (_dispatchedBufferFull) {}
    do
    {
      do
      {
        return;
        _dispatchedBufferFull = false;
        _savedBufferLength = _bufferLength;
      } while (!this$0.isBufferFull());
      _dispatchedBufferFull = true;
    } while (VideoEngineAdapter.access$600(this$0) == null);
    VideoEngineAdapter.access$600(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.BUFFERING_FULL));
  }
  
  protected void doUpdate()
  {
    try
    {
      if (VideoEngineAdapter.access$000(this$0) == null) {
        return;
      }
      if ((!VideoEngineAdapter.access$3100(this$0)) || (VideoEngineAdapter.access$3200(this$0) == null) || (VideoEngineAdapter.access$3200(this$0).getTime() == -3L)) {
        break label545;
      }
      if (VideoEngineAdapter.access$3200(this$0).getPeriod() != -1) {
        break label531;
      }
      _time = VideoEngineAdapter.access$3200(this$0).getTime();
    }
    catch (VideoEngineException localVideoEngineException)
    {
      for (;;)
      {
        Timeline localTimeline;
        long l3;
        VideoEngineAdapter.access$200().e(VideoEngineAdapter.access$100() + "#doUpdate", "Unable to update metrics.", localVideoEngineException);
        Object localObject = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.GET_QOS_DATA_ERROR, "An error has occurred while attempting to retrieve the QOS information.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", localVideoEngineException.getMessage());
        ((MediaPlayerNotification.Error)localObject).setMetadata(localMetadataNode);
        if (VideoEngineAdapter.access$600(this$0) == null) {
          break;
        }
        VideoEngineAdapter.access$600(this$0).dispatch(ErrorEvent.createVideoErrorEvent((MediaPlayerNotification.Error)localObject));
        return;
        label531:
        _time = VideoEngineAdapter.access$3500(this$0);
        continue;
        label545:
        _time = VideoEngineAdapter.access$000(this$0).getTime();
        continue;
        long l2 = virtualDuration;
        localObject = localVideoEngineException.getPeriodInfo(lastPeriodIndex);
        long l1 = l2;
        if (localObject != null)
        {
          l1 = l2;
          if (virtualStartTime + l2 > virtualStartTime + duration) {
            l1 = virtualStartTime + duration - virtualStartTime;
          }
        }
        _seekableRange = TimeRange.createRange(virtualStartTime, l1);
      }
    }
    _timeLocal = this$0.getLocalTime();
    _bufferLength = VideoEngineAdapter.access$000(this$0).getBufferLength();
    _readHead = (_time + _bufferLength + 0L);
    _bufferTime = VideoEngineAdapter.access$1100(this$0).getPlayBufferTime();
    localTimeline = VideoEngineAdapter.access$000(this$0).getTimeline();
    if (localTimeline != null)
    {
      l1 = Math.min(_time, virtualStartTime);
      _playbackRange = TimeRange.createRange(l1, virtualStartTime - l1 + virtualDuration);
      if (complete == 0)
      {
        _clientLivePoint = VideoEngineAdapter.access$000(this$0).getClientLivePoint();
        if (_clientLivePoint >= virtualDuration + virtualStartTime) {
          VideoEngineAdapter.access$200().i(VideoEngineAdapter.access$100() + "#DEBUG", "Client live point = " + _clientLivePoint + " virtual start time = " + virtualStartTime + " virtual end time  = " + (virtualStartTime + virtualDuration));
        }
        l1 = _clientLivePoint;
        l2 = virtualStartTime;
        _seekableRange = TimeRange.createRange(virtualStartTime, l1 - l2);
        l1 = VideoEngineAdapter.access$000(this$0).getTime();
        l2 = _bufferLength;
        l3 = virtualStartTime;
        _bufferedRange = TimeRange.createRange(l1, Math.min(l2, virtualDuration + l3 - VideoEngineAdapter.access$000(this$0).getTime()));
      }
    }
    else
    {
      _frameRate = VideoEngineAdapter.access$000(this$0).getQosFrameRate();
      _droppedFramesCount = VideoEngineAdapter.access$000(this$0).getQosDroppedFrameCount();
      _bitrate = VideoEngineAdapter.access$1800(this$0);
      checkAndDispatchBufferFullEvent();
      return;
    }
  }
  
  public long getReadHead()
  {
    return _readHead;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineAdapter.VideoEnginePlaybackMetrics
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */