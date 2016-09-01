.class public Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;
    }
.end annotation


# instance fields
.field private _onFail:Lcom/adobe/primetime/core/ICallback;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/ICallback;)V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_onFail:Lcom/adobe/primetime/core/ICallback;

    .line 39
    return-void
.end method

.method private _fail(Ljava/lang/String;)Z
    .locals 2

    .prologue
    .line 140
    new-instance v0, Lcom/adobe/primetime/va/ErrorInfo;

    const-string v1, "Invalid input data"

    invoke-direct {v0, v1, p1}, Lcom/adobe/primetime/va/ErrorInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_onFail:Lcom/adobe/primetime/core/ICallback;

    if-eqz v1, :cond_0

    .line 143
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_onFail:Lcom/adobe/primetime/core/ICallback;

    invoke-interface {v1, v0}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z
    .locals 5

    .prologue
    .line 46
    if-nez p1, :cond_0

    .line 47
    const-string v0, "Data cannot be null"

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    .line 133
    :goto_0
    return v0

    .line 50
    :cond_0
    array-length v1, p2

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v1, :cond_19

    aget-object v2, p2, v0

    .line 51
    invoke-static {v2}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->valueOf(Ljava/lang/String;)Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    move-result-object v3

    .line 53
    sget-object v4, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$1;->$SwitchMap$com$adobe$primetime$va$plugins$aa$InputDataValidator$Params:[I

    invoke-virtual {v3}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->ordinal()I

    move-result v3

    aget v3, v4, v3

    packed-switch v3, :pswitch_data_0

    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to validate unknown parameter: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    .line 56
    :pswitch_0
    const-string v2, "videoId"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v0, "The ID for the main video must be specified."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    .line 57
    :cond_1
    const-string v2, "videoId"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    const-string v2, "videoId"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-nez v2, :cond_3

    .line 58
    :cond_2
    const-string v0, "The ID for the main video must be a String."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    .line 59
    :cond_3
    const-string v2, "videoId"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, ""

    if-ne v2, v3, :cond_18

    const-string v0, "The ID for the main video cannot be an empty string."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    .line 63
    :pswitch_1
    const-string v2, "playerName"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 64
    const-string v0, "The player name for the main video must be specified."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    .line 65
    :cond_4
    const-string v2, "playerName"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_5

    const-string v2, "playerName"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-nez v2, :cond_6

    .line 66
    :cond_5
    const-string v0, "The player name for the main video must be a String."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 67
    :cond_6
    const-string v2, "playerName"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, ""

    if-ne v2, v3, :cond_18

    .line 68
    const-string v0, "The player name for the main video cannot be an empty string."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 72
    :pswitch_2
    const-string v2, "videoLength"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 73
    const-string v0, "The length of the main video must be specified."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 74
    :cond_7
    const-string v2, "videoLength"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_8

    const-string v2, "videoLength"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/Number;

    if-nez v2, :cond_18

    .line 75
    :cond_8
    const-string v0, "The length of the main video must be a Number."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 79
    :pswitch_3
    const-string v2, "streamType"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 80
    const-string v0, "The stream type for the main video must be specified."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 81
    :cond_9
    const-string v2, "streamType"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_a

    const-string v2, "streamType"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-nez v2, :cond_b

    .line 82
    :cond_a
    const-string v0, "The stream type for the main video must be a String."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 83
    :cond_b
    const-string v2, "streamType"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, ""

    if-ne v2, v3, :cond_18

    .line 84
    const-string v0, "The stream type for the main video cannot be an empty string."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 90
    :pswitch_4
    const-string v2, "podPlayerName"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 91
    const-string v0, "The player name for the ad-break must be specified."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 92
    :cond_c
    const-string v2, "podPlayerName"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_d

    const-string v2, "podPlayerName"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-nez v2, :cond_e

    .line 93
    :cond_d
    const-string v0, "The player name for the ad-break must be a String."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 94
    :cond_e
    const-string v2, "podPlayerName"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, ""

    if-ne v2, v3, :cond_18

    .line 95
    const-string v0, "The player name for the ad-break cannot be an empty string."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 99
    :pswitch_5
    const-string v2, "podPosition"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 100
    const-string v0, "Position (index) of the ad-break must be specified."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 101
    :cond_f
    const-string v2, "podPosition"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_10

    const-string v2, "podPosition"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/Number;

    if-nez v2, :cond_18

    .line 102
    :cond_10
    const-string v0, "Position (index) of the ad-break must be a Number."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 108
    :pswitch_6
    const-string v2, "adId"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_11

    const-string v0, "The ad ID must be specified."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 109
    :cond_11
    const-string v2, "adId"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_12

    const-string v2, "adId"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-nez v2, :cond_13

    .line 110
    :cond_12
    const-string v0, "The ad ID must be a String."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 111
    :cond_13
    const-string v2, "adId"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, ""

    if-ne v2, v3, :cond_18

    const-string v0, "The ad ID cannot be an empty string."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 115
    :pswitch_7
    const-string v2, "adLength"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    const-string v0, "The length of the ad must be specified."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 116
    :cond_14
    const-string v2, "adLength"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_15

    const-string v2, "adLength"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/Number;

    if-nez v2, :cond_18

    .line 117
    :cond_15
    const-string v0, "The length of the ad must be a Number."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 121
    :pswitch_8
    const-string v2, "adPosition"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_16

    const-string v0, "Position (index) of the ad must be specified."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 122
    :cond_16
    const-string v2, "adPosition"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_17

    const-string v2, "adPosition"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/Number;

    if-nez v2, :cond_18

    .line 123
    :cond_17
    const-string v0, "Position (index) of the ad must be a Number."

    invoke-direct {p0, v0}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->_fail(Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_0

    .line 50
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .line 133
    :cond_19
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 53
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method
