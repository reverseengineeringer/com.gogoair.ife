package android.support.v4.os;

import android.os.AsyncTask;

class AsyncTaskCompatHoneycomb
{
  static void executeParallel(AsyncTask paramAsyncTask, Object... paramVarArgs)
  {
    paramAsyncTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, paramVarArgs);
  }
}

/* Location:
 * Qualified Name:     android.support.v4.os.AsyncTaskCompatHoneycomb
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */