.class public Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginConfig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/plugin/IPluginConfig;


# instance fields
.field public debugLogging:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/plugins/videoplayer/VideoPlayerPluginConfig;->debugLogging:Z

    return-void
.end method
