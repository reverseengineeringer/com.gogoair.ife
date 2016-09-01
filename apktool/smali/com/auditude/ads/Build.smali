.class public Lcom/auditude/ads/Build;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final BUILD_DATE:Ljava/lang/String; = "20130704"

.field private static final BUILD_NUMBER:Ljava/lang/String; = "56"

.field private static final FIELD_SEPARATOR:Ljava/lang/String; = "."

.field private static final MAJOR_VERSION:Ljava/lang/String; = "1"

.field private static final MINOR_VERSION:Ljava/lang/String; = "0"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static description()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    const-string v0, "1.0.56 (20130704)"

    return-object v0
.end method

.method public static version()Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    const-string v0, "1.0.56"

    return-object v0
.end method
