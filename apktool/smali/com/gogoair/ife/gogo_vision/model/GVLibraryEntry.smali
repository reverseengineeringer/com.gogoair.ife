.class public Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;

.field private static final JSON_NAME_CACHEID:Ljava/lang/String; = "cacheId"

.field private static final JSON_NAME_CURRENCYCODE:Ljava/lang/String; = "currencyCode"

.field private static final JSON_NAME_DURATION:Ljava/lang/String; = "duration"

.field private static final JSON_NAME_DURATIONURL:Ljava/lang/String; = "durationUrl"

.field private static final JSON_NAME_IMA:Ljava/lang/String; = "ima"

.field private static final JSON_NAME_LOCALEINFO:Ljava/lang/String; = "localeInfo"

.field private static final JSON_NAME_LOGICALMEDIAID:Ljava/lang/String; = "logicalMediaId"

.field private static final JSON_NAME_MACADDRESS:Ljava/lang/String; = "macAddress"

.field private static final JSON_NAME_MEDIAFILEURL:Ljava/lang/String; = "mediaFileUrl"

.field private static final JSON_NAME_PHYSICALMEDIAID:Ljava/lang/String; = "physicalMediaId"

.field private static final JSON_NAME_PLAYDURATION:Ljava/lang/String; = "playDuration"

.field private static final JSON_NAME_PRODUCTID:Ljava/lang/String; = "productId"

.field private static final JSON_NAME_PRODUCTPRICE:Ljava/lang/String; = "productPrice"

.field private static final JSON_NAME_RA:Ljava/lang/String; = "ra"

.field private static final JSON_NAME_SY:Ljava/lang/String; = "sy"

.field private static final JSON_NAME_TI:Ljava/lang/String; = "ti"

.field private static final NO_CACHE_ID:Ljava/lang/String; = "freeVideo"


# instance fields
.field private appData:Ljava/lang/String;

.field private cacheId:Ljava/lang/String;

.field private duration:I

.field private durationUrl:Ljava/lang/String;

.field private ima:Ljava/lang/String;

.field private logicalMediaId:Ljava/lang/String;

.field private macAddress:Ljava/lang/String;

.field private mediaFileUrl:Ljava/lang/String;

.field private physicalMediaId:Ljava/lang/String;

.field private playDuration:Ljava/lang/String;

.field private playbackElapsed:I

.field private playbackLogged:Z

.field private playbackStart:J

.field private ra:Ljava/lang/String;

.field private selectedSubtitleIndex:I

.field private sy:Ljava/lang/String;

.field private ti:Ljava/lang/String;

