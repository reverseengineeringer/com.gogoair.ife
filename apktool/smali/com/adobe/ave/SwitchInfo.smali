.class public final enum Lcom/adobe/ave/SwitchInfo;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/ave/SwitchInfo;

.field public static final enum ABR:Lcom/adobe/ave/SwitchInfo;

.field public static final enum PERIOD:Lcom/adobe/ave/SwitchInfo;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 29
    new-instance v0, Lcom/adobe/ave/SwitchInfo;

    const-string v1, "ABR"

    invoke-direct {v0, v1, v2, v2}, Lcom/adobe/ave/SwitchInfo;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/ave/SwitchInfo;->ABR:Lcom/adobe/ave/SwitchInfo;

    .line 34
    new-instance v0, Lcom/adobe/ave/SwitchInfo;

    const-string v1, "PERIOD"

    invoke-direct {v0, v1, v3, v3}, Lcom/adobe/ave/SwitchInfo;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/ave/SwitchInfo;->PERIOD:Lcom/adobe/ave/SwitchInfo;

    .line 24
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/ave/SwitchInfo;

    sget-object v1, Lcom/adobe/ave/SwitchInfo;->ABR:Lcom/adobe/ave/SwitchInfo;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/ave/SwitchInfo;->PERIOD:Lcom/adobe/ave/SwitchInfo;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/ave/SwitchInfo;->$VALUES:[Lcom/adobe/ave/SwitchInfo;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 39
    iput p3, p0, Lcom/adobe/ave/SwitchInfo;->value:I

    .line 40
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/ave/SwitchInfo;
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/adobe/ave/SwitchInfo;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/ave/SwitchInfo;

    return-object v0
.end method

.method public static values()[Lcom/adobe/ave/SwitchInfo;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/adobe/ave/SwitchInfo;->$VALUES:[Lcom/adobe/ave/SwitchInfo;

    invoke-virtual {v0}, [Lcom/adobe/ave/SwitchInfo;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/ave/SwitchInfo;

    return-object v0
.end method


# virtual methods
.method final getValue()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/adobe/ave/SwitchInfo;->value:I

    return v0
.end method
