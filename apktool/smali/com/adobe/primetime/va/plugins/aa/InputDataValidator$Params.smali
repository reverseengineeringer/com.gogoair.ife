.class final enum Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Params"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

.field public static final enum adId:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

.field public static final enum adLength:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

.field public static final enum adPosition:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

.field public static final enum playerName:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

.field public static final enum podPlayerName:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

.field public static final enum podPosition:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

.field public static final enum streamType:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

.field public static final enum videoId:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

.field public static final enum videoLength:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 33
    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    const-string v1, "videoId"

    invoke-direct {v0, v1, v3}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->videoId:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    const-string v1, "playerName"

    invoke-direct {v0, v1, v4}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->playerName:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    const-string v1, "videoLength"

    invoke-direct {v0, v1, v5}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->videoLength:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    const-string v1, "streamType"

    invoke-direct {v0, v1, v6}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->streamType:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    .line 34
    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    const-string v1, "podPlayerName"

    invoke-direct {v0, v1, v7}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->podPlayerName:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    const-string v1, "podPosition"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->podPosition:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    const-string v1, "adId"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->adId:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    const-string v1, "adLength"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->adLength:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    new-instance v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    const-string v1, "adPosition"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->adPosition:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    .line 32
    const/16 v0, 0x9

    new-array v0, v0, [Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    sget-object v1, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->videoId:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->playerName:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->videoLength:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->streamType:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->podPlayerName:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->podPosition:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->adId:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->adLength:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->adPosition:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->$VALUES:[Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;
    .locals 1

    .prologue
    .line 32
    const-class v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    return-object v0
.end method

.method public static values()[Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->$VALUES:[Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    invoke-virtual {v0}, [Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/primetime/va/plugins/aa/InputDataValidator$Params;

    return-object v0
.end method
