.class public Lcom/auditude/ads/event/SMILEvent;
.super Lcom/auditude/ads/util/event/Event;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/event/SMILEvent$SMILEventType;
    }
.end annotation


# instance fields
.field private advancePattern:Z

.field private par:Lcom/auditude/ads/model/smil/Par;

.field private sequence:Lcom/auditude/ads/model/smil/Sequence;

.field private type:Lcom/auditude/ads/event/SMILEvent$SMILEventType;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/event/SMILEvent$SMILEventType;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Z)V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/auditude/ads/util/event/Event;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;)V

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/event/SMILEvent;->advancePattern:Z

    .line 27
    iput-object p2, p0, Lcom/auditude/ads/event/SMILEvent;->type:Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    .line 28
    iput-object p3, p0, Lcom/auditude/ads/event/SMILEvent;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    .line 29
    iput-object p4, p0, Lcom/auditude/ads/event/SMILEvent;->par:Lcom/auditude/ads/model/smil/Par;

    .line 30
    iput-boolean p5, p0, Lcom/auditude/ads/event/SMILEvent;->advancePattern:Z

    .line 31
    return-void
.end method


# virtual methods
.method public final getAdvancePattern()Z
    .locals 1

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/auditude/ads/event/SMILEvent;->advancePattern:Z

    return v0
.end method

.method public final getPar()Lcom/auditude/ads/model/smil/Par;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/auditude/ads/event/SMILEvent;->par:Lcom/auditude/ads/model/smil/Par;

    return-object v0
.end method

.method public final getSequence()Lcom/auditude/ads/model/smil/Sequence;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/auditude/ads/event/SMILEvent;->sequence:Lcom/auditude/ads/model/smil/Sequence;

    return-object v0
.end method

.method public final getType()Lcom/auditude/ads/event/SMILEvent$SMILEventType;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/auditude/ads/event/SMILEvent;->type:Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    return-object v0
.end method
