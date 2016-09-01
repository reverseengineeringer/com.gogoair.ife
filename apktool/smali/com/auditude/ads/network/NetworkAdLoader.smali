.class public abstract Lcom/auditude/ads/network/NetworkAdLoader;
.super Lcom/auditude/ads/util/event/EventDispatcher;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/network/INetworkAdLoader;


# static fields
.field public static final COMPLETE:Ljava/lang/String; = "complete"

.field public static final ERROR:Ljava/lang/String; = "error"


# instance fields
.field private ad:Lcom/auditude/ads/model/Ad;

.field private customParams:Ljava/util/HashMap;

.field private result:Ljava/lang/Object;

.field private source:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/auditude/ads/util/event/EventDispatcher;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract cancel()V
.end method

.method public final getAd()Lcom/auditude/ads/model/Ad;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/auditude/ads/network/NetworkAdLoader;->ad:Lcom/auditude/ads/model/Ad;

    return-object v0
.end method

.method public final getResult()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/auditude/ads/network/NetworkAdLoader;->result:Ljava/lang/Object;

    return-object v0
.end method

.method public final getSource()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/auditude/ads/network/NetworkAdLoader;->source:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 45
    iget-object v0, p0, Lcom/auditude/ads/network/NetworkAdLoader;->source:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/auditude/ads/util/AuditudeUtil;->substituteTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/auditude/ads/network/NetworkAdLoader;->customParams:Ljava/util/HashMap;

    if-eqz v1, :cond_0

    .line 50
    iget-object v1, p0, Lcom/auditude/ads/network/NetworkAdLoader;->customParams:Ljava/util/HashMap;

    invoke-static {v0, v1}, Lcom/auditude/ads/util/AuditudeUtil;->substituteCustomPublisherTags(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    .line 54
    :cond_0
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AdSettings;->getPassThroughParams()Ljava/util/HashMap;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/auditude/ads/util/AuditudeUtil;->substituteCustomPublisherTags(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    .line 60
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/network/NetworkAdLoader;->source:Ljava/lang/Object;

    goto :goto_0
.end method

.method public load()V
    .locals 0

    .prologue
    .line 26
    return-void
.end method

.method protected final logError(ILjava/lang/String;)V
    .locals 4

    .prologue
    .line 96
    new-instance v0, Lcom/auditude/ads/exception/AssetException;

    invoke-direct {v0, p1, p2}, Lcom/auditude/ads/exception/AssetException;-><init>(ILjava/lang/String;)V

    .line 97
    iget-object v1, p0, Lcom/auditude/ads/network/NetworkAdLoader;->ad:Lcom/auditude/ads/model/Ad;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/auditude/ads/network/NetworkAdLoader;->ad:Lcom/auditude/ads/model/Ad;

    invoke-virtual {v1}, Lcom/auditude/ads/model/Ad;->getID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/auditude/ads/exception/AssetException;->adId:Ljava/lang/String;

    .line 99
    :cond_0
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getAPI()Lcom/auditude/ads/core/APIBridge;

    move-result-object v1

    const-string v2, "playerError"

    .line 100
    new-instance v3, Lcom/auditude/ads/event/PlayerErrorEvent;

    invoke-direct {v3, p0, v0}, Lcom/auditude/ads/event/PlayerErrorEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/exception/PlayerException;)V

    .line 99
    invoke-virtual {v1, v2, v3}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    return-void
.end method

.method protected final notifyComplete()V
    .locals 2

    .prologue
    .line 86
    const-string v0, "complete"

    new-instance v1, Lcom/auditude/ads/util/event/Event;

    invoke-direct {v1, p0}, Lcom/auditude/ads/util/event/Event;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;)V

    invoke-virtual {p0, v0, v1}, Lcom/auditude/ads/network/NetworkAdLoader;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 87
    return-void
.end method

.method protected final notifyError(Lcom/auditude/ads/event/AdPluginEvent;)V
    .locals 1

    .prologue
    .line 91
    const-string v0, "error"

    invoke-virtual {p0, v0, p1}, Lcom/auditude/ads/network/NetworkAdLoader;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    return-void
.end method

.method public final setAd(Lcom/auditude/ads/model/Ad;)V
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/auditude/ads/network/NetworkAdLoader;->ad:Lcom/auditude/ads/model/Ad;

    .line 38
    return-void
.end method

.method public final setCustomParams(Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 81
    iput-object p1, p0, Lcom/auditude/ads/network/NetworkAdLoader;->customParams:Ljava/util/HashMap;

    .line 82
    return-void
.end method

.method public final setResult(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 76
    iput-object p1, p0, Lcom/auditude/ads/network/NetworkAdLoader;->result:Ljava/lang/Object;

    .line 77
    return-void
.end method

.method public final setSource(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 66
    iput-object p1, p0, Lcom/auditude/ads/network/NetworkAdLoader;->source:Ljava/lang/Object;

    .line 67
    return-void
.end method
