package android.support.v7.widget;

import android.content.Context;
import android.support.v7.appcompat.R.attr;
import android.util.AttributeSet;
import android.widget.SeekBar;

public class AppCompatSeekBar
  extends SeekBar
{
  private AppCompatSeekBarHelper mAppCompatSeekBarHelper;
  private TintManager mTintManager;
  
  public AppCompatSeekBar(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AppCompatSeekBar(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.seekBarStyle);
  }
  
  public AppCompatSeekBar(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    mTintManager = TintManager.get(paramContext);
    mAppCompatSeekBarHelper = new AppCompatSeekBarHelper(this, mTintManager);
    mAppCompatSeekBarHelper.loadFromAttributes(paramAttributeSet, paramInt);
  }
}

/* Location:
 * Qualified Name:     android.support.v7.widget.AppCompatSeekBar
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */