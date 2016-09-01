package com.gogoair.ife.utils;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.widget.ImageView;

public class GVDynamicHeightImageView
  extends ImageView
{
  public GVDynamicHeightImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    Drawable localDrawable = getDrawable();
    if (localDrawable != null)
    {
      paramInt1 = View.MeasureSpec.getSize(paramInt1);
      setMeasuredDimension(paramInt1, (int)Math.ceil(paramInt1 * localDrawable.getIntrinsicHeight() / localDrawable.getIntrinsicWidth()));
      return;
    }
    super.onMeasure(paramInt1, paramInt2);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.GVDynamicHeightImageView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */