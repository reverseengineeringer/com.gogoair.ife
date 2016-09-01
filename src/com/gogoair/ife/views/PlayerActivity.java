package com.gogoair.ife.views;

import android.app.AlertDialog.Builder;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.graphics.Point;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.UiThread;
import android.support.v4.app.NavUtils;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.MediaController.MediaPlayerControl;
import com.adobe.ave.drm.DRMManager;
import com.adobe.mediacore.DefaultMediaPlayer;
import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.DRMEventListener;
import com.adobe.mediacore.MediaPlayer.Event;
import com.adobe.mediacore.MediaPlayer.PlaybackEventListener;
import com.adobe.mediacore.MediaPlayer.PlayerState;
import com.adobe.mediacore.MediaPlayer.QOSEventListener;
import com.adobe.mediacore.MediaPlayerItem;
import com.adobe.mediacore.MediaPlayerView;
import com.adobe.mediacore.MediaResource;
import com.adobe.mediacore.Version;
import com.adobe.mediacore.info.ClosedCaptionsTrack;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger.Verbosity;
import com.adobe.mediacore.utils.TimeRange;
import com.crittercism.app.Crittercism;
import com.gogoair.ife.drm.DRMHelper;
import com.gogoair.ife.drm.DRMHelper.DRMLicenseAcquisitionListener;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.storage.MediaDb;
import com.gogoair.ife.utils.ClosedCaptionMediaController;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.GVLogger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;

