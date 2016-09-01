.class public interface abstract Lcom/auditude/ads/view/IViewController;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract addPropertyChangeListener(Lcom/auditude/ads/util/event/IEventListener;)V
.end method

.method public abstract getBitRate()I
.end method

.method public abstract getHeight()I
.end method

.method public abstract getIsInBreak()Z
.end method

.method public abstract getLeftVolume()F
.end method

.method public abstract getProperty(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract getRightVolume()F
.end method

.method public abstract getWidth()I
.end method

.method public abstract hasProperty(Ljava/lang/String;)Z
.end method

.method public abstract notifyAdViewEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Lcom/auditude/ads/view/IAdView;Ljava/util/HashMap;)V
.end method

.method public abstract pauseMainMedia()V
.end method

.method public abstract removePropertyChangeListener(Lcom/auditude/ads/util/event/IEventListener;)V
.end method

.method public abstract resumeMainMedia()V
.end method
