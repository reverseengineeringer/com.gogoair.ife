.class Lcom/gogoair/ife/views/PlayerActivity$6$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$2:Lcom/gogoair/ife/views/PlayerActivity$6$1;

.field final synthetic val$e:Ljava/lang/Exception;

.field final synthetic val$majorCode:J


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity$6$1;JLjava/lang/Exception;)V
    .locals 0

    .prologue
    .line 420
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1$1;->this$2:Lcom/gogoair/ife/views/PlayerActivity$6$1;

    iput-wide p2, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1$1;->val$majorCode:J

    iput-object p4, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1$1;->val$e:Ljava/lang/Exception;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 423
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "ERROR"

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->DRM_AUTH_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->getValue()I

    move-result v2

    iget-wide v4, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1$1;->val$majorCode:J

    long-to-int v3, v4

    iget-object v4, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1$1;->this$2:Lcom/gogoair/ife/views/PlayerActivity$6$1;

    iget-object v4, v4, Lcom/gogoair/ife/views/PlayerActivity$6$1;->this$1:Lcom/gogoair/ife/views/PlayerActivity$6;

    iget-object v4, v4, Lcom/gogoair/ife/views/PlayerActivity$6;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # getter for: Lcom/gogoair/ife/views/PlayerActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v4}, Lcom/gogoair/ife/views/PlayerActivity;->access$300(Lcom/gogoair/ife/views/PlayerActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v4

    invoke-virtual {v4}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getAppData()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1$1;->val$e:Ljava/lang/Exception;

    invoke-virtual {v5}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/gogoair/ife/utils/GVLogger;->logASP(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    .line 424
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1$1;->this$2:Lcom/gogoair/ife/views/PlayerActivity$6$1;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$6$1;->this$1:Lcom/gogoair/ife/views/PlayerActivity$6;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$6;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->DRM_AUTH_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    iget-wide v2, p0, Lcom/gogoair/ife/views/PlayerActivity$6$1$1;->val$majorCode:J

    long-to-int v2, v2

    int-to-long v2, v2

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->goToLandingPage(Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V
    invoke-static {v0, v1, v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->access$2200(Lcom/gogoair/ife/views/PlayerActivity;Lcom/gogoair/ife/utils/Constants$GVErrorCode;J)V

    .line 425
    return-void
.end method
