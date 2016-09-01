.class public final Lcom/adobe/primetime/va/Version;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final API_LEVEL:Ljava/lang/Integer;

.field private static final BUILD:Ljava/lang/String; = "4518d6"

.field private static final PLATFORM:Ljava/lang/String; = "android"

.field private static final VERSION:Ljava/lang/String; = "1.5.2.9"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/adobe/primetime/va/Version;->API_LEVEL:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getApiLevel()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 95
    sget-object v0, Lcom/adobe/primetime/va/Version;->API_LEVEL:Ljava/lang/Integer;

    return-object v0
.end method

.method public static getBuild()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    const-string v0, "4518d6"

    return-object v0
.end method

.method public static getMajor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/adobe/primetime/va/Version;->getNumberAtPosition(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMicro()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/adobe/primetime/va/Version;->getNumberAtPosition(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMinor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/adobe/primetime/va/Version;->getNumberAtPosition(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getNumberAtPosition(I)Ljava/lang/String;
    .locals 2

    .prologue
    .line 86
    const-string v0, "1.5.2.9"

    const-string v1, "\\."

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, p0

    return-object v0
.end method

.method public static getPatch()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/adobe/primetime/va/Version;->getNumberAtPosition(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    const-string v0, "android-1.5.2.9-4518d6"

    return-object v0
.end method
