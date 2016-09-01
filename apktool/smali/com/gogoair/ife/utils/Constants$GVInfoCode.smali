.class public final enum Lcom/gogoair/ife/utils/Constants$GVInfoCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "GVInfoCode"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/gogoair/ife/utils/Constants$GVInfoCode;

.field public static final enum ACC_GRADE_LOG_SUCCESS:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

.field public static final enum DRM_LICENSE_SUCCESS:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

.field public static final enum NONE:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

.field public static final enum PLAYER_STATE_CHANGE:Lcom/gogoair/ife/utils/Constants$GVInfoCode;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 43
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v3, v3}, Lcom/gogoair/ife/utils/Constants$GVInfoCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->NONE:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    .line 44
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    const-string v1, "ACC_GRADE_LOG_SUCCESS"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v4, v2}, Lcom/gogoair/ife/utils/Constants$GVInfoCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->ACC_GRADE_LOG_SUCCESS:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    .line 45
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    const-string v1, "PLAYER_STATE_CHANGE"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v5, v2}, Lcom/gogoair/ife/utils/Constants$GVInfoCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->PLAYER_STATE_CHANGE:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    .line 46
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    const-string v1, "DRM_LICENSE_SUCCESS"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v6, v2}, Lcom/gogoair/ife/utils/Constants$GVInfoCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->DRM_LICENSE_SUCCESS:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    .line 42
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->NONE:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->ACC_GRADE_LOG_SUCCESS:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->PLAYER_STATE_CHANGE:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->DRM_LICENSE_SUCCESS:Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    aput-object v1, v0, v6

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->$VALUES:[Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 51
    iput p3, p0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->value:I

    .line 52
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/gogoair/ife/utils/Constants$GVInfoCode;
    .locals 1

    .prologue
    .line 42
    const-class v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    return-object v0
.end method

.method public static values()[Lcom/gogoair/ife/utils/Constants$GVInfoCode;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->$VALUES:[Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    invoke-virtual {v0}, [Lcom/gogoair/ife/utils/Constants$GVInfoCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/gogoair/ife/utils/Constants$GVInfoCode;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lcom/gogoair/ife/utils/Constants$GVInfoCode;->value:I

    return v0
.end method
