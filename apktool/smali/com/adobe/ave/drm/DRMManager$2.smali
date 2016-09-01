.class Lcom/adobe/ave/drm/DRMManager$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/ave/drm/DRMLicenseAcquiredCallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/ave/drm/DRMManager;

.field final synthetic val$complete:Lcom/adobe/ave/drm/DRMOperationCompleteCallback;


# direct methods
.method constructor <init>(Lcom/adobe/ave/drm/DRMManager;Lcom/adobe/ave/drm/DRMOperationCompleteCallback;)V
    .locals 0

    .prologue
    .line 257
    iput-object p1, p0, Lcom/adobe/ave/drm/DRMManager$2;->this$0:Lcom/adobe/ave/drm/DRMManager;

    iput-object p2, p0, Lcom/adobe/ave/drm/DRMManager$2;->val$complete:Lcom/adobe/ave/drm/DRMOperationCompleteCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public LicenseAcquired(Lcom/adobe/ave/drm/DRMLicense;)V
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMManager$2;->val$complete:Lcom/adobe/ave/drm/DRMOperationCompleteCallback;

    invoke-interface {v0}, Lcom/adobe/ave/drm/DRMOperationCompleteCallback;->OperationComplete()V

    .line 260
    return-void
.end method
