.class public final enum Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/mediacore/ABRControlParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ABRPolicy"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

.field public static final enum ABR_AGGRESSIVE:Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

.field public static final enum ABR_CONSERVATIVE:Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

.field public static final enum ABR_MODERATE:Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;


# instance fields
.field private final _value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    const-string v1, "ABR_CONSERVATIVE"

    invoke-direct {v0, v1, v2, v2}, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->ABR_CONSERVATIVE:Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    new-instance v0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    const-string v1, "ABR_MODERATE"

    invoke-direct {v0, v1, v3, v3}, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->ABR_MODERATE:Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    new-instance v0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    const-string v1, "ABR_AGGRESSIVE"

    invoke-direct {v0, v1, v4, v4}, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->ABR_AGGRESSIVE:Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    sget-object v1, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->ABR_CONSERVATIVE:Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->ABR_MODERATE:Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->ABR_AGGRESSIVE:Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->$VALUES:[Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->_value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;
    .locals 1

    const-class v0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    return-object v0
.end method

.method public static values()[Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;
    .locals 1

    sget-object v0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->$VALUES:[Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    invoke-virtual {v0}, [Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    iget v0, p0, Lcom/adobe/mediacore/ABRControlParameters$ABRPolicy;->_value:I

    return v0
.end method
