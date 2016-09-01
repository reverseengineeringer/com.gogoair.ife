package android.support.v4.app;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.View;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import java.util.List;
import java.util.Map;

public abstract class SharedElementCallback
{
  private static final String BUNDLE_SNAPSHOT_BITMAP = "sharedElement:snapshot:bitmap";
  private static final String BUNDLE_SNAPSHOT_IMAGE_MATRIX = "sharedElement:snapshot:imageMatrix";
  private static final String BUNDLE_SNAPSHOT_IMAGE_SCALETYPE = "sharedElement:snapshot:imageScaleType";
  private static int MAX_IMAGE_SIZE = 1048576;
  private Matrix mTempMatrix;
  
  private static Bitmap createDrawableBitmap(Drawable paramDrawable)
  {
    int i = paramDrawable.getIntrinsicWidth();
    int j = paramDrawable.getIntrinsicHeight();
    if ((i <= 0) || (j <= 0)) {
      return null;
    }
    float f = Math.min(1.0F, MAX_IMAGE_SIZE / (i * j));
    if (((paramDrawable instanceof BitmapDrawable)) && (f == 1.0F)) {
      return ((BitmapDrawable)paramDrawable).getBitmap();
    }
    i = (int)(i * f);
    j = (int)(j * f);
    Bitmap localBitmap = Bitmap.createBitmap(i, j, Bitmap.Config.ARGB_8888);
    Canvas localCanvas = new Canvas(localBitmap);
    Rect localRect = paramDrawable.getBounds();
    int k = left;
    int m = top;
    int n = right;
    int i1 = bottom;
    paramDrawable.setBounds(0, 0, i, j);
    paramDrawable.draw(localCanvas);
    paramDrawable.setBounds(k, m, n, i1);
    return localBitmap;
  }
  
  public Parcelable onCaptureSharedElementSnapshot(View paramView, Matrix paramMatrix, RectF paramRectF)
  {
    ImageView localImageView;
    Object localObject1;
    if ((paramView instanceof ImageView))
    {
      localImageView = (ImageView)paramView;
      localObject1 = localImageView.getDrawable();
      Object localObject2 = localImageView.getBackground();
      if ((localObject1 != null) && (localObject2 == null))
      {
        localObject2 = createDrawableBitmap((Drawable)localObject1);
        if (localObject2 != null)
        {
          localObject1 = new Bundle();
          ((Bundle)localObject1).putParcelable("sharedElement:snapshot:bitmap", (Parcelable)localObject2);
          ((Bundle)localObject1).putString("sharedElement:snapshot:imageScaleType", localImageView.getScaleType().toString());
          if (localImageView.getScaleType() == ImageView.ScaleType.MATRIX)
          {
            paramView = localImageView.getImageMatrix();
            paramMatrix = new float[9];
            paramView.getValues(paramMatrix);
            ((Bundle)localObject1).putFloatArray("sharedElement:snapshot:imageMatrix", paramMatrix);
          }
        }
      }
    }
    do
    {
      do
      {
        return (Parcelable)localObject1;
        j = Math.round(paramRectF.width());
        i = Math.round(paramRectF.height());
        localImageView = null;
        localObject1 = localImageView;
      } while (j <= 0);
      localObject1 = localImageView;
    } while (i <= 0);
    float f = Math.min(1.0F, MAX_IMAGE_SIZE / (j * i));
    int j = (int)(j * f);
    int i = (int)(i * f);
    if (mTempMatrix == null) {
      mTempMatrix = new Matrix();
    }
    mTempMatrix.set(paramMatrix);
    mTempMatrix.postTranslate(-left, -top);
    mTempMatrix.postScale(f, f);
    paramMatrix = Bitmap.createBitmap(j, i, Bitmap.Config.ARGB_8888);
    paramRectF = new Canvas(paramMatrix);
    paramRectF.concat(mTempMatrix);
    paramView.draw(paramRectF);
    return paramMatrix;
  }
  
  public View onCreateSnapshotView(Context paramContext, Parcelable paramParcelable)
  {
    if ((paramParcelable instanceof Bundle))
    {
      paramParcelable = (Bundle)paramParcelable;
      Object localObject = (Bitmap)paramParcelable.getParcelable("sharedElement:snapshot:bitmap");
      if (localObject == null) {
        return null;
      }
      paramContext = new ImageView(paramContext);
      paramContext.setImageBitmap((Bitmap)localObject);
      paramContext.setScaleType(ImageView.ScaleType.valueOf(paramParcelable.getString("sharedElement:snapshot:imageScaleType")));
      if (paramContext.getScaleType() == ImageView.ScaleType.MATRIX)
      {
        paramParcelable = paramParcelable.getFloatArray("sharedElement:snapshot:imageMatrix");
        localObject = new Matrix();
        ((Matrix)localObject).setValues(paramParcelable);
        paramContext.setImageMatrix((Matrix)localObject);
      }
    }
    for (;;)
    {
      return paramContext;
      if ((paramParcelable instanceof Bitmap))
      {
        paramParcelable = (Bitmap)paramParcelable;
        paramContext = new ImageView(paramContext);
        paramContext.setImageBitmap(paramParcelable);
      }
      else
      {
        paramContext = null;
      }
    }
  }
  
  public void onMapSharedElements(List paramList, Map paramMap) {}
  
  public void onRejectSharedElements(List paramList) {}
  
  public void onSharedElementEnd(List paramList1, List paramList2, List paramList3) {}
  
  public void onSharedElementStart(List paramList1, List paramList2, List paramList3) {}
}

/* Location:
 * Qualified Name:     android.support.v4.app.SharedElementCallback
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */