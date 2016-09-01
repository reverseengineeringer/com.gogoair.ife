package com.gogoair.ife.gogo_vision.adapters;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.CursorAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.image.ImageDownloader;
import com.gogoair.ife.utils.image.ImageDownloader.Mode;
import java.util.concurrent.TimeUnit;

public class GVLibraryCursorAdapter
  extends CursorAdapter
{
  private static final int SEC_TO_MILLIS = 1000;
  private static Bitmap placeHolderBitmap;
  private final Context context;
  private final ImageDownloader mImageDownloader;
  
  public GVLibraryCursorAdapter(Context paramContext, Cursor paramCursor)
  {
    super(paramContext, paramCursor, 0);
    context = paramContext;
    mImageDownloader = new ImageDownloader(paramContext, getPlaceHolderImage());
    mImageDownloader.setMode(ImageDownloader.Mode.CORRECT);
  }
  
  private String formatTime(int paramInt)
  {
    return String.format("%d:%02d:%02d", new Object[] { Long.valueOf(TimeUnit.MILLISECONDS.toHours(paramInt)), Long.valueOf(TimeUnit.MILLISECONDS.toMinutes(paramInt) - TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS.toHours(paramInt))), Long.valueOf(TimeUnit.MILLISECONDS.toSeconds(paramInt) - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(paramInt))) });
  }
  
  private Bitmap getPlaceHolderImage()
  {
    try
    {
      if (placeHolderBitmap == null) {
        placeHolderBitmap = BitmapFactory.decodeResource(context.getResources(), 2130837580);
      }
      Bitmap localBitmap = placeHolderBitmap;
      return localBitmap;
    }
    finally {}
  }
  
  public void bindView(View paramView, Context paramContext, Cursor paramCursor)
  {
    paramContext = new GVLibraryEntry(paramCursor);
    VideoV2LibraryCellViewHolder localVideoV2LibraryCellViewHolder = new VideoV2LibraryCellViewHolder();
    imgIcon = ((ImageView)paramView.findViewById(2131427420));
    txtTitle = ((TextView)paramView.findViewById(2131427421));
    txtPlayback = ((TextView)paramView.findViewById(2131427422));
    ImageView localImageView = (ImageView)paramView.findViewById(2131427423);
    txtTitle.setText(paramCursor.getString(paramCursor.getColumnIndex("ti")));
    int i = paramCursor.getInt(paramCursor.getColumnIndex("playback_elapsed_time"));
    int j = paramCursor.getInt(paramCursor.getColumnIndex("duration")) * 1000;
    paramCursor = String.format("%s / %s", new Object[] { formatTime(i), formatTime(j) });
    txtPlayback.setText(paramCursor);
    imgIcon.setImageResource(2130837580);
    localImageView.getViewTreeObserver().addOnGlobalLayoutListener(new GVLibraryCursorAdapter.1(this, localImageView, i, j, paramView));
    if ((paramContext.getIma() != null) && (paramContext.getIma().length() > 0)) {
      mImageDownloader.download(paramContext.getIma(), imgIcon);
    }
  }
  
  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    return ((Activity)paramContext).getLayoutInflater().inflate(2130903068, paramViewGroup, false);
  }
  
  static class VideoV2LibraryCellViewHolder
  {
    ImageView imgIcon;
    TextView txtPlayback;
    TextView txtTitle;
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.gogo_vision.adapters.GVLibraryCursorAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */