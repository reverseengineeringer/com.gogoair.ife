.class public Lcom/auditude/ads/network/vast/model/VASTMediaFile;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final DELIVERY_PROGRESSIVE:Ljava/lang/String; = "progressive"

.field public static final DELIVERY_STREAMING:Ljava/lang/String; = "streaming"


# instance fields
.field public apiFramework:Ljava/lang/String;

.field public bitrate:I

.field public delivery:Ljava/lang/String;

.field public height:I

.field public id:Ljava/lang/String;

.field public maintainAspectRatio:Z

.field public scalable:Z

.field public type:Ljava/lang/String;

.field public url:Ljava/lang/String;

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput v0, p0, Lcom/auditude/ads/network/vast/model/VASTMediaFile;->bitrate:I

    .line 6
    return-void
.end method

.method public static parseDuration(Ljava/lang/String;)I
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v0, 0x0

    .line 24
    invoke-static {p0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 32
    :goto_0
    return v0

    .line 26
    :cond_0
    const-string v1, ":"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 27
    array-length v2, v1

    if-gt v2, v3, :cond_1

    .line 29
    invoke-static {p0, v0}, Lcom/auditude/ads/util/ObjectUtil;->convertToInt(Ljava/lang/Object;I)I

    move-result v0

    goto :goto_0

    .line 32
    :cond_1
    aget-object v2, v1, v0

    invoke-static {v2, v0}, Lcom/auditude/ads/util/ObjectUtil;->convertToInt(Ljava/lang/Object;I)I

    move-result v2

    mul-int/lit16 v2, v2, 0xe10

    .line 33
    aget-object v3, v1, v3

    invoke-static {v3, v0}, Lcom/auditude/ads/util/ObjectUtil;->convertToInt(Ljava/lang/Object;I)I

    move-result v3

    mul-int/lit8 v3, v3, 0x3c

    .line 32
    add-int/2addr v2, v3

    .line 34
    const/4 v3, 0x2

    aget-object v1, v1, v3

    invoke-static {v1, v0}, Lcom/auditude/ads/util/ObjectUtil;->convertToInt(Ljava/lang/Object;I)I

    move-result v0

    .line 32
    add-int/2addr v0, v2

    goto :goto_0
.end method
