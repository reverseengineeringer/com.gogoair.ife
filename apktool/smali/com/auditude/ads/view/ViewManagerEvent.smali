.class public Lcom/auditude/ads/view/ViewManagerEvent;
.super Lcom/auditude/ads/util/event/Event;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;
    }
.end annotation


# instance fields
.field private asset:Lcom/auditude/ads/model/IAsset;

.field private type:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;Lcom/auditude/ads/model/IAsset;)V
    .locals 2

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/auditude/ads/util/event/Event;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;)V

    .line 19
    invoke-static {}, Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;->values()[Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/auditude/ads/view/ViewManagerEvent;->type:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    .line 25
    iput-object p2, p0, Lcom/auditude/ads/view/ViewManagerEvent;->type:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    .line 26
    iput-object p3, p0, Lcom/auditude/ads/view/ViewManagerEvent;->asset:Lcom/auditude/ads/model/IAsset;

    .line 27
    return-void
.end method


# virtual methods
.method public final getAsset()Lcom/auditude/ads/model/IAsset;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManagerEvent;->asset:Lcom/auditude/ads/model/IAsset;

    return-object v0
.end method

.method public final getType()Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/auditude/ads/view/ViewManagerEvent;->type:Lcom/auditude/ads/view/ViewManagerEvent$ViewManagerEventType;

    return-object v0
.end method
