package com.adobe.primetime.core.radio;

import com.adobe.primetime.core.ICallback;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class CommandQueue
{
  private final long _delay;
  private boolean _drainInProgress = false;
  private final ExecutorService _executorService;
  private boolean _isSuspended = false;
  private List _queue = new ArrayList();
  
  public CommandQueue()
  {
    this(0L, false);
  }
  
  public CommandQueue(long paramLong, boolean paramBoolean)
  {
    _delay = paramLong;
    _isSuspended = paramBoolean;
    _executorService = Executors.newSingleThreadExecutor();
  }
  
  public CommandQueue(boolean paramBoolean)
  {
    this(0L, paramBoolean);
  }
  
  private void __drain()
  {
    if (_queue.size() == 0)
    {
      _drainInProgress = false;
      return;
    }
    Command localCommand = (Command)_queue.get(0);
    _queue.remove(0);
    _runCommand(localCommand, new CommandQueue.1(this));
  }
  
  private void _drain()
  {
    if (_isSuspended) {}
    while (_drainInProgress) {
      return;
    }
    _drainInProgress = true;
    __drain();
  }
  
  private void _runCommand(Command paramCommand, ICallback paramICallback)
  {
    try
    {
      if (_delay != 0L) {
        _executorService.submit(new CommandQueue.2(this));
      }
      _executorService.submit(paramCommand);
      if (paramICallback != null) {
        paramICallback.call(null);
      }
      return;
    }
    finally {}
  }
  
  public void addCommand(Command paramCommand)
  {
    try
    {
      _queue.add(paramCommand);
      _drain();
      return;
    }
    finally
    {
      paramCommand = finally;
      throw paramCommand;
    }
  }
  
  public void cancelAllCommands()
  {
    try
    {
      _queue.clear();
      destroy();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void destroy()
  {
    try
    {
      _executorService.shutdownNow();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean isEmpty()
  {
    try
    {
      boolean bool = _queue.isEmpty();
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean isSuspended()
  {
    try
    {
      boolean bool = _isSuspended;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void resume()
  {
    try
    {
      _isSuspended = false;
      _drain();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void suspend()
  {
    try
    {
      _isSuspended = true;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.radio.CommandQueue
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */