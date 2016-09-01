.class final Lcrittercism/android/az$3;
.super Lcrittercism/android/dj;


# instance fields
.field final synthetic a:Lcrittercism/android/az;

.field final synthetic b:Lcrittercism/android/az;


# direct methods
.method constructor <init>(Lcrittercism/android/az;Lcrittercism/android/az;)V
    .locals 0

    .prologue
    .line 1358
    iput-object p1, p0, Lcrittercism/android/az$3;->b:Lcrittercism/android/az;

    iput-object p2, p0, Lcrittercism/android/az$3;->a:Lcrittercism/android/az;

    invoke-direct {p0}, Lcrittercism/android/dj;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .prologue
    .line 1360
    iget-object v0, p0, Lcrittercism/android/az$3;->a:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    .line 1361
    invoke-virtual {v0}, Lcrittercism/android/dx;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1374
    :goto_0
    return-void

    .line 1365
    :cond_0
    new-instance v0, Lcrittercism/android/cv;

    iget-object v1, p0, Lcrittercism/android/az$3;->a:Lcrittercism/android/az;

    invoke-direct {v0, v1}, Lcrittercism/android/cv;-><init>(Lcrittercism/android/au;)V

    .line 1366
    const-string v1, "metadata"

    iget-object v2, p0, Lcrittercism/android/az$3;->a:Lcrittercism/android/az;

    iget-object v2, v2, Lcrittercism/android/az;->x:Lcrittercism/android/dw;

    invoke-virtual {v2}, Lcrittercism/android/dw;->a()Lorg/json/JSONObject;

    move-result-object v2

    iget-object v3, v0, Lcrittercism/android/cv;->a:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1368
    new-instance v1, Lcrittercism/android/dc;

    iget-object v2, p0, Lcrittercism/android/az$3;->b:Lcrittercism/android/az;

    iget-object v2, v2, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v2}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v2

    const-string v3, "/android_v2/update_user_metadata"

    invoke-direct {v1, v2, v3}, Lcrittercism/android/dc;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcrittercism/android/dc;->a()Ljava/net/URL;

    move-result-object v1

    .line 1369
    new-instance v2, Lcrittercism/android/dd;

    invoke-direct {v2, v1}, Lcrittercism/android/dd;-><init>(Ljava/net/URL;)V

    .line 1371
    new-instance v1, Lcrittercism/android/de;

    iget-object v3, p0, Lcrittercism/android/az$3;->a:Lcrittercism/android/az;

    iget-object v3, v3, Lcrittercism/android/az;->x:Lcrittercism/android/dw;

    invoke-direct {v1, v3}, Lcrittercism/android/de;-><init>(Lcrittercism/android/dw;)V

    .line 1372
    new-instance v3, Lcrittercism/android/dk;

    invoke-direct {v3, v0, v2, v1}, Lcrittercism/android/dk;-><init>(Lcrittercism/android/cx;Lcrittercism/android/dd;Lcrittercism/android/cz;)V

    invoke-virtual {v3}, Lcrittercism/android/dk;->run()V

    goto :goto_0
.end method
