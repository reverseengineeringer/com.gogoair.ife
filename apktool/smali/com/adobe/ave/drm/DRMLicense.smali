.class public Lcom/adobe/ave/drm/DRMLicense;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field bytes:[B

.field customProperties:Ljava/util/Map;

.field licenseEndDate:Ljava/util/Date;

.field licenseID:Ljava/lang/String;

.field licenseStartDate:Ljava/util/Date;

.field offlineStorageEndDate:Ljava/util/Date;

.field offlineStorageStartDate:Ljava/util/Date;

.field playbackTimeWindow:Lcom/adobe/ave/drm/DRMPlaybackTimeWindow;

.field policyID:Ljava/lang/String;

.field serverURL:Ljava/lang/String;


# direct methods
.method protected constructor <init>([BLjava/util/Date;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/ave/drm/DRMPlaybackTimeWindow;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/adobe/ave/drm/DRMLicense;->bytes:[B

    .line 55
    iput-object p2, p0, Lcom/adobe/ave/drm/DRMLicense;->licenseStartDate:Ljava/util/Date;

    .line 56
    iput-object p3, p0, Lcom/adobe/ave/drm/DRMLicense;->licenseEndDate:Ljava/util/Date;

    .line 57
    iput-object p4, p0, Lcom/adobe/ave/drm/DRMLicense;->offlineStorageStartDate:Ljava/util/Date;

    .line 58
    iput-object p5, p0, Lcom/adobe/ave/drm/DRMLicense;->offlineStorageEndDate:Ljava/util/Date;

    .line 59
    iput-object p6, p0, Lcom/adobe/ave/drm/DRMLicense;->serverURL:Ljava/lang/String;

    .line 60
    iput-object p7, p0, Lcom/adobe/ave/drm/DRMLicense;->licenseID:Ljava/lang/String;

    .line 61
    iput-object p8, p0, Lcom/adobe/ave/drm/DRMLicense;->policyID:Ljava/lang/String;

    .line 62
    iput-object p9, p0, Lcom/adobe/ave/drm/DRMLicense;->playbackTimeWindow:Lcom/adobe/ave/drm/DRMPlaybackTimeWindow;

    .line 63
    iput-object p10, p0, Lcom/adobe/ave/drm/DRMLicense;->customProperties:Ljava/util/Map;

    .line 64
    return-void
.end method

.method private printCustomProperties()Ljava/lang/String;
    .locals 5

    .prologue
    .line 132
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 133
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMLicense;->getCustomProperties()Ljava/util/Map;

    move-result-object v2

    .line 134
    if-nez v2, :cond_0

    .line 135
    const-string v0, ""

    .line 145
    :goto_0
    return-object v0

    .line 136
    :cond_0
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 137
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 139
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 140
    const/16 v4, 0x9

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 141
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 142
    const-string v4, ": "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    new-instance v4, Ljava/lang/String;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 145
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public getCustomProperties()Ljava/util/Map;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMLicense;->customProperties:Ljava/util/Map;

    return-object v0
.end method

.method public getLicenseEndDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMLicense;->licenseEndDate:Ljava/util/Date;

    return-object v0
.end method

.method public getLicenseID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMLicense;->licenseID:Ljava/lang/String;

    return-object v0
.end method

.method public getLicenseStartDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMLicense;->licenseStartDate:Ljava/util/Date;

    return-object v0
.end method

.method public getOfflineStorageEndDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMLicense;->offlineStorageEndDate:Ljava/util/Date;

    return-object v0
.end method

.method public getOfflineStorageStartDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMLicense;->offlineStorageStartDate:Ljava/util/Date;

    return-object v0
.end method

.method public getPlaybackTimeWindow()Lcom/adobe/ave/drm/DRMPlaybackTimeWindow;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMLicense;->playbackTimeWindow:Lcom/adobe/ave/drm/DRMPlaybackTimeWindow;

    return-object v0
.end method

.method public getPolicyID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMLicense;->policyID:Ljava/lang/String;

    return-object v0
.end method

.method public getServerURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMLicense;->serverURL:Ljava/lang/String;

    return-object v0
.end method

.method public toBytes()[B
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMLicense;->bytes:[B

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "License: \n\tStart date: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 120
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMLicense;->getLicenseStartDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\tEnd date: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 121
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMLicense;->getLicenseEndDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\tOffline storage start date: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 122
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMLicense;->getOfflineStorageStartDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\tOffline storage end date: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 123
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMLicense;->getOfflineStorageEndDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\tPlayback window: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 124
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMLicense;->getPlaybackTimeWindow()Lcom/adobe/ave/drm/DRMPlaybackTimeWindow;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\tServer URL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 125
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMLicense;->getServerURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\tLicense ID: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 126
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMLicense;->getLicenseID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\tPolicy ID: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 127
    invoke-virtual {p0}, Lcom/adobe/ave/drm/DRMLicense;->getPolicyID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 128
    invoke-direct {p0}, Lcom/adobe/ave/drm/DRMLicense;->printCustomProperties()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
