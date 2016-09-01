package com.adobe.mediacore;

final class PauseOperation
  implements PlayerOperation
{
  private VideoEngineAdapter _videoEngineAdapter;
  
  public void execute()
  {
    if (_videoEngineAdapter == null) {
      throw new IllegalArgumentException("Player operation does not a have a VideoEngineAdapter set");
    }
    _videoEngineAdapter.pause();
  }
  
  public void setVideoEngineAdapter(VideoEngineAdapter paramVideoEngineAdapter)
  {
    _videoEngineAdapter = paramVideoEngineAdapter;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.PauseOperation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */