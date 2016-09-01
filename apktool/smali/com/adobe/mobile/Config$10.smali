.class final Lcom/adobe/mobile/Config$10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 215
    invoke-static {}, Lcom/adobe/mobile/Lifecycle;->stop()V

    .line 216
    return-void
.end method
