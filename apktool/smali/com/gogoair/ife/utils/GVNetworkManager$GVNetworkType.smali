.class public final enum Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/GVNetworkManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "GVNetworkType"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

.field public static final enum ground:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

.field public static final enum in_air:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

.field public static final enum off:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

.field public static final enum unknown:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 38
    new-instance v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    const-string v1, "in_air"

    invoke-direct {v0, v1, v2}, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->in_air:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    new-instance v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    const-string v1, "ground"

    invoke-direct {v0, v1, v3}, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->ground:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    new-instance v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    const-string v1, "off"

    invoke-direct {v0, v1, v4}, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->off:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    new-instance v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    const-string v1, "unknown"

    invoke-direct {v0, v1, v5}, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->unknown:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    .line 37
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->in_air:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->ground:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->off:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->unknown:Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->$VALUES:[Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
    .locals 1

    .prologue
    .line 37
    const-class v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    return-object v0
.end method

.method public static values()[Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->$VALUES:[Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    invoke-virtual {v0}, [Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/gogoair/ife/utils/GVNetworkManager$GVNetworkType;

    return-object v0
.end method
