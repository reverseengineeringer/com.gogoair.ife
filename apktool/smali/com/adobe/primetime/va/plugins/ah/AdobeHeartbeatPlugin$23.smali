.class Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$23;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;)V
    .locals 0

    .prologue
    .line 814
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin$23;->this$0:Lcom/adobe/primetime/va/plugins/ah/AdobeHeartbeatPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 817
    invoke-static {}, Lcom/adobe/primetime/va/Version;->getApiLevel()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
