.class public final enum Lcom/gogoair/ife/utils/Constants$GVErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "GVErrorCode"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum ACC_GRADE_LOG_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum DRM_AUTH_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum DRM_LICENSE_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum EXPIRED:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum INDIV_AUTH_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum INDIV_LIC_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum NONE:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum NOTASPFLIGHT:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum NOVIDEO:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum NOWIFI:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

.field public static final enum PLAYER_ERROR:Lcom/gogoair/ife/utils/Constants$GVErrorCode;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 16
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v4, v4}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NONE:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 17
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "NOTASPFLIGHT"

    invoke-direct {v0, v1, v5, v5}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOTASPFLIGHT:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 18
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "NOWIFI"

    invoke-direct {v0, v1, v6, v6}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOWIFI:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 19
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "NOVIDEO"

    invoke-direct {v0, v1, v7, v7}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOVIDEO:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 20
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "DRM_LICENSE_FAIL"

    invoke-direct {v0, v1, v8, v8}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->DRM_LICENSE_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 21
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "EXPIRED"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->EXPIRED:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 22
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "DRM_AUTH_FAIL"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->DRM_AUTH_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 23
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "ACC_GRADE_LOG_FAIL"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->ACC_GRADE_LOG_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 24
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "INDIV_AUTH_FAIL"

    const/16 v2, 0x8

    const/16 v3, 0x8

    invoke-direct {v0, v1, v2, v3}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->INDIV_AUTH_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 25
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "INDIV_LIC_FAIL"

    const/16 v2, 0x9

    const/16 v3, 0x9

    invoke-direct {v0, v1, v2, v3}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->INDIV_LIC_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 26
    new-instance v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    const-string v1, "PLAYER_ERROR"

    const/16 v2, 0xa

    const/16 v3, 0xd

    invoke-direct {v0, v1, v2, v3}, Lcom/gogoair/ife/utils/Constants$GVErrorCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->PLAYER_ERROR:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    .line 15
    const/16 v0, 0xb

    new-array v0, v0, [Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NONE:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOTASPFLIGHT:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOWIFI:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->NOVIDEO:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v1, v0, v7

    sget-object v1, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->DRM_LICENSE_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->EXPIRED:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->DRM_AUTH_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->ACC_GRADE_LOG_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->INDIV_AUTH_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->INDIV_LIC_FAIL:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->PLAYER_ERROR:Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    aput-object v2, v0, v1

    sput-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->$VALUES:[Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 31
    iput p3, p0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->value:I

    .line 32
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/gogoair/ife/utils/Constants$GVErrorCode;
    .locals 1

    .prologue
    .line 15
    const-class v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    return-object v0
.end method

.method public static values()[Lcom/gogoair/ife/utils/Constants$GVErrorCode;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->$VALUES:[Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    invoke-virtual {v0}, [Lcom/gogoair/ife/utils/Constants$GVErrorCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/gogoair/ife/utils/Constants$GVErrorCode;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 35
    iget v0, p0, Lcom/gogoair/ife/utils/Constants$GVErrorCode;->value:I

    return v0
.end method
