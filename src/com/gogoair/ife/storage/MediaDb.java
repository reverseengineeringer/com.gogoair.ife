package com.gogoair.ife.storage;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.GVLogger;

public class MediaDb
  extends SQLiteOpenHelper
{
  public static final String COLUMN_NAME_APP_DATA = "app_data";
  public static final String COLUMN_NAME_DURATION = "duration";
  public static final String COLUMN_NAME_DURATIONURL = "durationUrl";
  private static final String COLUMN_NAME_ID = "_id";
  public static final String COLUMN_NAME_IMA = "ima";
  public static final String COLUMN_NAME_LOGICAL_MEDIAID = "logicalMediaId";
  public static final String COLUMN_NAME_MACADDRESS = "macAddress";
  public static final String COLUMN_NAME_MEDIAFILEURL = "mediaFileUrl";
  public static final String COLUMN_NAME_PHYSICAL_MEDIAID = "physicalMediaId";
  private static final String COLUMN_NAME_PLAYBACK_AUDIO_INDEX = "playback_audio_index";
  public static final String COLUMN_NAME_PLAYBACK_ELAPSED = "playback_elapsed_time";
  public static final String COLUMN_NAME_PLAYBACK_LOGGED = "playback_logged";
  public static final String COLUMN_NAME_PLAYBACK_START = "playback_start_time";
  public static final String COLUMN_NAME_PLAYBACK_SUBTITLE_INDEX = "playback_subtitle_index";
  public static final String COLUMN_NAME_PLAYDURATION = "playDuration";
  public static final String COLUMN_NAME_RA = "ra";
  public static final String COLUMN_NAME_SY = "sy";
  public static final String COLUMN_NAME_TI = "ti";
  public static final String COLUMN_NAME_TOKEN = "token";
  private static final String COLUMN_SEPARATOR = ",";
  private static final String DATABASE_NAME = "GVUTILITY.db";
  private static final int DATABASE_VERSION = 4;
  private static final String LIBRARY_TABLE_NAME = "ASPLibrary";
  private static final String PLAYABLE_TABLE_NAME = "Playable";
  private static final String SQL_CREATE_LIBRARY_STMT = "CREATE TABLE ASPLibrary (_id INT ,duration TEXT ,durationUrl TEXT ,ima TEXT ,macAddress TEXT ,mediaFileUrl TEXT ,physicalMediaId TEXT  ,logicalMediaId TEXT PRIMARY KEY ,playDuration TEXT ,ra TEXT ,sy TEXT ,ti TEXT ,token TEXT ,app_data TEXT ,playback_start_time INT ,playback_elapsed_time INT ,playback_logged INT,playback_subtitle_index INT,playback_audio_index INT )";
  private static final String V2_LIBRARY_TABLE_NAME = "V2Library";
  private final SQLiteDatabase readableDb = getReadableDatabase();
  private final String tag = "MediaDb";
  private final SQLiteDatabase writableDb = getWritableDatabase();
  
  public MediaDb(Context paramContext)
  {
    super(paramContext, "GVUTILITY.db", null, 4);
  }
  
  private void createTables(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("CREATE TABLE ASPLibrary (_id INT ,duration TEXT ,durationUrl TEXT ,ima TEXT ,macAddress TEXT ,mediaFileUrl TEXT ,physicalMediaId TEXT  ,logicalMediaId TEXT PRIMARY KEY ,playDuration TEXT ,ra TEXT ,sy TEXT ,ti TEXT ,token TEXT ,app_data TEXT ,playback_start_time INT ,playback_elapsed_time INT ,playback_logged INT,playback_subtitle_index INT,playback_audio_index INT )");
  }
  
  public void addV2LibraryEntry(GVLibraryEntry paramGVLibraryEntry)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("duration", Integer.valueOf(paramGVLibraryEntry.getDuration()));
    localContentValues.put("durationUrl", paramGVLibraryEntry.getDurationUrl());
    localContentValues.put("ima", paramGVLibraryEntry.getIma());
    localContentValues.put("macAddress", paramGVLibraryEntry.getMacAddress());
    localContentValues.put("mediaFileUrl", paramGVLibraryEntry.getMediaFileUrl());
    localContentValues.put("logicalMediaId", paramGVLibraryEntry.getLogicalMediaId());
    localContentValues.put("physicalMediaId", paramGVLibraryEntry.getPhysicalMediaId());
    localContentValues.put("playDuration", paramGVLibraryEntry.getPlayDuration());
    localContentValues.put("ra", paramGVLibraryEntry.getRa());
    localContentValues.put("sy", paramGVLibraryEntry.getSy());
    localContentValues.put("ti", paramGVLibraryEntry.getTi());
    localContentValues.put("token", paramGVLibraryEntry.getToken());
    localContentValues.put("app_data", paramGVLibraryEntry.getAppData());
    localContentValues.put("playback_elapsed_time", Integer.valueOf(paramGVLibraryEntry.getPlaybackElapsed()));
    localContentValues.put("playback_start_time", Long.valueOf(paramGVLibraryEntry.getPlaybackStart()));
    localContentValues.put("playback_logged", Boolean.valueOf(paramGVLibraryEntry.isPlaybackLogged()));
    if (writableDb.insertWithOnConflict("ASPLibrary", null, localContentValues, 4) == -1L)
    {
      GVLogger.getDefaultLogger().w("MediaDb", "Error inserting content with media id " + paramGVLibraryEntry.getLogicalMediaId());
      return;
    }
    GVLogger.getDefaultLogger().d("MediaDb", "Saved content " + paramGVLibraryEntry.getLogicalMediaId() + " to storage.");
  }
  
  public void close()
  {
    writableDb.close();
    readableDb.close();
  }
  
  public Cursor getV2Library()
  {
    return readableDb.query("ASPLibrary", null, null, null, null, null, null, null);
  }
  
  public GVLibraryEntry getVideoV2LibraryEntry(String paramString)
  {
    paramString = readableDb.query("ASPLibrary", null, "logicalMediaId=?", new String[] { paramString }, null, null, null, null);
    try
    {
      if (paramString.moveToFirst())
      {
        GVLibraryEntry localGVLibraryEntry = new GVLibraryEntry(paramString);
        return localGVLibraryEntry;
      }
      return null;
    }
    finally
    {
      paramString.close();
    }
  }
  
  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    createTables(paramSQLiteDatabase);
  }
  
  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    if (paramInt1 == 1)
    {
      GVLogger.getDefaultLogger().d("MediaDb", "Old database version " + paramInt1 + " detected. Upgrade to version " + paramInt2);
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS V2Library");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS Playable");
      createTables(paramSQLiteDatabase);
    }
    while ((paramInt1 != 2) && (paramInt1 != 3)) {
      return;
    }
    GVLogger.getDefaultLogger().d("MediaDb", "Old database version " + paramInt1 + " detected. Upgrade to version " + paramInt2);
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS ASPLibrary");
    createTables(paramSQLiteDatabase);
  }
  
  public void removeV2ExpiredContents()
  {
    int i = writableDb.delete("ASPLibrary", System.currentTimeMillis() + " - " + "playback_start_time" + " > " + 86400000, null);
    GVLogger.getDefaultLogger().d("MediaDb", i + " V2 Library videos have expired and have been deleted");
  }
  
  public void updateLibraryEntry(GVLibraryEntry paramGVLibraryEntry)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("playback_elapsed_time", Integer.valueOf(paramGVLibraryEntry.getPlaybackElapsed()));
    localContentValues.put("playback_logged", Boolean.valueOf(paramGVLibraryEntry.isPlaybackLogged()));
    localContentValues.put("playback_subtitle_index", Integer.valueOf(paramGVLibraryEntry.getSelectedSubtitleIndex()));
    writableDb.update("ASPLibrary", localContentValues, "logicalMediaId = ?", new String[] { paramGVLibraryEntry.getLogicalMediaId() });
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.storage.MediaDb
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */