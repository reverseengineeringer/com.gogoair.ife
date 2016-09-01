package android.support.v7.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.media.AudioManager;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.NonNull;
import android.support.v4.app.NavUtils;
import android.support.v4.os.ParcelableCompat;
import android.support.v4.view.LayoutInflaterCompat;
import android.support.v4.view.LayoutInflaterFactory;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewConfigurationCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.widget.PopupWindowCompat;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.color;
import android.support.v7.appcompat.R.id;
import android.support.v7.appcompat.R.layout;
import android.support.v7.appcompat.R.style;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.view.ActionMode;
import android.support.v7.view.ActionMode.Callback;
import android.support.v7.view.ContextThemeWrapper;
import android.support.v7.view.StandaloneActionMode;
import android.support.v7.view.menu.ListMenuPresenter;
import android.support.v7.view.menu.MenuBuilder;
import android.support.v7.view.menu.MenuBuilder.Callback;
import android.support.v7.view.menu.MenuPresenter.Callback;
import android.support.v7.view.menu.MenuView;
import android.support.v7.widget.ActionBarContextView;
import android.support.v7.widget.ContentFrameLayout;
import android.support.v7.widget.DecorContentParent;
import android.support.v7.widget.FitWindowsViewGroup;
import android.support.v7.widget.TintManager;
import android.support.v7.widget.Toolbar;
import android.support.v7.widget.ViewStubCompat;
import android.support.v7.widget.ViewUtils;
import android.text.TextUtils;
import android.util.AndroidRuntimeException;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.LayoutInflater.Factory;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewParent;
import android.view.Window;
import android.view.Window.Callback;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import android.widget.TextView;

