.class final Lcrittercism/android/ed$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ljava/lang/Throwable;

.field final synthetic b:J

.field final synthetic c:Lcrittercism/android/ed;


# direct methods
.method constructor <init>(Lcrittercism/android/ed;Ljava/lang/Throwable;J)V
    .locals 1

    .prologue
    .line 43
    iput-object p1, p0, Lcrittercism/android/ed$1;->c:Lcrittercism/android/ed;

    iput-object p2, p0, Lcrittercism/android/ed$1;->a:Ljava/lang/Throwable;

    iput-wide p3, p0, Lcrittercism/android/ed$1;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .prologue
    .line 46
    :try_start_0
    iget-object v0, p0, Lcrittercism/android/ed$1;->c:Lcrittercism/android/ed;

    iget-object v0, v0, Lcrittercism/android/ed;->d:Lcrittercism/android/dx;

    invoke-virtual {v0}, Lcrittercism/android/dx;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    :goto_0
    return-void

    .line 48
    :cond_0
    new-instance v0, Lcrittercism/android/bk;

    iget-object v1, p0, Lcrittercism/android/ed$1;->a:Ljava/lang/Throwable;

    iget-wide v2, p0, Lcrittercism/android/ed$1;->b:J

    invoke-direct {v0, v1, v2, v3}, Lcrittercism/android/bk;-><init>(Ljava/lang/Throwable;J)V

    .line 49
    const-string v1, "he"

    iput-object v1, v0, Lcrittercism/android/bk;->f:Ljava/lang/String;

    .line 50
    const-string v1, "5.0.6"
    :try_end_0
    .catch Ljava/lang/ThreadDeath; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v2, v0, Lcrittercism/android/bk;->g:Lorg/json/JSONObject;

    const-string v3, "app_version"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/ThreadDeath; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 51
    :goto_1
    :try_start_2
    iget-object v1, v0, Lcrittercism/android/bk;->g:Lorg/json/JSONObject;

    const-string v2, "logcat"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 52
    iget-object v1, p0, Lcrittercism/android/ed$1;->c:Lcrittercism/android/ed;

    iget-object v1, v1, Lcrittercism/android/ed;->a:Lcrittercism/android/aw;

    invoke-interface {v1}, Lcrittercism/android/aw;->p()Lcrittercism/android/bs;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcrittercism/android/bs;->a(Lcrittercism/android/ch;)Z
    :try_end_2
    .catch Ljava/lang/ThreadDeath; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 57
    :catch_0
    move-exception v0

    goto :goto_0

    .line 56
    :catch_1
    move-exception v0

    iget-object v0, p0, Lcrittercism/android/ed$1;->c:Lcrittercism/android/ed;

    iget-object v0, p0, Lcrittercism/android/ed$1;->a:Ljava/lang/Throwable;

    goto :goto_0

    :catch_2
    move-exception v1

    goto :goto_1
.end method
