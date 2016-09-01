package com.adobe.mediacore;

import com.adobe.ave.MediaErrorCode;
import com.adobe.ave.UpdateType;
import com.adobe.ave.VideoEngine;
import com.adobe.ave.VideoEngineListener;
import com.adobe.mediacore.logging.Logger;
import java.util.Arrays;

class MediaPlayerItemLoader$1
  extends VideoEngineListener
{
  MediaPlayerItemLoader$1(MediaPlayerItemLoader paramMediaPlayerItemLoader) {}
  
  public void onDRMMetadata(VideoEngine paramVideoEngine, byte[] paramArrayOfByte, int paramInt, long paramLong)
  {
    if (MediaPlayerItemLoader.access$000(this$0) == paramVideoEngine)
    {
      MediaPlayerItemLoader.access$200(this$0).i(MediaPlayerItemLoader.access$100() + "#onDRMMetadata", "DRMMetadata event  received at time [" + paramLong + "]");
      MediaPlayerItemLoader.access$302(this$0, true);
    }
  }
  
  public void onError(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, String paramString)
  {
    if (MediaPlayerItemLoader.access$000(this$0) == paramVideoEngine) {
      MediaPlayerItemLoader.access$200(this$0).e(MediaPlayerItemLoader.access$100() + "#onError", "[Error] >> " + String.valueOf(paramMediaErrorCode) + " - " + paramString);
    }
  }
  
  public void onTimeline(VideoEngine paramVideoEngine, UpdateType paramUpdateType)
  {
    if (MediaPlayerItemLoader.access$000(this$0) == paramVideoEngine)
    {
      MediaPlayerItemLoader.access$200(this$0).i(MediaPlayerItemLoader.access$100() + "#onTimeline", "Timeline event  received. Update type: " + paramUpdateType);
      paramVideoEngine = Arrays.asList(PSDKConfig.getAdTagsWithDefault());
      paramUpdateType = new DRMMetadataCache();
      MediaPlayerItemLoader.access$402(this$0, new VideoEngineItem(MediaPlayerItemLoader.access$500(this$0), MediaPlayerItemLoader.access$600(this$0), 0, paramUpdateType, paramVideoEngine));
      MediaPlayerItemLoader.access$400(this$0).update(MediaPlayerItemLoader.access$000(this$0));
      MediaPlayerItemLoader.access$400(this$0).setIsProtected(MediaPlayerItemLoader.access$300(this$0));
      MediaPlayerItemLoader.access$700(this$0).onLoadComplete(MediaPlayerItemLoader.access$400(this$0));
    }
  }
  
  public void onWarning(VideoEngine paramVideoEngine, MediaErrorCode paramMediaErrorCode, String paramString)
  {
    if (MediaPlayerItemLoader.access$000(this$0) == paramVideoEngine) {
      MediaPlayerItemLoader.access$200(this$0).w(MediaPlayerItemLoader.access$100() + "#onWarning", "[Warning] >> " + String.valueOf(paramMediaErrorCode) + " - " + paramString);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerItemLoader.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */