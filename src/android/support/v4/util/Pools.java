package android.support.v4.util;

public final class Pools
{
  public static abstract interface Pool
  {
    public abstract Object acquire();
    
    public abstract boolean release(Object paramObject);
  }
  
  public static class SimplePool
    implements Pools.Pool
  {
    private final Object[] mPool;
    private int mPoolSize;
    
    public SimplePool(int paramInt)
    {
      if (paramInt <= 0) {
        throw new IllegalArgumentException("The max pool size must be > 0");
      }
      mPool = new Object[paramInt];
    }
    
    private boolean isInPool(Object paramObject)
    {
      boolean bool2 = false;
      int i = 0;
      for (;;)
      {
        boolean bool1 = bool2;
        if (i < mPoolSize)
        {
          if (mPool[i] == paramObject) {
            bool1 = true;
          }
        }
        else {
          return bool1;
        }
        i += 1;
      }
    }
    
    public Object acquire()
    {
      if (mPoolSize > 0)
      {
        int i = mPoolSize - 1;
        Object localObject = mPool[i];
        mPool[i] = null;
        mPoolSize -= 1;
        return localObject;
      }
      return null;
    }
    
    public boolean release(Object paramObject)
    {
      if (isInPool(paramObject)) {
        throw new IllegalStateException("Already in the pool!");
      }
      if (mPoolSize < mPool.length)
      {
        mPool[mPoolSize] = paramObject;
        mPoolSize += 1;
        return true;
      }
      return false;
    }
  }
  
  public static class SynchronizedPool
    extends Pools.SimplePool
  {
    private final Object mLock = new Object();
    
    public SynchronizedPool(int paramInt)
    {
      super();
    }
    
    public Object acquire()
    {
      synchronized (mLock)
      {
        Object localObject2 = super.acquire();
        return localObject2;
      }
    }
    
    public boolean release(Object paramObject)
    {
      synchronized (mLock)
      {
        boolean bool = super.release(paramObject);
        return bool;
      }
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.util.Pools
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */