.class public final enum Lcom/adobe/mediacore/MediaPlayerState;
.super Ljava/lang/Enum;


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/mediacore/MediaPlayerState;

.field public static final enum COMPLETE:Lcom/adobe/mediacore/MediaPlayerState;

.field public static final enum ERROR:Lcom/adobe/mediacore/MediaPlayerState;

.field public static final enum IDLE:Lcom/adobe/mediacore/MediaPlayerState;

.field public static final enum PAUSE:Lcom/adobe/mediacore/MediaPlayerState;

.field public static final enum PLAY:Lcom/adobe/mediacore/MediaPlayerState;

.field public static final enum SEEKING:Lcom/adobe/mediacore/MediaPlayerState;

.field public static final enum SUSPENDED:Lcom/adobe/mediacore/MediaPlayerState;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/adobe/mediacore/MediaPlayerState;

    const-string v1, "IDLE"

    invoke-direct {v0, v1, v3}, Lcom/adobe/mediacore/MediaPlayerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/MediaPlayerState;->IDLE:Lcom/adobe/mediacore/MediaPlayerState;

    new-instance v0, Lcom/adobe/mediacore/MediaPlayerState;

    const-string v1, "PLAY"

    invoke-direct {v0, v1, v4}, Lcom/adobe/mediacore/MediaPlayerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/MediaPlayerState;->PLAY:Lcom/adobe/mediacore/MediaPlayerState;

    new-instance v0, Lcom/adobe/mediacore/MediaPlayerState;

    const-string v1, "PAUSE"

    invoke-direct {v0, v1, v5}, Lcom/adobe/mediacore/MediaPlayerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/MediaPlayerState;->PAUSE:Lcom/adobe/mediacore/MediaPlayerState;

    new-instance v0, Lcom/adobe/mediacore/MediaPlayerState;

    const-string v1, "SEEKING"

    invoke-direct {v0, v1, v6}, Lcom/adobe/mediacore/MediaPlayerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/MediaPlayerState;->SEEKING:Lcom/adobe/mediacore/MediaPlayerState;

    new-instance v0, Lcom/adobe/mediacore/MediaPlayerState;

    const-string v1, "COMPLETE"

    invoke-direct {v0, v1, v7}, Lcom/adobe/mediacore/MediaPlayerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/MediaPlayerState;->COMPLETE:Lcom/adobe/mediacore/MediaPlayerState;

    new-instance v0, Lcom/adobe/mediacore/MediaPlayerState;

    const-string v1, "ERROR"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/MediaPlayerState;->ERROR:Lcom/adobe/mediacore/MediaPlayerState;

    new-instance v0, Lcom/adobe/mediacore/MediaPlayerState;

    const-string v1, "SUSPENDED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/mediacore/MediaPlayerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/mediacore/MediaPlayerState;->SUSPENDED:Lcom/adobe/mediacore/MediaPlayerState;

    const/4 v0, 0x7

    new-array v0, v0, [Lcom/adobe/mediacore/MediaPlayerState;

    sget-object v1, Lcom/adobe/mediacore/MediaPlayerState;->IDLE:Lcom/adobe/mediacore/MediaPlayerState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/mediacore/MediaPlayerState;->PLAY:Lcom/adobe/mediacore/MediaPlayerState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/mediacore/MediaPlayerState;->PAUSE:Lcom/adobe/mediacore/MediaPlayerState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/mediacore/MediaPlayerState;->SEEKING:Lcom/adobe/mediacore/MediaPlayerState;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/mediacore/MediaPlayerState;->COMPLETE:Lcom/adobe/mediacore/MediaPlayerState;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/mediacore/MediaPlayerState;->ERROR:Lcom/adobe/mediacore/MediaPlayerState;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/mediacore/MediaPlayerState;->SUSPENDED:Lcom/adobe/mediacore/MediaPlayerState;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/mediacore/MediaPlayerState;->$VALUES:[Lcom/adobe/mediacore/MediaPlayerState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/mediacore/MediaPlayerState;
    .locals 1

    const-class v0, Lcom/adobe/mediacore/MediaPlayerState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/MediaPlayerState;

    return-object v0
.end method

.method public static values()[Lcom/adobe/mediacore/MediaPlayerState;
    .locals 1

    sget-object v0, Lcom/adobe/mediacore/MediaPlayerState;->$VALUES:[Lcom/adobe/mediacore/MediaPlayerState;

    invoke-virtual {v0}, [Lcom/adobe/mediacore/MediaPlayerState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/mediacore/MediaPlayerState;

    return-object v0
.end method
