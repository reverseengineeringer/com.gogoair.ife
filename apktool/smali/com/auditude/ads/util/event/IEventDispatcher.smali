.class public interface abstract Lcom/auditude/ads/util/event/IEventDispatcher;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V
.end method

.method public abstract addEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;I)V
.end method

.method public abstract dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract hasEventListener(Ljava/lang/String;)Ljava/lang/Boolean;
.end method

.method public abstract removeEventListener(Ljava/lang/String;Lcom/auditude/ads/util/event/IEventListener;)V
.end method
