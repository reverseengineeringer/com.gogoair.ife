.class final Lcom/adobe/mobile/Media$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$offset:D


# direct methods
.method constructor <init>(Ljava/lang/String;D)V
    .locals 0

    .prologue
    .line 119
    iput-object p1, p0, Lcom/adobe/mobile/Media$5;->val$name:Ljava/lang/String;

    iput-wide p2, p0, Lcom/adobe/mobile/Media$5;->val$offset:D

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 121
    invoke-static {}, Lcom/adobe/mobile/MediaAnalytics;->sharedInstance()Lcom/adobe/mobile/MediaAnalytics;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/mobile/Media$5;->val$name:Ljava/lang/String;

    iget-wide v2, p0, Lcom/adobe/mobile/Media$5;->val$offset:D

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/mobile/MediaAnalytics;->stop(Ljava/lang/String;D)V

    .line 122
    return-void
.end method
