package com.gogoair.ife.utils;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.TextView;

public class GVIconTextView
  extends TextView
{
  public GVIconTextView(Context paramContext)
  {
    super(paramContext);
    applyCustomFont(paramContext);
  }
  
  public GVIconTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    applyCustomFont(paramContext);
  }
  
  public GVIconTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    applyCustomFont(paramContext);
  }
  
  private void applyCustomFont(Context paramContext)
  {
    setTypeface(Typeface.createFromAsset(paramContext.getAssets(), "FontAwesome.otf"));
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.GVIconTextView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */