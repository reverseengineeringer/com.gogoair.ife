.class public Lcom/auditude/ads/event/AdPluginErrorEvent;
.super Lcom/auditude/ads/event/AdPluginEvent;
.source "SourceFile"


# static fields
.field public static final INIT_FAILED:Ljava/lang/String; = "initFailed"

.field public static final PLUGIN_ERROR:Ljava/lang/String; = "pluginError"


# instance fields
.field private error:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .prologue
    .line 13
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/auditude/ads/event/AdPluginErrorEvent;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/HashMap;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0, p1, p3}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 19
    iput-object p2, p0, Lcom/auditude/ads/event/AdPluginErrorEvent;->error:Ljava/lang/Throwable;

    .line 20
    return-void
.end method


# virtual methods
.method public final getError()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/auditude/ads/event/AdPluginErrorEvent;->error:Ljava/lang/Throwable;

    return-object v0
.end method
