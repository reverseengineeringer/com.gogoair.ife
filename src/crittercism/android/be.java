package crittercism.android;

import com.crittercism.app.Transaction;

public final class be
  extends Transaction
{
  public be()
  {
    dy.c("Creating no-op transaction");
  }
  
  public final void a()
  {
    dy.b("No-op transaction. Ignoring Transaction.start() call.", new IllegalStateException("No-op transaction"));
  }
  
  public final void a(int paramInt)
  {
    dy.b("No-op transaction. Ignoring Transaction.setValue(double) call.", new IllegalStateException("No-op transaction"));
  }
  
  public final void b()
  {
    dy.b("No-op transaction. Ignoring Transaction.stop() call.", new IllegalStateException("No-op transaction"));
  }
  
  public final void c()
  {
    dy.b("No-op transaction. Ignoring Transaction.fail() call.", new IllegalStateException("No-op transaction"));
  }
  
  public final int d()
  {
    dy.b("No-op transaction. Ignoring Transaction.getValue() call.", new IllegalStateException("No-op transaction"));
    return -1;
  }
}

/* Location:
 * Qualified Name:     crittercism.android.be
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */