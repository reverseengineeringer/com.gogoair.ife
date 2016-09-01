package com.adobe.mediacore.session;

import com.adobe.mediacore.MediaPlayerNotification;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class NotificationHistory
{
  private static final int DEFAULT_SIZE = 100;
  private long _index;
  private List _listeners = new ArrayList();
  private List _notifications = new ArrayList();
  private long _size;
  
  public NotificationHistory()
  {
    this(100L);
  }
  
  public NotificationHistory(long paramLong)
  {
    _size = paramLong;
    _index = 0L;
  }
  
  private void dispatchNewItemAddedEvent(Item paramItem)
  {
    Iterator localIterator = _listeners.iterator();
    while (localIterator.hasNext()) {
      ((EventListener)localIterator.next()).onNewItemAdded(paramItem);
    }
  }
  
  public void addListener(EventListener paramEventListener)
  {
    _listeners.add(paramEventListener);
  }
  
  public void addNotification(MediaPlayerNotification paramMediaPlayerNotification)
  {
    if (_notifications.size() >= _size) {
      _notifications.remove(_notifications.size() - 1);
    }
    long l = _index;
    _index = (1L + l);
    paramMediaPlayerNotification = new Item(l, System.currentTimeMillis(), paramMediaPlayerNotification);
    _notifications.add(0, paramMediaPlayerNotification);
    dispatchNewItemAddedEvent(paramMediaPlayerNotification);
  }
  
  public void clear()
  {
    _notifications.clear();
  }
  
  public List getNotifications()
  {
    return Collections.unmodifiableList(_notifications);
  }
  
  public void removeAllListeners()
  {
    _listeners.clear();
  }
  
  public void removeListener(EventListener paramEventListener)
  {
    Iterator localIterator = _listeners.iterator();
    while (localIterator.hasNext()) {
      if (paramEventListener == (EventListener)localIterator.next()) {
        _listeners.remove(paramEventListener);
      }
    }
  }
  
  public void setSize(long paramLong)
  {
    if (paramLong < 1L) {
      throw new IllegalArgumentException("Player session size must a positive integer value.");
    }
    if (paramLong < _size)
    {
      ArrayList localArrayList = new ArrayList();
      int i = 0;
      while (i < paramLong)
      {
        localArrayList.add(_notifications.get(i));
        i += 1;
      }
      _notifications = localArrayList;
    }
    _size = paramLong;
  }
  
  static abstract interface EventListener
  {
    public abstract void onNewItemAdded(NotificationHistory.Item paramItem);
  }
  
  public class Item
  {
    private final long _index;
    private final MediaPlayerNotification _notification;
    private final long _timeStamp;
    
    public Item(long paramLong1, long paramLong2, MediaPlayerNotification paramMediaPlayerNotification)
    {
      _index = paramLong1;
      _timeStamp = paramLong2;
      _notification = paramMediaPlayerNotification;
    }
    
    public long getIndex()
    {
      return _index;
    }
    
    public MediaPlayerNotification getNotification()
    {
      return _notification;
    }
    
    public long getTimeStamp()
    {
      return _timeStamp;
    }
    
    public String toString()
    {
      StringBuffer localStringBuffer = new StringBuffer("{");
      localStringBuffer.append("\"index\":").append(_index).append(",");
      localStringBuffer.append("\"timestamp\":").append(_timeStamp).append(",");
      if (_notification != null) {
        localStringBuffer.append("\"notification\":").append(_notification);
      }
      for (;;)
      {
        return "}";
        localStringBuffer.append("\"notification\":null");
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.session.NotificationHistory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */