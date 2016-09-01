package android.support.v7.widget;

import android.content.Context;
import android.support.annotation.DrawableRes;
import android.util.AttributeSet;
import android.widget.CheckedTextView;

public class AppCompatCheckedTextView
  extends CheckedTextView
{
  private static final int[] TINT_ATTRS = { 16843016 };
  private AppCompatTextHelper mTextHelper = AppCompatTextHelper.create(this);
  private TintManager mTintManager;
  
  public AppCompatCheckedTextView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AppCompatCheckedTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16843720);
  }
  
  public AppCompatCheckedTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    mTextHelper.loadFromAttributes(paramAttributeSet, paramInt);
    mTextHelper.applyCompoundDrawablesTints();
    if (TintManager.SHOULD_BE_USED)
    {
      paramContext = TintTypedArray.obtainStyledAttributes(getContext(), paramAttributeSet, TINT_ATTRS, paramInt, 0);
      setCheckMarkDrawable(paramContext.getDrawable(0));
      paramContext.recycle();
      mTintManager = paramContext.getTintManager();
    }
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    if (mTextHelper != null) {
      mTextHelper.applyCompoundDrawablesTints();
    }
  }
  
  public void setCheckMarkDrawable(@DrawableRes int paramInt)
  {
    if (mTintManager != null)
    {
      setCheckMarkDrawable(mTintManager.getDrawable(paramInt));
      return;
    }
    super.setCheckMarkDrawable(paramInt);
  }
  
  public void setTextAppearance(Context paramContext, int paramInt)
  {
    super.setTextAppearance(paramContext, paramInt);
    if (mTextHelper != null) {
      mTextHelper.onSetTextAppearance(paramContext, paramInt);
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v7.widget.AppCompatCheckedTextView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */