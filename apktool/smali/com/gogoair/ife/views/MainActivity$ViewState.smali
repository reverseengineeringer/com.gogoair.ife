.class final enum Lcom/gogoair/ife/views/MainActivity$ViewState;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/views/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ViewState"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/gogoair/ife/views/MainActivity$ViewState;

.field public static final enum AIR_NO_TITLES:Lcom/gogoair/ife/views/MainActivity$ViewState;

.field public static final enum AIR_SHOWING_TITLES:Lcom/gogoair/ife/views/MainActivity$ViewState;

.field public static final enum GROUND:Lcom/gogoair/ife/views/MainActivity$ViewState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 46
    new-instance v0, Lcom/gogoair/ife/views/MainActivity$ViewState;

    const-string v1, "GROUND"

    invoke-direct {v0, v1, v2}, Lcom/gogoair/ife/views/MainActivity$ViewState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gogoair/ife/views/MainActivity$ViewState;->GROUND:Lcom/gogoair/ife/views/MainActivity$ViewState;

    .line 47
    new-instance v0, Lcom/gogoair/ife/views/MainActivity$ViewState;

    const-string v1, "AIR_NO_TITLES"

    invoke-direct {v0, v1, v3}, Lcom/gogoair/ife/views/MainActivity$ViewState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gogoair/ife/views/MainActivity$ViewState;->AIR_NO_TITLES:Lcom/gogoair/ife/views/MainActivity$ViewState;

    .line 48
    new-instance v0, Lcom/gogoair/ife/views/MainActivity$ViewState;

    const-string v1, "AIR_SHOWING_TITLES"

    invoke-direct {v0, v1, v4}, Lcom/gogoair/ife/views/MainActivity$ViewState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gogoair/ife/views/MainActivity$ViewState;->AIR_SHOWING_TITLES:Lcom/gogoair/ife/views/MainActivity$ViewState;

    .line 45
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/gogoair/ife/views/MainActivity$ViewState;

    sget-object v1, Lcom/gogoair/ife/views/MainActivity$ViewState;->GROUND:Lcom/gogoair/ife/views/MainActivity$ViewState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/gogoair/ife/views/MainActivity$ViewState;->AIR_NO_TITLES:Lcom/gogoair/ife/views/MainActivity$ViewState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/gogoair/ife/views/MainActivity$ViewState;->AIR_SHOWING_TITLES:Lcom/gogoair/ife/views/MainActivity$ViewState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/gogoair/ife/views/MainActivity$ViewState;->$VALUES:[Lcom/gogoair/ife/views/MainActivity$ViewState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/gogoair/ife/views/MainActivity$ViewState;
    .locals 1

    .prologue
    .line 45
    const-class v0, Lcom/gogoair/ife/views/MainActivity$ViewState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/views/MainActivity$ViewState;

    return-object v0
.end method

.method public static values()[Lcom/gogoair/ife/views/MainActivity$ViewState;
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lcom/gogoair/ife/views/MainActivity$ViewState;->$VALUES:[Lcom/gogoair/ife/views/MainActivity$ViewState;

    invoke-virtual {v0}, [Lcom/gogoair/ife/views/MainActivity$ViewState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/gogoair/ife/views/MainActivity$ViewState;

    return-object v0
.end method