class AppCompatDelegateImplV7
  extends AppCompatDelegateImplBase
  implements LayoutInflaterFactory, MenuBuilder.Callback
{
  private ActionMenuPresenterCallback mActionMenuPresenterCallback;
  ActionMode mActionMode;
  PopupWindow mActionModePopup;
  ActionBarContextView mActionModeView;
  private AppCompatViewInflater mAppCompatViewInflater;
  private boolean mClosingActionMenu;
  private DecorContentParent mDecorContentParent;
  private boolean mEnableDefaultActionBarUp;
  ViewPropertyAnimatorCompat mFadeAnim = null;
  private boolean mFeatureIndeterminateProgress;
  private boolean mFeatureProgress;
  private int mInvalidatePanelMenuFeatures;
  private boolean mInvalidatePanelMenuPosted;
  private final Runnable mInvalidatePanelMenuRunnable = new AppCompatDelegateImplV7.1(this);
  private boolean mLongPressBackDown;
  private PanelMenuPresenterCallback mPanelMenuPresenterCallback;
  private PanelFeatureState[] mPanels;
  private PanelFeatureState mPreparedPanel;
  Runnable mShowActionModePopup;
  private View mStatusGuard;
  private ViewGroup mSubDecor;
  private boolean mSubDecorInstalled;
  private Rect mTempRect1;
  private Rect mTempRect2;
  private TextView mTitleView;
  private ViewGroup mWindowDecor;
  
  AppCompatDelegateImplV7(Context paramContext, Window paramWindow, AppCompatCallback paramAppCompatCallback)
  {
    super(paramContext, paramWindow, paramAppCompatCallback);
  }
  
  private void applyFixedSizeWindow()
  {
    ContentFrameLayout localContentFrameLayout = (ContentFrameLayout)mSubDecor.findViewById(16908290);
    localContentFrameLayout.setDecorPadding(mWindowDecor.getPaddingLeft(), mWindowDecor.getPaddingTop(), mWindowDecor.getPaddingRight(), mWindowDecor.getPaddingBottom());
    TypedArray localTypedArray = mContext.obtainStyledAttributes(R.styleable.Theme);
    localTypedArray.getValue(R.styleable.Theme_windowMinWidthMajor, localContentFrameLayout.getMinWidthMajor());
    localTypedArray.getValue(R.styleable.Theme_windowMinWidthMinor, localContentFrameLayout.getMinWidthMinor());
    if (localTypedArray.hasValue(R.styleable.Theme_windowFixedWidthMajor)) {
      localTypedArray.getValue(R.styleable.Theme_windowFixedWidthMajor, localContentFrameLayout.getFixedWidthMajor());
    }
    if (localTypedArray.hasValue(R.styleable.Theme_windowFixedWidthMinor)) {
      localTypedArray.getValue(R.styleable.Theme_windowFixedWidthMinor, localContentFrameLayout.getFixedWidthMinor());
    }
    if (localTypedArray.hasValue(R.styleable.Theme_windowFixedHeightMajor)) {
      localTypedArray.getValue(R.styleable.Theme_windowFixedHeightMajor, localContentFrameLayout.getFixedHeightMajor());
    }
    if (localTypedArray.hasValue(R.styleable.Theme_windowFixedHeightMinor)) {
      localTypedArray.getValue(R.styleable.Theme_windowFixedHeightMinor, localContentFrameLayout.getFixedHeightMinor());
    }
    localTypedArray.recycle();
    localContentFrameLayout.requestLayout();
  }
  
  private void callOnPanelClosed(int paramInt, PanelFeatureState paramPanelFeatureState, Menu paramMenu)
  {
    Object localObject1 = paramPanelFeatureState;
    Object localObject2 = paramMenu;
    if (paramMenu == null)
    {
      PanelFeatureState localPanelFeatureState = paramPanelFeatureState;
      if (paramPanelFeatureState == null)
      {
        localPanelFeatureState = paramPanelFeatureState;
        if (paramInt >= 0)
        {
          localPanelFeatureState = paramPanelFeatureState;
          if (paramInt < mPanels.length) {
            localPanelFeatureState = mPanels[paramInt];
          }
        }
      }
      localObject1 = localPanelFeatureState;
      localObject2 = paramMenu;
      if (localPanelFeatureState != null)
      {
        localObject2 = menu;
        localObject1 = localPanelFeatureState;
      }
    }
    if ((localObject1 != null) && (!isOpen)) {}
    while (isDestroyed()) {
      return;
    }
    mOriginalWindowCallback.onPanelClosed(paramInt, (Menu)localObject2);
  }
  
  private void checkCloseActionMenu(MenuBuilder paramMenuBuilder)
  {
    if (mClosingActionMenu) {
      return;
    }
    mClosingActionMenu = true;
    mDecorContentParent.dismissPopups();
    Window.Callback localCallback = getWindowCallback();
    if ((localCallback != null) && (!isDestroyed())) {
      localCallback.onPanelClosed(108, paramMenuBuilder);
    }
    mClosingActionMenu = false;
  }
  
  private void closePanel(int paramInt)
  {
    closePanel(getPanelState(paramInt, true), true);
  }
  
  private void closePanel(PanelFeatureState paramPanelFeatureState, boolean paramBoolean)
  {
    if ((paramBoolean) && (featureId == 0) && (mDecorContentParent != null) && (mDecorContentParent.isOverflowMenuShowing())) {
      checkCloseActionMenu(menu);
    }
    do
    {
      return;
      WindowManager localWindowManager = (WindowManager)mContext.getSystemService("window");
      if ((localWindowManager != null) && (isOpen) && (decorView != null))
      {
        localWindowManager.removeView(decorView);
        if (paramBoolean) {
          callOnPanelClosed(featureId, paramPanelFeatureState, null);
        }
      }
      isPrepared = false;
      isHandled = false;
      isOpen = false;
      shownPanelView = null;
      refreshDecorView = true;
    } while (mPreparedPanel != paramPanelFeatureState);
    mPreparedPanel = null;
  }
  
  private ViewGroup createSubDecor()
  {
    Object localObject = mContext.obtainStyledAttributes(R.styleable.Theme);
    if (!((TypedArray)localObject).hasValue(R.styleable.Theme_windowActionBar))
    {
      ((TypedArray)localObject).recycle();
      throw new IllegalStateException("You need to use a Theme.AppCompat theme (or descendant) with this activity.");
    }
    if (((TypedArray)localObject).getBoolean(R.styleable.Theme_windowNoTitle, false))
    {
      requestWindowFeature(1);
      if (((TypedArray)localObject).getBoolean(R.styleable.Theme_windowActionBarOverlay, false)) {
        requestWindowFeature(109);
      }
      if (((TypedArray)localObject).getBoolean(R.styleable.Theme_windowActionModeOverlay, false)) {
        requestWindowFeature(10);
      }
      mIsFloating = ((TypedArray)localObject).getBoolean(R.styleable.Theme_android_windowIsFloating, false);
      ((TypedArray)localObject).recycle();
      localObject = LayoutInflater.from(mContext);
      if (mWindowNoTitle) {
        break label422;
      }
      if (!mIsFloating) {
        break label263;
      }
      localObject = (ViewGroup)((LayoutInflater)localObject).inflate(R.layout.abc_dialog_title_material, null);
      mOverlayActionBar = false;
      mHasActionBar = false;
    }
    for (;;)
    {
      if (localObject == null)
      {
        throw new IllegalArgumentException("AppCompat does not support the current theme features: { windowActionBar: " + mHasActionBar + ", windowActionBarOverlay: " + mOverlayActionBar + ", android:windowIsFloating: " + mIsFloating + ", windowActionModeOverlay: " + mOverlayActionMode + ", windowNoTitle: " + mWindowNoTitle + " }");
        if (!((TypedArray)localObject).getBoolean(R.styleable.Theme_windowActionBar, false)) {
          break;
        }
        requestWindowFeature(108);
        break;
        label263:
        if (!mHasActionBar) {
          break label624;
        }
        localObject = new TypedValue();
        mContext.getTheme().resolveAttribute(R.attr.actionBarTheme, (TypedValue)localObject, true);
        if (resourceId != 0) {}
        for (localObject = new ContextThemeWrapper(mContext, resourceId);; localObject = mContext)
        {
          localObject = (ViewGroup)LayoutInflater.from((Context)localObject).inflate(R.layout.abc_screen_toolbar, null);
          mDecorContentParent = ((DecorContentParent)((ViewGroup)localObject).findViewById(R.id.decor_content_parent));
          mDecorContentParent.setWindowCallback(getWindowCallback());
          if (mOverlayActionBar) {
            mDecorContentParent.initFeature(109);
          }
          if (mFeatureProgress) {
            mDecorContentParent.initFeature(2);
          }
          if (mFeatureIndeterminateProgress) {
            mDecorContentParent.initFeature(5);
          }
          break;
        }
        label422:
        if (mOverlayActionMode) {}
        for (localObject = (ViewGroup)((LayoutInflater)localObject).inflate(R.layout.abc_screen_simple_overlay_action_mode, null);; localObject = (ViewGroup)((LayoutInflater)localObject).inflate(R.layout.abc_screen_simple, null))
        {
          if (Build.VERSION.SDK_INT < 21) {
            break label479;
          }
          ViewCompat.setOnApplyWindowInsetsListener((View)localObject, new AppCompatDelegateImplV7.2(this));
          break;
        }
        label479:
        ((FitWindowsViewGroup)localObject).setOnFitSystemWindowsListener(new AppCompatDelegateImplV7.3(this));
        continue;
      }
      if (mDecorContentParent == null) {
        mTitleView = ((TextView)((ViewGroup)localObject).findViewById(R.id.title));
      }
      ViewUtils.makeOptionalFitsSystemWindows((View)localObject);
      ViewGroup localViewGroup = (ViewGroup)mWindow.findViewById(16908290);
      ContentFrameLayout localContentFrameLayout = (ContentFrameLayout)((ViewGroup)localObject).findViewById(R.id.action_bar_activity_content);
      while (localViewGroup.getChildCount() > 0)
      {
        View localView = localViewGroup.getChildAt(0);
        localViewGroup.removeViewAt(0);
        localContentFrameLayout.addView(localView);
      }
      mWindow.setContentView((View)localObject);
      localViewGroup.setId(-1);
      localContentFrameLayout.setId(16908290);
      if ((localViewGroup instanceof FrameLayout)) {
        ((FrameLayout)localViewGroup).setForeground(null);
      }
      localContentFrameLayout.setAttachListener(new AppCompatDelegateImplV7.4(this));
      return (ViewGroup)localObject;
      label624:
      localObject = null;
    }
  }
  
  private void dismissPopups()
  {
    if (mDecorContentParent != null) {
      mDecorContentParent.dismissPopups();
    }
    if (mActionModePopup != null)
    {
      mWindowDecor.removeCallbacks(mShowActionModePopup);
      if (!mActionModePopup.isShowing()) {}
    }
    try
    {
      mActionModePopup.dismiss();
      mActionModePopup = null;
      endOnGoingFadeAnimation();
      PanelFeatureState localPanelFeatureState = getPanelState(0, false);
      if ((localPanelFeatureState != null) && (menu != null)) {
        menu.close();
      }
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;) {}
    }
  }
  
  private void doInvalidatePanelMenu(int paramInt)
  {
    PanelFeatureState localPanelFeatureState = getPanelState(paramInt, true);
    if (menu != null)
    {
      Bundle localBundle = new Bundle();
      menu.saveActionViewStates(localBundle);
      if (localBundle.size() > 0) {
        frozenActionViewState = localBundle;
      }
      menu.stopDispatchingItemsChanged();
      menu.clear();
    }
    refreshMenuContent = true;
    refreshDecorView = true;
    if (((paramInt == 108) || (paramInt == 0)) && (mDecorContentParent != null))
    {
      localPanelFeatureState = getPanelState(0, false);
      if (localPanelFeatureState != null)
      {
        isPrepared = false;
        preparePanel(localPanelFeatureState, null);
      }
    }
  }
  
  private void endOnGoingFadeAnimation()
  {
    if (mFadeAnim != null) {
      mFadeAnim.cancel();
    }
  }
  
  private void ensureSubDecor()
  {
    if (!mSubDecorInstalled)
    {
      mSubDecor = createSubDecor();
      Object localObject = getTitle();
      if (!TextUtils.isEmpty((CharSequence)localObject)) {
        onTitleChanged((CharSequence)localObject);
      }
      applyFixedSizeWindow();
      onSubDecorInstalled(mSubDecor);
      mSubDecorInstalled = true;
      localObject = getPanelState(0, false);
      if ((!isDestroyed()) && ((localObject == null) || (menu == null))) {
        invalidatePanelMenu(108);
      }
    }
  }
  
  private PanelFeatureState findMenuPanel(Menu paramMenu)
  {
    PanelFeatureState[] arrayOfPanelFeatureState = mPanels;
    int i;
    int j;
    if (arrayOfPanelFeatureState != null)
    {
      i = arrayOfPanelFeatureState.length;
      j = 0;
    }
    for (;;)
    {
      if (j >= i) {
        break label57;
      }
      PanelFeatureState localPanelFeatureState = arrayOfPanelFeatureState[j];
      if ((localPanelFeatureState != null) && (menu == paramMenu))
      {
        return localPanelFeatureState;
        i = 0;
        break;
      }
      j += 1;
    }
    label57:
    return null;
  }
  
  private PanelFeatureState getPanelState(int paramInt, boolean paramBoolean)
  {
    Object localObject2 = mPanels;
    Object localObject1;
    if (localObject2 != null)
    {
      localObject1 = localObject2;
      if (localObject2.length > paramInt) {}
    }
    else
    {
      localObject1 = new PanelFeatureState[paramInt + 1];
      if (localObject2 != null) {
        System.arraycopy(localObject2, 0, localObject1, 0, localObject2.length);
      }
      mPanels = ((PanelFeatureState[])localObject1);
    }
    localObject2 = localObject1[paramInt];
    if (localObject2 == null)
    {
      localObject2 = new PanelFeatureState(paramInt);
      localObject1[paramInt] = localObject2;
      return (PanelFeatureState)localObject2;
    }
    return (PanelFeatureState)localObject2;
  }
  
  private boolean initializePanelContent(PanelFeatureState paramPanelFeatureState)
  {
    if (createdPanelView != null)
    {
      shownPanelView = createdPanelView;
      return true;
    }
    if (menu == null) {
      return false;
    }
    if (mPanelMenuPresenterCallback == null) {
      mPanelMenuPresenterCallback = new PanelMenuPresenterCallback(null);
    }
    shownPanelView = ((View)paramPanelFeatureState.getListMenuView(mPanelMenuPresenterCallback));
    if (shownPanelView != null) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  private boolean initializePanelDecor(PanelFeatureState paramPanelFeatureState)
  {
    paramPanelFeatureState.setStyle(getActionBarThemedContext());
    decorView = new ListMenuDecorView(listPresenterContext);
    gravity = 81;
    return true;
  }
  
  private boolean initializePanelMenu(PanelFeatureState paramPanelFeatureState)
  {
    Context localContext = mContext;
    TypedValue localTypedValue;
    Resources.Theme localTheme;
    Object localObject1;
    if (((featureId == 0) || (featureId == 108)) && (mDecorContentParent != null))
    {
      localTypedValue = new TypedValue();
      localTheme = localContext.getTheme();
      localTheme.resolveAttribute(R.attr.actionBarTheme, localTypedValue, true);
      localObject1 = null;
      if (resourceId != 0)
      {
        localObject1 = localContext.getResources().newTheme();
        ((Resources.Theme)localObject1).setTo(localTheme);
        ((Resources.Theme)localObject1).applyStyle(resourceId, true);
        ((Resources.Theme)localObject1).resolveAttribute(R.attr.actionBarWidgetTheme, localTypedValue, true);
        Object localObject2 = localObject1;
        if (resourceId != 0)
        {
          localObject2 = localObject1;
          if (localObject1 == null)
          {
            localObject2 = localContext.getResources().newTheme();
            ((Resources.Theme)localObject2).setTo(localTheme);
          }
          ((Resources.Theme)localObject2).applyStyle(resourceId, true);
        }
        if (localObject2 == null) {
          break label203;
        }
        localObject1 = new ContextThemeWrapper(localContext, 0);
        ((Context)localObject1).getTheme().setTo((Resources.Theme)localObject2);
      }
    }
    for (;;)
    {
      localObject1 = new MenuBuilder((Context)localObject1);
      ((MenuBuilder)localObject1).setCallback(this);
      paramPanelFeatureState.setMenu((MenuBuilder)localObject1);
      return true;
      localTheme.resolveAttribute(R.attr.actionBarWidgetTheme, localTypedValue, true);
      break;
      label203:
      localObject1 = localContext;
    }
  }
  
  private void invalidatePanelMenu(int paramInt)
  {
    mInvalidatePanelMenuFeatures |= 1 << paramInt;
    if ((!mInvalidatePanelMenuPosted) && (mWindowDecor != null))
    {
      ViewCompat.postOnAnimation(mWindowDecor, mInvalidatePanelMenuRunnable);
      mInvalidatePanelMenuPosted = true;
    }
  }
  
  private boolean onKeyDownPanel(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramKeyEvent.getRepeatCount() == 0)
    {
      PanelFeatureState localPanelFeatureState = getPanelState(paramInt, true);
      if (!isOpen) {
        return preparePanel(localPanelFeatureState, paramKeyEvent);
      }
    }
    return false;
  }
  
  private boolean onKeyUpPanel(int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool2 = true;
    if (mActionMode != null) {
      return false;
    }
    PanelFeatureState localPanelFeatureState = getPanelState(paramInt, true);
    if ((paramInt == 0) && (mDecorContentParent != null) && (mDecorContentParent.canShowOverflowMenu()) && (!ViewConfigurationCompat.hasPermanentMenuKey(ViewConfiguration.get(mContext)))) {
      if (!mDecorContentParent.isOverflowMenuShowing())
      {
        if ((isDestroyed()) || (!preparePanel(localPanelFeatureState, paramKeyEvent))) {
          break label229;
        }
        bool1 = mDecorContentParent.showOverflowMenu();
      }
    }
    for (;;)
    {
      if (bool1)
      {
        paramKeyEvent = (AudioManager)mContext.getSystemService("audio");
        if (paramKeyEvent == null) {
          break label216;
        }
        paramKeyEvent.playSoundEffect(0);
      }
      label122:
      return bool1;
      bool1 = mDecorContentParent.hideOverflowMenu();
      continue;
      if ((!isOpen) && (!isHandled)) {
        break;
      }
      bool1 = isOpen;
      closePanel(localPanelFeatureState, true);
    }
    if (isPrepared)
    {
      if (!refreshMenuContent) {
        break label234;
      }
      isPrepared = false;
    }
    label216:
    label229:
    label234:
    for (boolean bool1 = preparePanel(localPanelFeatureState, paramKeyEvent);; bool1 = true)
    {
      if (bool1)
      {
        openPanel(localPanelFeatureState, paramKeyEvent);
        bool1 = bool2;
        break;
        Log.w("AppCompatDelegate", "Couldn't get audio manager");
        break label122;
      }
      bool1 = false;
      break;
    }
  }
  
  private void openPanel(PanelFeatureState paramPanelFeatureState, KeyEvent paramKeyEvent)
  {
    int k = -1;
    if ((isOpen) || (isDestroyed())) {}
    Object localObject;
    int i;
    label112:
    label117:
    label121:
    label123:
    do
    {
      do
      {
        for (;;)
        {
          return;
          if (featureId == 0)
          {
            localObject = mContext;
            if ((getResourcesgetConfigurationscreenLayout & 0xF) != 4) {
              break label112;
            }
            i = 1;
            if (getApplicationInfotargetSdkVersion < 11) {
              break label117;
            }
          }
          for (int j = 1;; j = 0)
          {
            if ((i != 0) && (j != 0)) {
              break label121;
            }
            localObject = getWindowCallback();
            if ((localObject == null) || (((Window.Callback)localObject).onMenuOpened(featureId, menu))) {
              break label123;
            }
            closePanel(paramPanelFeatureState, true);
            return;
            i = 0;
            break;
          }
        }
        localObject = (WindowManager)mContext.getSystemService("window");
      } while ((localObject == null) || (!preparePanel(paramPanelFeatureState, paramKeyEvent)));
      if ((decorView != null) && (!refreshDecorView)) {
        break label400;
      }
      if (decorView != null) {
        break;
      }
    } while ((!initializePanelDecor(paramPanelFeatureState)) || (decorView == null));
    label188:
    if ((initializePanelContent(paramPanelFeatureState)) && (paramPanelFeatureState.hasPanelItems()))
    {
      paramKeyEvent = shownPanelView.getLayoutParams();
      if (paramKeyEvent != null) {
        break label436;
      }
      paramKeyEvent = new ViewGroup.LayoutParams(-2, -2);
    }
    label400:
    label436:
    for (;;)
    {
      i = background;
      decorView.setBackgroundResource(i);
      ViewParent localViewParent = shownPanelView.getParent();
      if ((localViewParent != null) && ((localViewParent instanceof ViewGroup))) {
        ((ViewGroup)localViewParent).removeView(shownPanelView);
      }
      decorView.addView(shownPanelView, paramKeyEvent);
      if (!shownPanelView.hasFocus()) {
        shownPanelView.requestFocus();
      }
      i = -2;
      for (;;)
      {
        isHandled = false;
        paramKeyEvent = new WindowManager.LayoutParams(i, -2, x, y, 1002, 8519680, -3);
        gravity = gravity;
        windowAnimations = windowAnimations;
        ((WindowManager)localObject).addView(decorView, paramKeyEvent);
        isOpen = true;
        return;
        if ((!refreshDecorView) || (decorView.getChildCount() <= 0)) {
          break label188;
        }
        decorView.removeAllViews();
        break label188;
        break;
        if (createdPanelView != null)
        {
          paramKeyEvent = createdPanelView.getLayoutParams();
          if (paramKeyEvent != null)
          {
            i = k;
            if (width == -1) {
              continue;
            }
          }
        }
        i = -2;
      }
    }
  }
  
  private boolean performPanelShortcut(PanelFeatureState paramPanelFeatureState, int paramInt1, KeyEvent paramKeyEvent, int paramInt2)
  {
    boolean bool2 = false;
    boolean bool1 = false;
    if (paramKeyEvent.isSystem()) {
      bool2 = bool1;
    }
    do
    {
      do
      {
        do
        {
          return bool2;
          if (!isPrepared)
          {
            bool1 = bool2;
            if (!preparePanel(paramPanelFeatureState, paramKeyEvent)) {}
          }
          else
          {
            bool1 = bool2;
            if (menu != null) {
              bool1 = menu.performShortcut(paramInt1, paramKeyEvent, paramInt2);
            }
          }
          bool2 = bool1;
        } while (!bool1);
        bool2 = bool1;
      } while ((paramInt2 & 0x1) != 0);
      bool2 = bool1;
    } while (mDecorContentParent != null);
    closePanel(paramPanelFeatureState, true);
    return bool1;
  }
  
  private boolean preparePanel(PanelFeatureState paramPanelFeatureState, KeyEvent paramKeyEvent)
  {
    if (isDestroyed()) {
      return false;
    }
    if (isPrepared) {
      return true;
    }
    if ((mPreparedPanel != null) && (mPreparedPanel != paramPanelFeatureState)) {
      closePanel(mPreparedPanel, false);
    }
    Window.Callback localCallback = getWindowCallback();
    if (localCallback != null) {
      createdPanelView = localCallback.onCreatePanelView(featureId);
    }
    if ((featureId == 0) || (featureId == 108)) {}
    for (int i = 1;; i = 0)
    {
      if ((i != 0) && (mDecorContentParent != null)) {
        mDecorContentParent.setMenuPrepared();
      }
      if ((createdPanelView != null) || ((i != 0) && ((peekSupportActionBar() instanceof ToolbarActionBar)))) {
        break label408;
      }
      if ((menu != null) && (!refreshMenuContent)) {
        break label278;
      }
      if ((menu == null) && ((!initializePanelMenu(paramPanelFeatureState)) || (menu == null))) {
        break;
      }
      if ((i != 0) && (mDecorContentParent != null))
      {
        if (mActionMenuPresenterCallback == null) {
          mActionMenuPresenterCallback = new ActionMenuPresenterCallback(null);
        }
        mDecorContentParent.setMenu(menu, mActionMenuPresenterCallback);
      }
      menu.stopDispatchingItemsChanged();
      if (localCallback.onCreatePanelMenu(featureId, menu)) {
        break label273;
      }
      paramPanelFeatureState.setMenu(null);
      if ((i == 0) || (mDecorContentParent == null)) {
        break;
      }
      mDecorContentParent.setMenu(null, mActionMenuPresenterCallback);
      return false;
    }
    label273:
    refreshMenuContent = false;
    label278:
    menu.stopDispatchingItemsChanged();
    if (frozenActionViewState != null)
    {
      menu.restoreActionViewStates(frozenActionViewState);
      frozenActionViewState = null;
    }
    if (!localCallback.onPreparePanel(0, createdPanelView, menu))
    {
      if ((i != 0) && (mDecorContentParent != null)) {
        mDecorContentParent.setMenu(null, mActionMenuPresenterCallback);
      }
      menu.startDispatchingItemsChanged();
      return false;
    }
    if (paramKeyEvent != null)
    {
      i = paramKeyEvent.getDeviceId();
      if (KeyCharacterMap.load(i).getKeyboardType() == 1) {
        break label430;
      }
    }
    label408:
    label430:
    for (boolean bool = true;; bool = false)
    {
      qwertyMode = bool;
      menu.setQwertyMode(qwertyMode);
      menu.startDispatchingItemsChanged();
      isPrepared = true;
      isHandled = false;
      mPreparedPanel = paramPanelFeatureState;
      return true;
      i = -1;
      break;
    }
  }
  
  private void reopenMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    if ((mDecorContentParent != null) && (mDecorContentParent.canShowOverflowMenu()) && ((!ViewConfigurationCompat.hasPermanentMenuKey(ViewConfiguration.get(mContext))) || (mDecorContentParent.isOverflowMenuShowPending())))
    {
      paramMenuBuilder = getWindowCallback();
      if ((!mDecorContentParent.isOverflowMenuShowing()) || (!paramBoolean)) {
        if ((paramMenuBuilder != null) && (!isDestroyed()))
        {
          if ((mInvalidatePanelMenuPosted) && ((mInvalidatePanelMenuFeatures & 0x1) != 0))
          {
            mWindowDecor.removeCallbacks(mInvalidatePanelMenuRunnable);
            mInvalidatePanelMenuRunnable.run();
          }
          PanelFeatureState localPanelFeatureState = getPanelState(0, true);
          if ((menu != null) && (!refreshMenuContent) && (paramMenuBuilder.onPreparePanel(0, createdPanelView, menu)))
          {
            paramMenuBuilder.onMenuOpened(108, menu);
            mDecorContentParent.showOverflowMenu();
          }
        }
      }
      do
      {
        return;
        mDecorContentParent.hideOverflowMenu();
      } while (isDestroyed());
      paramMenuBuilder.onPanelClosed(108, getPanelState0menu);
      return;
    }
    paramMenuBuilder = getPanelState(0, true);
    refreshDecorView = true;
    closePanel(paramMenuBuilder, false);
    openPanel(paramMenuBuilder, null);
  }
  
  private int sanitizeWindowFeatureId(int paramInt)
  {
    int i;
    if (paramInt == 8)
    {
      Log.i("AppCompatDelegate", "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR id when requesting this feature.");
      i = 108;
    }
    do
    {
      return i;
      i = paramInt;
    } while (paramInt != 9);
    Log.i("AppCompatDelegate", "You should now use the AppCompatDelegate.FEATURE_SUPPORT_ACTION_BAR_OVERLAY id when requesting this feature.");
    return 109;
  }
  
  private boolean shouldInheritContext(ViewParent paramViewParent)
  {
    if (paramViewParent == null)
    {
      return false;
      paramViewParent = paramViewParent.getParent();
    }
    for (;;)
    {
      if (paramViewParent == null) {
        return true;
      }
      if ((paramViewParent != mWindowDecor) && ((paramViewParent instanceof View)) && (!ViewCompat.isAttachedToWindow((View)paramViewParent))) {
        break;
      }
      return false;
    }
  }
  
  private void throwFeatureRequestIfSubDecorInstalled()
  {
    if (mSubDecorInstalled) {
      throw new AndroidRuntimeException("Window feature must be requested before adding content");
    }
  }
  
  private int updateStatusGuard(int paramInt)
  {
    int j = 1;
    int k = 1;
    int m = 0;
    Object localObject1;
    Object localObject2;
    int i;
    if ((mActionModeView != null) && ((mActionModeView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)))
    {
      localObject1 = (ViewGroup.MarginLayoutParams)mActionModeView.getLayoutParams();
      if (mActionModeView.isShown())
      {
        if (mTempRect1 == null)
        {
          mTempRect1 = new Rect();
          mTempRect2 = new Rect();
        }
        localObject2 = mTempRect1;
        Rect localRect = mTempRect2;
        ((Rect)localObject2).set(0, paramInt, 0, 0);
        ViewUtils.computeFitSystemWindows(mSubDecor, (Rect)localObject2, localRect);
        if (top == 0)
        {
          i = paramInt;
          if (topMargin == i) {
            break label355;
          }
          topMargin = paramInt;
          if (mStatusGuard != null) {
            break label279;
          }
          mStatusGuard = new View(mContext);
          mStatusGuard.setBackgroundColor(mContext.getResources().getColor(R.color.abc_input_method_navigation_guard));
          mSubDecor.addView(mStatusGuard, -1, new ViewGroup.LayoutParams(-1, paramInt));
          i = 1;
          label201:
          if (mStatusGuard == null) {
            break label317;
          }
          label208:
          j = paramInt;
          if (!mOverlayActionMode)
          {
            j = paramInt;
            if (k != 0) {
              j = 0;
            }
          }
          paramInt = j;
          j = i;
          i = k;
          label233:
          if (j != 0) {
            mActionModeView.setLayoutParams((ViewGroup.LayoutParams)localObject1);
          }
        }
      }
    }
    for (;;)
    {
      if (mStatusGuard != null)
      {
        localObject1 = mStatusGuard;
        if (i == 0) {
          break label342;
        }
      }
      label279:
      label317:
      label342:
      for (i = m;; i = 8)
      {
        ((View)localObject1).setVisibility(i);
        return paramInt;
        i = 0;
        break;
        localObject2 = mStatusGuard.getLayoutParams();
        if (height != paramInt)
        {
          height = paramInt;
          mStatusGuard.setLayoutParams((ViewGroup.LayoutParams)localObject2);
        }
        i = 1;
        break label201;
        k = 0;
        break label208;
        if (topMargin == 0) {
          break label348;
        }
        topMargin = 0;
        i = 0;
        break label233;
      }
      label348:
      j = 0;
      i = 0;
      break label233;
      label355:
      i = 0;
      break label201;
      i = 0;
    }
  }
  
  public void addContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    ensureSubDecor();
    ((ViewGroup)mSubDecor.findViewById(16908290)).addView(paramView, paramLayoutParams);
    mOriginalWindowCallback.onContentChanged();
  }
  
  View callActivityOnCreateView(View paramView, String paramString, Context paramContext, AttributeSet paramAttributeSet)
  {
    if ((mOriginalWindowCallback instanceof LayoutInflater.Factory))
    {
      paramView = ((LayoutInflater.Factory)mOriginalWindowCallback).onCreateView(paramString, paramContext, paramAttributeSet);
      if (paramView != null) {
        return paramView;
      }
    }
    return null;
  }
  
  public View createView(View paramView, String paramString, @NonNull Context paramContext, @NonNull AttributeSet paramAttributeSet)
  {
    boolean bool1;
    if (Build.VERSION.SDK_INT < 21)
    {
      bool1 = true;
      if (mAppCompatViewInflater == null) {
        mAppCompatViewInflater = new AppCompatViewInflater();
      }
      if ((!bool1) || (!mSubDecorInstalled) || (!shouldInheritContext((ViewParent)paramView))) {
        break label79;
      }
    }
    label79:
    for (boolean bool2 = true;; bool2 = false)
    {
      return mAppCompatViewInflater.createView(paramView, paramString, paramContext, paramAttributeSet, bool2, bool1, true);
      bool1 = false;
      break;
    }
  }
  
  boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    int i = 1;
    if ((paramKeyEvent.getKeyCode() == 82) && (mOriginalWindowCallback.dispatchKeyEvent(paramKeyEvent))) {
      return true;
    }
    int j = paramKeyEvent.getKeyCode();
    if (paramKeyEvent.getAction() == 0) {}
    while (i != 0)
    {
      return onKeyDown(j, paramKeyEvent);
      i = 0;
    }
    return onKeyUp(j, paramKeyEvent);
  }
  
  ViewGroup getSubDecor()
  {
    return mSubDecor;
  }
  
  public boolean hasWindowFeature(int paramInt)
  {
    paramInt = sanitizeWindowFeatureId(paramInt);
    switch (paramInt)
    {
    default: 
      return mWindow.hasFeature(paramInt);
    case 108: 
      return mHasActionBar;
    case 109: 
      return mOverlayActionBar;
    case 10: 
      return mOverlayActionMode;
    case 2: 
      return mFeatureProgress;
    case 5: 
      return mFeatureIndeterminateProgress;
    }
    return mWindowNoTitle;
  }
  
  public void initWindowDecorActionBar()
  {
    ensureSubDecor();
    if ((!mHasActionBar) || (mActionBar != null)) {}
    for (;;)
    {
      return;
      if ((mOriginalWindowCallback instanceof Activity)) {
        mActionBar = new WindowDecorActionBar((Activity)mOriginalWindowCallback, mOverlayActionBar);
      }
      while (mActionBar != null)
      {
        mActionBar.setDefaultDisplayHomeAsUpEnabled(mEnableDefaultActionBarUp);
        return;
        if ((mOriginalWindowCallback instanceof Dialog)) {
          mActionBar = new WindowDecorActionBar((Dialog)mOriginalWindowCallback);
        }
      }
    }
  }
  
  public void installViewFactory()
  {
    LayoutInflater localLayoutInflater = LayoutInflater.from(mContext);
    if (localLayoutInflater.getFactory() == null)
    {
      LayoutInflaterCompat.setFactory(localLayoutInflater, this);
      return;
    }
    Log.i("AppCompatDelegate", "The Activity's LayoutInflater already has a Factory installed so we can not install AppCompat's");
  }
  
  public void invalidateOptionsMenu()
  {
    ActionBar localActionBar = getSupportActionBar();
    if ((localActionBar != null) && (localActionBar.invalidateOptionsMenu())) {
      return;
    }
    invalidatePanelMenu(0);
  }
  
  boolean onBackPressed()
  {
    if (mActionMode != null) {
      mActionMode.finish();
    }
    ActionBar localActionBar;
    do
    {
      return true;
      localActionBar = getSupportActionBar();
    } while ((localActionBar != null) && (localActionBar.collapseActionView()));
    return false;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if ((mHasActionBar) && (mSubDecorInstalled))
    {
      ActionBar localActionBar = getSupportActionBar();
      if (localActionBar != null) {
        localActionBar.onConfigurationChanged(paramConfiguration);
      }
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    mWindowDecor = ((ViewGroup)mWindow.getDecorView());
    if (((mOriginalWindowCallback instanceof Activity)) && (NavUtils.getParentActivityName((Activity)mOriginalWindowCallback) != null))
    {
      paramBundle = peekSupportActionBar();
      if (paramBundle == null) {
        mEnableDefaultActionBarUp = true;
      }
    }
    else
    {
      return;
    }
    paramBundle.setDefaultDisplayHomeAsUpEnabled(true);
  }
  
  public final View onCreateView(View paramView, String paramString, Context paramContext, AttributeSet paramAttributeSet)
  {
    View localView = callActivityOnCreateView(paramView, paramString, paramContext, paramAttributeSet);
    if (localView != null) {
      return localView;
    }
    return createView(paramView, paramString, paramContext, paramAttributeSet);
  }
  
  boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool = true;
    switch (paramInt)
    {
    default: 
      if (Build.VERSION.SDK_INT < 11) {
        onKeyShortcut(paramInt, paramKeyEvent);
      }
      return false;
    case 82: 
      onKeyDownPanel(0, paramKeyEvent);
      return true;
    }
    if ((paramKeyEvent.getFlags() & 0x80) != 0) {}
    for (;;)
    {
      mLongPressBackDown = bool;
      break;
      bool = false;
    }
  }
  
  boolean onKeyShortcut(int paramInt, KeyEvent paramKeyEvent)
  {
    Object localObject = getSupportActionBar();
    if ((localObject != null) && (((ActionBar)localObject).onKeyShortcut(paramInt, paramKeyEvent))) {}
    boolean bool;
    do
    {
      do
      {
        return true;
        if ((mPreparedPanel == null) || (!performPanelShortcut(mPreparedPanel, paramKeyEvent.getKeyCode(), paramKeyEvent, 1))) {
          break;
        }
      } while (mPreparedPanel == null);
      mPreparedPanel.isHandled = true;
      return true;
      if (mPreparedPanel != null) {
        break;
      }
      localObject = getPanelState(0, true);
      preparePanel((PanelFeatureState)localObject, paramKeyEvent);
      bool = performPanelShortcut((PanelFeatureState)localObject, paramKeyEvent.getKeyCode(), paramKeyEvent, 1);
      isPrepared = false;
    } while (bool);
    return false;
  }
  
  boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool1 = true;
    switch (paramInt)
    {
    }
    do
    {
      bool1 = false;
      boolean bool2;
      do
      {
        return bool1;
        onKeyUpPanel(0, paramKeyEvent);
        return true;
        bool2 = mLongPressBackDown;
        mLongPressBackDown = false;
        paramKeyEvent = getPanelState(0, false);
        if ((paramKeyEvent == null) || (!isOpen)) {
          break;
        }
      } while (bool2);
      closePanel(paramKeyEvent, true);
      return true;
    } while (!onBackPressed());
    return true;
  }
  
  public boolean onMenuItemSelected(MenuBuilder paramMenuBuilder, MenuItem paramMenuItem)
  {
    Window.Callback localCallback = getWindowCallback();
    if ((localCallback != null) && (!isDestroyed()))
    {
      paramMenuBuilder = findMenuPanel(paramMenuBuilder.getRootMenu());
      if (paramMenuBuilder != null) {
        return localCallback.onMenuItemSelected(featureId, paramMenuItem);
      }
    }
    return false;
  }
  
  public void onMenuModeChange(MenuBuilder paramMenuBuilder)
  {
    reopenMenu(paramMenuBuilder, true);
  }
  
  boolean onMenuOpened(int paramInt, Menu paramMenu)
  {
    if (paramInt == 108)
    {
      paramMenu = getSupportActionBar();
      if (paramMenu != null) {
        paramMenu.dispatchMenuVisibilityChanged(true);
      }
      return true;
    }
    return false;
  }
  
  void onPanelClosed(int paramInt, Menu paramMenu)
  {
    if (paramInt == 108)
    {
      paramMenu = getSupportActionBar();
      if (paramMenu != null) {
        paramMenu.dispatchMenuVisibilityChanged(false);
      }
    }
    do
    {
      do
      {
        return;
      } while (paramInt != 0);
      paramMenu = getPanelState(paramInt, true);
    } while (!isOpen);
    closePanel(paramMenu, false);
  }
  
  public void onPostCreate(Bundle paramBundle)
  {
    ensureSubDecor();
  }
  
  public void onPostResume()
  {
    ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null) {
      localActionBar.setShowHideAnimationEnabled(true);
    }
  }
  
  public void onStop()
  {
    ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null) {
      localActionBar.setShowHideAnimationEnabled(false);
    }
  }
  
  void onSubDecorInstalled(ViewGroup paramViewGroup) {}
  
  void onTitleChanged(CharSequence paramCharSequence)
  {
    if (mDecorContentParent != null) {
      mDecorContentParent.setWindowTitle(paramCharSequence);
    }
    do
    {
      return;
      if (peekSupportActionBar() != null)
      {
        peekSupportActionBar().setWindowTitle(paramCharSequence);
        return;
      }
    } while (mTitleView == null);
    mTitleView.setText(paramCharSequence);
  }
  
  public boolean requestWindowFeature(int paramInt)
  {
    paramInt = sanitizeWindowFeatureId(paramInt);
    if ((mWindowNoTitle) && (paramInt == 108)) {
      return false;
    }
    if ((mHasActionBar) && (paramInt == 1)) {
      mHasActionBar = false;
    }
    switch (paramInt)
    {
    default: 
      return mWindow.requestFeature(paramInt);
    case 108: 
      throwFeatureRequestIfSubDecorInstalled();
      mHasActionBar = true;
      return true;
    case 109: 
      throwFeatureRequestIfSubDecorInstalled();
      mOverlayActionBar = true;
      return true;
    case 10: 
      throwFeatureRequestIfSubDecorInstalled();
      mOverlayActionMode = true;
      return true;
    case 2: 
      throwFeatureRequestIfSubDecorInstalled();
      mFeatureProgress = true;
      return true;
    case 5: 
      throwFeatureRequestIfSubDecorInstalled();
      mFeatureIndeterminateProgress = true;
      return true;
    }
    throwFeatureRequestIfSubDecorInstalled();
    mWindowNoTitle = true;
    return true;
  }
  
  public void setContentView(int paramInt)
  {
    ensureSubDecor();
    ViewGroup localViewGroup = (ViewGroup)mSubDecor.findViewById(16908290);
    localViewGroup.removeAllViews();
    LayoutInflater.from(mContext).inflate(paramInt, localViewGroup);
    mOriginalWindowCallback.onContentChanged();
  }
  
  public void setContentView(View paramView)
  {
    ensureSubDecor();
    ViewGroup localViewGroup = (ViewGroup)mSubDecor.findViewById(16908290);
    localViewGroup.removeAllViews();
    localViewGroup.addView(paramView);
    mOriginalWindowCallback.onContentChanged();
  }
  
  public void setContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    ensureSubDecor();
    ViewGroup localViewGroup = (ViewGroup)mSubDecor.findViewById(16908290);
    localViewGroup.removeAllViews();
    localViewGroup.addView(paramView, paramLayoutParams);
    mOriginalWindowCallback.onContentChanged();
  }
  
  public void setSupportActionBar(Toolbar paramToolbar)
  {
    if (!(mOriginalWindowCallback instanceof Activity)) {
      return;
    }
    if ((getSupportActionBar() instanceof WindowDecorActionBar)) {
      throw new IllegalStateException("This Activity already has an action bar supplied by the window decor. Do not request Window.FEATURE_SUPPORT_ACTION_BAR and set windowActionBar to false in your theme to use a Toolbar instead.");
    }
    mMenuInflater = null;
    paramToolbar = new ToolbarActionBar(paramToolbar, ((Activity)mContext).getTitle(), mAppCompatWindowCallback);
    mActionBar = paramToolbar;
    mWindow.setCallback(paramToolbar.getWrappedWindowCallback());
    paramToolbar.invalidateOptionsMenu();
  }
  
  public ActionMode startSupportActionMode(ActionMode.Callback paramCallback)
  {
    if (paramCallback == null) {
      throw new IllegalArgumentException("ActionMode callback can not be null.");
    }
    if (mActionMode != null) {
      mActionMode.finish();
    }
    paramCallback = new ActionModeCallbackWrapperV7(paramCallback);
    ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null)
    {
      mActionMode = localActionBar.startActionMode(paramCallback);
      if ((mActionMode != null) && (mAppCompatCallback != null)) {
        mAppCompatCallback.onSupportActionModeStarted(mActionMode);
      }
    }
    if (mActionMode == null) {
      mActionMode = startSupportActionModeFromWindow(paramCallback);
    }
    return mActionMode;
  }
  
  ActionMode startSupportActionModeFromWindow(ActionMode.Callback paramCallback)
  {
    endOnGoingFadeAnimation();
    if (mActionMode != null) {
      mActionMode.finish();
    }
    ActionModeCallbackWrapperV7 localActionModeCallbackWrapperV7 = new ActionModeCallbackWrapperV7(paramCallback);
    if ((mAppCompatCallback != null) && (!isDestroyed())) {}
    for (;;)
    {
      try
      {
        ActionMode localActionMode = mAppCompatCallback.onWindowStartingSupportActionMode(localActionModeCallbackWrapperV7);
        if (localActionMode != null)
        {
          mActionMode = localActionMode;
          if ((mActionMode != null) && (mAppCompatCallback != null)) {
            mAppCompatCallback.onSupportActionModeStarted(mActionMode);
          }
          return mActionMode;
        }
      }
      catch (AbstractMethodError localAbstractMethodError)
      {
        localObject1 = null;
        continue;
        Object localObject2;
        if (mActionModeView == null)
        {
          if (!mIsFloating) {
            continue;
          }
          localObject2 = new TypedValue();
          localObject1 = mContext.getTheme();
          ((Resources.Theme)localObject1).resolveAttribute(R.attr.actionBarTheme, (TypedValue)localObject2, true);
          if (resourceId != 0)
          {
            Resources.Theme localTheme = mContext.getResources().newTheme();
            localTheme.setTo((Resources.Theme)localObject1);
            localTheme.applyStyle(resourceId, true);
            localObject1 = new ContextThemeWrapper(mContext, 0);
            ((Context)localObject1).getTheme().setTo(localTheme);
            mActionModeView = new ActionBarContextView((Context)localObject1);
            mActionModePopup = new PopupWindow((Context)localObject1, null, R.attr.actionModePopupWindowStyle);
            PopupWindowCompat.setWindowLayoutType(mActionModePopup, 2);
            mActionModePopup.setContentView(mActionModeView);
            mActionModePopup.setWidth(-1);
            ((Context)localObject1).getTheme().resolveAttribute(R.attr.actionBarSize, (TypedValue)localObject2, true);
            int i = TypedValue.complexToDimensionPixelSize(data, ((Context)localObject1).getResources().getDisplayMetrics());
            mActionModeView.setContentHeight(i);
            mActionModePopup.setHeight(-2);
            mShowActionModePopup = new AppCompatDelegateImplV7.5(this);
          }
        }
        else
        {
          if (mActionModeView == null) {
            continue;
          }
          endOnGoingFadeAnimation();
          mActionModeView.killMode();
          localObject1 = mActionModeView.getContext();
          localObject2 = mActionModeView;
          if (mActionModePopup != null) {
            continue;
          }
          bool = true;
          localObject1 = new StandaloneActionMode((Context)localObject1, (ActionBarContextView)localObject2, localActionModeCallbackWrapperV7, bool);
          if (!paramCallback.onCreateActionMode((ActionMode)localObject1, ((ActionMode)localObject1).getMenu())) {
            continue;
          }
          ((ActionMode)localObject1).invalidate();
          mActionModeView.initForMode((ActionMode)localObject1);
          mActionMode = ((ActionMode)localObject1);
          ViewCompat.setAlpha(mActionModeView, 0.0F);
          mFadeAnim = ViewCompat.animate(mActionModeView).alpha(1.0F);
          mFadeAnim.setListener(new AppCompatDelegateImplV7.6(this));
          if (mActionModePopup == null) {
            continue;
          }
          mWindow.getDecorView().post(mShowActionModePopup);
          continue;
        }
        localObject1 = mContext;
        continue;
        localObject1 = (ViewStubCompat)mSubDecor.findViewById(R.id.action_mode_bar_stub);
        if (localObject1 == null) {
          continue;
        }
        ((ViewStubCompat)localObject1).setLayoutInflater(LayoutInflater.from(getActionBarThemedContext()));
        mActionModeView = ((ActionBarContextView)((ViewStubCompat)localObject1).inflate());
        continue;
        boolean bool = false;
        continue;
        mActionMode = null;
        continue;
      }
      Object localObject1 = null;
    }
  }
  
  private final class ActionMenuPresenterCallback
    implements MenuPresenter.Callback
  {
    private ActionMenuPresenterCallback() {}
    
    public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
    {
      AppCompatDelegateImplV7.this.checkCloseActionMenu(paramMenuBuilder);
    }
    
    public boolean onOpenSubMenu(MenuBuilder paramMenuBuilder)
    {
      Window.Callback localCallback = getWindowCallback();
      if (localCallback != null) {
        localCallback.onMenuOpened(108, paramMenuBuilder);
      }
      return true;
    }
  }
  
  class ActionModeCallbackWrapperV7
    implements ActionMode.Callback
  {
    private ActionMode.Callback mWrapped;
    
    public ActionModeCallbackWrapperV7(ActionMode.Callback paramCallback)
    {
      mWrapped = paramCallback;
    }
    
    public boolean onActionItemClicked(ActionMode paramActionMode, MenuItem paramMenuItem)
    {
      return mWrapped.onActionItemClicked(paramActionMode, paramMenuItem);
    }
    
    public boolean onCreateActionMode(ActionMode paramActionMode, Menu paramMenu)
    {
      return mWrapped.onCreateActionMode(paramActionMode, paramMenu);
    }
    
    public void onDestroyActionMode(ActionMode paramActionMode)
    {
      mWrapped.onDestroyActionMode(paramActionMode);
      if (mActionModePopup != null) {
        mWindow.getDecorView().removeCallbacks(mShowActionModePopup);
      }
      if (mActionModeView != null)
      {
        AppCompatDelegateImplV7.this.endOnGoingFadeAnimation();
        mFadeAnim = ViewCompat.animate(mActionModeView).alpha(0.0F);
        mFadeAnim.setListener(new AppCompatDelegateImplV7.ActionModeCallbackWrapperV7.1(this));
      }
      if (mAppCompatCallback != null) {
        mAppCompatCallback.onSupportActionModeFinished(mActionMode);
      }
      mActionMode = null;
    }
    
    public boolean onPrepareActionMode(ActionMode paramActionMode, Menu paramMenu)
    {
      return mWrapped.onPrepareActionMode(paramActionMode, paramMenu);
    }
  }
  
  private class ListMenuDecorView
    extends ContentFrameLayout
  {
    public ListMenuDecorView(Context paramContext)
    {
      super();
    }
    
    private boolean isOutOfBounds(int paramInt1, int paramInt2)
    {
      return (paramInt1 < -5) || (paramInt2 < -5) || (paramInt1 > getWidth() + 5) || (paramInt2 > getHeight() + 5);
    }
    
    public boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
    {
      return (AppCompatDelegateImplV7.this.dispatchKeyEvent(paramKeyEvent)) || (super.dispatchKeyEvent(paramKeyEvent));
    }
    
    public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
    {
      if ((paramMotionEvent.getAction() == 0) && (isOutOfBounds((int)paramMotionEvent.getX(), (int)paramMotionEvent.getY())))
      {
        AppCompatDelegateImplV7.this.closePanel(0);
        return true;
      }
      return super.onInterceptTouchEvent(paramMotionEvent);
    }
    
    public void setBackgroundResource(int paramInt)
    {
      setBackgroundDrawable(TintManager.getDrawable(getContext(), paramInt));
    }
  }
  
  private static final class PanelFeatureState
  {
    int background;
    View createdPanelView;
    ViewGroup decorView;
    int featureId;
    Bundle frozenActionViewState;
    Bundle frozenMenuState;
    int gravity;
    boolean isHandled;
    boolean isOpen;
    boolean isPrepared;
    ListMenuPresenter listMenuPresenter;
    Context listPresenterContext;
    MenuBuilder menu;
    public boolean qwertyMode;
    boolean refreshDecorView;
    boolean refreshMenuContent;
    View shownPanelView;
    boolean wasLastOpen;
    int windowAnimations;
    int x;
    int y;
    
    PanelFeatureState(int paramInt)
    {
      featureId = paramInt;
      refreshDecorView = false;
    }
    
    void applyFrozenState()
    {
      if ((menu != null) && (frozenMenuState != null))
      {
        menu.restorePresenterStates(frozenMenuState);
        frozenMenuState = null;
      }
    }
    
    public void clearMenuPresenters()
    {
      if (menu != null) {
        menu.removeMenuPresenter(listMenuPresenter);
      }
      listMenuPresenter = null;
    }
    
    MenuView getListMenuView(MenuPresenter.Callback paramCallback)
    {
      if (menu == null) {
        return null;
      }
      if (listMenuPresenter == null)
      {
        listMenuPresenter = new ListMenuPresenter(listPresenterContext, R.layout.abc_list_menu_item_layout);
        listMenuPresenter.setCallback(paramCallback);
        menu.addMenuPresenter(listMenuPresenter);
      }
      return listMenuPresenter.getMenuView(decorView);
    }
    
    public boolean hasPanelItems()
    {
      boolean bool2 = true;
      boolean bool1;
      if (shownPanelView == null) {
        bool1 = false;
      }
      do
      {
        do
        {
          return bool1;
          bool1 = bool2;
        } while (createdPanelView != null);
        bool1 = bool2;
      } while (listMenuPresenter.getAdapter().getCount() > 0);
      return false;
    }
    
    void onRestoreInstanceState(Parcelable paramParcelable)
    {
      paramParcelable = (SavedState)paramParcelable;
      featureId = featureId;
      wasLastOpen = isOpen;
      frozenMenuState = menuState;
      shownPanelView = null;
      decorView = null;
    }
    
    Parcelable onSaveInstanceState()
    {
      SavedState localSavedState = new SavedState(null);
      featureId = featureId;
      isOpen = isOpen;
      if (menu != null)
      {
        menuState = new Bundle();
        menu.savePresenterStates(menuState);
      }
      return localSavedState;
    }
    
    void setMenu(MenuBuilder paramMenuBuilder)
    {
      if (paramMenuBuilder == menu) {}
      do
      {
        return;
        if (menu != null) {
          menu.removeMenuPresenter(listMenuPresenter);
        }
        menu = paramMenuBuilder;
      } while ((paramMenuBuilder == null) || (listMenuPresenter == null));
      paramMenuBuilder.addMenuPresenter(listMenuPresenter);
    }
    
    void setStyle(Context paramContext)
    {
      TypedValue localTypedValue = new TypedValue();
      Resources.Theme localTheme = paramContext.getResources().newTheme();
      localTheme.setTo(paramContext.getTheme());
      localTheme.resolveAttribute(R.attr.actionBarPopupTheme, localTypedValue, true);
      if (resourceId != 0) {
        localTheme.applyStyle(resourceId, true);
      }
      localTheme.resolveAttribute(R.attr.panelMenuListTheme, localTypedValue, true);
      if (resourceId != 0) {
        localTheme.applyStyle(resourceId, true);
      }
      for (;;)
      {
        paramContext = new ContextThemeWrapper(paramContext, 0);
        paramContext.getTheme().setTo(localTheme);
        listPresenterContext = paramContext;
        paramContext = paramContext.obtainStyledAttributes(R.styleable.Theme);
        background = paramContext.getResourceId(R.styleable.Theme_panelBackground, 0);
        windowAnimations = paramContext.getResourceId(R.styleable.Theme_android_windowAnimationStyle, 0);
        paramContext.recycle();
        return;
        localTheme.applyStyle(R.style.Theme_AppCompat_CompactMenu, true);
      }
    }
    
    private static class SavedState
      implements Parcelable
    {
      public static final Parcelable.Creator CREATOR = ParcelableCompat.newCreator(new AppCompatDelegateImplV7.PanelFeatureState.SavedState.1());
      int featureId;
      boolean isOpen;
      Bundle menuState;
      
      private static SavedState readFromParcel(Parcel paramParcel, ClassLoader paramClassLoader)
      {
        boolean bool = true;
        SavedState localSavedState = new SavedState();
        featureId = paramParcel.readInt();
        if (paramParcel.readInt() == 1) {}
        for (;;)
        {
          isOpen = bool;
          if (isOpen) {
            menuState = paramParcel.readBundle(paramClassLoader);
          }
          return localSavedState;
          bool = false;
        }
      }
      
      public int describeContents()
      {
        return 0;
      }
      
      public void writeToParcel(Parcel paramParcel, int paramInt)
      {
        paramParcel.writeInt(featureId);
        if (isOpen) {}
        for (paramInt = 1;; paramInt = 0)
        {
          paramParcel.writeInt(paramInt);
          if (isOpen) {
            paramParcel.writeBundle(menuState);
          }
          return;
        }
      }
    }
  }
  
  private final class PanelMenuPresenterCallback
    implements MenuPresenter.Callback
  {
    private PanelMenuPresenterCallback() {}
    
    public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
    {
      MenuBuilder localMenuBuilder = paramMenuBuilder.getRootMenu();
      if (localMenuBuilder != paramMenuBuilder) {}
      for (int i = 1;; i = 0)
      {
        AppCompatDelegateImplV7 localAppCompatDelegateImplV7 = AppCompatDelegateImplV7.this;
        if (i != 0) {
          paramMenuBuilder = localMenuBuilder;
        }
        paramMenuBuilder = localAppCompatDelegateImplV7.findMenuPanel(paramMenuBuilder);
        if (paramMenuBuilder != null)
        {
          if (i == 0) {
            break;
          }
          AppCompatDelegateImplV7.this.callOnPanelClosed(featureId, paramMenuBuilder, localMenuBuilder);
          AppCompatDelegateImplV7.this.closePanel(paramMenuBuilder, true);
        }
        return;
      }
      AppCompatDelegateImplV7.this.closePanel(paramMenuBuilder, paramBoolean);
    }
    
    public boolean onOpenSubMenu(MenuBuilder paramMenuBuilder)
    {
      if ((paramMenuBuilder == null) && (mHasActionBar))
      {
        Window.Callback localCallback = getWindowCallback();
        if ((localCallback != null) && (!isDestroyed())) {
          localCallback.onMenuOpened(108, paramMenuBuilder);
        }
      }
      return true;
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v7.app.AppCompatDelegateImplV7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */