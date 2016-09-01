.class public Lcom/adobe/primetime/va/HeartbeatConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public debugLogging:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/va/HeartbeatConfig;->debugLogging:Z

    return-void
.end method
