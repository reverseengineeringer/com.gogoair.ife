package android.support.v4.content;

import android.content.Context;
import android.os.Handler;
import android.os.SystemClock;
import android.support.v4.os.OperationCanceledException;
import android.support.v4.util.TimeUtils;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executor;

public abstract class AsyncTaskLoader
  extends Loader
{
  static final boolean DEBUG = false;
  static final String TAG = "AsyncTaskLoader";
  volatile LoadTask mCancellingTask;
  private final Executor mExecutor;
  Handler mHandler;
  long mLastLoadCompleteTime = -10000L;
  volatile LoadTask mTask;
  long mUpdateThrottle;
  
  public AsyncTaskLoader(Context paramContext)
  {
    this(paramContext, ModernAsyncTask.THREAD_POOL_EXECUTOR);
  }
  
  private AsyncTaskLoader(Context paramContext, Executor paramExecutor)
  {
    super(paramContext);
    mExecutor = paramExecutor;
  }
  
  public void cancelLoadInBackground() {}
  
  void dispatchOnCancelled(LoadTask paramLoadTask, Object paramObject)
  {
    onCanceled(paramObject);
    if (mCancellingTask == paramLoadTask)
    {
      rollbackContentChanged();
      mLastLoadCompleteTime = SystemClock.uptimeMillis();
      mCancellingTask = null;
      deliverCancellation();
      executePendingTask();
    }
  }
  
  void dispatchOnLoadComplete(LoadTask paramLoadTask, Object paramObject)
  {
    if (mTask != paramLoadTask)
    {
      dispatchOnCancelled(paramLoadTask, paramObject);
      return;
    }
    if (isAbandoned())
    {
      onCanceled(paramObject);
      return;
    }
    commitContentChanged();
    mLastLoadCompleteTime = SystemClock.uptimeMillis();
    mTask = null;
    deliverResult(paramObject);
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    super.dump(paramString, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
    if (mTask != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("mTask=");
      paramPrintWriter.print(mTask);
      paramPrintWriter.print(" waiting=");
      paramPrintWriter.println(mTask.waiting);
    }
    if (mCancellingTask != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("mCancellingTask=");
      paramPrintWriter.print(mCancellingTask);
      paramPrintWriter.print(" waiting=");
      paramPrintWriter.println(mCancellingTask.waiting);
    }
    if (mUpdateThrottle != 0L)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("mUpdateThrottle=");
      TimeUtils.formatDuration(mUpdateThrottle, paramPrintWriter);
      paramPrintWriter.print(" mLastLoadCompleteTime=");
      TimeUtils.formatDuration(mLastLoadCompleteTime, SystemClock.uptimeMillis(), paramPrintWriter);
      paramPrintWriter.println();
    }
  }
  
  void executePendingTask()
  {
    if ((mCancellingTask == null) && (mTask != null))
    {
      if (mTask.waiting)
      {
        mTask.waiting = false;
        mHandler.removeCallbacks(mTask);
      }
      if ((mUpdateThrottle > 0L) && (SystemClock.uptimeMillis() < mLastLoadCompleteTime + mUpdateThrottle))
      {
        mTask.waiting = true;
        mHandler.postAtTime(mTask, mLastLoadCompleteTime + mUpdateThrottle);
      }
    }
    else
    {
      return;
    }
    mTask.executeOnExecutor(mExecutor, (Void[])null);
  }
  
  public boolean isLoadInBackgroundCanceled()
  {
    return mCancellingTask != null;
  }
  
  public abstract Object loadInBackground();
  
  protected boolean onCancelLoad()
  {
    if (mTask != null)
    {
      if (mCancellingTask != null)
      {
        if (mTask.waiting)
        {
          mTask.waiting = false;
          mHandler.removeCallbacks(mTask);
        }
        mTask = null;
      }
    }
    else {
      return false;
    }
    if (mTask.waiting)
    {
      mTask.waiting = false;
      mHandler.removeCallbacks(mTask);
      mTask = null;
      return false;
    }
    boolean bool = mTask.cancel(false);
    if (bool)
    {
      mCancellingTask = mTask;
      cancelLoadInBackground();
    }
    mTask = null;
    return bool;
  }
  
  public void onCanceled(Object paramObject) {}
  
  protected void onForceLoad()
  {
    super.onForceLoad();
    cancelLoad();
    mTask = new LoadTask();
    executePendingTask();
  }
  
  protected Object onLoadInBackground()
  {
    return loadInBackground();
  }
  
  public void setUpdateThrottle(long paramLong)
  {
    mUpdateThrottle = paramLong;
    if (paramLong != 0L) {
      mHandler = new Handler();
    }
  }
  
  public void waitForLoader()
  {
    LoadTask localLoadTask = mTask;
    if (localLoadTask != null) {
      localLoadTask.waitForLoader();
    }
  }
  
  final class LoadTask
    extends ModernAsyncTask
    implements Runnable
  {
    private final CountDownLatch mDone = new CountDownLatch(1);
    boolean waiting;
    
    LoadTask() {}
    
    protected Object doInBackground(Void... paramVarArgs)
    {
      try
      {
        paramVarArgs = onLoadInBackground();
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
        dispatchOnCancelled(this, paramObject);
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
        dispatchOnLoadComplete(this, paramObject);
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
      executePendingTask();
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
}

/* Location:
 * Qualified Name:     android.support.v4.content.AsyncTaskLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */