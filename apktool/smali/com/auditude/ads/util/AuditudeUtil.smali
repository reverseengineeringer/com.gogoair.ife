.class public Lcom/auditude/ads/util/AuditudeUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/util/AuditudeUtil$AssetURI;,
        Lcom/auditude/ads/util/AuditudeUtil$CacheBustingTagResult;,
        Lcom/auditude/ads/util/AuditudeUtil$ContentPlayhead;,
        Lcom/auditude/ads/util/AuditudeUtil$HeightTagResult;,
        Lcom/auditude/ads/util/AuditudeUtil$ITagResult;,
        Lcom/auditude/ads/util/AuditudeUtil$LocaltimeTagResult;,
        Lcom/auditude/ads/util/AuditudeUtil$PageUrlTagResult;,
        Lcom/auditude/ads/util/AuditudeUtil$RandomTagResult;,
        Lcom/auditude/ads/util/AuditudeUtil$TimestampTagResult;,
        Lcom/auditude/ads/util/AuditudeUtil$WidthTagResult;
    }
.end annotation


# static fields
.field public static AuditudePluginSize:Lcom/auditude/ads/util/Size;

.field private static URL_TAGS:Ljava/util/HashMap;

.field private static assetUri:Ljava/lang/String;

.field private static contentPlayhead:I

.field private static isInitialized:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 15
    new-instance v0, Lcom/auditude/ads/util/Size;

    invoke-direct {v0, v1, v1}, Lcom/auditude/ads/util/Size;-><init>(II)V

    sput-object v0, Lcom/auditude/ads/util/AuditudeUtil;->AuditudePluginSize:Lcom/auditude/ads/util/Size;

    .line 17
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    .line 18
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/auditude/ads/util/AuditudeUtil;->isInitialized:Ljava/lang/Boolean;

    .line 19
    sput v1, Lcom/auditude/ads/util/AuditudeUtil;->contentPlayhead:I

    .line 20
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()I
    .locals 1

    .prologue
    .line 19
    sget v0, Lcom/auditude/ads/util/AuditudeUtil;->contentPlayhead:I

    return v0
.end method

.method static synthetic access$1()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->assetUri:Ljava/lang/String;

    return-object v0
.end method

.method public static getUrlWithState(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 66
    .line 68
    invoke-static {p0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 71
    const-string v0, "https?://.*.auditude.com/adserver/.*"

    .line 72
    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    .line 74
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v2

    invoke-virtual {v2}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v2

    .line 75
    const-string v3, "adRequestDomain"

    invoke-virtual {v2, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 77
    const-string v3, "adRequestDomain"

    invoke-virtual {v2, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 79
    const-string v3, "adRequestDomain"

    invoke-virtual {v2, v3}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 80
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "https?://"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/adserver/.*"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 81
    if-nez v0, :cond_2

    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    move v0, v1

    .line 85
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 87
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 88
    if-lez v0, :cond_1

    .line 90
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    const-string v3, "="

    invoke-static {p1, v2, v3}, Lcom/auditude/ads/util/StringUtil;->ConvertToString(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 94
    :cond_1
    return-object p0

    .line 81
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static initialize()V
    .locals 3

    .prologue
    .line 24
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->isInitialized:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    :goto_0
    return-void

    .line 26
    :cond_0
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    const-string v1, "[timestamp]"

    new-instance v2, Lcom/auditude/ads/util/AuditudeUtil$TimestampTagResult;

    invoke-direct {v2}, Lcom/auditude/ads/util/AuditudeUtil$TimestampTagResult;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    const-string v1, "[random]"

    new-instance v2, Lcom/auditude/ads/util/AuditudeUtil$RandomTagResult;

    invoke-direct {v2}, Lcom/auditude/ads/util/AuditudeUtil$RandomTagResult;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    const-string v1, "[CACHEBUSTING]"

    new-instance v2, Lcom/auditude/ads/util/AuditudeUtil$CacheBustingTagResult;

    invoke-direct {v2}, Lcom/auditude/ads/util/AuditudeUtil$CacheBustingTagResult;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    const-string v1, "%5BCACHEBUSTING%5D"

    new-instance v2, Lcom/auditude/ads/util/AuditudeUtil$CacheBustingTagResult;

    invoke-direct {v2}, Lcom/auditude/ads/util/AuditudeUtil$CacheBustingTagResult;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    const-string v1, "[page_url]"

    new-instance v2, Lcom/auditude/ads/util/AuditudeUtil$PageUrlTagResult;

    invoke-direct {v2}, Lcom/auditude/ads/util/AuditudeUtil$PageUrlTagResult;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    const-string v1, "[width]"

    new-instance v2, Lcom/auditude/ads/util/AuditudeUtil$WidthTagResult;

    invoke-direct {v2}, Lcom/auditude/ads/util/AuditudeUtil$WidthTagResult;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    const-string v1, "[height]"

    new-instance v2, Lcom/auditude/ads/util/AuditudeUtil$HeightTagResult;

    invoke-direct {v2}, Lcom/auditude/ads/util/AuditudeUtil$HeightTagResult;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    const-string v1, "[localtime]"

    new-instance v2, Lcom/auditude/ads/util/AuditudeUtil$LocaltimeTagResult;

    invoke-direct {v2}, Lcom/auditude/ads/util/AuditudeUtil$LocaltimeTagResult;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    const-string v1, "[CONTENTPLAYHEAD]"

    new-instance v2, Lcom/auditude/ads/util/AuditudeUtil$ContentPlayhead;

    invoke-direct {v2}, Lcom/auditude/ads/util/AuditudeUtil$ContentPlayhead;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    const-string v1, "[ASSETURI]"

    new-instance v2, Lcom/auditude/ads/util/AuditudeUtil$AssetURI;

    invoke-direct {v2}, Lcom/auditude/ads/util/AuditudeUtil$AssetURI;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/auditude/ads/util/AuditudeUtil;->isInitialized:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static setAssetURI(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 263
    sput-object p0, Lcom/auditude/ads/util/AuditudeUtil;->assetUri:Ljava/lang/String;

    .line 264
    return-void
.end method

.method public static setContentPlayhead(I)V
    .locals 0

    .prologue
    .line 244
    sput p0, Lcom/auditude/ads/util/AuditudeUtil;->contentPlayhead:I

    .line 245
    return-void
.end method

.method public static substituteCustomPublisherTags(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    .locals 4

    .prologue
    .line 55
    invoke-static {p0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    if-nez p1, :cond_1

    .line 61
    :cond_0
    return-object p0

    .line 57
    :cond_1
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v1, "\\["

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\\]"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static substituteTags(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 42
    invoke-static {p0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 50
    :cond_0
    return-object p0

    .line 43
    :cond_1
    invoke-static {}, Lcom/auditude/ads/util/AuditudeUtil;->initialize()V

    .line 45
    sget-object v0, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 47
    sget-object v1, Lcom/auditude/ads/util/AuditudeUtil;->URL_TAGS:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/auditude/ads/util/AuditudeUtil$ITagResult;

    invoke-interface {v1}, Lcom/auditude/ads/util/AuditudeUtil$ITagResult;->getResult()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method
