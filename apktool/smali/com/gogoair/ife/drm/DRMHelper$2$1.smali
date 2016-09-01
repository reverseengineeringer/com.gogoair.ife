.class Lcom/gogoair/ife/drm/DRMHelper$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/ave/drm/DRMOperationErrorCallback;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/drm/DRMHelper$2;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/drm/DRMHelper$2;)V
    .locals 0

    .prologue
    .line 252
    iput-object p1, p0, Lcom/gogoair/ife/drm/DRMHelper$2$1;->this$0:Lcom/gogoair/ife/drm/DRMHelper$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OperationError(JJLjava/lang/Exception;)V
    .locals 7

    .prologue
    .line 255
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$2$1;->this$0:Lcom/gogoair/ife/drm/DRMHelper$2;

    iget-object v1, v0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authenticationListener:Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    invoke-interface/range {v1 .. v6}, Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;->onAuthenticationError(JJLjava/lang/Exception;)V

    .line 256
    return-void
.end method
