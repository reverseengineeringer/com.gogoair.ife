package android.support.v4.app;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.os.Parcelable;
import android.view.View;
import java.util.List;
import java.util.Map;

public abstract class ActivityCompat21$SharedElementCallback21
{
  public abstract Parcelable onCaptureSharedElementSnapshot(View paramView, Matrix paramMatrix, RectF paramRectF);
  
  public abstract View onCreateSnapshotView(Context paramContext, Parcelable paramParcelable);
  
  public abstract void onMapSharedElements(List paramList, Map paramMap);
  
  public abstract void onRejectSharedElements(List paramList);
  
  public abstract void onSharedElementEnd(List paramList1, List paramList2, List paramList3);
  
  public abstract void onSharedElementStart(List paramList1, List paramList2, List paramList3);
}

/* Location:
 * Qualified Name:     android.support.v4.app.ActivityCompat21.SharedElementCallback21
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */