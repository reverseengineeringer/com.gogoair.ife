.class final Lcrittercism/android/az$2;
.super Lcrittercism/android/dj;


# instance fields
.field final synthetic a:Lcrittercism/android/az;

.field final synthetic b:Lorg/json/JSONObject;

.field final synthetic c:Lcrittercism/android/az;


# direct methods
.method constructor <init>(Lcrittercism/android/az;Lcrittercism/android/az;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 1329
    iput-object p1, p0, Lcrittercism/android/az$2;->c:Lcrittercism/android/az;

    iput-object p2, p0, Lcrittercism/android/az$2;->a:Lcrittercism/android/az;

    iput-object p3, p0, Lcrittercism/android/az$2;->b:Lorg/json/JSONObject;

    invoke-direct {p0}, Lcrittercism/android/dj;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .prologue
    .line 1331
    iget-object v0, p0, Lcrittercism/android/az$2;->a:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    .line 1332
    invoke-virtual {v0}, Lcrittercism/android/dx;->b()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1342
    :cond_0
    :goto_0
    return-void

    .line 1336
    :cond_1
    iget-object v0, p0, Lcrittercism/android/az$2;->a:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->x:Lcrittercism/android/dw;

    iget-object v1, p0, Lcrittercism/android/az$2;->b:Lorg/json/JSONObject;

    invoke-virtual {v0, v1}, Lcrittercism/android/dw;->a(Lorg/json/JSONObject;)V

    .line 1339
    iget-object v0, p0, Lcrittercism/android/az$2;->a:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->x:Lcrittercism/android/dw;

    invoke-virtual {v0}, Lcrittercism/android/dw;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1340
    iget-object v0, p0, Lcrittercism/android/az$2;->a:Lcrittercism/android/az;

    invoke-virtual {v0}, Lcrittercism/android/az;->E()V

    goto :goto_0
.end method
