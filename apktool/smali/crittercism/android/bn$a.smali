.class public final enum Lcrittercism/android/bn$a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcrittercism/android/bn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "a"
.end annotation


# static fields
.field public static final enum a:Lcrittercism/android/bn$a;

.field public static final enum b:Lcrittercism/android/bn$a;

.field public static final enum c:Lcrittercism/android/bn$a;

.field public static final enum d:Lcrittercism/android/bn$a;

.field private static final synthetic g:[Lcrittercism/android/bn$a;


# instance fields
.field private final e:Ljava/lang/String;

.field private final f:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 31
    new-instance v0, Lcrittercism/android/bn$a;

    const-string v1, "US_WEST_1_PROD"

    const-string v2, "00555300"

    const-string v3, "crittercism.com"

    invoke-direct {v0, v1, v4, v2, v3}, Lcrittercism/android/bn$a;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/bn$a;->a:Lcrittercism/android/bn$a;

    .line 32
    new-instance v0, Lcrittercism/android/bn$a;

    const-string v1, "US_WEST_2_CI"

    const-string v2, "00555304"

    const-string v3, "crit-ci.com"

    invoke-direct {v0, v1, v5, v2, v3}, Lcrittercism/android/bn$a;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/bn$a;->b:Lcrittercism/android/bn$a;

    .line 33
    new-instance v0, Lcrittercism/android/bn$a;

    const-string v1, "US_WEST_2_STAGING"

    const-string v2, "00555305"

    const-string v3, "crit-staging.com"

    invoke-direct {v0, v1, v6, v2, v3}, Lcrittercism/android/bn$a;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/bn$a;->c:Lcrittercism/android/bn$a;

    .line 34
    new-instance v0, Lcrittercism/android/bn$a;

    const-string v1, "EU_CENTRAL_1"

    const-string v2, "00444503"

    const-string v3, "eu.crittercism.com"

    invoke-direct {v0, v1, v7, v2, v3}, Lcrittercism/android/bn$a;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcrittercism/android/bn$a;->d:Lcrittercism/android/bn$a;

    .line 30
    const/4 v0, 0x4

    new-array v0, v0, [Lcrittercism/android/bn$a;

    sget-object v1, Lcrittercism/android/bn$a;->a:Lcrittercism/android/bn$a;

    aput-object v1, v0, v4

    sget-object v1, Lcrittercism/android/bn$a;->b:Lcrittercism/android/bn$a;

    aput-object v1, v0, v5

    sget-object v1, Lcrittercism/android/bn$a;->c:Lcrittercism/android/bn$a;

    aput-object v1, v0, v6

    sget-object v1, Lcrittercism/android/bn$a;->d:Lcrittercism/android/bn$a;

    aput-object v1, v0, v7

    sput-object v0, Lcrittercism/android/bn$a;->g:[Lcrittercism/android/bn$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 40
    iput-object p3, p0, Lcrittercism/android/bn$a;->e:Ljava/lang/String;

    .line 41
    iput-object p4, p0, Lcrittercism/android/bn$a;->f:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public static a(Ljava/lang/String;)Lcrittercism/android/bn$a;
    .locals 7

    .prologue
    const/4 v0, 0x0

    .line 49
    const-string v1, "[0-9a-fA-F]+"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 63
    :cond_0
    :goto_0
    return-object v0

    .line 51
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x18

    if-ne v1, v2, :cond_2

    .line 52
    sget-object v0, Lcrittercism/android/bn$a;->a:Lcrittercism/android/bn$a;

    goto :goto_0

    .line 53
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x28

    if-ne v1, v2, :cond_0

    .line 54
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x8

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 56
    invoke-static {}, Lcrittercism/android/bn$a;->values()[Lcrittercism/android/bn$a;

    move-result-object v4

    array-length v5, v4

    const/4 v1, 0x0

    move v2, v1

    :goto_1
    if-ge v2, v5, :cond_0

    aget-object v1, v4, v2

    .line 57
    iget-object v6, v1, Lcrittercism/android/bn$a;->e:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    move-object v0, v1

    .line 58
    goto :goto_0

    .line 56
    :cond_3
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lcrittercism/android/bn$a;
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcrittercism/android/bn$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcrittercism/android/bn$a;

    return-object v0
.end method

.method public static values()[Lcrittercism/android/bn$a;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcrittercism/android/bn$a;->g:[Lcrittercism/android/bn$a;

    invoke-virtual {v0}, [Lcrittercism/android/bn$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcrittercism/android/bn$a;

    return-object v0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcrittercism/android/bn$a;->f:Ljava/lang/String;

    return-object v0
.end method
