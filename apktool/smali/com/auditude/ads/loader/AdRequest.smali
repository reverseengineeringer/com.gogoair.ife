.class public Lcom/auditude/ads/loader/AdRequest;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final IMPRESSION_FORMAT:Ljava/lang/String; = "15"

.field private static final OUTPUT_FORMAT:Ljava/lang/String; = "1.4"


# instance fields
.field private aamSegments:[Ljava/lang/String;

.field private aamUuid:Ljava/lang/String;

.field private data:Ljava/util/HashMap;

.field private domain:Ljava/lang/String;

.field private mediaId:Ljava/lang/Object;

.field private timeout:I

.field private useSSL:Z

.field private zoneId:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;ILjava/lang/String;Ljava/util/HashMap;I)V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/loader/AdRequest;->useSSL:Z

    .line 32
    iput p2, p0, Lcom/auditude/ads/loader/AdRequest;->zoneId:I

    .line 33
    iput-object p3, p0, Lcom/auditude/ads/loader/AdRequest;->domain:Ljava/lang/String;

    .line 34
    iput-object p1, p0, Lcom/auditude/ads/loader/AdRequest;->mediaId:Ljava/lang/Object;

    .line 35
    iput-object p4, p0, Lcom/auditude/ads/loader/AdRequest;->data:Ljava/util/HashMap;

    .line 36
    iput p5, p0, Lcom/auditude/ads/loader/AdRequest;->timeout:I

    .line 38
    iget v0, p0, Lcom/auditude/ads/loader/AdRequest;->timeout:I

    if-gez v0, :cond_0

    .line 39
    :cond_0
    return-void
.end method

.method private getGeoString()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 242
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v1

    .line 243
    const-string v2, "auditudeParamZipCode"

    invoke-virtual {v1, v2}, Lcom/auditude/ads/core/AdSettings;->getCustomParamValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/auditude/ads/util/ObjectUtil;->convertToString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 244
    const-string v3, "auditudeParamCountryCode"

    invoke-virtual {v1, v3}, Lcom/auditude/ads/core/AdSettings;->getCustomParamValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/auditude/ads/util/ObjectUtil;->convertToString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 246
    invoke-static {v2}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {v1}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 248
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, ";"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";;;"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";;"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getGroupId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 236
    const-string v0, "1000005"

    return-object v0
.end method

.method private getTimelineString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->data:Ljava/util/HashMap;

    .line 213
    if-eqz v0, :cond_0

    const-string v1, "auditudeTimeline"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 215
    :cond_0
    const/4 v0, 0x0

    .line 218
    :goto_0
    return-object v0

    :cond_1
    const-string v1, "auditudeTimeline"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public final getAdRequestUrl()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 134
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->domain:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->mediaId:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/auditude/ads/loader/AdRequest;->zoneId:I

    if-gtz v0, :cond_1

    .line 206
    :cond_0
    :goto_0
    return-object v1

    .line 139
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v0, "http"

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/auditude/ads/loader/AdRequest;->useSSL:Z

    if-eqz v0, :cond_7

    const-string v0, "s"

    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "://"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    const-string v0, ""

    .line 142
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v2

    invoke-virtual {v2}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v2

    .line 143
    const-string v4, "adRequestDomain"

    invoke-virtual {v2, v4}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 145
    const-string v4, "adRequestDomain"

    invoke-virtual {v2, v4}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 147
    const-string v0, "adRequestDomain"

    invoke-virtual {v2, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 151
    :cond_2
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 153
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "/adserver?"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    :goto_2
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->mediaId:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Iterable;

    if-eqz v0, :cond_d

    .line 163
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->mediaId:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Iterable;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->mediaId:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Iterable;

    .line 164
    :goto_3
    const/4 v1, 0x0

    .line 165
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v2, v1

    :cond_3
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_b

    .line 187
    :cond_4
    :goto_5
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "&z="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/auditude/ads/loader/AdRequest;->zoneId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "&l="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/auditude/ads/util/AuditudeUtil$LocaltimeTagResult;

    invoke-direct {v1}, Lcom/auditude/ads/util/AuditudeUtil$LocaltimeTagResult;-><init>()V

    invoke-virtual {v1}, Lcom/auditude/ads/util/AuditudeUtil$LocaltimeTagResult;->getResult()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    const-string v0, "&of=1.4"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    const-string v0, "&tm=15"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "&g="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/auditude/ads/loader/AdRequest;->getGroupId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    invoke-direct {p0}, Lcom/auditude/ads/loader/AdRequest;->getGeoString()Ljava/lang/String;

    move-result-object v0

    .line 194
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 196
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "&geo="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/auditude/ads/util/URLUtil;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    :cond_5
    invoke-direct {p0}, Lcom/auditude/ads/loader/AdRequest;->getTimelineString()Ljava/lang/String;

    move-result-object v0

    .line 200
    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 202
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "&tl="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    :cond_6
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 139
    :cond_7
    const-string v0, ""

    goto/16 :goto_1

    .line 157
    :cond_8
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->domain:Ljava/lang/String;

    invoke-static {v0}, Lcom/auditude/ads/util/URLUtil;->isIPAddress(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_9

    const-string v0, "ad."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/auditude/ads/loader/AdRequest;->domain:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/adserver?"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    :cond_a
    move-object v0, v1

    .line 163
    goto/16 :goto_3

    .line 165
    :cond_b
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 167
    if-eqz v1, :cond_3

    move-object v0, v1

    .line 169
    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 174
    if-lez v2, :cond_c

    .line 176
    const-string v0, "&"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    :cond_c
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v5, "u="

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/auditude/ads/util/MD5;->GetMd5String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto/16 :goto_4

    .line 182
    :cond_d
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->mediaId:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/String;

    if-ne v0, v1, :cond_4

    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "u="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/auditude/ads/loader/AdRequest;->mediaId:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/auditude/ads/util/MD5;->GetMd5String(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_5
.end method

.method public final getDomain()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->domain:Ljava/lang/String;

    return-object v0
.end method

.method public final getKeyValueString()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v2, 0x0

    .line 63
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->data:Ljava/util/HashMap;

    .line 65
    if-eqz v0, :cond_0

    const-string v1, "userData"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 67
    :cond_0
    const/4 v0, 0x0

    .line 129
    :goto_0
    return-object v0

    .line 70
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    const-string v1, "userData"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 73
    if-nez v1, :cond_2

    .line 75
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 78
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v4, Ljava/lang/String;

    if-ne v0, v4, :cond_3

    move-object v0, v1

    .line 80
    check-cast v0, Ljava/lang/String;

    const-string v4, ";"

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 82
    if-eqz v4, :cond_3

    array-length v0, v4

    if-lez v0, :cond_3

    .line 84
    array-length v5, v4

    move v0, v2

    :goto_1
    if-lt v0, v5, :cond_7

    .line 96
    :cond_3
    instance-of v0, v1, Ljava/util/Map;

    if-eqz v0, :cond_4

    .line 101
    :try_start_0
    check-cast v1, Ljava/util/Map;

    .line 102
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 103
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-nez v0, :cond_9

    .line 116
    :cond_4
    :goto_3
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->aamSegments:[Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->aamSegments:[Ljava/lang/String;

    array-length v0, v0

    if-lez v0, :cond_5

    move v0, v2

    .line 118
    :goto_4
    iget-object v1, p0, Lcom/auditude/ads/loader/AdRequest;->aamSegments:[Ljava/lang/String;

    array-length v1, v1

    if-lt v0, v1, :cond_a

    .line 124
    :cond_5
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->aamUuid:Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->aamUuid:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_6

    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "aud_aam_uuid="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/auditude/ads/loader/AdRequest;->aamUuid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    :cond_6
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 84
    :cond_7
    aget-object v6, v4, v0

    .line 86
    const-string v7, "="

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    .line 87
    if-gtz v7, :cond_8

    .line 84
    :goto_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 91
    :cond_8
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/auditude/ads/util/URLUtil;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/auditude/ads/util/URLUtil;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 105
    :cond_9
    :try_start_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 106
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/auditude/ads/util/URLUtil;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/auditude/ads/util/URLUtil;->urlEncode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\n"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .line 110
    :catch_0
    move-exception v0

    goto/16 :goto_3

    .line 120
    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "aud_aam_segs="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/auditude/ads/loader/AdRequest;->aamSegments:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_4
.end method

.method public final getMediaId()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/auditude/ads/loader/AdRequest;->mediaId:Ljava/lang/Object;

    return-object v0
.end method

.method public final getUseSSL()Z
    .locals 1

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/auditude/ads/loader/AdRequest;->useSSL:Z

    return v0
.end method

.method public final getZoneId()I
    .locals 1

    .prologue
    .line 57
    iget v0, p0, Lcom/auditude/ads/loader/AdRequest;->zoneId:I

    return v0
.end method

.method public final setAamSegments([Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 47
    iput-object p1, p0, Lcom/auditude/ads/loader/AdRequest;->aamSegments:[Ljava/lang/String;

    .line 48
    return-void
.end method

.method public final setAamUuid(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 52
    iput-object p1, p0, Lcom/auditude/ads/loader/AdRequest;->aamUuid:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public final setUseSSL(Z)V
    .locals 0

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/auditude/ads/loader/AdRequest;->useSSL:Z

    return-void
.end method