public class PlayerActivity
  extends AppCompatActivity
  implements MediaController.MediaPlayerControl
{
  public static final String INTENT_EXTRA_GV_LIBRARY_ENTRY = "INTENT_EXTRA_GV_LIBRARY_ENTRY";
  private static final int MEDIACONTROLLER_SHOW_TIME = 5000;
  private static final int PLAYBACK_OBSERVATION_INTERVAL = 1000;
  private static final String TAG = "Player";
  private long accountingGradeDuration = 0L;
  private int actionBarVisibility = 1280;
  private List closedCaptionTracks;
  private long createTimestamp;
  private MediaDb db;
  private final MediaPlayer.DRMEventListener drmEventListener = new PlayerActivity.6(this);
  private DRMManager drmManager;
  private final DRMHelper.DRMLicenseAcquisitionListener licenseAcquisitionListener = new PlayerActivity.5(this);
  private ClosedCaptionMediaController mediaController;
  private MediaPlayer mediaPlayer;
  private GVLibraryEntry movie;
  private long movieHeight = 0L;
  private View moviePlayerLayout;
  private long movieWidth = 0L;
  private final MediaPlayer.PlaybackEventListener playbackEventListener = new PlayerActivity.3(this);
  @NonNull
  private final Handler playbackObserverHandler = new Handler();
  @NonNull
  private final PlaybackObserverRunnable playbackObserverRunnable = new PlaybackObserverRunnable();
  private FrameLayout playerFrame;
  private boolean playerPrepared = false;
  private ProgressDialog progressDialog;
  private final MediaPlayer.QOSEventListener qosEventListener = new PlayerActivity.2(this);
  private int savedPosition;
  private final Handler seekProgressDialogHandler = new Handler();
  private final Runnable seekProgressDialogRunnable = new PlayerActivity.1(this);
  private int selectedClosedCaptionsIndex = 0;
  private long timeToBufferStart;
  private long timeToFirstFrame;
  
  private void attemptIndiv()
  {
    DRMHelper.setUseCloudDRM(Boolean.valueOf(false));
    drmManager = DRMManager.getSharedManager(getApplicationContext());
    DRMHelper.loadDRMMetadata(drmManager, "http://cs.video.gogoinflight.com/media/static/players/ReferencePlayer/onprem.metadata", new PlayerActivity.7(this));
  }
  
  private void cancelProgressDialog()
  {
    try
    {
      progressDialog.cancel();
      return;
    }
    catch (NullPointerException localNullPointerException)
    {
      localNullPointerException.printStackTrace();
    }
  }
  
  private void createPlayer()
  {
    GVLogger.getDefaultLogger().i("Player", "Creating media player.");
    mediaPlayer = DefaultMediaPlayer.create(getApplicationContext());
    mediaPlayer.addEventListener(MediaPlayer.Event.PLAYBACK, playbackEventListener);
    mediaPlayer.addEventListener(MediaPlayer.Event.QOS, qosEventListener);
    mediaPlayer.addEventListener(MediaPlayer.Event.DRM, drmEventListener);
    playerFrame = ((FrameLayout)findViewById(2131427419));
    playerFrame.addView(mediaPlayer.getView());
    playerFrame.setOnTouchListener(new PlayerActivity.8(this));
  }
  
  private void destroyPlayer()
  {
    if (mediaPlayer != null)
    {
      mediaPlayer.removeEventListener(MediaPlayer.Event.PLAYBACK, playbackEventListener);
      playerFrame.removeAllViews();
      mediaPlayer.release();
      mediaPlayer = null;
    }
  }
  
  private long getAccountingGradeDuration()
  {
    if ((movie.getPlayDuration() != null) && (movie.getDurationUrl() != null)) {
      try
      {
        Date localDate = new SimpleDateFormat("mm:ss", Locale.US).parse(movie.getPlayDuration());
        GregorianCalendar localGregorianCalendar = new GregorianCalendar();
        localGregorianCalendar.clear();
        long l1 = localDate.getTime();
        long l2 = localGregorianCalendar.getTimeInMillis();
        return l1 - l2;
      }
      catch (ParseException localParseException)
      {
        localParseException.printStackTrace();
      }
    }
    return 0L;
  }
  
  private List getCaptionLanguageTitles()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = closedCaptionTracks.iterator();
    while (localIterator.hasNext()) {
      localArrayList.add(((ClosedCaptionsTrack)localIterator.next()).getName());
    }
    return localArrayList;
  }
  
  @UiThread
  private void goToLandingPage(Constants.GVErrorCode paramGVErrorCode, long paramLong)
  {
    Intent localIntent = new Intent(this, LandingActivity.class);
    localIntent.putExtra("LANDING_STATE_INTENT_EXTRA", paramGVErrorCode);
    localIntent.putExtra("INTENT_EXTRA_GV_LIBRARY_ENTRY", movie);
    if (paramLong != 0L) {
      localIntent.putExtra("LANDING_ADOBE_CODE_INTENT_EXTRA", (int)paramLong);
    }
    startActivity(localIntent);
    finish();
  }
  
  private void hideActionBar()
  {
    actionBarVisibility |= 0x4;
    moviePlayerLayout.setSystemUiVisibility(actionBarVisibility);
    if (getSupportActionBar() != null) {
      getSupportActionBar().hide();
    }
  }
  
  private void initializeMediaController()
  {
    mediaController = new ClosedCaptionMediaController(this);
    mediaController.setAnchorView(playerFrame);
    mediaController.setMediaPlayer(this);
    mediaController.setEnabled(true);
    mediaController.show(5000);
    if (closedCaptionTracks.size() > 0) {
      mediaController.showClosedCaptionButton();
    }
    mediaController.setClosedCaptionMediaControllerListener(new PlayerActivity.4(this));
  }
  
  private boolean isPlayerValid()
  {
    return (mediaPlayer != null) && (playerPrepared) && (mediaPlayer.getStatus() != MediaPlayer.PlayerState.ERROR);
  }
  
  private List loadClosedCaptioningTracks(@Nullable MediaPlayerItem paramMediaPlayerItem)
  {
    ArrayList localArrayList = new ArrayList();
    if (paramMediaPlayerItem != null)
    {
      paramMediaPlayerItem = paramMediaPlayerItem.getClosedCaptionsTracks().iterator();
      while (paramMediaPlayerItem.hasNext())
      {
        ClosedCaptionsTrack localClosedCaptionsTrack = (ClosedCaptionsTrack)paramMediaPlayerItem.next();
        if (localClosedCaptionsTrack.isActive()) {
          localArrayList.add(localClosedCaptionsTrack);
        }
      }
    }
    return localArrayList;
  }
  
  private void prepareMedia()
  {
    GVLogger.getDefaultLogger().i("Player", "Preparing media player item: " + movie.getMediaFileUrl());
    MediaResource localMediaResource = MediaResource.createFromUrl(movie.getMediaFileUrl(), null);
    mediaPlayer.replaceCurrentItem(localMediaResource);
  }
  
  private void setPlayerViewSize(long paramLong1, long paramLong2)
  {
    Point localPoint = new Point();
    y = playerFrame.getMeasuredHeight();
    x = playerFrame.getMeasuredWidth();
    if ((mediaPlayer == null) || (mediaPlayer.getView() == null)) {
      return;
    }
    long l3 = x;
    long l4 = y;
    long l1 = l4;
    long l2 = l3;
    if (paramLong1 > 0L)
    {
      l1 = l4;
      l2 = l3;
      if (paramLong2 > 0L)
      {
        if (paramLong1 * l4 <= l3 * paramLong2) {
          break label149;
        }
        l1 = l3 * paramLong2 / paramLong1;
        l2 = l3;
      }
    }
    for (;;)
    {
      mediaPlayer.getView().setLayoutParams(new FrameLayout.LayoutParams((int)l2, (int)l1, 17));
      return;
      label149:
      l1 = l4;
      l2 = l3;
      if (paramLong1 * l4 < l3 * paramLong2)
      {
        l2 = l4 * paramLong1 / paramLong2;
        l1 = l4;
      }
    }
  }
  
  private void showActionBar()
  {
    actionBarVisibility &= 0xFFFFFFFB;
    moviePlayerLayout.setSystemUiVisibility(actionBarVisibility);
    if (getSupportActionBar() != null) {
      getSupportActionBar().show();
    }
  }
  
  private void showProgressDialog(String paramString1, String paramString2)
  {
    progressDialog.setIndeterminate(true);
    progressDialog.setMessage(paramString2);
    progressDialog.setTitle(paramString1);
    progressDialog.setProgressStyle(0);
    progressDialog.setCancelable(false);
    progressDialog.show();
  }
  
  private void startPlaybackObserver()
  {
    playbackObserverHandler.removeCallbacks(playbackObserverRunnable);
    playbackObserverHandler.postDelayed(playbackObserverRunnable, 1000L);
  }
  
  private void stopPlaybackObserver()
  {
    playbackObserverHandler.removeCallbacks(playbackObserverRunnable);
  }
  
  public boolean canPause()
  {
    return isPlayerValid();
  }
  
  public boolean canSeekBackward()
  {
    return isPlayerValid();
  }
  
  public boolean canSeekForward()
  {
    return isPlayerValid();
  }
  
  public int getAudioSessionId()
  {
    return 0;
  }
  
  public int getBufferPercentage()
  {
    return 0;
  }
  
  public int getCurrentPosition()
  {
    if (isPlayerValid()) {
      return (int)mediaPlayer.getCurrentTime();
    }
    return 0;
  }
  
  public int getDuration()
  {
    if (isPlayerValid()) {
      return (int)mediaPlayer.getPlaybackRange().getEnd();
    }
    return 0;
  }
  
  public boolean isPlaying()
  {
    return (isPlayerValid()) && (mediaPlayer.getRate() > 0.0F);
  }
  
  public void onBackPressed()
  {
    NavUtils.navigateUpFromSameTask(this);
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    if (playerFrame != null) {
      playerFrame.getViewTreeObserver().addOnGlobalLayoutListener(new PlayerActivity.10(this));
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    GVLogger.getDefaultLogger().d("Player", "AVE Version:" + Version.getAVEVersion() + " PSDK version:" + Version.getVersion());
    GVLogger.getAdobeLogger().setVerbosityLevel(Logger.Verbosity.ERROR);
    Log.setLogFactory(new PlayerActivity.9(this));
    drmManager = DRMManager.getSharedManager(getApplicationContext());
    drmManager.setMaxOperationTime(15L);
    attemptIndiv();
    createTimestamp = System.currentTimeMillis();
    setContentView(2130903067);
    progressDialog = new ProgressDialog(this);
    movie = ((GVLibraryEntry)getIntent().getParcelableExtra("INTENT_EXTRA_GV_LIBRARY_ENTRY"));
    if (movie != null) {}
    try
    {
      paramBundle = new JSONObject();
      paramBundle.put("mediaId", movie.getLogicalMediaId());
      paramBundle.put("cacheId", movie.getCacheId());
      Crittercism.setMetadata(paramBundle);
      db = new MediaDb(this);
      showProgressDialog(getString(2131034140), getString(2131034139));
      setSupportActionBar((Toolbar)findViewById(2131427427));
      if (getSupportActionBar() != null)
      {
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().hide();
      }
      moviePlayerLayout = findViewById(16908290);
      moviePlayerLayout.setSystemUiVisibility(actionBarVisibility);
      PreferenceManager.getDefaultSharedPreferences(this).edit().putBoolean("com.gogoair.ife.playedContent", true).apply();
      return;
    }
    catch (JSONException paramBundle)
    {
      for (;;)
      {
        paramBundle.printStackTrace();
      }
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131492864, paramMenu);
    return true;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    db.close();
    GVLogger.getDefaultLogger().i("Player#onDestroy", "Destroying fragment.");
    destroyPlayer();
    cancelProgressDialog();
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default: 
      return super.onOptionsItemSelected(paramMenuItem);
    }
    try
    {
      new AlertDialog.Builder(this).setTitle(getString(2131034140)).setMessage(getPackageManagergetPackageInfogetPackageName0versionName).show();
      return true;
    }
    catch (PackageManager.NameNotFoundException paramMenuItem)
    {
      for (;;)
      {
        paramMenuItem.printStackTrace();
      }
    }
  }
  
  public void onPause()
  {
    super.onPause();
    GVLogger.getDefaultLogger().d("Player", "onPause");
    pause();
    if ((movie.getLogicalMediaId() != null) && (mediaPlayer != null))
    {
      long l = mediaPlayer.getPlaybackRange().getEnd();
      if (l > 0L)
      {
        if (mediaPlayer.getCurrentTime() * 100L / l <= 98L) {
          break label126;
        }
        GVLogger.getDefaultLogger().d("Player", "Completed watching content. Resetting position back to 0");
        movie.setPlaybackElapsed(0);
      }
    }
    for (;;)
    {
      db.updateLibraryEntry(movie);
      if (mediaController != null) {
        mediaController.hide();
      }
      stopPlaybackObserver();
      return;
      label126:
      GVLogger.getDefaultLogger().d("Player", "Saving moving position with value " + mediaPlayer.getCurrentTime());
      movie.setPlaybackElapsed((int)mediaPlayer.getCurrentTime());
    }
  }
  
  public void onResume()
  {
    super.onResume();
    GVLogger.getDefaultLogger().d("Player", "onResume");
    start();
  }
  
  public void pause()
  {
    if (isPlayerValid()) {
      mediaPlayer.pause();
    }
  }
  
  public void seekTo(int paramInt)
  {
    if (isPlayerValid())
    {
      mediaPlayer.seek(paramInt);
      movie.setPlaybackElapsed(paramInt);
      db.updateLibraryEntry(movie);
    }
  }
  
  public void start()
  {
    if (isPlayerValid()) {
      mediaPlayer.play();
    }
  }
  
  private class PlaybackObserverRunnable
    implements Runnable
  {
    private static final int SAVE_INTERVAL = 10000;
    private long previousSaveTime = 0L;
    
    public PlaybackObserverRunnable() {}
    
    private void processAccountingGradeLoggingIfNeeded()
    {
      if ((accountingGradeDuration <= 0L) || (movie.getDurationUrl() == null) || (movie.isPlaybackLogged()) || (mediaPlayer.getCurrentTime() > accountingGradeDuration)) {
        try
        {
          GVLogger.getDefaultLogger().d("Player", "Accounting grade triggering...");
          PlayerActivity.access$1002(PlayerActivity.this, 0L);
          JSONObject localJSONObject = new JSONObject(movie.getAppData());
          localJSONObject.put("eventType", "3");
          GVLogger.getDefaultLogger().logAccountingGrade(PlayerActivity.this, localJSONObject.toString(), movie.getDurationUrl(), movie);
          return;
        }
        catch (JSONException localJSONException)
        {
          localJSONException.printStackTrace();
          return;
        }
      }
      GVLogger.getDefaultLogger().d("Player", "Accounting grade logging will trigger after in " + (accountingGradeDuration - mediaPlayer.getCurrentTime()) / 1000L + " seconds");
    }
    
    private boolean processContentExpiry()
    {
      if (movie.timeToExpiryInMillis() > 0L)
      {
        GVLogger.getDefaultLogger().d("Player", "Movie will expire in " + movie.timeToExpiryInMillis() / 1000L + " seconds.");
        return true;
      }
      PlayerActivity.this.goToLandingPage(Constants.GVErrorCode.EXPIRED, 0L);
      return false;
    }
    
    private void savePlaybackPositionIfNeeded()
    {
      long l = new Date().getTime();
      if (l - previousSaveTime > 10000L)
      {
        GVLogger.getDefaultLogger().d("Player", "Saved playback position " + mediaPlayer.getCurrentTime());
        movie.setPlaybackElapsed((int)mediaPlayer.getCurrentTime());
        db.updateLibraryEntry(movie);
        previousSaveTime = l;
      }
    }
    
    public void run()
    {
      if ((movie != null) && (mediaPlayer != null))
      {
        processAccountingGradeLoggingIfNeeded();
        savePlaybackPositionIfNeeded();
        if (processContentExpiry()) {
          PlayerActivity.this.startPlaybackObserver();
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */