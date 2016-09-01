.class public final Lcom/auditude/ads/util/BrowserUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static OpenUrl(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 20
    invoke-static {p0}, Lcom/auditude/ads/util/StringUtil;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    :cond_0
    return-void
.end method

.method public static getPageUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 15
    const-string v0, ""

    return-object v0
.end method
