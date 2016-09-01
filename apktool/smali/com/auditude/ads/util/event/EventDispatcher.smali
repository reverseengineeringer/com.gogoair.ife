.class public Lcom/auditude/ads/util/event/EventDispatcher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/util/event/IEventDispatcher;


# instance fields
.field private listeners:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/util/event/EventDispatcher;->listeners:Ljava/util/HashMap;

    .line 11
    return-void
.end method

.method private getListenersForType(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/auditude/ads/util/event/EventDispatcher;->getListenersForType(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method private getListenersForType(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/util/ArrayList;
    .locals 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/auditude/ads/util/event/EventDispatcher;->listeners:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/auditude/ads/util/event/EventDispatcher;->listeners:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 114
    :goto_0
    return-object v0

    .line 107
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 110
    iget-object v1, p0, Lcom/auditude/ads/util/event/EventDispatcher;->listeners:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 114
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/auditude/ads/util/event/EventDispatcher;->addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;I)V

    .line 18
    return-void
.end method

.method public addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;I)V
    .locals 4

    .prologue
    .line 22
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    .line 24
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/auditude/ads/util/event/EventDispatcher;->getListenersForType(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/util/ArrayList;

    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 27
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 42
    new-instance v0, Lcom/auditude/ads/util/event/EventListenerHolder;

    invoke-direct {v0, p2, p3}, Lcom/auditude/ads/util/event/EventListenerHolder;-><init>(Lcom/auditude/ads/util/event/IEventListener;I)V

    .line 43
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    new-instance v0, Lcom/auditude/ads/util/event/ListenerPriorityComparator;

    invoke-direct {v0}, Lcom/auditude/ads/util/event/ListenerPriorityComparator;-><init>()V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 47
    :cond_1
    :goto_0
    return-void

    .line 29
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/event/EventListenerHolder;

    .line 30
    iget-object v3, v0, Lcom/auditude/ads/util/event/EventListenerHolder;->listener:Lcom/auditude/ads/util/event/IEventListener;

    if-ne v3, p2, :cond_0

    .line 32
    iget v2, v0, Lcom/auditude/ads/util/event/EventListenerHolder;->priority:I

    if-eq v2, p3, :cond_1

    .line 34
    iput p3, v0, Lcom/auditude/ads/util/event/EventListenerHolder;->priority:I

    .line 35
    new-instance v0, Lcom/auditude/ads/util/event/ListenerPriorityComparator;

    invoke-direct {v0}, Lcom/auditude/ads/util/event/ListenerPriorityComparator;-><init>()V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    goto :goto_0
.end method

.method public dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/auditude/ads/util/event/EventDispatcher;->listeners:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    invoke-direct {p0, p1}, Lcom/auditude/ads/util/event/EventDispatcher;->getListenersForType(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 54
    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 57
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 63
    :cond_0
    return-void

    .line 59
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/event/EventListenerHolder;

    invoke-virtual {v0, p1, p2}, Lcom/auditude/ads/util/event/EventListenerHolder;->invoke(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public hasEventListener(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 67
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 69
    invoke-direct {p0, p1}, Lcom/auditude/ads/util/event/EventDispatcher;->getListenersForType(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 70
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 73
    :goto_0
    return-object v0

    .line 70
    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 73
    :cond_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V
    .locals 2

    .prologue
    .line 78
    invoke-static {p1}, Lcom/auditude/ads/util/StringUtil;->isNotNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    .line 80
    invoke-direct {p0, p1}, Lcom/auditude/ads/util/event/EventDispatcher;->getListenersForType(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 81
    if-eqz v0, :cond_1

    .line 83
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 84
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 93
    :cond_1
    return-void

    .line 86
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/util/event/EventListenerHolder;

    iget-object v0, v0, Lcom/auditude/ads/util/event/EventListenerHolder;->listener:Lcom/auditude/ads/util/event/IEventListener;

    if-ne v0, p2, :cond_0

    .line 88
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0
.end method
