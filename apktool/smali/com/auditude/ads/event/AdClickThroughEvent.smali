.class public Lcom/auditude/ads/event/AdClickThroughEvent;
.super Lcom/auditude/ads/event/AdPluginEvent;
.source "SourceFile"


# static fields
.field public static final AD_CLICK:Ljava/lang/String; = "adClick"


# instance fields
.field private click:Lcom/auditude/ads/model/IClick;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/auditude/ads/model/IClick;)V
    .locals 1

    .prologue
    .line 13
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/auditude/ads/event/AdClickThroughEvent;-><init>(Ljava/lang/String;Lcom/auditude/ads/model/IClick;Ljava/util/HashMap;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/auditude/ads/model/IClick;Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0, p1, p3}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 19
    iput-object p2, p0, Lcom/auditude/ads/event/AdClickThroughEvent;->click:Lcom/auditude/ads/model/IClick;

    .line 20
    return-void
.end method


# virtual methods
.method public final getClick()Lcom/auditude/ads/model/IClick;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/auditude/ads/event/AdClickThroughEvent;->click:Lcom/auditude/ads/model/IClick;

    return-object v0
.end method
