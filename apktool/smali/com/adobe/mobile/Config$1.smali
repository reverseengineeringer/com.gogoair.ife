.class final Lcom/adobe/mobile/Config$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 61
    invoke-static {}, Lcom/adobe/mobile/WearableFunctionBridge;->syncConfigFromHandheld()V

    .line 62
    return-void
.end method
