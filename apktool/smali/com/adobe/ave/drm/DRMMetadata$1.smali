.class Lcom/adobe/ave/drm/DRMMetadata$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/ave/drm/DRMMetadataCreatedCallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/ave/drm/DRMMetadata;


# direct methods
.method constructor <init>(Lcom/adobe/ave/drm/DRMMetadata;)V
    .locals 0

    .prologue
    .line 56
    iput-object p1, p0, Lcom/adobe/ave/drm/DRMMetadata$1;->this$0:Lcom/adobe/ave/drm/DRMMetadata;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public MetadataCreated(J)V
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/adobe/ave/drm/DRMMetadata$1;->this$0:Lcom/adobe/ave/drm/DRMMetadata;

    iput-wide p1, v0, Lcom/adobe/ave/drm/DRMMetadata;->peerObject:J

    .line 60
    return-void
.end method
