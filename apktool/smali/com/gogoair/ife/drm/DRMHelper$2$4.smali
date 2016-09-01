.class Lcom/gogoair/ife/drm/DRMHelper$2$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/ave/drm/DRMOperationCompleteCallback;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/drm/DRMHelper$2;

.field final synthetic val$customAuthenticationTokenBytes:[B


# direct methods
.method constructor <init>(Lcom/gogoair/ife/drm/DRMHelper$2;[B)V
    .locals 0

    .prologue
    .line 291
    iput-object p1, p0, Lcom/gogoair/ife/drm/DRMHelper$2$4;->this$0:Lcom/gogoair/ife/drm/DRMHelper$2;

    iput-object p2, p0, Lcom/gogoair/ife/drm/DRMHelper$2$4;->val$customAuthenticationTokenBytes:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OperationComplete()V
    .locals 3

    .prologue
    .line 293
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    const-string v2, "authentication token set"

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$2$4;->this$0:Lcom/gogoair/ife/drm/DRMHelper$2;

    iget-object v0, v0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authenticationListener:Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;

    iget-object v1, p0, Lcom/gogoair/ife/drm/DRMHelper$2$4;->val$customAuthenticationTokenBytes:[B

    invoke-interface {v0, v1}, Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;->onAuthenticationComplete([B)V

    .line 295
    return-void
.end method