.field private token:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 221
    new-instance v0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry$1;

    invoke-direct {v0}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry$1;-><init>()V

    sput-object v0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 2

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    :try_start_0
    const-string v0, "duration"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->duration:I

    .line 83
    const-string v0, "durationUrl"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->durationUrl:Ljava/lang/String;

    .line 84
    const-string v0, "ima"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ima:Ljava/lang/String;

    .line 85
    const-string v0, "macAddress"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->macAddress:Ljava/lang/String;

    .line 86
    const-string v0, "mediaFileUrl"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->mediaFileUrl:Ljava/lang/String;

    .line 87
    const-string v0, "logicalMediaId"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->logicalMediaId:Ljava/lang/String;

    .line 88
    const-string v0, "physicalMediaId"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->physicalMediaId:Ljava/lang/String;

    .line 89
    const-string v0, "playDuration"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playDuration:Ljava/lang/String;

    .line 90
    const-string v0, "ra"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ra:Ljava/lang/String;

    .line 91
    const-string v0, "sy"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->sy:Ljava/lang/String;

    .line 92
    const-string v0, "ti"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ti:Ljava/lang/String;

    .line 93
    const-string v0, "token"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->token:Ljava/lang/String;

    .line 94
    const-string v0, "playback_elapsed_time"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackElapsed:I

    .line 95
    const-string v0, "playback_start_time"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackStart:J

    .line 96
    const-string v0, "playback_logged"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackLogged:Z

    .line 97
    const-string v0, "app_data"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->appData:Ljava/lang/String;

    .line 98
    const-string v0, "playback_subtitle_index"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->selectedSubtitleIndex:I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    :goto_1
    return-void

    .line 96
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 99
    :catch_0
    move-exception v0

    .line 100
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_1
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->cacheId:Ljava/lang/String;

    .line 234
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->duration:I

    .line 235
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->durationUrl:Ljava/lang/String;

    .line 236
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ima:Ljava/lang/String;

    .line 237
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->macAddress:Ljava/lang/String;

    .line 238
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->mediaFileUrl:Ljava/lang/String;

    .line 239
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->logicalMediaId:Ljava/lang/String;

    .line 240
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->physicalMediaId:Ljava/lang/String;

    .line 241
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playDuration:Ljava/lang/String;

    .line 242
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ra:Ljava/lang/String;

    .line 243
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->sy:Ljava/lang/String;

    .line 244
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ti:Ljava/lang/String;

    .line 245
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->token:Ljava/lang/String;

    .line 246
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackElapsed:I

    .line 247
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackStart:J

    .line 248
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackLogged:Z

    .line 249
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->appData:Ljava/lang/String;

    .line 250
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->selectedSubtitleIndex:I

    .line 251
    return-void

    .line 248
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry$1;)V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackStart:J

    .line 57
    iput v3, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackElapsed:I

    .line 58
    iput-boolean v3, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackLogged:Z

    .line 59
    iput v3, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->selectedSubtitleIndex:I

    .line 61
    const-string v0, "logicalMediaId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->logicalMediaId:Ljava/lang/String;

    .line 62
    const-string v0, "physicalMediaId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->physicalMediaId:Ljava/lang/String;

    .line 63
    const-string v0, "cacheId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "cacheId"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->cacheId:Ljava/lang/String;

    .line 64
    :cond_0
    const-string v1, "mediaId=%s&productId=%s&productPrice=%f&currencyCode=%s&localeInfo=%s&physicalMediaId=%s&logicalMediaId=%s&cacheId=%s"

    const/16 v0, 0x8

    new-array v2, v0, [Ljava/lang/Object;

    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->physicalMediaId:Ljava/lang/String;

    aput-object v0, v2, v3

    const/4 v0, 0x1

    const-string v3, "productId"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v0, 0x2

    const-string v3, "productPrice"

    .line 65
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v0, 0x3

    const-string v3, "currencyCode"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v0, 0x4

    const-string v3, "localeInfo"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    const/4 v0, 0x5

    iget-object v3, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->physicalMediaId:Ljava/lang/String;

    aput-object v3, v2, v0

    const/4 v0, 0x6

    iget-object v3, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->logicalMediaId:Ljava/lang/String;

    aput-object v3, v2, v0

    const/4 v3, 0x7

    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->cacheId:Ljava/lang/String;

    if-nez v0, :cond_a

    const-string v0, "freeVideo"

    :goto_0
    aput-object v0, v2, v3

    .line 64
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->token:Ljava/lang/String;

    .line 67
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->appData:Ljava/lang/String;

    .line 69
    const-string v0, "duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->duration:I

    .line 70
    :cond_1
    const-string v0, "durationUrl"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "durationUrl"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->durationUrl:Ljava/lang/String;

    .line 71
    :cond_2
    const-string v0, "ima"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "ima"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ima:Ljava/lang/String;

    .line 72
    :cond_3
    const-string v0, "macAddress"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "macAddress"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->macAddress:Ljava/lang/String;

    .line 73
    :cond_4
    const-string v0, "mediaFileUrl"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "mediaFileUrl"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->mediaFileUrl:Ljava/lang/String;

    .line 74
    :cond_5
    const-string v0, "playDuration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "playDuration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playDuration:Ljava/lang/String;

    .line 75
    :cond_6
    const-string v0, "ra"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "ra"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ra:Ljava/lang/String;

    .line 76
    :cond_7
    const-string v0, "sy"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "sy"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->sy:Ljava/lang/String;

    .line 77
    :cond_8
    const-string v0, "ti"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "ti"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ti:Ljava/lang/String;

    .line 78
    :cond_9
    return-void

    .line 65
    :cond_a
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->cacheId:Ljava/lang/String;

    goto/16 :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 196
    const/4 v0, 0x0

    return v0
.end method

.method public getAppData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->appData:Ljava/lang/String;

    return-object v0
.end method

.method public getCacheId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->cacheId:Ljava/lang/String;

    return-object v0
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 113
    iget v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->duration:I

    return v0
.end method

.method public getDurationUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->durationUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getIma()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ima:Ljava/lang/String;

    return-object v0
.end method

.method public getLogicalMediaId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->logicalMediaId:Ljava/lang/String;

    return-object v0
.end method

.method public getMacAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->macAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaFileUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->mediaFileUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getPhysicalMediaId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->physicalMediaId:Ljava/lang/String;

    return-object v0
.end method

.method public getPlayDuration()Ljava/lang/String;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playDuration:Ljava/lang/String;

    return-object v0
.end method

.method public getPlaybackElapsed()I
    .locals 1

    .prologue
    .line 167
    iget v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackElapsed:I

    return v0
.end method

.method public getPlaybackStart()J
    .locals 2

    .prologue
    .line 175
    iget-wide v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackStart:J

    return-wide v0
.end method

.method public getRa()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ra:Ljava/lang/String;

    return-object v0
.end method

.method public getSelectedSubtitleIndex()I
    .locals 1

    .prologue
    .line 187
    iget v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->selectedSubtitleIndex:I

    return v0
.end method

.method public getSy()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->sy:Ljava/lang/String;

    return-object v0
.end method

.method public getTi()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ti:Ljava/lang/String;

    return-object v0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->token:Ljava/lang/String;

    return-object v0
.end method

.method public hasExpired()Z
    .locals 4

    .prologue
    .line 105
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackStart:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x5265c00

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPlaybackLogged()Z
    .locals 1

    .prologue
    .line 171
    iget-boolean v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackLogged:Z

    return v0
.end method

.method public setPlaybackElapsed(I)V
    .locals 0

    .prologue
    .line 179
    iput p1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackElapsed:I

    .line 180
    return-void
.end method

.method public setPlaybackLogged(Z)V
    .locals 0

    .prologue
    .line 183
    iput-boolean p1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackLogged:Z

    .line 184
    return-void
.end method

.method public setSelectedSubtitleIndex(I)V
    .locals 0

    .prologue
    .line 191
    iput p1, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->selectedSubtitleIndex:I

    .line 192
    return-void
.end method

.method public timeToExpiryInMillis()J
    .locals 4

    .prologue
    .line 109
    iget-wide v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackStart:J

    const-wide/32 v2, 0x5265c00

    add-long/2addr v0, v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->cacheId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 202
    iget v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->duration:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 203
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->durationUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 204
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ima:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 205
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->macAddress:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 206
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->mediaFileUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 207
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->logicalMediaId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 208
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->physicalMediaId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 209
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playDuration:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 210
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ra:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 211
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->sy:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 212
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->ti:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 213
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->token:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 214
    iget v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackElapsed:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 215
    iget-wide v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackStart:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 216
    iget-boolean v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->playbackLogged:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 217
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->appData:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 218
    iget v0, p0, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->selectedSubtitleIndex:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 219
    return-void

    .line 216
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
