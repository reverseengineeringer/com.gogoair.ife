.class public final enum Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;
.super Ljava/lang/Enum;


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

.field public static final enum PLAY:Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

.field public static final enum SEEK:Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

.field public static final enum TRICK_PLAY:Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;


# instance fields
.field private _action:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    const-string v1, "PLAY"

    const-string v2, "play"

    invoke-direct {v0, v1, v3, v2}, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->PLAY:Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    new-instance v0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    const-string v1, "SEEK"

    const-string v2, "seek"

    invoke-direct {v0, v1, v4, v2}, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->SEEK:Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    new-instance v0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    const-string v1, "TRICK_PLAY"

    const-string v2, "trick_play"

    invoke-direct {v0, v1, v5, v2}, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->TRICK_PLAY:Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    sget-object v1, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->PLAY:Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->SEEK:Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->TRICK_PLAY:Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    aput-object v1, v0, v5

    sput-object v0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->$VALUES:[Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->_action:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;
    .locals 1

    const-class v0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    return-object v0
.end method

.method public static values()[Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;
    .locals 1

    sget-object v0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->$VALUES:[Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    invoke-virtual {v0}, [Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;

    return-object v0
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/timeline/advertising/AdPolicyMode;->_action:Ljava/lang/String;

    return-object v0
.end method
