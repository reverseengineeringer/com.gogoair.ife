.class public final Lcrittercism/android/de;
.super Ljava/lang/Object;

# interfaces
.implements Lcrittercism/android/cz;


# instance fields
.field private a:Lcrittercism/android/dw;


# direct methods
.method public constructor <init>(Lcrittercism/android/dw;)V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcrittercism/android/de;->a:Lcrittercism/android/dw;

    .line 13
    return-void
.end method


# virtual methods
.method public final a(ZILorg/json/JSONObject;)V
    .locals 2

    .prologue
    .line 17
    if-nez p1, :cond_0

    .line 22
    iget-object v0, p0, Lcrittercism/android/de;->a:Lcrittercism/android/dw;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcrittercism/android/dw;->a(Z)V

    .line 24
    :cond_0
    return-void
.end method
