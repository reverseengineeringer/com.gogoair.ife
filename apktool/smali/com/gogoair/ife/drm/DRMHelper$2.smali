.class final Lcom/gogoair/ife/drm/DRMHelper$2;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field final synthetic val$authPass:Ljava/lang/String;

.field final synthetic val$authToken:Ljava/lang/String;

.field final synthetic val$authUser:Ljava/lang/String;

.field final synthetic val$authenticationListener:Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;

.field final synthetic val$drmManager:Lcom/adobe/ave/drm/DRMManager;

.field final synthetic val$drmMetadata:Lcom/adobe/ave/drm/DRMMetadata;


# direct methods
.method constructor <init>(Lcom/adobe/ave/drm/DRMMetadata;Ljava/lang/String;Ljava/lang/String;Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;Lcom/adobe/ave/drm/DRMManager;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 233
    iput-object p1, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$drmMetadata:Lcom/adobe/ave/drm/DRMMetadata;

    iput-object p2, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authUser:Ljava/lang/String;

    iput-object p3, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authPass:Ljava/lang/String;

    iput-object p4, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authenticationListener:Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;

    iput-object p5, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$drmManager:Lcom/adobe/ave/drm/DRMManager;

    iput-object p6, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authToken:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 235
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$drmMetadata:Lcom/adobe/ave/drm/DRMMetadata;

    invoke-virtual {v0}, Lcom/adobe/ave/drm/DRMMetadata;->getPolicies()[Lcom/adobe/ave/drm/DRMPolicy;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v4, v0, v1

    .line 236
    invoke-virtual {v4}, Lcom/adobe/ave/drm/DRMPolicy;->getAuthenticationMethod()Lcom/adobe/ave/drm/DRMAuthenticationMethod;

    move-result-object v0

    .line 237
    sget-object v1, Lcom/gogoair/ife/drm/DRMHelper$5;->$SwitchMap$com$adobe$ave$drm$DRMAuthenticationMethod:[I

    invoke-virtual {v0}, Lcom/adobe/ave/drm/DRMAuthenticationMethod;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    .line 339
    :cond_0
    :goto_0
    return-void

    .line 239
    :pswitch_0
    # getter for: Lcom/gogoair/ife/drm/DRMHelper;->useCloudDRM:Ljava/lang/Boolean;
    invoke-static {}, Lcom/gogoair/ife/drm/DRMHelper;->access$200()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 245
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "[DRMPLAYER]::DRMHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " username = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authUser:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " pwd = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authPass:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authenticationListener:Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;

    invoke-interface {v0}, Lcom/gogoair/ife/drm/DRMHelper$DRMAuthenticationListener;->onAuthenticationStart()V

    .line 250
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$drmManager:Lcom/adobe/ave/drm/DRMManager;

    iget-object v1, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$drmMetadata:Lcom/adobe/ave/drm/DRMMetadata;

    iget-object v2, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$drmMetadata:Lcom/adobe/ave/drm/DRMMetadata;

    invoke-virtual {v2}, Lcom/adobe/ave/drm/DRMMetadata;->getServerURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4}, Lcom/adobe/ave/drm/DRMPolicy;->getAuthenticationDomain()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authUser:Ljava/lang/String;

    iget-object v5, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authPass:Ljava/lang/String;

    new-instance v6, Lcom/gogoair/ife/drm/DRMHelper$2$1;

    invoke-direct {v6, p0}, Lcom/gogoair/ife/drm/DRMHelper$2$1;-><init>(Lcom/gogoair/ife/drm/DRMHelper$2;)V

    new-instance v7, Lcom/gogoair/ife/drm/DRMHelper$2$2;

    invoke-direct {v7, p0}, Lcom/gogoair/ife/drm/DRMHelper$2$2;-><init>(Lcom/gogoair/ife/drm/DRMHelper$2;)V

    invoke-virtual/range {v0 .. v7}, Lcom/adobe/ave/drm/DRMManager;->authenticate(Lcom/adobe/ave/drm/DRMMetadata;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/ave/drm/DRMOperationErrorCallback;Lcom/adobe/ave/drm/DRMAuthenticationCompleteCallback;)V

    goto :goto_0

    .line 273
    :pswitch_1
    # getter for: Lcom/gogoair/ife/drm/DRMHelper;->useCloudDRM:Ljava/lang/Boolean;
    invoke-static {}, Lcom/gogoair/ife/drm/DRMHelper;->access$200()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authToken:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 285
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$drmManager:Lcom/adobe/ave/drm/DRMManager;

    iget-object v1, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$drmMetadata:Lcom/adobe/ave/drm/DRMMetadata;

    invoke-virtual {v4}, Lcom/adobe/ave/drm/DRMPolicy;->getAuthenticationDomain()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lcom/gogoair/ife/drm/DRMHelper$2$3;

    invoke-direct {v4, p0}, Lcom/gogoair/ife/drm/DRMHelper$2$3;-><init>(Lcom/gogoair/ife/drm/DRMHelper$2;)V

    new-instance v5, Lcom/gogoair/ife/drm/DRMHelper$2$4;

    invoke-direct {v5, p0, v3}, Lcom/gogoair/ife/drm/DRMHelper$2$4;-><init>(Lcom/gogoair/ife/drm/DRMHelper$2;[B)V

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/ave/drm/DRMManager;->setAuthenticationToken(Lcom/adobe/ave/drm/DRMMetadata;Ljava/lang/String;[BLcom/adobe/ave/drm/DRMOperationErrorCallback;Lcom/adobe/ave/drm/DRMOperationCompleteCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 298
    :catch_0
    move-exception v0

    .line 300
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v1

    const-string v2, "[DRMPLAYER]::DRMHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "An error setting the authentication token, perhaps you didn\'t load metadata yet, or it didn\'t have any policies? "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/gogoair/ife/utils/GVLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 306
    :pswitch_2
    # getter for: Lcom/gogoair/ife/drm/DRMHelper;->useCloudDRM:Ljava/lang/Boolean;
    invoke-static {}, Lcom/gogoair/ife/drm/DRMHelper;->access$200()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 311
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$authToken:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 314
    :try_start_1
    iget-object v0, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$drmManager:Lcom/adobe/ave/drm/DRMManager;

    iget-object v1, p0, Lcom/gogoair/ife/drm/DRMHelper$2;->val$drmMetadata:Lcom/adobe/ave/drm/DRMMetadata;

    invoke-virtual {v4}, Lcom/adobe/ave/drm/DRMPolicy;->getAuthenticationDomain()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lcom/gogoair/ife/drm/DRMHelper$2$5;

    invoke-direct {v4, p0}, Lcom/gogoair/ife/drm/DRMHelper$2$5;-><init>(Lcom/gogoair/ife/drm/DRMHelper$2;)V

    new-instance v5, Lcom/gogoair/ife/drm/DRMHelper$2$6;

    invoke-direct {v5, p0, v3}, Lcom/gogoair/ife/drm/DRMHelper$2$6;-><init>(Lcom/gogoair/ife/drm/DRMHelper$2;[B)V

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/ave/drm/DRMManager;->setAuthenticationToken(Lcom/adobe/ave/drm/DRMMetadata;Ljava/lang/String;[BLcom/adobe/ave/drm/DRMOperationErrorCallback;Lcom/adobe/ave/drm/DRMOperationCompleteCallback;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 327
    :catch_1
    move-exception v0

    .line 329
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v1

    const-string v2, "[DRMPLAYER]::DRMHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "An error setting the authentication token, perhaps you didn\'t load metadata yet, or it didn\'t have any policies? "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/gogoair/ife/utils/GVLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 237
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
