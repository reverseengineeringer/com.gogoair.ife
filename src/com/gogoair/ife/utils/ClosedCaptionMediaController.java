package com.gogoair.ife.utils;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout.LayoutParams;
import android.widget.MediaController;

public class ClosedCaptionMediaController
  extends MediaController
{
  private Button closedCaptionButton;
  private ClosedCaptionMediaControllerListener closedCaptionMediaControllerListener;
  private final Context context;
  
  public ClosedCaptionMediaController(Context paramContext)
  {
    super(paramContext);
    context = paramContext;
  }
  
  public ClosedCaptionMediaController(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    context = paramContext;
  }
  
  public void hide()
  {
    super.hide();
    if (closedCaptionMediaControllerListener != null) {
      closedCaptionMediaControllerListener.onHideMediaController();
    }
  }
  
  public void setAnchorView(View paramView)
  {
    super.setAnchorView(paramView);
    closedCaptionButton = new Button(context);
    paramView = Typeface.createFromAsset(context.getAssets(), "FontAwesome.otf");
    closedCaptionButton.setTypeface(paramView);
    closedCaptionButton.setText(context.getString(2131034137));
    closedCaptionButton.setTextColor(-1);
    closedCaptionButton.setBackgroundColor(0);
    closedCaptionButton.setVisibility(8);
    closedCaptionButton.setOnClickListener(new ClosedCaptionMediaController.1(this));
    paramView = new FrameLayout.LayoutParams(-2, -2);
    gravity = 8388613;
    addView(closedCaptionButton, paramView);
  }
  
  public void setClosedCaptionMediaControllerListener(ClosedCaptionMediaControllerListener paramClosedCaptionMediaControllerListener)
  {
    closedCaptionMediaControllerListener = paramClosedCaptionMediaControllerListener;
  }
  
  public void show()
  {
    super.show();
    if (closedCaptionMediaControllerListener != null) {
      closedCaptionMediaControllerListener.onShowMediaController();
    }
  }
  
  public void show(int paramInt)
  {
    super.show(paramInt);
    if (closedCaptionMediaControllerListener != null) {
      closedCaptionMediaControllerListener.onShowMediaController();
    }
  }
  
  public void showClosedCaptionButton()
  {
    closedCaptionButton.setVisibility(0);
  }
  
  public static abstract interface ClosedCaptionMediaControllerListener
  {
    public abstract void onClosedCaptionButtonPressed();
    
    public abstract void onHideMediaController();
    
    public abstract void onShowMediaController();
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.ClosedCaptionMediaController
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */