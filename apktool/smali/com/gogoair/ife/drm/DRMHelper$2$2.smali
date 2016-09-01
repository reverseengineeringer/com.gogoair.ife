.class Lcom/gogoair/ife/drm/DRMHelper$2$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/ave/drm/DRMAuthenticationCompleteCallback;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/drm/DRMHelper$2;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/drm/DRMHelper$2;)V
    .locals 0

    .prologue
    .line 259
    iput-object p1, p0, Lcom/gogoair/ife/drm/DRMHelper$2$2;->this$0:Lcom/gogoair/ife/drm/DRMHelper$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AuthenticationComplete([B)V
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$2$2;->this$0:Lcom/gogoair/ife/drm/DRMHelper$2;

    iget-object v0, v0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authenticationListener:Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;

    invoke-interface {v0, p1}, Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;->onAuthenticationComplete([B)V

    .line 263
    return-void
.end method
