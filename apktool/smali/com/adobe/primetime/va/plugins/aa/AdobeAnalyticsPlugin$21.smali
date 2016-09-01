.class synthetic Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$21;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final synthetic $SwitchMap$com$adobe$primetime$va$plugins$aa$AdobeAnalyticsPlugin$Domain:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 525
    invoke-static {}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;->values()[Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$21;->$SwitchMap$com$adobe$primetime$va$plugins$aa$AdobeAnalyticsPlugin$Domain:[I

    :try_start_0
    sget-object v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$21;->$SwitchMap$com$adobe$primetime$va$plugins$aa$AdobeAnalyticsPlugin$Domain:[I

    sget-object v1, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;->video:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$21;->$SwitchMap$com$adobe$primetime$va$plugins$aa$AdobeAnalyticsPlugin$Domain:[I

    sget-object v1, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;->ad:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$21;->$SwitchMap$com$adobe$primetime$va$plugins$aa$AdobeAnalyticsPlugin$Domain:[I

    sget-object v1, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;->chapter:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;->ordinal()I

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
