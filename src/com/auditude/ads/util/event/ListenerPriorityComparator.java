package com.auditude.ads.util.event;

import java.util.Comparator;

class ListenerPriorityComparator
  implements Comparator
{
  public int compare(EventListenerHolder paramEventListenerHolder1, EventListenerHolder paramEventListenerHolder2)
  {
    if (priority > priority) {
      return -1;
    }
    if (priority < priority) {
      return 1;
    }
    return 0;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.event.ListenerPriorityComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */