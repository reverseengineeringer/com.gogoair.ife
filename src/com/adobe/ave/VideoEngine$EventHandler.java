package com.adobe.ave;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.adobe.ave.drm.DRMError;
import java.util.Set;

class VideoEngine$EventHandler
  extends Handler
{
  private VideoEngine mVideoEngine;
  
  public VideoEngine$EventHandler(VideoEngine paramVideoEngine1, VideoEngine paramVideoEngine2, Looper paramLooper)
  {
    super(paramLooper);
    mVideoEngine = paramVideoEngine2;
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
    if (VideoEngine.access$100(mVideoEngine) == 0L) {
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
        } while (VideoEngine.access$200(mVideoEngine) == null);
        switch (what)
        {
        default: 
          return;
        }
      } while (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.ERROR));
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
          VideoEngine.access$200(mVideoEngine).onError(mVideoEngine, (MediaErrorCode)localObject1, (String)obj);
          return;
        }
        i += 1;
      }
    } while (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.PLAY_STATE));
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
      VideoEngine.access$200(mVideoEngine).onPlayState(mVideoEngine, paramMessage);
      return;
      i += 1;
      break label330;
      if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.STREAM_SWITCH)) {
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
        VideoEngine.access$200(mVideoEngine).onStreamSwitch(mVideoEngine, m_l1, paramMessage, m_n2, (int)m_l2);
        return;
        i += 1;
        break label423;
        if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.STREAM_METADATA)) {
          break label43;
        }
        VideoEngine.access$200(mVideoEngine).onStreamMetadata(mVideoEngine, (StreamMetadata)obj);
        return;
        if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.DRM_METADATA)) {
          break label43;
        }
        paramMessage = (VideoEngine.customMessage)obj;
        VideoEngine.access$200(mVideoEngine).onDRMMetadata(mVideoEngine, (byte[])m_obj, m_n1, m_l1);
        return;
        if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.TIMELINE)) {
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
          VideoEngine.access$200(mVideoEngine).onTimeline(mVideoEngine, paramMessage);
          return;
          i += 1;
          break label623;
          if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.DATA)) {
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
            VideoEngine.access$200(mVideoEngine).onData(mVideoEngine, m_l1, paramMessage, (byte[])m_obj, m_n2);
            return;
            i += 1;
            break label715;
            if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.MANIFEST_LOAD)) {
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
              VideoEngine.access$200(mVideoEngine).onManifestLoad(mVideoEngine, paramMessage, m_n2, (int)m_l1, m_l2);
              return;
              i += 1;
              break label829;
              if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.SEEK_COMPLETE)) {
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
                VideoEngine.access$200(mVideoEngine).onSeekComplete(mVideoEngine, paramMessage);
                return;
                i += 1;
                break label930;
                if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.WARNING)) {
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
                    VideoEngine.access$200(mVideoEngine).onWarning(mVideoEngine, (MediaErrorCode)localObject1, (String)obj);
                    return;
                  }
                  i += 1;
                }
                if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.DICTIONARY_DATA)) {
                  break label43;
                }
                paramMessage = (VideoEngine.customMessage)obj;
                VideoEngine.access$200(mVideoEngine).onDictionaryData(mVideoEngine, (Dictionary)m_obj, m_l1);
                return;
                if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.LOAD_INFO)) {
                  break label43;
                }
                VideoEngine.access$200(mVideoEngine).onLoadInfo(mVideoEngine, (String)obj);
                return;
                if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.TRICK_PLAY_ENDED)) {
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
                  VideoEngine.access$200(mVideoEngine).onTrickPlayEnded(mVideoEngine, paramMessage);
                  return;
                  i += 1;
                  break label1199;
                  Log.w("VideoEngine(j)", "Handler : kCTDRMError!!!");
                  paramMessage = (DRMError)obj;
                  if (VideoEngine.access$300(mVideoEngine).contains(ListenerType.DRM_ERROR)) {
                    VideoEngine.access$200(mVideoEngine).onDRMError(mVideoEngine, paramMessage);
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
                  if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.BACKGROUND_MANIFEST_ERROR)) {
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
                      VideoEngine.access$200(mVideoEngine).onBackgroundManifestError(mVideoEngine, (MediaErrorCode)localObject1, (String)obj);
                      return;
                    }
                    i += 1;
                  }
                  if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.BACKGROUND_MANIFEST_WARNING)) {
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
                      VideoEngine.access$200(mVideoEngine).onBackgroundManifestWarning(mVideoEngine, (MediaErrorCode)localObject1, (String)obj);
                      return;
                    }
                    i += 1;
                  }
                  Log.w("VideoEngine(j)", "Handler : kCTPauseAtPeriodEnd!!!");
                  if (!VideoEngine.access$300(mVideoEngine).contains(ListenerType.PAUSE_AT_PERIOD_END)) {
                    break;
                  }
                  paramMessage = (VideoEngine.customMessage)obj;
                  VideoEngine.access$200(mVideoEngine).onPauseAtPeriodEnd(mVideoEngine, m_n1);
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

/* Location:
 * Qualified Name:     com.adobe.ave.VideoEngine.EventHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */