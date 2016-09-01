.class public interface abstract Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/drm/DRMHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "DRMAuthenticationListener"
.end annotation


# virtual methods
.method public abstract onAuthenticationComplete([B)V
.end method

.method public abstract onAuthenticationError(JJLjava/lang/Exception;)V
.end method

.method public abstract onAuthenticationStart()V
.end method
