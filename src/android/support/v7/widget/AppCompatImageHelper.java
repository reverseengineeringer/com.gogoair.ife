package android.support.v7.widget;

import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.widget.ImageView;

class AppCompatImageHelper
{
  private static final int[] VIEW_ATTRS = { 16843033 };
  private final TintManager mTintManager;
  private final ImageView mView;
  
  AppCompatImageHelper(ImageView paramImageView, TintManager paramTintManager)
  {
    mView = paramImageView;
    mTintManager = paramTintManager;
  }
  
  void loadFromAttributes(AttributeSet paramAttributeSet, int paramInt)
  {
    paramAttributeSet = TintTypedArray.obtainStyledAttributes(mView.getContext(), paramAttributeSet, VIEW_ATTRS, paramInt, 0);
    try
    {
      if (paramAttributeSet.hasValue(0)) {
        mView.setImageDrawable(paramAttributeSet.getDrawable(0));
      }
      return;
    }
    finally
    {
      paramAttributeSet.recycle();
    }
  }
  
  void setImageResource(int paramInt)
  {
    if (paramInt != 0)
    {
      ImageView localImageView = mView;
      if (mTintManager != null) {}
      for (Drawable localDrawable = mTintManager.getDrawable(paramInt);; localDrawable = ContextCompat.getDrawable(mView.getContext(), paramInt))
      {
        localImageView.setImageDrawable(localDrawable);
        return;
      }
    }
    mView.setImageDrawable(null);
  }
}

/* Location:
 * Qualified Name:     android.support.v7.widget.AppCompatImageHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */