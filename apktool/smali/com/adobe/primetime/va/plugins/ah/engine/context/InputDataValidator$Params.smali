.class final enum Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Params"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum adId:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum adPosition:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum chapterLength:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum chapterOffset:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum chapterPosition:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum playerName:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum playhead:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum podPlayerName:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum podPosition:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum streamType:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum videoId:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

.field public static final enum videoLength:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 34
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "videoId"

    invoke-direct {v0, v1, v3}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->videoId:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "playerName"

    invoke-direct {v0, v1, v4}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->playerName:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "videoLength"

    invoke-direct {v0, v1, v5}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->videoLength:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "streamType"

    invoke-direct {v0, v1, v6}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->streamType:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "playhead"

    invoke-direct {v0, v1, v7}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->playhead:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    .line 35
    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "podPlayerName"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->podPlayerName:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "podPosition"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->podPosition:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "adId"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->adId:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "adPosition"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->adPosition:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "chapterPosition"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->chapterPosition:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "chapterOffset"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->chapterOffset:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    const-string v1, "chapterLength"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->chapterLength:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    .line 33
    const/16 v0, 0xc

    new-array v0, v0, [Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->videoId:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->playerName:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->videoLength:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->streamType:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->playhead:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->podPlayerName:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->podPosition:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->adId:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->adPosition:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->chapterPosition:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->chapterOffset:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->chapterLength:Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->$VALUES:[Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;
    .locals 1

    .prologue
    .line 33
    const-class v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    return-object v0
.end method

.method public static values()[Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->$VALUES:[Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    invoke-virtual {v0}, [Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/primetime/va/plugins/ah/engine/context/InputDataValidator$Params;

    return-object v0
.end method
