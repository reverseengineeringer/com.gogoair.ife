.class synthetic Lcom/gogoair/ife/drm/DRMHelper$5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final synthetic $SwitchMap$com$adobe$ave$drm$DRMAuthenticationMethod:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 237
    invoke-static {}, Lcom/adobe/ave/drm/DRMAuthenticationMethod;->values()[Lcom/adobe/ave/drm/DRMAuthenticationMethod;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/gogoair/ife/drm/DRMHelper$5;->$SwitchMap$com$adobe$ave$drm$DRMAuthenticationMethod:[I

    :try_start_0
    sget-object v0, Lcom/gogoair/ife/drm/DRMHelper$5;->$SwitchMap$com$adobe$ave$drm$DRMAuthenticationMethod:[I

    sget-object v1, Lcom/adobe/ave/drm/DRMAuthenticationMethod;->USERNAME_AND_PASSWORD:Lcom/adobe/ave/drm/DRMAuthenticationMethod;

    invoke-virtual {v1}, Lcom/adobe/ave/drm/DRMAuthenticationMethod;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v0, Lcom/gogoair/ife/drm/DRMHelper$5;->$SwitchMap$com$adobe$ave$drm$DRMAuthenticationMethod:[I

    sget-object v1, Lcom/adobe/ave/drm/DRMAuthenticationMethod;->ANONYMOUS:Lcom/adobe/ave/drm/DRMAuthenticationMethod;

    invoke-virtual {v1}, Lcom/adobe/ave/drm/DRMAuthenticationMethod;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v0, Lcom/gogoair/ife/drm/DRMHelper$5;->$SwitchMap$com$adobe$ave$drm$DRMAuthenticationMethod:[I

    sget-object v1, Lcom/adobe/ave/drm/DRMAuthenticationMethod;->UNKNOWN:Lcom/adobe/ave/drm/DRMAuthenticationMethod;

    invoke-virtual {v1}, Lcom/adobe/ave/drm/DRMAuthenticationMethod;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    return-void

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_0
.end method
