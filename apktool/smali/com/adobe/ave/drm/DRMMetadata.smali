.class public Lcom/adobe/ave/drm/DRMMetadata;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected licenseId:Ljava/lang/String;

.field protected peerObject:J

.field protected policies:[Lcom/adobe/ave/drm/DRMPolicy;

.field protected serverURL:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Lcom/adobe/ave/drm/DRMManager;[BLcom/adobe/ave/drm/DRMOperationErrorCallback;)V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    if-nez p1, :cond_1

    .line 54
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 56
    :cond_1
    new-instance v0, Lcom/adobe/ave/drm/DRMMetadata$1;

    invoke-direct {v0, p0}, Lcom/adobe/ave/drm/DRMMetadata$1;-><init>(Lcom/adobe/ave/drm/DRMMetadata;)V

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/adobe/ave/drm/DRMMetadata;->init(Lcom/adobe/ave/drm/DRMManager;[BLcom/adobe/ave/drm/DRMOperationErrorCallback;Lcom/adobe/ave/drm/DRMMetadataCreatedCallback;)V

    .line 62
    return-void
.end method

.method protected static createFromData(Lcom/adobe/ave/drm/DRMManager;[BLcom/adobe/ave/drm/DRMOperationErrorCallback;)Lcom/adobe/ave/drm/DRMMetadata;
    .locals 6

    .prologue
    .line 42
    new-instance v0, Lcom/adobe/ave/drm/DRMMetadata;

    invoke-direct {v0, p0, p1, p2}, Lcom/adobe/ave/drm/DRMMetadata;-><init>(Lcom/adobe/ave/drm/DRMManager;[BLcom/adobe/ave/drm/DRMOperationErrorCallback;)V

    .line 43
    iget-wide v2, v0, Lcom/adobe/ave/drm/DRMMetadata;->peerObject:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 44
    const/4 v0, 0x0

    .line 46
    :cond_0
    return-object v0
.end method

.method private native init(Lcom/adobe/ave/drm/DRMManager;[BLcom/adobe/ave/drm/DRMOperationErrorCallback;Lcom/adobe/ave/drm/DRMMetadataCreatedCallback;)V
.end method


# virtual methods
.method protected native finalize()V
.end method

.method public native getLicenseId()Ljava/lang/String;
.end method

.method public native getPolicies()[Lcom/adobe/ave/drm/DRMPolicy;
.end method

.method public native getServerURL()Ljava/lang/String;
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 86
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 87
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMMetadata;->getServerURL()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "License server URL: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMMetadata;->getServerURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    :cond_0
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMMetadata;->getLicenseId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "License id: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMMetadata;->getLicenseId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 94
    :goto_0
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMMetadata;->getPolicies()[Lcom/adobe/ave/drm/DRMPolicy;

    move-result-object v2

    .line 95
    if-eqz v2, :cond_2

    .line 96
    const/4 v0, 0x0

    :goto_1
    array-length v3, v2

    if-ge v0, v3, :cond_2

    .line 97
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Policy #: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    aget-object v3, v2, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 96
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 92
    :cond_1
    const-string v0, "Invalid metadata file\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 101
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
