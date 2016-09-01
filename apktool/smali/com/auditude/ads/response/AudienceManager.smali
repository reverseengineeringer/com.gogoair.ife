.class public Lcom/auditude/ads/response/AudienceManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;
    }
.end annotation


# static fields
.field public static final AUD_AAM_SEGS:Ljava/lang/String; = "aud_aam_segs"

.field public static final AUD_AAM_SEGS_DATE:Ljava/lang/String; = "aud_aam_segs_expire"

.field public static final AUD_AAM_UUID:Ljava/lang/String; = "aud_aam_uuid"

.field public static final AUD_CN_NAME:Ljava/lang/String; = "aud"

.field public static final AUD_OBJ_NAME:Ljava/lang/String; = "stuff"

.field public static final AUD_SEGS_PARAM_NAME:Ljava/lang/String; = "segs"


# instance fields
.field private aamUrl:Ljava/lang/String;

.field private dataLoader:Lcom/auditude/ads/loader/DataLoader;

.field private listener:Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;

.field private segmentsValues:[Ljava/lang/String;

.field private timeout:I

.field private uuid:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput p1, p0, Lcom/auditude/ads/response/AudienceManager;->timeout:I

    .line 35
    return-void
.end method

.method private loadData()Ljava/lang/Boolean;
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 143
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v1, "applicationContext"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 144
    if-eqz v0, :cond_3

    .line 148
    :try_start_0
    const-string v1, "aud_aam_segs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 149
    const-string v1, "aud_aam_segs_expire"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 150
    const-string v2, "aamUrl"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 151
    if-eqz v1, :cond_2

    .line 153
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, v1}, Ljava/util/Date;-><init>(Ljava/lang/String;)V

    .line 154
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 155
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    long-to-int v1, v4

    .line 156
    const v3, 0x5265c00

    if-ge v1, v3, :cond_1

    iget-object v1, p0, Lcom/auditude/ads/response/AudienceManager;->aamUrl:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 158
    const-string v1, "aud_aam_segs"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 159
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 161
    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/auditude/ads/response/AudienceManager;->segmentsValues:[Ljava/lang/String;

    .line 163
    :cond_0
    const-string v1, "aud_aam_uuid"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->uuid:Ljava/lang/String;

    .line 164
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 183
    :goto_0
    return-object v0

    .line 168
    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 173
    :cond_2
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 176
    :catch_0
    move-exception v0

    .line 178
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 183
    :cond_3
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method private saveData()V
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 110
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v2, "applicationContext"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 111
    if-eqz v0, :cond_2

    .line 115
    :try_start_0
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 116
    const-string v3, "aud_aam_segs"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 117
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 118
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 119
    const-string v0, "aud_aam_segs_expire"

    invoke-virtual {v2}, Ljava/util/Date;->toGMTString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 120
    const-string v0, "aamUrl"

    iget-object v2, p0, Lcom/auditude/ads/response/AudienceManager;->aamUrl:Ljava/lang/String;

    invoke-interface {v3, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 121
    iget-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->uuid:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, "aud_aam_uuid"

    iget-object v2, p0, Lcom/auditude/ads/response/AudienceManager;->uuid:Ljava/lang/String;

    invoke-interface {v3, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 123
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    iget-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->segmentsValues:[Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->segmentsValues:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_1

    move v0, v1

    .line 126
    :goto_0
    iget-object v1, p0, Lcom/auditude/ads/response/AudienceManager;->segmentsValues:[Ljava/lang/String;

    array-length v1, v1

    if-lt v0, v1, :cond_3

    .line 130
    const-string v0, "aud_aam_segs"

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 132
    :cond_1
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 139
    :cond_2
    :goto_1
    return-void

    .line 128
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/auditude/ads/response/AudienceManager;->segmentsValues:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, ","

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 134
    :catch_0
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method public getSegmentsValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->segmentsValues:[Ljava/lang/String;

    return-object v0
.end method

.method public getUuid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->uuid:Ljava/lang/String;

    return-object v0
.end method

.method public loadSegmentData(Ljava/lang/String;)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 39
    iput-object p1, p0, Lcom/auditude/ads/response/AudienceManager;->aamUrl:Ljava/lang/String;

    .line 40
    iput-object v3, p0, Lcom/auditude/ads/response/AudienceManager;->segmentsValues:[Ljava/lang/String;

    .line 41
    iput-object v3, p0, Lcom/auditude/ads/response/AudienceManager;->uuid:Ljava/lang/String;

    .line 43
    invoke-direct {p0}, Lcom/auditude/ads/response/AudienceManager;->loadData()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->listener:Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;

    invoke-interface {v0}, Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;->onAudienceManagerComplete()V

    .line 53
    :goto_0
    return-void

    .line 49
    :cond_0
    new-instance v0, Lcom/auditude/ads/loader/DataLoader;

    invoke-direct {v0}, Lcom/auditude/ads/loader/DataLoader;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    .line 50
    iget-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/loader/DataLoader;->setDataLoaderListener(Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;)V

    .line 51
    iget-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    iget-object v1, p0, Lcom/auditude/ads/response/AudienceManager;->aamUrl:Ljava/lang/String;

    iget v2, p0, Lcom/auditude/ads/response/AudienceManager;->timeout:I

    invoke-virtual {v0, v1, v3, v2}, Lcom/auditude/ads/loader/DataLoader;->load(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public onRequestComplete(Ljava/lang/String;)V
    .locals 6

    .prologue
    const/4 v0, 0x0

    const/4 v5, 0x1

    .line 61
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 62
    const-string v2, "uuid"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/auditude/ads/response/AudienceManager;->uuid:Ljava/lang/String;

    .line 63
    const-string v2, "stuff"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 65
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 78
    invoke-direct {p0}, Lcom/auditude/ads/response/AudienceManager;->saveData()V

    .line 79
    iget-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->listener:Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;

    invoke-interface {v0}, Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;->onAudienceManagerComplete()V

    .line 85
    :goto_1
    return-void

    .line 67
    :cond_0
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 69
    const-string v3, "cn"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    const-string v4, "aud"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "cv"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 71
    const-string v3, "cv"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 72
    if-eqz v2, :cond_1

    array-length v3, v2

    if-le v3, v5, :cond_1

    const/4 v3, 0x0

    aget-object v3, v2, v3

    const-string v4, "segs"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    aget-object v3, v2, v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 74
    const/4 v3, 0x1

    aget-object v2, v2, v3

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/auditude/ads/response/AudienceManager;->segmentsValues:[Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 81
    :catch_0
    move-exception v0

    .line 83
    iget-object v1, p0, Lcom/auditude/ads/response/AudienceManager;->listener:Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;

    invoke-interface {v1, v0}, Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;->onAudienceManagerFailed(Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public onRequestFailed(Ljava/lang/Throwable;)V
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/auditude/ads/response/AudienceManager;->listener:Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;

    invoke-interface {v0, p1}, Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;->onAudienceManagerFailed(Ljava/lang/Throwable;)V

    .line 90
    return-void
.end method

.method public setAudienceManagerListener(Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/auditude/ads/response/AudienceManager;->listener:Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;

    return-void
.end method
