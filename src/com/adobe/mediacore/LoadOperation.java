package com.adobe.mediacore;

final class LoadOperation
  implements PlayerOperation
{
  private final int _contentId;
  private final MediaResource _mediaResource;
  private VideoEngineAdapter _videoEngineAdapter;
  
  public LoadOperation(MediaResource paramMediaResource, int paramInt)
  {
    _mediaResource = paramMediaResource;
    _contentId = paramInt;
  }
  
  public void execute()
  {
    if (_videoEngineAdapter == null) {
      throw new IllegalArgumentException("Player operation does not a have a VideoEngineAdapter set");
    }
    if (_videoEngineAdapter.getBufferControlParameters() == null) {
      _videoEngineAdapter.setBufferControlParameters(VideoEngineAdapter.getDefaultBufferingParameters());
    }
    _videoEngineAdapter.load(_mediaResource, _contentId);
  }
  
  public void setVideoEngineAdapter(VideoEngineAdapter paramVideoEngineAdapter)
  {
    _videoEngineAdapter = paramVideoEngineAdapter;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.LoadOperation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */