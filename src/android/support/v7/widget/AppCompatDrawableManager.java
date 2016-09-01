package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.graphics.drawable.DrawableContainer.DrawableContainerState;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build.VERSION;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.support.v4.graphics.ColorUtils;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v4.util.LruCache;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.drawable;
import android.util.Log;
import android.util.SparseArray;
import java.util.ArrayList;
import java.util.WeakHashMap;

public final class AppCompatDrawableManager
{
  private static final int[] COLORFILTER_COLOR_BACKGROUND_MULTIPLY;
  private static final int[] COLORFILTER_COLOR_CONTROL_ACTIVATED;
  private static final int[] COLORFILTER_TINT_COLOR_CONTROL_NORMAL;
  private static final ColorFilterLruCache COLOR_FILTER_CACHE;
  private static final boolean DEBUG = false;
  private static final PorterDuff.Mode DEFAULT_MODE = PorterDuff.Mode.SRC_IN;
  private static AppCompatDrawableManager INSTANCE;
  private static final String TAG = "TintManager";
  private static final int[] TINT_CHECKABLE_BUTTON_LIST = { R.drawable.abc_btn_check_material, R.drawable.abc_btn_radio_material };
  private static final int[] TINT_COLOR_CONTROL_NORMAL;
  private static final int[] TINT_COLOR_CONTROL_STATE_LIST;
  private ArrayList mDelegates;
  private WeakHashMap mTintLists;
  
  static
  {
    COLOR_FILTER_CACHE = new ColorFilterLruCache(6);
    COLORFILTER_TINT_COLOR_CONTROL_NORMAL = new int[] { R.drawable.abc_textfield_search_default_mtrl_alpha, R.drawable.abc_textfield_default_mtrl_alpha, R.drawable.abc_ab_share_pack_mtrl_alpha };
    TINT_COLOR_CONTROL_NORMAL = new int[] { R.drawable.abc_ic_ab_back_mtrl_am_alpha, R.drawable.abc_ic_go_search_api_mtrl_alpha, R.drawable.abc_ic_search_api_mtrl_alpha, R.drawable.abc_ic_commit_search_api_mtrl_alpha, R.drawable.abc_ic_clear_mtrl_alpha, R.drawable.abc_ic_menu_share_mtrl_alpha, R.drawable.abc_ic_menu_copy_mtrl_am_alpha, R.drawable.abc_ic_menu_cut_mtrl_alpha, R.drawable.abc_ic_menu_selectall_mtrl_alpha, R.drawable.abc_ic_menu_paste_mtrl_am_alpha, R.drawable.abc_ic_menu_moreoverflow_mtrl_alpha, R.drawable.abc_ic_voice_search_api_mtrl_alpha };
    COLORFILTER_COLOR_CONTROL_ACTIVATED = new int[] { R.drawable.abc_textfield_activated_mtrl_alpha, R.drawable.abc_textfield_search_activated_mtrl_alpha, R.drawable.abc_cab_background_top_mtrl_alpha, R.drawable.abc_text_cursor_material };
    COLORFILTER_COLOR_BACKGROUND_MULTIPLY = new int[] { R.drawable.abc_popup_background_mtrl_mult, R.drawable.abc_cab_background_internal_bg, R.drawable.abc_menu_hardkey_panel_mtrl_mult };
    TINT_COLOR_CONTROL_STATE_LIST = new int[] { R.drawable.abc_edit_text_material, R.drawable.abc_tab_indicator_material, R.drawable.abc_textfield_search_material, R.drawable.abc_spinner_mtrl_am_alpha, R.drawable.abc_spinner_textfield_background_material, R.drawable.abc_ratingbar_full_material, R.drawable.abc_switch_track_mtrl_alpha, R.drawable.abc_switch_thumb_material, R.drawable.abc_btn_default_mtrl_shape, R.drawable.abc_btn_borderless_material };
  }
  
