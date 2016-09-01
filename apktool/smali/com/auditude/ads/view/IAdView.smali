.class public interface abstract Lcom/auditude/ads/view/IAdView;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/view/IAuditudeView;


# virtual methods
.method public abstract dispose()V
.end method

.method public abstract getDuration()I
.end method

.method public abstract getLeftVolume()F
.end method

.method public abstract getPlaybackSession()Lcom/auditude/ads/session/IPlaybackSession;
.end method

.method public abstract getPosition()I
.end method

.method public abstract getRightVolume()F
.end method

.method public abstract getSource()Lcom/auditude/ads/view/model/IAdViewSource;
.end method

.method public abstract hide(Lcom/auditude/ads/view/model/IAdViewSource;)V
.end method

.method public abstract notifyAdEvent(Lcom/auditude/ads/view/AdViewEvent$AdViewEventType;Ljava/util/HashMap;)V
.end method

.method public abstract reset()V
.end method

.method public abstract setPlaybackSession(Lcom/auditude/ads/session/IPlaybackSession;)V
.end method

.method public abstract setVolume(FF)V
.end method

.method public abstract shouldNotifyAdBeginOnLoad()Z
.end method

.method public abstract show(Lcom/auditude/ads/view/model/IAdViewSource;)V
.end method
