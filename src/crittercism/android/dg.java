package crittercism.android;

import android.content.Context;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;

public final class dg
{
  private Context a;
  private List b;
  
  public dg(Context paramContext)
  {
    a = paramContext;
    b = new ArrayList();
  }
  
  public final void a()
  {
    Object localObject = new ArrayList();
    Iterator localIterator = b.iterator();
    while (localIterator.hasNext()) {
      ((ArrayList)localObject).add(new Thread((dj)localIterator.next()));
    }
    localIterator = ((ArrayList)localObject).iterator();
    while (localIterator.hasNext()) {
      ((Thread)localIterator.next()).start();
    }
    localObject = ((ArrayList)localObject).iterator();
    while (((Iterator)localObject).hasNext()) {
      ((Thread)((Iterator)localObject).next()).join();
    }
  }
  
  public final void a(bs parambs, da paramda, String paramString1, String paramString2, String paramString3, au paramau, cy paramcy)
  {
    try
    {
      if (parambs.b() > 0)
      {
        bs localbs = parambs.a(a);
        paramda = paramda.a(localbs, parambs, paramString3, a, paramau);
        parambs = new di(localbs, parambs, paramau, new dc(paramString1, paramString2).a(), paramda, paramcy);
        b.add(parambs);
      }
      return;
    }
    finally
    {
      parambs = finally;
      throw parambs;
    }
  }
  
  public final void a(dh paramdh, ExecutorService paramExecutorService)
  {
    Iterator localIterator = b.iterator();
    while (localIterator.hasNext())
    {
      dj localdj = (dj)localIterator.next();
      if (!paramdh.a(localdj)) {
        paramExecutorService.execute(localdj);
      }
    }
  }
}

/* Location:
 * Qualified Name:     crittercism.android.dg
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */