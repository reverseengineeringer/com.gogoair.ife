.class final Lcom/adobe/mobile/Analytics$14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 286
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 288
    invoke-static {}, Lcom/adobe/mobile/AnalyticsWorker;->sharedInstance()Lcom/adobe/mobile/AnalyticsWorker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/mobile/AnalyticsWorker;->forceKick()V

    .line 289
    return-void
.end method
