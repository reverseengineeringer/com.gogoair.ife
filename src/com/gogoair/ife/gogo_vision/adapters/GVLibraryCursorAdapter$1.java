package com.gogoair.ife.gogo_vision.adapters;

import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.ImageView;

class GVLibraryCursorAdapter$1
  implements ViewTreeObserver.OnGlobalLayoutListener
{
  GVLibraryCursorAdapter$1(GVLibraryCursorAdapter paramGVLibraryCursorAdapter, ImageView paramImageView, int paramInt1, int paramInt2, View paramView) {}
  
  public void onGlobalLayout()
  {
    long l = val$progressView.getMeasuredWidth() * val$playbackPosition / val$duration;
    val$view.findViewById(2131427424)).getLayoutParams().width = ((int)l);
    val$progressView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
    val$progressView.invalidate();
    val$progressView.requestLayout();
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.gogo_vision.adapters.GVLibraryCursorAdapter.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */