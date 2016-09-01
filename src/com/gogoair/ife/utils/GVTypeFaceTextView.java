package com.gogoair.ife.utils;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.TextView;

public class GVTypeFaceTextView
  extends TextView
{
  public GVTypeFaceTextView(Context paramContext)
  {
    super(paramContext);
    applyCustomFont(paramContext);
  }
  
  public GVTypeFaceTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    applyCustomFont(paramContext);
  }
  
  public GVTypeFaceTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    applyCustomFont(paramContext);
  }
  
  private void applyCustomFont(Context paramContext)
  {
    setTypeface(Typeface.createFromAsset(paramContext.getAssets(), "DINOffcPro-Light.otf"));
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.GVTypeFaceTextView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */