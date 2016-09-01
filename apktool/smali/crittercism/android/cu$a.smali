.class public final Lcrittercism/android/cu$a;
.super Ljava/lang/Object;

# interfaces
.implements Lcrittercism/android/da;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcrittercism/android/cu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic a(Lcrittercism/android/bs;Lcrittercism/android/bs;Ljava/lang/String;Landroid/content/Context;Lcrittercism/android/au;)Lcrittercism/android/cz;
    .locals 6

    .prologue
    .line 41
    new-instance v0, Lcrittercism/android/cu;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcrittercism/android/cu;-><init>(Lcrittercism/android/bs;Lcrittercism/android/bs;Ljava/lang/String;Landroid/content/Context;Lcrittercism/android/au;)V

    return-object v0
.end method
