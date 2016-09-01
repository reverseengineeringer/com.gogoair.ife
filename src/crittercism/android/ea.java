package crittercism.android;

import java.util.concurrent.ThreadFactory;

public final class ea
  implements ThreadFactory
{
  public final Thread newThread(Runnable paramRunnable)
  {
    return new dz(paramRunnable);
  }
}

/* Location:
 * Qualified Name:     crittercism.android.ea
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */