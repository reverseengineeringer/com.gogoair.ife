package com.adobe.mediacore;

final class SeekOperation
  implements PlayerOperation
{
  private final VideoEngineTimeline.TimeMapping _desiredTimeMappingPosition;
  private VideoEngineAdapter _videoEngineAdapter;
  
  protected SeekOperation(VideoEngineTimeline.TimeMapping paramTimeMapping)
  {
    _desiredTimeMappingPosition = paramTimeMapping;
  }
  
  public void execute()
  {
    if (_videoEngineAdapter == null) {
      throw new IllegalArgumentException("Player operation does not a have a VideoEngineAdapter set");
    }
    _videoEngineAdapter.seek(_desiredTimeMappingPosition);
  }
  
  public void setVideoEngineAdapter(VideoEngineAdapter paramVideoEngineAdapter)
  {
    _videoEngineAdapter = paramVideoEngineAdapter;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.SeekOperation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */