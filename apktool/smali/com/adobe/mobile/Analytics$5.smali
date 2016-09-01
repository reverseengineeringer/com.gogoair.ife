.class final Lcom/adobe/mobile/Analytics$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 111
    invoke-static {}, Lcom/adobe/mobile/AnalyticsTrackBeacon;->clearBeacon()V

    .line 112
    return-void
.end method
