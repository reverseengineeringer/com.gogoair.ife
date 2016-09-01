package com.adobe.mediacore.timeline.advertising;

public enum AdPolicyMode
{
  PLAY("play"),  SEEK("seek"),  TRICK_PLAY("trick_play");
  
  private String _action;
  
  private AdPolicyMode(String paramString1)
  {
    _action = paramString1;
  }
  
  public String getAction()
  {
    return _action;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.AdPolicyMode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */