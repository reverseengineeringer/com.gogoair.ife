package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.graphics.drawable.DrawableUtils;
import android.util.AttributeSet;
import android.view.View;

class AppCompatBackgroundHelper
{
  private TintInfo mBackgroundTint;
  private TintInfo mInternalBackgroundTint;
  private final TintManager mTintManager;
  private final View mView;
  
  AppCompatBackgroundHelper(View paramView, TintManager paramTintManager)
  {
    mView = paramView;
    mTintManager = paramTintManager;
  }
  
  void applySupportBackgroundTint()
  {
    Drawable localDrawable = mView.getBackground();
    if (localDrawable != null)
    {
      if (mBackgroundTint == null) {
        break label35;
      }
      TintManager.tintDrawable(localDrawable, mBackgroundTint, mView.getDrawableState());
    }
    label35:
    while (mInternalBackgroundTint == null) {
      return;
    }
    TintManager.tintDrawable(localDrawable, mInternalBackgroundTint, mView.getDrawableState());
  }
  
  ColorStateList getSupportBackgroundTintList()
  {
    if (mBackgroundTint != null) {
      return mBackgroundTint.mTintList;
    }
    return null;
  }
  
  PorterDuff.Mode getSupportBackgroundTintMode()
  {
    if (mBackgroundTint != null) {
      return mBackgroundTint.mTintMode;
    }
    return null;
  }
  
  void loadFromAttributes(AttributeSet paramAttributeSet, int paramInt)
  {
    paramAttributeSet = mView.getContext().obtainStyledAttributes(paramAttributeSet, R.styleable.ViewBackgroundHelper, paramInt, 0);
    try
    {
      if (paramAttributeSet.hasValue(R.styleable.ViewBackgroundHelper_android_background))
      {
        ColorStateList localColorStateList = mTintManager.getTintList(paramAttributeSet.getResourceId(R.styleable.ViewBackgroundHelper_android_background, -1));
        if (localColorStateList != null) {
          setInternalBackgroundTint(localColorStateList);
        }
      }
      if (paramAttributeSet.hasValue(R.styleable.ViewBackgroundHelper_backgroundTint)) {
        ViewCompat.setBackgroundTintList(mView, paramAttributeSet.getColorStateList(R.styleable.ViewBackgroundHelper_backgroundTint));
      }
      if (paramAttributeSet.hasValue(R.styleable.ViewBackgroundHelper_backgroundTintMode)) {
        ViewCompat.setBackgroundTintMode(mView, DrawableUtils.parseTintMode(paramAttributeSet.getInt(R.styleable.ViewBackgroundHelper_backgroundTintMode, -1), null));
      }
      return;
    }
    finally
    {
      paramAttributeSet.recycle();
    }
  }
  
  void onSetBackgroundDrawable(Drawable paramDrawable)
  {
    setInternalBackgroundTint(null);
  }
  
  void onSetBackgroundResource(int paramInt)
  {
    if (mTintManager != null) {}
    for (ColorStateList localColorStateList = mTintManager.getTintList(paramInt);; localColorStateList = null)
    {
      setInternalBackgroundTint(localColorStateList);
      return;
    }
  }
  
  void setInternalBackgroundTint(ColorStateList paramColorStateList)
  {
    if (paramColorStateList != null)
    {
      if (mInternalBackgroundTint == null) {
        mInternalBackgroundTint = new TintInfo();
      }
      mInternalBackgroundTint.mTintList = paramColorStateList;
      mInternalBackgroundTint.mHasTintList = true;
    }
    for (;;)
    {
      applySupportBackgroundTint();
      return;
      mInternalBackgroundTint = null;
    }
  }
  
  void setSupportBackgroundTintList(ColorStateList paramColorStateList)
  {
    if (mBackgroundTint == null) {
      mBackgroundTint = new TintInfo();
    }
    mBackgroundTint.mTintList = paramColorStateList;
    mBackgroundTint.mHasTintList = true;
    applySupportBackgroundTint();
  }
  
  void setSupportBackgroundTintMode(PorterDuff.Mode paramMode)
  {
    if (mBackgroundTint == null) {
      mBackgroundTint = new TintInfo();
    }
    mBackgroundTint.mTintMode = paramMode;
    mBackgroundTint.mHasTintMode = true;
    applySupportBackgroundTint();
  }
}

/* Location:
 * Qualified Name:     android.support.v7.widget.AppCompatBackgroundHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */