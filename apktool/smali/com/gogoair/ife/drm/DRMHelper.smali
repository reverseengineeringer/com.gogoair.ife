.class public Lcom/gogoair/ife/drm/DRMHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;,
        Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;,
        Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "[DRMPLAYER]::DRMHelper"

.field private static useCloudDRM:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/gogoair/ife/drm/DRMHelper;->useCloudDRM:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    invoke-static {p0}, Lcom/gogoair/ife/drm/DRMHelper;->getBytesFromURL(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/ave/drm/DRMMetadata;)Z
    .locals 1

    .prologue
    .line 46
    invoke-static {p0}, Lcom/gogoair/ife/drm/DRMHelper;->isAuthNeeded(Lcom/adobe/ave/drm/DRMMetadata;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/gogoair/ife/drm/DRMHelper;->useCloudDRM:Ljava/lang/Boolean;

    return-object v0
.end method

.method public static acquireLicense(Lcom/adobe/ave/drm/DRMManager;Lcom/adobe/ave/drm/DRMMetadata;Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;)V
    .locals 3

    .prologue
    .line 373
    if-nez p1, :cond_0

    .line 396
    :goto_0
    return-void

    .line 377
    :cond_0
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    const-string v2, "Acquiring license."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    if-eqz p2, :cond_1

    .line 379
    invoke-interface {p2}, Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;->onStart()V

    .line 381
    :cond_1
    sget-object v0, Lcom/adobe/ave/drm/DRMAcquireLicenseSettings;->FORCE_REFRESH:Lcom/adobe/ave/drm/DRMAcquireLicenseSettings;

    new-instance v1, Lcom/gogoair/ife/drm/DRMHelper$3;

    invoke-direct {v1, p2}, Lcom/gogoair/ife/drm/DRMHelper$3;-><init>(Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;)V

    new-instance v2, Lcom/gogoair/ife/drm/DRMHelper$4;

    invoke-direct {v2, p2}, Lcom/gogoair/ife/drm/DRMHelper$4;-><init>(Lcom/gogoair/ife/drm/DRMHelper$DRMLicenseAcquisitionListener;)V

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/adobe/ave/drm/DRMManager;->acquireLicense(Lcom/adobe/ave/drm/DRMMetadata;Lcom/adobe/ave/drm/DRMAcquireLicenseSettings;Lcom/adobe/ave/drm/DRMOperationErrorCallback;Lcom/adobe/ave/drm/DRMLicenseAcquiredCallback;)V

    goto :goto_0
.end method

.method private static getBytesFromInputStream(Ljava/io/InputStream;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 359
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 360
    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 363
    :cond_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 364
    if-lez v2, :cond_1

    .line 365
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 366
    :cond_1
    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 368
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 369
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method private static getBytesFromURL(Ljava/lang/String;)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 351
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 352
    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    .line 353
    invoke-static {v0}, Lcom/gogoair/ife/drm/DRMHelper;->getBytesFromInputStream(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 354
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 355
    return-object v1
.end method

.method public static getUseCloudDRM()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lcom/gogoair/ife/drm/DRMHelper;->useCloudDRM:Ljava/lang/Boolean;

    return-object v0
.end method

.method private static isAuthNeeded(Lcom/adobe/ave/drm/DRMMetadata;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 193
    if-nez p0, :cond_1

    .line 197
    :cond_0
    :goto_0
    return v0

    .line 196
    :cond_1
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMMetadata;->getPolicies()[Lcom/adobe/ave/drm/DRMPolicy;

    move-result-object v1

    aget-object v1, v1, v0

    .line 197
    invoke-virtual {v1}, Lcom/adobe/ave/drm/DRMPolicy;->getAuthenticationMethod()Lcom/adobe/ave/drm/DRMAuthenticationMethod;

    move-result-object v1

    sget-object v2, Lcom/adobe/ave/drm/DRMAuthenticationMethod;->USERNAME_AND_PASSWORD:Lcom/adobe/ave/drm/DRMAuthenticationMethod;

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static loadDRMMetadata(Lcom/adobe/ave/drm/DRMManager;Ljava/lang/String;Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;)V
    .locals 3

    .prologue
    .line 130
    invoke-static {p1}, Lcom/adobe/mediacore/utils/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    invoke-interface {p2}, Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;->onLoadMetadataUrlError()V

    .line 182
    :goto_0
    return-void

    .line 135
    :cond_0
    if-nez p2, :cond_1

    .line 136
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    const-string v2, "DRMLoadMetadataListener is null."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 140
    :cond_1
    new-instance v0, Lcom/gogoair/ife/drm/DRMHelper$1;

    invoke-direct {v0, p2, p1, p0}, Lcom/gogoair/ife/drm/DRMHelper$1;-><init>(Lcom/gogoair/ife/drm/DRMHelper$DRMLoadMetadataListener;Ljava/lang/String;Lcom/adobe/ave/drm/DRMManager;)V

    .line 181
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public static performDrmAuthentication(Lcom/adobe/ave/drm/DRMManager;Lcom/adobe/ave/drm/DRMMetadata;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;)V
    .locals 7

    .prologue
    .line 218
    if-nez p1, :cond_0

    .line 219
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    const-string v2, "DRM Metadata is null."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    :goto_0
    return-void

    .line 223
    :cond_0
    if-nez p5, :cond_1

    .line 224
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    const-string v2, "DRMAuthenticationListener is null."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 228
    :cond_1
    if-nez p0, :cond_2

    .line 229
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    const-string v2, "DRMManager is null."

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 233
    :cond_2
    new-instance v0, Lcom/gogoair/ife/drm/DRMHelper$2;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p5

    move-object v5, p0

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/gogoair/ife/drm/DRMHelper$2;-><init>(Lcom/adobe/ave/drm/DRMMetadata;Ljava/lang/String;Ljava/lang/String;Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;Lcom/adobe/ave/drm/DRMManager;Ljava/lang/String;)V

    .line 341
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public static setUseCloudDRM(Ljava/lang/Boolean;)V
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/gogoair/ife/drm/DRMHelper;->useCloudDRM:Ljava/lang/Boolean;

    .line 56
    return-void
.end method
