.class final Lcom/adobe/mobile/AudienceManagerWorker$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/adobe/mobile/AudienceManagerWorker$3;->call()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 120
    # getter for: Lcom/adobe/mobile/AudienceManagerWorker;->_dpid:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/mobile/AudienceManagerWorker;->access$300()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
