.class public Lcom/auditude/ads/event/AdPluginEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final BREAK_BEGIN:Ljava/lang/String; = "breakBegin"

.field public static final BREAK_END:Ljava/lang/String; = "breakEnd"

.field public static final INIT_COMPLETE:Ljava/lang/String; = "initComplete"

.field public static final LOAD_COMPLETE:Ljava/lang/String; = "loadComplete"

.field public static final NETWORK_AD_RESPONSE_EMPTY:Ljava/lang/String; = "NetworkAdResponseEmpty"

.field public static final PAUSE_PLAYBACK:Ljava/lang/String; = "pausePlayback"

.field public static final RESUME_PLAYBACK:Ljava/lang/String; = "resumePlayback"


# instance fields
.field private data:Ljava/util/HashMap;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/auditude/ads/event/AdPluginEvent;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/auditude/ads/event/AdPluginEvent;->type:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lcom/auditude/ads/event/AdPluginEvent;->data:Ljava/util/HashMap;

    .line 25
    return-void
.end method


# virtual methods
.method public final getData()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/auditude/ads/event/AdPluginEvent;->data:Ljava/util/HashMap;

    return-object v0
.end method

.method public final getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/auditude/ads/event/AdPluginEvent;->type:Ljava/lang/String;

    return-object v0
.end method
