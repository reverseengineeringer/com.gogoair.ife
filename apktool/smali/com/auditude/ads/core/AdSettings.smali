.class public Lcom/auditude/ads/core/AdSettings;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final PUBLISHER_VERSION:Ljava/lang/String; = "publisherVersion"

.field public static final USE_SSL:Ljava/lang/String; = "useSSL"


# instance fields
.field private aamSegments:[Ljava/lang/String;

.field private aamUuid:Ljava/lang/String;

.field private adProperties:Ljava/util/HashMap;

.field private customParams:Ljava/util/HashMap;

.field private domain:Ljava/lang/String;

.field pcs:Ljava/beans/PropertyChangeSupport;

.field private zoneId:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/high16 v3, 0x3f400000    # 0.75f

    const/4 v2, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/core/AdSettings;->adProperties:Ljava/util/HashMap;

    .line 25
    new-instance v0, Ljava/beans/PropertyChangeSupport;

    invoke-direct {v0, p0}, Ljava/beans/PropertyChangeSupport;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/auditude/ads/core/AdSettings;->pcs:Ljava/beans/PropertyChangeSupport;

    .line 29
    const-string v0, "bitrate"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 30
    const-string v0, "leftVolume"

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 31
    const-string v0, "rightVolume"

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 32
    const-string v0, "width"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 33
    const-string v0, "height"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 34
    const-string v0, "auditudeHandlesChapterBreaks"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 35
    const-string v0, "auditudeHandlesLinearVideoAds"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 36
    const-string v0, "userAgent"

    const-string v1, ""

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 37
    const-string v0, "useSSL"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 38
    return-void
.end method


# virtual methods
.method public addPropertyChangeListener(Ljava/beans/PropertyChangeListener;)V
    .locals 1

    .prologue
    .line 264
    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->pcs:Ljava/beans/PropertyChangeSupport;

    invoke-virtual {v0, p1}, Ljava/beans/PropertyChangeSupport;->addPropertyChangeListener(Ljava/beans/PropertyChangeListener;)V

    .line 265
    return-void
.end method

.method public final getBitRate()I
    .locals 1

    .prologue
    .line 114
    const-string v0, "bitrate"

    invoke-virtual {p0, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getCustomParamValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 142
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->customParams:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->customParams:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 147
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getCustomParams()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->customParams:Ljava/util/HashMap;

    return-object v0
.end method

.method public final getDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->domain:Ljava/lang/String;

    return-object v0
.end method

.method public final getHeight()D
    .locals 2

    .prologue
    .line 80
    const-string v0, "height"

    invoke-virtual {p0, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public final getLeftVolume()F
    .locals 2

    .prologue
    .line 98
    const-string v0, "leftVolume"

    invoke-virtual {p0, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->convertToFloat(Ljava/lang/Object;F)F

    move-result v0

    return v0
.end method

.method public final getPassThroughParams()Ljava/util/HashMap;
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 153
    .line 154
    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->customParams:Ljava/util/HashMap;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->customParams:Ljava/util/HashMap;

    const-string v3, "auditudePassThroughParams"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->customParams:Ljava/util/HashMap;

    const-string v3, "auditudePassThroughParams"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 155
    :goto_0
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-class v4, Ljava/lang/String;

    if-ne v3, v4, :cond_8

    .line 157
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 158
    check-cast v0, Ljava/lang/String;

    const-string v3, ";"

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 159
    if-eqz v3, :cond_b

    array-length v0, v3

    if-lez v0, :cond_b

    .line 161
    array-length v4, v3

    move v0, v2

    :goto_1
    if-lt v0, v4, :cond_6

    move-object v0, v1

    .line 182
    :goto_2
    iget-object v1, p0, Lcom/auditude/ads/core/AdSettings;->aamSegments:[Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/auditude/ads/core/AdSettings;->aamSegments:[Ljava/lang/String;

    array-length v1, v1

    if-gtz v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/auditude/ads/core/AdSettings;->aamUuid:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/auditude/ads/core/AdSettings;->aamUuid:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_4

    .line 184
    :cond_1
    if-nez v0, :cond_2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 185
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 187
    iget-object v1, p0, Lcom/auditude/ads/core/AdSettings;->aamSegments:[Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/auditude/ads/core/AdSettings;->aamSegments:[Ljava/lang/String;

    array-length v1, v1

    if-lez v1, :cond_3

    move v1, v2

    .line 189
    :goto_3
    iget-object v2, p0, Lcom/auditude/ads/core/AdSettings;->aamSegments:[Ljava/lang/String;

    array-length v2, v2

    if-lt v1, v2, :cond_9

    .line 193
    const-string v1, "aud_aam_segs"

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    :cond_3
    iget-object v1, p0, Lcom/auditude/ads/core/AdSettings;->aamUuid:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/auditude/ads/core/AdSettings;->aamUuid:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_4

    .line 197
    const-string v1, "aud_aam_uuid"

    iget-object v2, p0, Lcom/auditude/ads/core/AdSettings;->aamUuid:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    :cond_4
    return-object v0

    :cond_5
    move-object v0, v1

    .line 154
    goto :goto_0

    .line 161
    :cond_6
    aget-object v5, v3, v0

    .line 163
    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 164
    if-gtz v6, :cond_7

    .line 161
    :goto_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 168
    :cond_7
    invoke-virtual {v5, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 172
    :cond_8
    instance-of v3, v0, Ljava/util/HashMap;

    if-eqz v3, :cond_a

    .line 176
    :try_start_0
    check-cast v0, Ljava/util/HashMap;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 178
    :catch_0
    move-exception v0

    move-object v0, v1

    goto :goto_2

    .line 191
    :cond_9
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "aud_aam_segs="

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/auditude/ads/core/AdSettings;->aamSegments:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ";"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_a
    move-object v0, v1

    goto/16 :goto_2

    :cond_b
    move-object v0, v1

    goto/16 :goto_2
.end method

.method public final getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 235
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->adProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 237
    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->adProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 240
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getPropertyAsBoolean(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 245
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->adProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->adProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 248
    if-eqz v0, :cond_0

    .line 250
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 254
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getPublisherVersion()Ljava/lang/String;
    .locals 2

    .prologue
    .line 42
    const-string v0, "publisherVersion"

    invoke-virtual {p0, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 43
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    :goto_0
    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getRightVolume()F
    .locals 2

    .prologue
    .line 103
    const-string v0, "rightVolume"

    invoke-virtual {p0, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->convertToFloat(Ljava/lang/Object;F)F

    move-result v0

    return v0
.end method

.method public final getUserAgent()Ljava/lang/String;
    .locals 2

    .prologue
    .line 89
    const-string v0, "userAgent"

    invoke-virtual {p0, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/auditude/ads/util/ObjectUtil;->convertToString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getUserData()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 205
    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->customParams:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->customParams:Ljava/util/HashMap;

    const-string v1, "userData"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->customParams:Ljava/util/HashMap;

    const-string v1, "userData"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final getWidth()D
    .locals 2

    .prologue
    .line 71
    const-string v0, "width"

    invoke-virtual {p0, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public final getZoneId()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lcom/auditude/ads/core/AdSettings;->zoneId:I

    return v0
.end method

.method public final hasProperty(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 259
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->adProperties:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removePropertyChangeListener(Ljava/beans/PropertyChangeListener;)V
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lcom/auditude/ads/core/AdSettings;->pcs:Ljava/beans/PropertyChangeSupport;

    invoke-virtual {v0, p1}, Ljava/beans/PropertyChangeSupport;->removePropertyChangeListener(Ljava/beans/PropertyChangeListener;)V

    .line 270
    return-void
.end method

.method public final setAamSegments([Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 132
    iput-object p1, p0, Lcom/auditude/ads/core/AdSettings;->aamSegments:[Ljava/lang/String;

    .line 133
    return-void
.end method

.method public final setAamUuid(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 137
    iput-object p1, p0, Lcom/auditude/ads/core/AdSettings;->aamUuid:Ljava/lang/String;

    .line 138
    return-void
.end method

.method public final setBitRate(I)V
    .locals 2

    .prologue
    .line 119
    const-string v0, "bitrate"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 120
    return-void
.end method

.method public final setCustomParams(Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 128
    iput-object p1, p0, Lcom/auditude/ads/core/AdSettings;->customParams:Ljava/util/HashMap;

    .line 129
    return-void
.end method

.method public final setDomain(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 56
    iput-object p1, p0, Lcom/auditude/ads/core/AdSettings;->domain:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public final setHeight(D)V
    .locals 3

    .prologue
    .line 84
    const-string v0, "height"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    return-void
.end method

.method public final setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 210
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 211
    return-void
.end method

.method public final setProperty(Ljava/lang/String;Ljava/lang/Object;Z)V
    .locals 2

    .prologue
    .line 215
    if-nez p1, :cond_1

    .line 231
    :cond_0
    :goto_0
    return-void

    .line 220
    :cond_1
    invoke-virtual {p0, p1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 221
    iget-object v1, p0, Lcom/auditude/ads/core/AdSettings;->adProperties:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    if-eq p2, v0, :cond_0

    .line 226
    if-eqz p3, :cond_0

    .line 228
    iget-object v1, p0, Lcom/auditude/ads/core/AdSettings;->pcs:Ljava/beans/PropertyChangeSupport;

    invoke-virtual {v1, p1, v0, p2}, Ljava/beans/PropertyChangeSupport;->firePropertyChange(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public final setPublisherVersion(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/auditude/ads/core/AdSettings;->getPublisherVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 48
    return-void
.end method

.method public final setUserAgent(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 93
    const-string v0, "userAgent"

    invoke-virtual {p0, v0, p1}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    return-void
.end method

.method public final setVolume(FF)V
    .locals 2

    .prologue
    .line 108
    const-string v0, "leftVolume"

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 109
    const-string v0, "rightVolume"

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 110
    return-void
.end method

.method public final setWidth(D)V
    .locals 3

    .prologue
    .line 75
    const-string v0, "width"

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/core/AdSettings;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 76
    return-void
.end method

.method public final setZoneId(I)V
    .locals 0

    .prologue
    .line 66
    iput p1, p0, Lcom/auditude/ads/core/AdSettings;->zoneId:I

    .line 67
    return-void
.end method
