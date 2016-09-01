.class Lcom/adobe/ave/drm/DRMManager$UIThreadLicenseAcquiredCB$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$1:Lcom/adobe/ave/drm/DRMManager$UIThreadLicenseAcquiredCB;

.field final synthetic val$license:Lcom/adobe/ave/drm/DRMLicense;


# direct methods
.method constructor <init>(Lcom/adobe/ave/drm/DRMManager$UIThreadLicenseAcquiredCB;Lcom/adobe/ave/drm/DRMLicense;)V
    .locals 0

    .prologue
    .line 131
    iput-object p1, p0, Lcom/adobe/ave/drm/DRMManager$UIThreadLicenseAcquiredCB$1;->this$1:Lcom/adobe/ave/drm/DRMManager$UIThreadLicenseAcquiredCB;

    iput-object p2, p0, Lcom/adobe/ave/drm/DRMManager$UIThreadLicenseAcquiredCB$1;->val$license:Lcom/adobe/ave/drm/DRMLicense;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMManager$UIThreadLicenseAcquiredCB$1;->this$1:Lcom/adobe/ave/drm/DRMManager$UIThreadLicenseAcquiredCB;

    iget-object v0, v0, Lcom/adobe/ave/drm/DRMManager$UIThreadLicenseAcquiredCB;->cb:Lcom/adobe/ave/drm/DRMLicenseAcquiredCallback;

    iget-object v1, p0, Lcom/adobe/ave/drm/DRMManager$UIThreadLicenseAcquiredCB$1;->val$license:Lcom/adobe/ave/drm/DRMLicense;

    invoke-interface {v0, v1}, Lcom/adobe/ave/drm/DRMLicenseAcquiredCallback;->LicenseAcquired(Lcom/adobe/ave/drm/DRMLicense;)V

    .line 134
    return-void
.end method
