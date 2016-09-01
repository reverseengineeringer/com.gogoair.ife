package com.adobe.mediacore;

class ContentLoader$ContentLoadCompleteListener
  implements AdManifestLoadCompleteListener
{
  private ContentLoader$ContentLoadCompleteListener(ContentLoader paramContentLoader) {}
  
  public void onCompleted(int paramInt1, int paramInt2, long paramLong)
  {
    AdHandle localAdHandle = new AdHandle(paramInt2, paramLong);
    String str = ContentLoader.access$300(this$0).getUrl(paramInt1);
    ContentLoader.access$400(this$0).addContent(str, localAdHandle);
    ContentLoader.access$300(this$0).markContentResolved(paramInt1);
    if (ContentLoader.access$300(this$0).hasFinishedLoading()) {
      ContentLoader.access$500(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.AD_BREAK_MANIFEST_LOAD_COMPLETE));
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentLoader.ContentLoadCompleteListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */