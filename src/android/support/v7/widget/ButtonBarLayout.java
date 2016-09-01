package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v7.appcompat.R.id;
import android.support.v7.appcompat.R.styleable;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.widget.LinearLayout;

public class ButtonBarLayout
  extends LinearLayout
{
  private boolean mAllowStacking;
  private int mLastWidthSize = -1;
  
  public ButtonBarLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ButtonBarLayout);
    mAllowStacking = paramContext.getBoolean(R.styleable.ButtonBarLayout_allowStacking, false);
    paramContext.recycle();
  }
  
  private boolean isStacked()
  {
    return getOrientation() == 1;
  }
  
  private void setStacked(boolean paramBoolean)
  {
    label17:
    View localView;
    if (paramBoolean)
    {
      i = 1;
      setOrientation(i);
      if (!paramBoolean) {
        break label78;
      }
      i = 5;
      setGravity(i);
      localView = findViewById(R.id.spacer);
      if (localView != null) {
        if (!paramBoolean) {
          break label84;
        }
      }
    }
    label78:
    label84:
    for (int i = 8;; i = 4)
    {
      localView.setVisibility(i);
      i = getChildCount() - 2;
      while (i >= 0)
      {
        bringChildToFront(getChildAt(i));
        i -= 1;
      }
      i = 0;
      break;
      i = 80;
      break label17;
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = View.MeasureSpec.getSize(paramInt1);
    if (mAllowStacking)
    {
      if ((i > mLastWidthSize) && (isStacked())) {
        setStacked(false);
      }
      mLastWidthSize = i;
    }
    int j;
    if ((!isStacked()) && (View.MeasureSpec.getMode(paramInt1) == 1073741824))
    {
      j = View.MeasureSpec.makeMeasureSpec(i, Integer.MIN_VALUE);
      i = 1;
    }
    for (;;)
    {
      super.onMeasure(j, paramInt2);
      j = i;
      if (mAllowStacking)
      {
        j = i;
        if (!isStacked())
        {
          j = i;
          if ((getMeasuredWidthAndState() & 0xFF000000) == 16777216)
          {
            setStacked(true);
            j = 1;
          }
        }
      }
      if (j != 0) {
        super.onMeasure(paramInt1, paramInt2);
      }
      return;
      i = 0;
      j = paramInt1;
    }
  }
  
  public void setAllowStacking(boolean paramBoolean)
  {
    if (mAllowStacking != paramBoolean)
    {
      mAllowStacking = paramBoolean;
      if ((!mAllowStacking) && (getOrientation() == 1)) {
        setStacked(false);
      }
      requestLayout();
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v7.widget.ButtonBarLayout
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */