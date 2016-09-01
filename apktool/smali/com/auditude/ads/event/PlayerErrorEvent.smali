.class public Lcom/auditude/ads/event/PlayerErrorEvent;
.super Lcom/auditude/ads/util/event/Event;
.source "SourceFile"


# static fields
.field public static final PLAYER_ERROR:Ljava/lang/String; = "playerError"


# instance fields
.field public exception:Lcom/auditude/ads/exception/PlayerException;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/exception/PlayerException;)V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0, p1}, Lcom/auditude/ads/util/event/Event;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;)V

    .line 16
    iput-object p2, p0, Lcom/auditude/ads/event/PlayerErrorEvent;->exception:Lcom/auditude/ads/exception/PlayerException;

    .line 17
    return-void
.end method