  private void addTintListToCache(@NonNull Context paramContext, @DrawableRes int paramInt, @NonNull ColorStateList paramColorStateList)
  {
    if (mTintLists == null) {
      mTintLists = new WeakHashMap();
    }
    SparseArray localSparseArray2 = (SparseArray)mTintLists.get(paramContext);
    SparseArray localSparseArray1 = localSparseArray2;
    if (localSparseArray2 == null)
    {
      localSparseArray1 = new SparseArray();
      mTintLists.put(paramContext, localSparseArray1);
    }
    localSparseArray1.append(paramInt, paramColorStateList);
  }
  
  private static boolean arrayContains(int[] paramArrayOfInt, int paramInt)
  {
    boolean bool2 = false;
    int j = paramArrayOfInt.length;
    int i = 0;
    for (;;)
    {
      boolean bool1 = bool2;
      if (i < j)
      {
        if (paramArrayOfInt[i] == paramInt) {
          bool1 = true;
        }
      }
      else {
        return bool1;
      }
      i += 1;
    }
  }
  
  private ColorStateList createButtonColorStateList(Context paramContext, int paramInt)
  {
    paramInt = ThemeUtils.getThemeAttrColor(paramContext, paramInt);
    int k = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlHighlight);
    int[] arrayOfInt1 = ThemeUtils.DISABLED_STATE_SET;
    int i = ThemeUtils.getDisabledThemeAttrColor(paramContext, R.attr.colorButtonNormal);
    paramContext = ThemeUtils.PRESSED_STATE_SET;
    int j = ColorUtils.compositeColors(k, paramInt);
    int[] arrayOfInt2 = ThemeUtils.FOCUSED_STATE_SET;
    k = ColorUtils.compositeColors(k, paramInt);
    return new ColorStateList(new int[][] { arrayOfInt1, paramContext, arrayOfInt2, ThemeUtils.EMPTY_STATE_SET }, new int[] { i, j, k, paramInt });
  }
  
  private ColorStateList createCheckableButtonColorStateList(Context paramContext)
  {
    int[] arrayOfInt1 = ThemeUtils.DISABLED_STATE_SET;
    int i = ThemeUtils.getDisabledThemeAttrColor(paramContext, R.attr.colorControlNormal);
    int[] arrayOfInt2 = ThemeUtils.CHECKED_STATE_SET;
    int j = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlActivated);
    int[] arrayOfInt3 = ThemeUtils.EMPTY_STATE_SET;
    int k = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlNormal);
    return new ColorStateList(new int[][] { arrayOfInt1, arrayOfInt2, arrayOfInt3 }, new int[] { i, j, k });
  }
  
  private ColorStateList createColoredButtonColorStateList(Context paramContext)
  {
    return createButtonColorStateList(paramContext, R.attr.colorAccent);
  }
  
  private ColorStateList createDefaultButtonColorStateList(Context paramContext)
  {
    return createButtonColorStateList(paramContext, R.attr.colorButtonNormal);
  }
  
  private ColorStateList createDefaultColorStateList(Context paramContext)
  {
    int i = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlNormal);
    int j = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlActivated);
    int[] arrayOfInt = ThemeUtils.DISABLED_STATE_SET;
    int k = ThemeUtils.getDisabledThemeAttrColor(paramContext, R.attr.colorControlNormal);
    return new ColorStateList(new int[][] { arrayOfInt, ThemeUtils.FOCUSED_STATE_SET, ThemeUtils.ACTIVATED_STATE_SET, ThemeUtils.PRESSED_STATE_SET, ThemeUtils.CHECKED_STATE_SET, ThemeUtils.SELECTED_STATE_SET, ThemeUtils.EMPTY_STATE_SET }, new int[] { k, j, j, j, j, j, i });
  }
  
  private ColorStateList createEditTextColorStateList(Context paramContext)
  {
    int[] arrayOfInt1 = ThemeUtils.DISABLED_STATE_SET;
    int i = ThemeUtils.getDisabledThemeAttrColor(paramContext, R.attr.colorControlNormal);
    int[] arrayOfInt2 = ThemeUtils.NOT_PRESSED_OR_FOCUSED_STATE_SET;
    int j = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlNormal);
    int[] arrayOfInt3 = ThemeUtils.EMPTY_STATE_SET;
    int k = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlActivated);
    return new ColorStateList(new int[][] { arrayOfInt1, arrayOfInt2, arrayOfInt3 }, new int[] { i, j, k });
  }
  
  private ColorStateList createSeekbarThumbColorStateList(Context paramContext)
  {
    int[] arrayOfInt1 = ThemeUtils.DISABLED_STATE_SET;
    int i = ThemeUtils.getDisabledThemeAttrColor(paramContext, R.attr.colorControlActivated);
    int[] arrayOfInt2 = ThemeUtils.EMPTY_STATE_SET;
    int j = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlActivated);
    return new ColorStateList(new int[][] { arrayOfInt1, arrayOfInt2 }, new int[] { i, j });
  }
  
  private ColorStateList createSpinnerColorStateList(Context paramContext)
  {
    int[] arrayOfInt1 = ThemeUtils.DISABLED_STATE_SET;
    int i = ThemeUtils.getDisabledThemeAttrColor(paramContext, R.attr.colorControlNormal);
    int[] arrayOfInt2 = ThemeUtils.NOT_PRESSED_OR_FOCUSED_STATE_SET;
    int j = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlNormal);
    int[] arrayOfInt3 = ThemeUtils.EMPTY_STATE_SET;
    int k = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlActivated);
    return new ColorStateList(new int[][] { arrayOfInt1, arrayOfInt2, arrayOfInt3 }, new int[] { i, j, k });
  }
  
  private ColorStateList createSwitchThumbColorStateList(Context paramContext)
  {
    int[][] arrayOfInt = new int[3][];
    int[] arrayOfInt1 = new int[3];
    ColorStateList localColorStateList = ThemeUtils.getThemeAttrColorStateList(paramContext, R.attr.colorSwitchThumbNormal);
    if ((localColorStateList != null) && (localColorStateList.isStateful()))
    {
      arrayOfInt[0] = ThemeUtils.DISABLED_STATE_SET;
      arrayOfInt1[0] = localColorStateList.getColorForState(arrayOfInt[0], 0);
      arrayOfInt[1] = ThemeUtils.CHECKED_STATE_SET;
      arrayOfInt1[1] = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlActivated);
      arrayOfInt[2] = ThemeUtils.EMPTY_STATE_SET;
      arrayOfInt1[2] = localColorStateList.getDefaultColor();
    }
    for (;;)
    {
      return new ColorStateList(arrayOfInt, arrayOfInt1);
      arrayOfInt[0] = ThemeUtils.DISABLED_STATE_SET;
      arrayOfInt1[0] = ThemeUtils.getDisabledThemeAttrColor(paramContext, R.attr.colorSwitchThumbNormal);
      arrayOfInt[1] = ThemeUtils.CHECKED_STATE_SET;
      arrayOfInt1[1] = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlActivated);
      arrayOfInt[2] = ThemeUtils.EMPTY_STATE_SET;
      arrayOfInt1[2] = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorSwitchThumbNormal);
    }
  }
  
  private ColorStateList createSwitchTrackColorStateList(Context paramContext)
  {
    int[] arrayOfInt1 = ThemeUtils.DISABLED_STATE_SET;
    int i = ThemeUtils.getThemeAttrColor(paramContext, 16842800, 0.1F);
    int[] arrayOfInt2 = ThemeUtils.CHECKED_STATE_SET;
    int j = ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlActivated, 0.3F);
    int[] arrayOfInt3 = ThemeUtils.EMPTY_STATE_SET;
    int k = ThemeUtils.getThemeAttrColor(paramContext, 16842800, 0.3F);
    return new ColorStateList(new int[][] { arrayOfInt1, arrayOfInt2, arrayOfInt3 }, new int[] { i, j, k });
  }
  
  private static PorterDuffColorFilter createTintFilter(ColorStateList paramColorStateList, PorterDuff.Mode paramMode, int[] paramArrayOfInt)
  {
    if ((paramColorStateList == null) || (paramMode == null)) {
      return null;
    }
    return getPorterDuffColorFilter(paramColorStateList.getColorForState(paramArrayOfInt, 0), paramMode);
  }
  
  public static AppCompatDrawableManager get()
  {
    if (INSTANCE == null) {
      INSTANCE = new AppCompatDrawableManager();
    }
    return INSTANCE;
  }
  
  private static PorterDuffColorFilter getPorterDuffColorFilter(int paramInt, PorterDuff.Mode paramMode)
  {
    PorterDuffColorFilter localPorterDuffColorFilter2 = COLOR_FILTER_CACHE.get(paramInt, paramMode);
    PorterDuffColorFilter localPorterDuffColorFilter1 = localPorterDuffColorFilter2;
    if (localPorterDuffColorFilter2 == null)
    {
      localPorterDuffColorFilter1 = new PorterDuffColorFilter(paramInt, paramMode);
      COLOR_FILTER_CACHE.put(paramInt, paramMode, localPorterDuffColorFilter1);
    }
    return localPorterDuffColorFilter1;
  }
  
  private ColorStateList getTintListFromCache(@NonNull Context paramContext, @DrawableRes int paramInt)
  {
    if (mTintLists != null)
    {
      paramContext = (SparseArray)mTintLists.get(paramContext);
      if (paramContext != null) {
        return (ColorStateList)paramContext.get(paramInt);
      }
      return null;
    }
    return null;
  }
  
  private static void setPorterDuffColorFilter(Drawable paramDrawable, int paramInt, PorterDuff.Mode paramMode)
  {
    PorterDuff.Mode localMode = paramMode;
    if (paramMode == null) {
      localMode = DEFAULT_MODE;
    }
    paramDrawable.setColorFilter(getPorterDuffColorFilter(paramInt, localMode));
  }
  
  private static boolean shouldMutateBackground(Drawable paramDrawable)
  {
    if (Build.VERSION.SDK_INT >= 16) {}
    for (;;)
    {
      return true;
      if ((paramDrawable instanceof LayerDrawable))
      {
        if (Build.VERSION.SDK_INT >= 16) {}
        for (boolean bool = true;; bool = false) {
          return bool;
        }
      }
      if ((paramDrawable instanceof InsetDrawable))
      {
        if (Build.VERSION.SDK_INT < 14) {
          return false;
        }
      }
      else if ((paramDrawable instanceof DrawableContainer))
      {
        paramDrawable = paramDrawable.getConstantState();
        if ((paramDrawable instanceof DrawableContainer.DrawableContainerState))
        {
          paramDrawable = ((DrawableContainer.DrawableContainerState)paramDrawable).getChildren();
          int j = paramDrawable.length;
          int i = 0;
          while (i < j)
          {
            if (!shouldMutateBackground(paramDrawable[i])) {
              return false;
            }
            i += 1;
          }
        }
      }
    }
  }
  
  public static void tintDrawable(Drawable paramDrawable, TintInfo paramTintInfo, int[] paramArrayOfInt)
  {
    if ((shouldMutateBackground(paramDrawable)) && (paramDrawable.mutate() != paramDrawable)) {
      Log.d("TintManager", "Mutated drawable is not the same instance as the input.");
    }
    label63:
    label91:
    label103:
    for (;;)
    {
      return;
      ColorStateList localColorStateList;
      if ((mHasTintList) || (mHasTintMode)) {
        if (mHasTintList)
        {
          localColorStateList = mTintList;
          if (!mHasTintMode) {
            break label91;
          }
          paramTintInfo = mTintMode;
          paramDrawable.setColorFilter(createTintFilter(localColorStateList, paramTintInfo, paramArrayOfInt));
        }
      }
      for (;;)
      {
        if (Build.VERSION.SDK_INT > 10) {
          break label103;
        }
        paramDrawable.invalidateSelf();
        return;
        localColorStateList = null;
        break;
        paramTintInfo = DEFAULT_MODE;
        break label63;
        paramDrawable.clearColorFilter();
      }
    }
  }
  
  public void addDelegate(@NonNull InflateDelegate paramInflateDelegate)
  {
    if (mDelegates == null) {
      mDelegates = new ArrayList();
    }
    if (!mDelegates.contains(paramInflateDelegate)) {
      mDelegates.add(paramInflateDelegate);
    }
  }
  
  public Drawable getDrawable(@NonNull Context paramContext, @DrawableRes int paramInt)
  {
    return getDrawable(paramContext, paramInt, false);
  }
  
  public Drawable getDrawable(@NonNull Context paramContext, @DrawableRes int paramInt, boolean paramBoolean)
  {
    int i;
    Object localObject1;
    if (mDelegates != null)
    {
      int j = mDelegates.size();
      i = 0;
      if (i < j)
      {
        localObject1 = ((InflateDelegate)mDelegates.get(i)).onInflateDrawable(paramContext, paramInt);
        if (localObject1 == null) {}
      }
    }
    label147:
    do
    {
      Object localObject2;
      do
      {
        do
        {
          Drawable localDrawable;
          do
          {
            return (Drawable)localObject1;
            i += 1;
            break;
            localDrawable = ContextCompat.getDrawable(paramContext, paramInt);
            localObject1 = localDrawable;
          } while (localDrawable == null);
          localObject2 = localDrawable;
          if (Build.VERSION.SDK_INT >= 8) {
            localObject2 = localDrawable.mutate();
          }
          localObject1 = getTintList(paramContext, paramInt);
          if (localObject1 == null) {
            break label147;
          }
          paramContext = DrawableCompat.wrap((Drawable)localObject2);
          DrawableCompat.setTintList(paramContext, (ColorStateList)localObject1);
          localObject2 = getTintMode(paramInt);
          localObject1 = paramContext;
        } while (localObject2 == null);
        DrawableCompat.setTintMode(paramContext, (PorterDuff.Mode)localObject2);
        return paramContext;
        if (paramInt == R.drawable.abc_cab_background_top_material) {
          return new LayerDrawable(new Drawable[] { getDrawable(paramContext, R.drawable.abc_cab_background_internal_bg), getDrawable(paramContext, R.drawable.abc_cab_background_top_mtrl_alpha) });
        }
        if (paramInt == R.drawable.abc_seekbar_track_material)
        {
          localObject1 = (LayerDrawable)localObject2;
          setPorterDuffColorFilter(((LayerDrawable)localObject1).findDrawableByLayerId(16908288), ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlNormal), DEFAULT_MODE);
          setPorterDuffColorFilter(((LayerDrawable)localObject1).findDrawableByLayerId(16908303), ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlNormal), DEFAULT_MODE);
          setPorterDuffColorFilter(((LayerDrawable)localObject1).findDrawableByLayerId(16908301), ThemeUtils.getThemeAttrColor(paramContext, R.attr.colorControlActivated), DEFAULT_MODE);
          return (Drawable)localObject2;
        }
        localObject1 = localObject2;
      } while (tintDrawableUsingColorFilter(paramContext, paramInt, (Drawable)localObject2));
      localObject1 = localObject2;
    } while (!paramBoolean);
    return null;
  }
  
  public final ColorStateList getTintList(@NonNull Context paramContext, @DrawableRes int paramInt)
  {
    ColorStateList localColorStateList1 = getTintListFromCache(paramContext, paramInt);
    ColorStateList localColorStateList2 = localColorStateList1;
    if (localColorStateList1 == null)
    {
      if (paramInt != R.drawable.abc_edit_text_material) {
        break label47;
      }
      localColorStateList1 = createEditTextColorStateList(paramContext);
    }
    for (;;)
    {
      localColorStateList2 = localColorStateList1;
      if (localColorStateList1 != null)
      {
        addTintListToCache(paramContext, paramInt, localColorStateList1);
        localColorStateList2 = localColorStateList1;
      }
      return localColorStateList2;
      label47:
      if (paramInt == R.drawable.abc_switch_track_mtrl_alpha) {
        localColorStateList1 = createSwitchTrackColorStateList(paramContext);
      } else if (paramInt == R.drawable.abc_switch_thumb_material) {
        localColorStateList1 = createSwitchThumbColorStateList(paramContext);
      } else if ((paramInt == R.drawable.abc_btn_default_mtrl_shape) || (paramInt == R.drawable.abc_btn_borderless_material)) {
        localColorStateList1 = createDefaultButtonColorStateList(paramContext);
      } else if (paramInt == R.drawable.abc_btn_colored_material) {
        localColorStateList1 = createColoredButtonColorStateList(paramContext);
      } else if ((paramInt == R.drawable.abc_spinner_mtrl_am_alpha) || (paramInt == R.drawable.abc_spinner_textfield_background_material)) {
        localColorStateList1 = createSpinnerColorStateList(paramContext);
      } else if (arrayContains(TINT_COLOR_CONTROL_NORMAL, paramInt)) {
        localColorStateList1 = ThemeUtils.getThemeAttrColorStateList(paramContext, R.attr.colorControlNormal);
      } else if (arrayContains(TINT_COLOR_CONTROL_STATE_LIST, paramInt)) {
        localColorStateList1 = createDefaultColorStateList(paramContext);
      } else if (arrayContains(TINT_CHECKABLE_BUTTON_LIST, paramInt)) {
        localColorStateList1 = createCheckableButtonColorStateList(paramContext);
      } else if (paramInt == R.drawable.abc_seekbar_thumb_material) {
        localColorStateList1 = createSeekbarThumbColorStateList(paramContext);
      }
    }
  }
  
  final PorterDuff.Mode getTintMode(int paramInt)
  {
    PorterDuff.Mode localMode = null;
    if (paramInt == R.drawable.abc_switch_thumb_material) {
      localMode = PorterDuff.Mode.MULTIPLY;
    }
    return localMode;
  }
  
  public void removeDelegate(@NonNull InflateDelegate paramInflateDelegate)
  {
    if (mDelegates != null) {
      mDelegates.remove(paramInflateDelegate);
    }
  }
  
  public final boolean tintDrawableUsingColorFilter(@NonNull Context paramContext, @DrawableRes int paramInt, @NonNull Drawable paramDrawable)
  {
    PorterDuff.Mode localMode = DEFAULT_MODE;
    int i;
    int j;
    if (arrayContains(COLORFILTER_TINT_COLOR_CONTROL_NORMAL, paramInt))
    {
      i = R.attr.colorControlNormal;
      j = 1;
      paramInt = -1;
    }
    for (;;)
    {
      if (j != 0)
      {
        paramDrawable.setColorFilter(getPorterDuffColorFilter(ThemeUtils.getThemeAttrColor(paramContext, i), localMode));
        if (paramInt != -1) {
          paramDrawable.setAlpha(paramInt);
        }
        return true;
        if (arrayContains(COLORFILTER_COLOR_CONTROL_ACTIVATED, paramInt))
        {
          i = R.attr.colorControlActivated;
          j = 1;
          paramInt = -1;
          continue;
        }
        if (arrayContains(COLORFILTER_COLOR_BACKGROUND_MULTIPLY, paramInt))
        {
          localMode = PorterDuff.Mode.MULTIPLY;
          j = 1;
          i = 16842801;
          paramInt = -1;
          continue;
        }
        if (paramInt == R.drawable.abc_list_divider_mtrl_alpha)
        {
          i = 16842800;
          paramInt = Math.round(40.8F);
          j = 1;
        }
      }
      else
      {
        return false;
      }
      paramInt = -1;
      i = 0;
      j = 0;
    }
  }
  
  private static class ColorFilterLruCache
    extends LruCache
  {
    public ColorFilterLruCache(int paramInt)
    {
      super();
    }
    
    private static int generateCacheKey(int paramInt, PorterDuff.Mode paramMode)
    {
      return (paramInt + 31) * 31 + paramMode.hashCode();
    }
    
    PorterDuffColorFilter get(int paramInt, PorterDuff.Mode paramMode)
    {
      return (PorterDuffColorFilter)get(Integer.valueOf(generateCacheKey(paramInt, paramMode)));
    }
    
    PorterDuffColorFilter put(int paramInt, PorterDuff.Mode paramMode, PorterDuffColorFilter paramPorterDuffColorFilter)
    {
      return (PorterDuffColorFilter)put(Integer.valueOf(generateCacheKey(paramInt, paramMode)), paramPorterDuffColorFilter);
    }
  }
  
  public static abstract interface InflateDelegate
  {
    @Nullable
    public abstract Drawable onInflateDrawable(@NonNull Context paramContext, @DrawableRes int paramInt);
  }
}

/* Location:
 * Qualified Name:     android.support.v7.widget.AppCompatDrawableManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */