package com.adobe.mediacore;

public class TrickPlayOperation
  implements PlayerOperation
{
  private float _rate;
  private boolean _removeAds;
  private VideoEngineAdapter _videoEngineAdapter;
  
  public TrickPlayOperation(float paramFloat, boolean paramBoolean)
  {
    _rate = paramFloat;
    _removeAds = paramBoolean;
  }
  
  public void execute()
  {
    if (_videoEngineAdapter == null) {
      throw new IllegalArgumentException("Player operation does not a have a VideoEngineAdapter set");
    }
    _videoEngineAdapter.enableTrickPlay(_rate, _removeAds);
  }
  
  public void setVideoEngineAdapter(VideoEngineAdapter paramVideoEngineAdapter)
  {
    _videoEngineAdapter = paramVideoEngineAdapter;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TrickPlayOperation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */