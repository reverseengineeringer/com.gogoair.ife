package android.support.v4.app;

import android.app.Activity;
import android.app.SharedElementCallback;
import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.media.session.MediaController;
import android.os.Parcelable;
import android.view.View;
import java.util.List;
import java.util.Map;

class ActivityCompat21
{
  private static SharedElementCallback createCallback(SharedElementCallback21 paramSharedElementCallback21)
  {
    SharedElementCallbackImpl localSharedElementCallbackImpl = null;
    if (paramSharedElementCallback21 != null) {
      localSharedElementCallbackImpl = new SharedElementCallbackImpl(paramSharedElementCallback21);
    }
    return localSharedElementCallbackImpl;
  }
  
  public static void finishAfterTransition(Activity paramActivity)
  {
    paramActivity.finishAfterTransition();
  }
  
  public static void postponeEnterTransition(Activity paramActivity)
  {
    paramActivity.postponeEnterTransition();
  }
  
  public static void setEnterSharedElementCallback(Activity paramActivity, SharedElementCallback21 paramSharedElementCallback21)
  {
    paramActivity.setEnterSharedElementCallback(createCallback(paramSharedElementCallback21));
  }
  
  public static void setExitSharedElementCallback(Activity paramActivity, SharedElementCallback21 paramSharedElementCallback21)
  {
    paramActivity.setExitSharedElementCallback(createCallback(paramSharedElementCallback21));
  }
  
  public static void setMediaController(Activity paramActivity, Object paramObject)
  {
    paramActivity.setMediaController((MediaController)paramObject);
  }
  
  public static void startPostponedEnterTransition(Activity paramActivity)
  {
    paramActivity.startPostponedEnterTransition();
  }
  
  public static abstract class SharedElementCallback21
  {
    public abstract Parcelable onCaptureSharedElementSnapshot(View paramView, Matrix paramMatrix, RectF paramRectF);
    
    public abstract View onCreateSnapshotView(Context paramContext, Parcelable paramParcelable);
    
    public abstract void onMapSharedElements(List paramList, Map paramMap);
    
    public abstract void onRejectSharedElements(List paramList);
    
    public abstract void onSharedElementEnd(List paramList1, List paramList2, List paramList3);
    
    public abstract void onSharedElementStart(List paramList1, List paramList2, List paramList3);
  }
  
  private static class SharedElementCallbackImpl
    extends SharedElementCallback
  {
    private ActivityCompat21.SharedElementCallback21 mCallback;
    
    public SharedElementCallbackImpl(ActivityCompat21.SharedElementCallback21 paramSharedElementCallback21)
    {
      mCallback = paramSharedElementCallback21;
    }
    
    public Parcelable onCaptureSharedElementSnapshot(View paramView, Matrix paramMatrix, RectF paramRectF)
    {
      return mCallback.onCaptureSharedElementSnapshot(paramView, paramMatrix, paramRectF);
    }
    
    public View onCreateSnapshotView(Context paramContext, Parcelable paramParcelable)
    {
      return mCallback.onCreateSnapshotView(paramContext, paramParcelable);
    }
    
    public void onMapSharedElements(List paramList, Map paramMap)
    {
      mCallback.onMapSharedElements(paramList, paramMap);
    }
    
    public void onRejectSharedElements(List paramList)
    {
      mCallback.onRejectSharedElements(paramList);
    }
    
    public void onSharedElementEnd(List paramList1, List paramList2, List paramList3)
    {
      mCallback.onSharedElementEnd(paramList1, paramList2, paramList3);
    }
    
    public void onSharedElementStart(List paramList1, List paramList2, List paramList3)
    {
      mCallback.onSharedElementStart(paramList1, paramList2, paramList3);
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v4.app.ActivityCompat21
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */