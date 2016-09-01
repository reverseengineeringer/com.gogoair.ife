.class public Lcom/gogoair/ife/storage/MediaDb;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SourceFile"


# static fields
.field public static final COLUMN_NAME_APP_DATA:Ljava/lang/String; = "app_data"

.field public static final COLUMN_NAME_DURATION:Ljava/lang/String; = "duration"

.field public static final COLUMN_NAME_DURATIONURL:Ljava/lang/String; = "durationUrl"

.field private static final COLUMN_NAME_ID:Ljava/lang/String; = "_id"

.field public static final COLUMN_NAME_IMA:Ljava/lang/String; = "ima"

.field public static final COLUMN_NAME_LOGICAL_MEDIAID:Ljava/lang/String; = "logicalMediaId"

.field public static final COLUMN_NAME_MACADDRESS:Ljava/lang/String; = "macAddress"

.field public static final COLUMN_NAME_MEDIAFILEURL:Ljava/lang/String; = "mediaFileUrl"

.field public static final COLUMN_NAME_PHYSICAL_MEDIAID:Ljava/lang/String; = "physicalMediaId"

.field private static final COLUMN_NAME_PLAYBACK_AUDIO_INDEX:Ljava/lang/String; = "playback_audio_index"

.field public static final COLUMN_NAME_PLAYBACK_ELAPSED:Ljava/lang/String; = "playback_elapsed_time"

.field public static final COLUMN_NAME_PLAYBACK_LOGGED:Ljava/lang/String; = "playback_logged"

.field public static final COLUMN_NAME_PLAYBACK_START:Ljava/lang/String; = "playback_start_time"

.field public static final COLUMN_NAME_PLAYBACK_SUBTITLE_INDEX:Ljava/lang/String; = "playback_subtitle_index"

.field public static final COLUMN_NAME_PLAYDURATION:Ljava/lang/String; = "playDuration"

.field public static final COLUMN_NAME_RA:Ljava/lang/String; = "ra"

.field public static final COLUMN_NAME_SY:Ljava/lang/String; = "sy"

.field public static final COLUMN_NAME_TI:Ljava/lang/String; = "ti"

.field public static final COLUMN_NAME_TOKEN:Ljava/lang/String; = "token"

.field private static final COLUMN_SEPARATOR:Ljava/lang/String; = ","

.field private static final DATABASE_NAME:Ljava/lang/String; = "GVUTILITY.db"

.field private static final DATABASE_VERSION:I = 0x4

.field private static final LIBRARY_TABLE_NAME:Ljava/lang/String; = "ASPLibrary"

.field private static final PLAYABLE_TABLE_NAME:Ljava/lang/String; = "Playable"

.field private static final SQL_CREATE_LIBRARY_STMT:Ljava/lang/String; = "CREATE TABLE ASPLibrary (_id INT ,duration TEXT ,durationUrl TEXT ,ima TEXT ,macAddress TEXT ,mediaFileUrl TEXT ,physicalMediaId TEXT  ,logicalMediaId TEXT PRIMARY KEY ,playDuration TEXT ,ra TEXT ,sy TEXT ,ti TEXT ,token TEXT ,app_data TEXT ,playback_start_time INT ,playback_elapsed_time INT ,playback_logged INT,playback_subtitle_index INT,playback_audio_index INT )"

.field private static final V2_LIBRARY_TABLE_NAME:Ljava/lang/String; = "V2Library"


# instance fields
.field private final readableDb:Landroid/database/sqlite/SQLiteDatabase;

.field private final tag:Ljava/lang/String;

.field private final writableDb:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 76
    const-string v0, "GVUTILITY.db"

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 71
    const-string v0, "MediaDb"

    iput-object v0, p0, Lcom/gogoair/ife/storage/MediaDb;->tag:Ljava/lang/String;

    .line 77
    invoke-virtual {p0}, Lcom/gogoair/ife/storage/MediaDb;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/storage/MediaDb;->writableDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 78
    invoke-virtual {p0}, Lcom/gogoair/ife/storage/MediaDb;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/storage/MediaDb;->readableDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 79
    return-void
.end method

.method private createTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .prologue
    .line 182
    const-string v0, "CREATE TABLE ASPLibrary (_id INT ,duration TEXT ,durationUrl TEXT ,ima TEXT ,macAddress TEXT ,mediaFileUrl TEXT ,physicalMediaId TEXT  ,logicalMediaId TEXT PRIMARY KEY ,playDuration TEXT ,ra TEXT ,sy TEXT ,ti TEXT ,token TEXT ,app_data TEXT ,playback_start_time INT ,playback_elapsed_time INT ,playback_logged INT,playback_subtitle_index INT,playback_audio_index INT )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 183
    return-void
.end method


# virtual methods
.method public addV2LibraryEntry(Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V
    .locals 5

    .prologue
    .line 137
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 139
    const-string v1, "duration"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getDuration()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 140
    const-string v1, "durationUrl"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getDurationUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    const-string v1, "ima"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getIma()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    const-string v1, "macAddress"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getMacAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    const-string v1, "mediaFileUrl"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getMediaFileUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    const-string v1, "logicalMediaId"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getLogicalMediaId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    const-string v1, "physicalMediaId"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getPhysicalMediaId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    const-string v1, "playDuration"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getPlayDuration()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    const-string v1, "ra"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getRa()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    const-string v1, "sy"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getSy()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    const-string v1, "ti"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getTi()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    const-string v1, "token"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    const-string v1, "app_data"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    const-string v1, "playback_elapsed_time"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getPlaybackElapsed()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 153
    const-string v1, "playback_start_time"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getPlaybackStart()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 154
    const-string v1, "playback_logged"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->isPlaybackLogged()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 156
    iget-object v1, p0, Lcom/gogoair/ife/storage/MediaDb;->writableDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "ASPLibrary"

    const/4 v3, 0x0

    const/4 v4, 0x4

    invoke-virtual {v1, v2, v3, v0, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v0

    .line 157
    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 158
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "MediaDb"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error inserting content with media id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getLogicalMediaId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    :goto_0
    return-void

    .line 160
    :cond_0
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "MediaDb"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Saved content "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getLogicalMediaId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to storage."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public close()V
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/gogoair/ife/storage/MediaDb;->writableDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 103
    iget-object v0, p0, Lcom/gogoair/ife/storage/MediaDb;->readableDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 104
    return-void
.end method

.method public getV2Library()Landroid/database/Cursor;
    .locals 9

    .prologue
    const/4 v2, 0x0

    .line 164
    iget-object v0, p0, Lcom/gogoair/ife/storage/MediaDb;->readableDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "ASPLibrary"

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    move-object v8, v2

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public getVideoV2LibraryEntry(Ljava/lang/String;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    .locals 9

    .prologue
    const/4 v2, 0x0

    .line 113
    iget-object v0, p0, Lcom/gogoair/ife/storage/MediaDb;->readableDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "ASPLibrary"

    const-string v3, "logicalMediaId=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    move-object v8, v2

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 125
    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    new-instance v2, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-direct {v2, v1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;-><init>(Landroid/database/Cursor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :goto_0
    return-object v2

    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0, p1}, Lcom/gogoair/ife/storage/MediaDb;->createTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 84
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 4

    .prologue
    .line 89
    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    .line 90
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "MediaDb"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Old database version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " detected. Upgrade to version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    const-string v0, "DROP TABLE IF EXISTS V2Library"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 92
    const-string v0, "DROP TABLE IF EXISTS Playable"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 93
    invoke-direct {p0, p1}, Lcom/gogoair/ife/storage/MediaDb;->createTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 94
    :cond_1
    const/4 v0, 0x2

    if-eq p2, v0, :cond_2

    const/4 v0, 0x3

    if-ne p2, v0, :cond_0

    .line 95
    :cond_2
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "MediaDb"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Old database version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " detected. Upgrade to version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    const-string v0, "DROP TABLE IF EXISTS ASPLibrary"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 97
    invoke-direct {p0, p1}, Lcom/gogoair/ife/storage/MediaDb;->createTables(Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0
.end method

.method public removeV2ExpiredContents()V
    .locals 6

    .prologue
    .line 176
    iget-object v0, p0, Lcom/gogoair/ife/storage/MediaDb;->writableDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "ASPLibrary"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "playback_start_time"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x5265c00

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    .line 176
    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 178
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v1

    const-string v2, "MediaDb"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " V2 Library videos have expired and have been deleted"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/gogoair/ife/utils/GVLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    return-void
.end method

.method public updateLibraryEntry(Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;)V
    .locals 7

    .prologue
    .line 168
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 169
    const-string v1, "playback_elapsed_time"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getPlaybackElapsed()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 170
    const-string v1, "playback_logged"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->isPlaybackLogged()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 171
    const-string v1, "playback_subtitle_index"

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getSelectedSubtitleIndex()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 172
    iget-object v1, p0, Lcom/gogoair/ife/storage/MediaDb;->writableDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "ASPLibrary"

    const-string v3, "logicalMediaId = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getLogicalMediaId()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 173
    return-void
.end method
