package com.adobe.primetime.va;

import com.adobe.primetime.core.plugin.IPlugin;
import java.util.Comparator;

class Heartbeat$1
  implements Comparator
{
  Heartbeat$1(Heartbeat paramHeartbeat) {}
  
  public int compare(IPlugin paramIPlugin1, IPlugin paramIPlugin2)
  {
    if ((paramIPlugin1.getName().equals("adobe-heartbeat")) && (paramIPlugin2.getName().equals("adobe-analytics"))) {}
    do
    {
      do
      {
        return -1;
      } while ((paramIPlugin1.getName().equals("adobe-heartbeat")) && (paramIPlugin2.getName().equals("player")));
      if ((paramIPlugin1.getName().equals("adobe-analytics")) && (paramIPlugin2.getName().equals("adobe-heartbeat"))) {
        return 1;
      }
    } while ((paramIPlugin1.getName().equals("adobe-analytics")) && (paramIPlugin2.getName().equals("player")));
    if ((paramIPlugin1.getName().equals("player")) && (paramIPlugin2.getName().equals("adobe-heartbeat"))) {
      return 1;
    }
    if ((paramIPlugin1.getName().equals("player")) && (paramIPlugin2.getName().equals("adobe-analytics"))) {
      return 1;
    }
    return 0;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.Heartbeat.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */