package android.support.v4.util;

public class Pools$SynchronizedPool
  extends Pools.SimplePool
{
  private final Object mLock = new Object();
  
  public Pools$SynchronizedPool(int paramInt)
  {
    super(paramInt);
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

/* Location:
 * Qualified Name:     android.support.v4.util.Pools.SynchronizedPool
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */