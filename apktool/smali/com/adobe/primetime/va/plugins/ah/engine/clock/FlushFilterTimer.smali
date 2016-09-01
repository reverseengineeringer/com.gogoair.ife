.class public final Lcom/adobe/primetime/va/plugins/ah/engine/clock/FlushFilterTimer;
.super Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;
.source "SourceFile"


# static fields
.field private static final DEFAULT_FLUSH_FILTER_INTERVAL:D = 0.25

.field private static final NAME:Ljava/lang/String; = "flush_filter"


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Lcom/adobe/primetime/core/ILogger;)V
    .locals 7

    .prologue
    .line 35
    const-string v3, "flush_filter"

    const-wide/high16 v4, 0x3fd0000000000000L    # 0.25

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;-><init>(Lcom/adobe/primetime/core/plugin/PluginManager;Lcom/adobe/primetime/core/radio/Channel;Ljava/lang/String;DLcom/adobe/primetime/core/ILogger;)V

    .line 36
    return-void
.end method


# virtual methods
.method public bridge synthetic destroy()V
    .locals 0

    .prologue
    .line 26
    invoke-super {p0}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->destroy()V

    return-void
.end method

.method public bridge synthetic pause(Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 26
    invoke-super {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->pause(Ljava/lang/Boolean;)V

    return-void
.end method

.method public bridge synthetic resume(Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 26
    invoke-super {p0, p1}, Lcom/adobe/primetime/va/plugins/ah/engine/clock/Timer;->resume(Ljava/lang/Boolean;)V

    return-void
.end method
