package android.support.v4.content;

import android.support.v4.os.OperationCanceledException;
import java.util.concurrent.CountDownLatch;

final class AsyncTaskLoader$LoadTask
  extends ModernAsyncTask
  implements Runnable
{
  private final CountDownLatch mDone = new CountDownLatch(1);
  boolean waiting;
  
  AsyncTaskLoader$LoadTask(AsyncTaskLoader paramAsyncTaskLoader) {}
  
  protected Object doInBackground(Void... paramVarArgs)
  {
    try
    {
      paramVarArgs = this$0.onLoadInBackground();
      return paramVarArgs;
    }
    catch (OperationCanceledException paramVarArgs)
    {
      if (!isCancelled()) {
        throw paramVarArgs;
      }
    }
    return null;
  }
  
  protected void onCancelled(Object paramObject)
  {
    try
    {
      this$0.dispatchOnCancelled(this, paramObject);
      return;
    }
    finally
    {
      mDone.countDown();
    }
  }
  
  protected void onPostExecute(Object paramObject)
  {
    try
    {
      this$0.dispatchOnLoadComplete(this, paramObject);
      return;
    }
    finally
    {
      mDone.countDown();
    }
  }
  
  public void run()
  {
    waiting = false;
    this$0.executePendingTask();
  }
  
  public void waitForLoader()
  {
    try
    {
      mDone.await();
      return;
    }
    catch (InterruptedException localInterruptedException) {}
  }
}

/* Location:
 * Qualified Name:     android.support.v4.content.AsyncTaskLoader.LoadTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */