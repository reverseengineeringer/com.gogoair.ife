package android.support.v4.app;

import android.app.SharedElementCallback;
import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.os.Parcelable;
import android.view.View;
import java.util.List;
import java.util.Map;

class ActivityCompat21$SharedElementCallbackImpl
  extends SharedElementCallback
{
  private ActivityCompat21.SharedElementCallback21 mCallback;
  
  public ActivityCompat21$SharedElementCallbackImpl(ActivityCompat21.SharedElementCallback21 paramSharedElementCallback21)
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

/* Location:
 * Qualified Name:     android.support.v4.app.ActivityCompat21.SharedElementCallbackImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */