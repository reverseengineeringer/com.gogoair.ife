.class Lcom/adobe/mobile/VisitorIDService$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field final synthetic this$0:Lcom/adobe/mobile/VisitorIDService;


# direct methods
.method constructor <init>(Lcom/adobe/mobile/VisitorIDService;)V
    .locals 0

    .prologue
    .line 248
    iput-object p1, p0, Lcom/adobe/mobile/VisitorIDService$3;->this$0:Lcom/adobe/mobile/VisitorIDService;

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
    .line 248
    invoke-virtual {p0}, Lcom/adobe/mobile/VisitorIDService$3;->call()Ljava/lang/String;

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
    .line 251
    iget-object v0, p0, Lcom/adobe/mobile/VisitorIDService$3;->this$0:Lcom/adobe/mobile/VisitorIDService;

    # getter for: Lcom/adobe/mobile/VisitorIDService;->_marketingCloudID:Ljava/lang/String;
    invoke-static {v0}, Lcom/adobe/mobile/VisitorIDService;->access$000(Lcom/adobe/mobile/VisitorIDService;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
