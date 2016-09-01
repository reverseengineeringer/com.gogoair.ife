package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.database.DataSetObserver;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.support.v4.view.TintableBackgroundView;
import android.support.v4.view.ViewCompat;
import android.support.v7.appcompat.R.attr;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewTreeObserver;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;

public class AppCompatSpinner
  extends Spinner
  implements TintableBackgroundView
{
  private static final int[] ATTRS_ANDROID_SPINNERMODE;
  private static final boolean IS_AT_LEAST_JB;
  private static final boolean IS_AT_LEAST_M;
  private static final int MAX_ITEMS_MEASURED = 15;
  private static final int MODE_DIALOG = 0;
  private static final int MODE_DROPDOWN = 1;
  private static final int MODE_THEME = -1;
  private static final String TAG = "AppCompatSpinner";
  private AppCompatBackgroundHelper mBackgroundTintHelper;
  private int mDropDownWidth;
  private ListPopupWindow.ForwardingListener mForwardingListener;
  private DropdownPopup mPopup;
  private Context mPopupContext;
  private boolean mPopupSet;
  private SpinnerAdapter mTempAdapter;
  private final Rect mTempRect;
  private TintManager mTintManager;
  
  static
  {
    if (Build.VERSION.SDK_INT >= 23)
    {
      bool = true;
      IS_AT_LEAST_M = bool;
      if (Build.VERSION.SDK_INT < 16) {
        break label45;
      }
    }
    label45:
    for (boolean bool = true;; bool = false)
    {
      IS_AT_LEAST_JB = bool;
      ATTRS_ANDROID_SPINNERMODE = new int[] { 16843505 };
      return;
      bool = false;
      break;
    }
  }
  
  public AppCompatSpinner(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AppCompatSpinner(Context paramContext, int paramInt)
  {
    this(paramContext, null, R.attr.spinnerStyle, paramInt);
  }
  
  public AppCompatSpinner(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.spinnerStyle);
  }
  
  public AppCompatSpinner(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    this(paramContext, paramAttributeSet, paramInt, -1);
  }
  
  public AppCompatSpinner(Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    this(paramContext, paramAttributeSet, paramInt1, paramInt2, null);
  }
  
  /* Error */
  public AppCompatSpinner(Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2, Resources.Theme paramTheme)
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: aload_2
    //   3: iload_3
    //   4: invokespecial 84	android/widget/Spinner:<init>	(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    //   7: aload_0
    //   8: new 86	android/graphics/Rect
    //   11: dup
    //   12: invokespecial 88	android/graphics/Rect:<init>	()V
    //   15: putfield 90	android/support/v7/widget/AppCompatSpinner:mTempRect	Landroid/graphics/Rect;
    //   18: aload_1
    //   19: aload_2
    //   20: getstatic 95	android/support/v7/appcompat/R$styleable:Spinner	[I
    //   23: iload_3
    //   24: iconst_0
    //   25: invokestatic 101	android/support/v7/widget/TintTypedArray:obtainStyledAttributes	(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;
    //   28: astore 9
    //   30: aload_0
    //   31: aload 9
    //   33: invokevirtual 105	android/support/v7/widget/TintTypedArray:getTintManager	()Landroid/support/v7/widget/TintManager;
    //   36: putfield 107	android/support/v7/widget/AppCompatSpinner:mTintManager	Landroid/support/v7/widget/TintManager;
    //   39: aload_0
    //   40: new 109	android/support/v7/widget/AppCompatBackgroundHelper
    //   43: dup
    //   44: aload_0
    //   45: aload_0
    //   46: getfield 107	android/support/v7/widget/AppCompatSpinner:mTintManager	Landroid/support/v7/widget/TintManager;
    //   49: invokespecial 112	android/support/v7/widget/AppCompatBackgroundHelper:<init>	(Landroid/view/View;Landroid/support/v7/widget/TintManager;)V
    //   52: putfield 114	android/support/v7/widget/AppCompatSpinner:mBackgroundTintHelper	Landroid/support/v7/widget/AppCompatBackgroundHelper;
    //   55: aload 5
    //   57: ifnull +238 -> 295
    //   60: aload_0
    //   61: new 116	android/support/v7/view/ContextThemeWrapper
    //   64: dup
    //   65: aload_1
    //   66: aload 5
    //   68: invokespecial 119	android/support/v7/view/ContextThemeWrapper:<init>	(Landroid/content/Context;Landroid/content/res/Resources$Theme;)V
    //   71: putfield 121	android/support/v7/widget/AppCompatSpinner:mPopupContext	Landroid/content/Context;
    //   74: aload_0
    //   75: getfield 121	android/support/v7/widget/AppCompatSpinner:mPopupContext	Landroid/content/Context;
    //   78: ifnull +177 -> 255
    //   81: iload 4
    //   83: istore 7
    //   85: iload 4
    //   87: iconst_m1
    //   88: if_icmpne +69 -> 157
    //   91: getstatic 53	android/os/Build$VERSION:SDK_INT	I
    //   94: bipush 11
    //   96: if_icmplt +308 -> 404
    //   99: aload_1
    //   100: aload_2
    //   101: getstatic 60	android/support/v7/widget/AppCompatSpinner:ATTRS_ANDROID_SPINNERMODE	[I
    //   104: iload_3
    //   105: iconst_0
    //   106: invokevirtual 126	android/content/Context:obtainStyledAttributes	(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;
    //   109: astore 5
    //   111: iload 4
    //   113: istore 6
    //   115: aload 5
    //   117: astore_1
    //   118: aload 5
    //   120: iconst_0
    //   121: invokevirtual 132	android/content/res/TypedArray:hasValue	(I)Z
    //   124: ifeq +15 -> 139
    //   127: aload 5
    //   129: astore_1
    //   130: aload 5
    //   132: iconst_0
    //   133: iconst_0
    //   134: invokevirtual 136	android/content/res/TypedArray:getInt	(II)I
    //   137: istore 6
    //   139: iload 6
    //   141: istore 7
    //   143: aload 5
    //   145: ifnull +12 -> 157
    //   148: aload 5
    //   150: invokevirtual 139	android/content/res/TypedArray:recycle	()V
    //   153: iload 6
    //   155: istore 7
    //   157: iload 7
    //   159: iconst_1
    //   160: if_icmpne +95 -> 255
    //   163: new 11	android/support/v7/widget/AppCompatSpinner$DropdownPopup
    //   166: dup
    //   167: aload_0
    //   168: aload_0
    //   169: getfield 121	android/support/v7/widget/AppCompatSpinner:mPopupContext	Landroid/content/Context;
    //   172: aload_2
    //   173: iload_3
    //   174: invokespecial 142	android/support/v7/widget/AppCompatSpinner$DropdownPopup:<init>	(Landroid/support/v7/widget/AppCompatSpinner;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    //   177: astore_1
    //   178: aload_0
    //   179: getfield 121	android/support/v7/widget/AppCompatSpinner:mPopupContext	Landroid/content/Context;
    //   182: aload_2
    //   183: getstatic 95	android/support/v7/appcompat/R$styleable:Spinner	[I
    //   186: iload_3
    //   187: iconst_0
    //   188: invokestatic 101	android/support/v7/widget/TintTypedArray:obtainStyledAttributes	(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;
    //   191: astore 5
    //   193: aload_0
    //   194: aload 5
    //   196: getstatic 145	android/support/v7/appcompat/R$styleable:Spinner_android_dropDownWidth	I
    //   199: bipush -2
    //   201: invokevirtual 148	android/support/v7/widget/TintTypedArray:getLayoutDimension	(II)I
    //   204: putfield 150	android/support/v7/widget/AppCompatSpinner:mDropDownWidth	I
    //   207: aload_1
    //   208: aload 5
    //   210: getstatic 153	android/support/v7/appcompat/R$styleable:Spinner_android_popupBackground	I
    //   213: invokevirtual 157	android/support/v7/widget/TintTypedArray:getDrawable	(I)Landroid/graphics/drawable/Drawable;
    //   216: invokevirtual 161	android/support/v7/widget/AppCompatSpinner$DropdownPopup:setBackgroundDrawable	(Landroid/graphics/drawable/Drawable;)V
    //   219: aload_1
    //   220: aload 9
    //   222: getstatic 164	android/support/v7/appcompat/R$styleable:Spinner_android_prompt	I
    //   225: invokevirtual 168	android/support/v7/widget/TintTypedArray:getString	(I)Ljava/lang/String;
    //   228: invokevirtual 172	android/support/v7/widget/AppCompatSpinner$DropdownPopup:setPromptText	(Ljava/lang/CharSequence;)V
    //   231: aload 5
    //   233: invokevirtual 173	android/support/v7/widget/TintTypedArray:recycle	()V
    //   236: aload_0
    //   237: aload_1
    //   238: putfield 175	android/support/v7/widget/AppCompatSpinner:mPopup	Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;
    //   241: aload_0
    //   242: new 177	android/support/v7/widget/AppCompatSpinner$1
    //   245: dup
    //   246: aload_0
    //   247: aload_0
    //   248: aload_1
    //   249: invokespecial 180	android/support/v7/widget/AppCompatSpinner$1:<init>	(Landroid/support/v7/widget/AppCompatSpinner;Landroid/view/View;Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;)V
    //   252: putfield 182	android/support/v7/widget/AppCompatSpinner:mForwardingListener	Landroid/support/v7/widget/ListPopupWindow$ForwardingListener;
    //   255: aload 9
    //   257: invokevirtual 173	android/support/v7/widget/TintTypedArray:recycle	()V
    //   260: aload_0
    //   261: iconst_1
    //   262: putfield 184	android/support/v7/widget/AppCompatSpinner:mPopupSet	Z
    //   265: aload_0
    //   266: getfield 186	android/support/v7/widget/AppCompatSpinner:mTempAdapter	Landroid/widget/SpinnerAdapter;
    //   269: ifnull +16 -> 285
    //   272: aload_0
    //   273: aload_0
    //   274: getfield 186	android/support/v7/widget/AppCompatSpinner:mTempAdapter	Landroid/widget/SpinnerAdapter;
    //   277: invokevirtual 190	android/support/v7/widget/AppCompatSpinner:setAdapter	(Landroid/widget/SpinnerAdapter;)V
    //   280: aload_0
    //   281: aconst_null
    //   282: putfield 186	android/support/v7/widget/AppCompatSpinner:mTempAdapter	Landroid/widget/SpinnerAdapter;
    //   285: aload_0
    //   286: getfield 114	android/support/v7/widget/AppCompatSpinner:mBackgroundTintHelper	Landroid/support/v7/widget/AppCompatBackgroundHelper;
    //   289: aload_2
    //   290: iload_3
    //   291: invokevirtual 194	android/support/v7/widget/AppCompatBackgroundHelper:loadFromAttributes	(Landroid/util/AttributeSet;I)V
    //   294: return
    //   295: aload 9
    //   297: getstatic 197	android/support/v7/appcompat/R$styleable:Spinner_popupTheme	I
    //   300: iconst_0
    //   301: invokevirtual 200	android/support/v7/widget/TintTypedArray:getResourceId	(II)I
    //   304: istore 6
    //   306: iload 6
    //   308: ifeq +20 -> 328
    //   311: aload_0
    //   312: new 116	android/support/v7/view/ContextThemeWrapper
    //   315: dup
    //   316: aload_1
    //   317: iload 6
    //   319: invokespecial 202	android/support/v7/view/ContextThemeWrapper:<init>	(Landroid/content/Context;I)V
    //   322: putfield 121	android/support/v7/widget/AppCompatSpinner:mPopupContext	Landroid/content/Context;
    //   325: goto -251 -> 74
    //   328: getstatic 55	android/support/v7/widget/AppCompatSpinner:IS_AT_LEAST_M	Z
    //   331: ifne +15 -> 346
    //   334: aload_1
    //   335: astore 5
    //   337: aload_0
    //   338: aload 5
    //   340: putfield 121	android/support/v7/widget/AppCompatSpinner:mPopupContext	Landroid/content/Context;
    //   343: goto -269 -> 74
    //   346: aconst_null
    //   347: astore 5
    //   349: goto -12 -> 337
    //   352: astore 8
    //   354: aconst_null
    //   355: astore 5
    //   357: aload 5
    //   359: astore_1
    //   360: ldc 30
    //   362: ldc -52
    //   364: aload 8
    //   366: invokestatic 210	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   369: pop
    //   370: iload 4
    //   372: istore 7
    //   374: aload 5
    //   376: ifnull -219 -> 157
    //   379: aload 5
    //   381: invokevirtual 139	android/content/res/TypedArray:recycle	()V
    //   384: iload 4
    //   386: istore 7
    //   388: goto -231 -> 157
    //   391: astore_2
    //   392: aconst_null
    //   393: astore_1
    //   394: aload_1
    //   395: ifnull +7 -> 402
    //   398: aload_1
    //   399: invokevirtual 139	android/content/res/TypedArray:recycle	()V
    //   402: aload_2
    //   403: athrow
    //   404: iconst_1
    //   405: istore 7
    //   407: goto -250 -> 157
    //   410: astore_2
    //   411: goto -17 -> 394
    //   414: astore 8
    //   416: goto -59 -> 357
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	419	0	this	AppCompatSpinner
    //   0	419	1	paramContext	Context
    //   0	419	2	paramAttributeSet	AttributeSet
    //   0	419	3	paramInt1	int
    //   0	419	4	paramInt2	int
    //   0	419	5	paramTheme	Resources.Theme
    //   113	205	6	i	int
    //   83	323	7	j	int
    //   352	13	8	localException1	Exception
    //   414	1	8	localException2	Exception
    //   28	268	9	localTintTypedArray	TintTypedArray
    // Exception table:
    //   from	to	target	type
    //   99	111	352	java/lang/Exception
    //   99	111	391	finally
    //   118	127	410	finally
    //   130	139	410	finally
    //   360	370	410	finally
    //   118	127	414	java/lang/Exception
    //   130	139	414	java/lang/Exception
  }
  
  private int compatMeasureContentWidth(SpinnerAdapter paramSpinnerAdapter, Drawable paramDrawable)
  {
    if (paramSpinnerAdapter == null) {
      return 0;
    }
    int n = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 0);
    int i1 = View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 0);
    int i = Math.max(0, getSelectedItemPosition());
    int i2 = Math.min(paramSpinnerAdapter.getCount(), i + 15);
    int j = Math.max(0, i - (15 - (i2 - i)));
    View localView = null;
    int k = 0;
    i = 0;
    if (j < i2)
    {
      int m = paramSpinnerAdapter.getItemViewType(j);
      if (m == i) {
        break label204;
      }
      localView = null;
      i = m;
    }
    label204:
    for (;;)
    {
      localView = paramSpinnerAdapter.getView(j, localView, this);
      if (localView.getLayoutParams() == null) {
        localView.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
      }
      localView.measure(n, i1);
      k = Math.max(k, localView.getMeasuredWidth());
      j += 1;
      break;
      if (paramDrawable != null)
      {
        paramDrawable.getPadding(mTempRect);
        return mTempRect.left + mTempRect.right + k;
      }
      return k;
    }
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    if (mBackgroundTintHelper != null) {
      mBackgroundTintHelper.applySupportBackgroundTint();
    }
  }
  
  public int getDropDownHorizontalOffset()
  {
    if (mPopup != null) {
      return mPopup.getHorizontalOffset();
    }
    if (IS_AT_LEAST_JB) {
      return super.getDropDownHorizontalOffset();
    }
    return 0;
  }
  
  public int getDropDownVerticalOffset()
  {
    if (mPopup != null) {
      return mPopup.getVerticalOffset();
    }
    if (IS_AT_LEAST_JB) {
      return super.getDropDownVerticalOffset();
    }
    return 0;
  }
  
  public int getDropDownWidth()
  {
    if (mPopup != null) {
      return mDropDownWidth;
    }
    if (IS_AT_LEAST_JB) {
      return super.getDropDownWidth();
    }
    return 0;
  }
  
  public Drawable getPopupBackground()
  {
    if (mPopup != null) {
      return mPopup.getBackground();
    }
    if (IS_AT_LEAST_JB) {
      return super.getPopupBackground();
    }
    return null;
  }
  
  public Context getPopupContext()
  {
    if (mPopup != null) {
      return mPopupContext;
    }
    if (IS_AT_LEAST_M) {
      return super.getPopupContext();
    }
    return null;
  }
  
  public CharSequence getPrompt()
  {
    if (mPopup != null) {
      return mPopup.getHintText();
    }
    return super.getPrompt();
  }
  
  @Nullable
  public ColorStateList getSupportBackgroundTintList()
  {
    if (mBackgroundTintHelper != null) {
      return mBackgroundTintHelper.getSupportBackgroundTintList();
    }
    return null;
  }
  
  @Nullable
  public PorterDuff.Mode getSupportBackgroundTintMode()
  {
    if (mBackgroundTintHelper != null) {
      return mBackgroundTintHelper.getSupportBackgroundTintMode();
    }
    return null;
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if ((mPopup != null) && (mPopup.isShowing())) {
      mPopup.dismiss();
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if ((mPopup != null) && (View.MeasureSpec.getMode(paramInt1) == Integer.MIN_VALUE)) {
      setMeasuredDimension(Math.min(Math.max(getMeasuredWidth(), compatMeasureContentWidth(getAdapter(), getBackground())), View.MeasureSpec.getSize(paramInt1)), getMeasuredHeight());
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((mForwardingListener != null) && (mForwardingListener.onTouch(this, paramMotionEvent))) {
      return true;
    }
    return super.onTouchEvent(paramMotionEvent);
  }
  
  public boolean performClick()
  {
    if ((mPopup != null) && (!mPopup.isShowing()))
    {
      mPopup.show();
      return true;
    }
    return super.performClick();
  }
  
  public void setAdapter(SpinnerAdapter paramSpinnerAdapter)
  {
    if (!mPopupSet) {
      mTempAdapter = paramSpinnerAdapter;
    }
    do
    {
      return;
      super.setAdapter(paramSpinnerAdapter);
    } while (mPopup == null);
    if (mPopupContext == null) {}
    for (Context localContext = getContext();; localContext = mPopupContext)
    {
      mPopup.setAdapter(new DropDownAdapter(paramSpinnerAdapter, localContext.getTheme()));
      return;
    }
  }
  
  public void setBackgroundDrawable(Drawable paramDrawable)
  {
    super.setBackgroundDrawable(paramDrawable);
    if (mBackgroundTintHelper != null) {
      mBackgroundTintHelper.onSetBackgroundDrawable(paramDrawable);
    }
  }
  
  public void setBackgroundResource(@DrawableRes int paramInt)
  {
    super.setBackgroundResource(paramInt);
    if (mBackgroundTintHelper != null) {
      mBackgroundTintHelper.onSetBackgroundResource(paramInt);
    }
  }
  
  public void setDropDownHorizontalOffset(int paramInt)
  {
    if (mPopup != null) {
      mPopup.setHorizontalOffset(paramInt);
    }
    while (!IS_AT_LEAST_JB) {
      return;
    }
    super.setDropDownHorizontalOffset(paramInt);
  }
  
  public void setDropDownVerticalOffset(int paramInt)
  {
    if (mPopup != null) {
      mPopup.setVerticalOffset(paramInt);
    }
    while (!IS_AT_LEAST_JB) {
      return;
    }
    super.setDropDownVerticalOffset(paramInt);
  }
  
  public void setDropDownWidth(int paramInt)
  {
    if (mPopup != null) {
      mDropDownWidth = paramInt;
    }
    while (!IS_AT_LEAST_JB) {
      return;
    }
    super.setDropDownWidth(paramInt);
  }
  
  public void setPopupBackgroundDrawable(Drawable paramDrawable)
  {
    if (mPopup != null) {
      mPopup.setBackgroundDrawable(paramDrawable);
    }
    while (!IS_AT_LEAST_JB) {
      return;
    }
    super.setPopupBackgroundDrawable(paramDrawable);
  }
  
  public void setPopupBackgroundResource(@DrawableRes int paramInt)
  {
    setPopupBackgroundDrawable(getPopupContext().getDrawable(paramInt));
  }
  
  public void setPrompt(CharSequence paramCharSequence)
  {
    if (mPopup != null)
    {
      mPopup.setPromptText(paramCharSequence);
      return;
    }
    super.setPrompt(paramCharSequence);
  }
  
  public void setSupportBackgroundTintList(@Nullable ColorStateList paramColorStateList)
  {
    if (mBackgroundTintHelper != null) {
      mBackgroundTintHelper.setSupportBackgroundTintList(paramColorStateList);
    }
  }
  
  public void setSupportBackgroundTintMode(@Nullable PorterDuff.Mode paramMode)
  {
    if (mBackgroundTintHelper != null) {
      mBackgroundTintHelper.setSupportBackgroundTintMode(paramMode);
    }
  }
  
  private static class DropDownAdapter
    implements ListAdapter, SpinnerAdapter
  {
    private SpinnerAdapter mAdapter;
    private ListAdapter mListAdapter;
    
    public DropDownAdapter(@Nullable SpinnerAdapter paramSpinnerAdapter, @Nullable Resources.Theme paramTheme)
    {
      mAdapter = paramSpinnerAdapter;
      if ((paramSpinnerAdapter instanceof ListAdapter)) {
        mListAdapter = ((ListAdapter)paramSpinnerAdapter);
      }
      if (paramTheme != null)
      {
        if ((!AppCompatSpinner.IS_AT_LEAST_M) || (!(paramSpinnerAdapter instanceof android.widget.ThemedSpinnerAdapter))) {
          break label64;
        }
        paramSpinnerAdapter = (android.widget.ThemedSpinnerAdapter)paramSpinnerAdapter;
        if (paramSpinnerAdapter.getDropDownViewTheme() != paramTheme) {
          paramSpinnerAdapter.setDropDownViewTheme(paramTheme);
        }
      }
      label64:
      do
      {
        do
        {
          return;
        } while (!(paramSpinnerAdapter instanceof ThemedSpinnerAdapter));
        paramSpinnerAdapter = (ThemedSpinnerAdapter)paramSpinnerAdapter;
      } while (paramSpinnerAdapter.getDropDownViewTheme() != null);
      paramSpinnerAdapter.setDropDownViewTheme(paramTheme);
    }
    
    public boolean areAllItemsEnabled()
    {
      ListAdapter localListAdapter = mListAdapter;
      if (localListAdapter != null) {
        return localListAdapter.areAllItemsEnabled();
      }
      return true;
    }
    
    public int getCount()
    {
      if (mAdapter == null) {
        return 0;
      }
      return mAdapter.getCount();
    }
    
    public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (mAdapter == null) {
        return null;
      }
      return mAdapter.getDropDownView(paramInt, paramView, paramViewGroup);
    }
    
    public Object getItem(int paramInt)
    {
      if (mAdapter == null) {
        return null;
      }
      return mAdapter.getItem(paramInt);
    }
    
    public long getItemId(int paramInt)
    {
      if (mAdapter == null) {
        return -1L;
      }
      return mAdapter.getItemId(paramInt);
    }
    
    public int getItemViewType(int paramInt)
    {
      return 0;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      return getDropDownView(paramInt, paramView, paramViewGroup);
    }
    
    public int getViewTypeCount()
    {
      return 1;
    }
    
    public boolean hasStableIds()
    {
      return (mAdapter != null) && (mAdapter.hasStableIds());
    }
    
    public boolean isEmpty()
    {
      return getCount() == 0;
    }
    
    public boolean isEnabled(int paramInt)
    {
      ListAdapter localListAdapter = mListAdapter;
      if (localListAdapter != null) {
        return localListAdapter.isEnabled(paramInt);
      }
      return true;
    }
    
    public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
    {
      if (mAdapter != null) {
        mAdapter.registerDataSetObserver(paramDataSetObserver);
      }
    }
    
    public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
    {
      if (mAdapter != null) {
        mAdapter.unregisterDataSetObserver(paramDataSetObserver);
      }
    }
  }
  
  private class DropdownPopup
    extends ListPopupWindow
  {
    private ListAdapter mAdapter;
    private CharSequence mHintText;
    private final Rect mVisibleRect = new Rect();
    
    public DropdownPopup(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
    {
      super(paramAttributeSet, paramInt);
      setAnchorView(AppCompatSpinner.this);
      setModal(true);
      setPromptPosition(0);
      setOnItemClickListener(new AppCompatSpinner.DropdownPopup.1(this, AppCompatSpinner.this));
    }
    
    private boolean isVisibleToUser(View paramView)
    {
      return (ViewCompat.isAttachedToWindow(paramView)) && (paramView.getGlobalVisibleRect(mVisibleRect));
    }
    
    void computeContentWidth()
    {
      Object localObject = getBackground();
      int i;
      int m;
      int n;
      int i1;
      int j;
      if (localObject != null)
      {
        ((Drawable)localObject).getPadding(mTempRect);
        if (ViewUtils.isLayoutRtl(AppCompatSpinner.this))
        {
          i = mTempRect.right;
          m = getPaddingLeft();
          n = getPaddingRight();
          i1 = getWidth();
          if (mDropDownWidth != -2) {
            break label240;
          }
          j = AppCompatSpinner.this.compatMeasureContentWidth((SpinnerAdapter)mAdapter, getBackground());
          int k = getContext().getResources().getDisplayMetrics().widthPixels - mTempRect.left - mTempRect.right;
          if (j <= k) {
            break label288;
          }
          j = k;
        }
      }
      label165:
      label240:
      label288:
      for (;;)
      {
        setContentWidth(Math.max(j, i1 - m - n));
        if (ViewUtils.isLayoutRtl(AppCompatSpinner.this)) {
          i = i1 - n - getWidth() + i;
        }
        for (;;)
        {
          setHorizontalOffset(i);
          return;
          i = -mTempRect.left;
          break;
          localObject = mTempRect;
          mTempRect.right = 0;
          left = 0;
          i = 0;
          break;
          if (mDropDownWidth == -1)
          {
            setContentWidth(i1 - m - n);
            break label165;
          }
          setContentWidth(mDropDownWidth);
          break label165;
          i += m;
        }
      }
    }
    
    public CharSequence getHintText()
    {
      return mHintText;
    }
    
    public void setAdapter(ListAdapter paramListAdapter)
    {
      super.setAdapter(paramListAdapter);
      mAdapter = paramListAdapter;
    }
    
    public void setPromptText(CharSequence paramCharSequence)
    {
      mHintText = paramCharSequence;
    }
    
    public void show()
    {
      boolean bool = isShowing();
      computeContentWidth();
      setInputMethodMode(2);
      super.show();
      getListView().setChoiceMode(1);
      setSelection(getSelectedItemPosition());
      if (bool) {}
      ViewTreeObserver localViewTreeObserver;
      do
      {
        return;
        localViewTreeObserver = getViewTreeObserver();
      } while (localViewTreeObserver == null);
      AppCompatSpinner.DropdownPopup.2 local2 = new AppCompatSpinner.DropdownPopup.2(this);
      localViewTreeObserver.addOnGlobalLayoutListener(local2);
      setOnDismissListener(new AppCompatSpinner.DropdownPopup.3(this, local2));
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v7.widget.AppCompatSpinner
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */