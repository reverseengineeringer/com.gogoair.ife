.class final Lcrittercism/android/az$5;
.super Lcrittercism/android/dj;


# instance fields
.field final synthetic a:Ljava/lang/Throwable;

.field final synthetic b:J

.field final synthetic c:Lcrittercism/android/az;


# direct methods
.method constructor <init>(Lcrittercism/android/az;Ljava/lang/Throwable;J)V
    .locals 1

    .prologue
    .line 631
    iput-object p1, p0, Lcrittercism/android/az$5;->c:Lcrittercism/android/az;

    iput-object p2, p0, Lcrittercism/android/az$5;->a:Ljava/lang/Throwable;

    iput-wide p3, p0, Lcrittercism/android/az$5;->b:J

    invoke-direct {p0}, Lcrittercism/android/dj;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7

    .prologue
    .line 634
    iget-object v0, p0, Lcrittercism/android/az$5;->c:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    invoke-virtual {v0}, Lcrittercism/android/dx;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 665
    :goto_0
    return-void

    .line 638
    :cond_0
    iget-object v0, p0, Lcrittercism/android/az$5;->c:Lcrittercism/android/az;

    iget-object v1, v0, Lcrittercism/android/az;->p:Lcrittercism/android/cw;

    monitor-enter v1

    .line 639
    :try_start_0
    iget-object v0, p0, Lcrittercism/android/az$5;->c:Lcrittercism/android/az;

    iget v0, v0, Lcrittercism/android/az;->B:I

    const/16 v2, 0xa

    if-ge v0, v2, :cond_1

    .line 640
    new-instance v0, Lcrittercism/android/bk;

    iget-object v2, p0, Lcrittercism/android/az$5;->a:Ljava/lang/Throwable;

    iget-wide v4, p0, Lcrittercism/android/az$5;->b:J

    invoke-direct {v0, v2, v4, v5}, Lcrittercism/android/bk;-><init>(Ljava/lang/Throwable;J)V

    .line 641
    const-string v2, "current_session"

    iget-object v3, p0, Lcrittercism/android/az$5;->c:Lcrittercism/android/az;

    .line 643
    iget-object v3, v3, Lcrittercism/android/az;->k:Lcrittercism/android/bs;

    .line 641
    invoke-virtual {v0, v2, v3}, Lcrittercism/android/bk;->a(Ljava/lang/String;Lcrittercism/android/bs;)V

    .line 647
    iget-object v2, p0, Lcrittercism/android/az$5;->c:Lcrittercism/android/az;

    iget-object v2, v2, Lcrittercism/android/az;->l:Lcrittercism/android/bs;

    invoke-virtual {v0, v2}, Lcrittercism/android/bk;->a(Lcrittercism/android/bs;)V

    .line 648
    const-string v2, "he"

    iput-object v2, v0, Lcrittercism/android/bk;->f:Ljava/lang/String;

    .line 650
    iget-object v2, p0, Lcrittercism/android/az$5;->c:Lcrittercism/android/az;

    iget-object v2, v2, Lcrittercism/android/az;->p:Lcrittercism/android/cw;

    invoke-virtual {v2}, Lcrittercism/android/cw;->a()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 651
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 652
    invoke-virtual {v0}, Lcrittercism/android/bk;->a()Lorg/json/JSONObject;

    move-result-object v0

    .line 651
    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v0

    .line 653
    new-instance v2, Lcrittercism/android/cv;

    .line 654
    sget-object v3, Lcrittercism/android/az;->a:Lcrittercism/android/az;

    invoke-direct {v2, v3}, Lcrittercism/android/cv;-><init>(Lcrittercism/android/au;)V

    sget-object v3, Lcrittercism/android/br;->b:Lcrittercism/android/br;

    .line 655
    invoke-virtual {v3}, Lcrittercism/android/br;->f()Ljava/lang/String;

    move-result-object v3

    .line 654
    invoke-virtual {v2, v3, v0}, Lcrittercism/android/cv;->a(Ljava/lang/String;Lorg/json/JSONArray;)Lcrittercism/android/cv;

    move-result-object v0

    .line 657
    new-instance v2, Lcrittercism/android/dk;

    new-instance v3, Lcrittercism/android/dd;

    new-instance v4, Lcrittercism/android/dc;

    iget-object v5, p0, Lcrittercism/android/az$5;->c:Lcrittercism/android/az;

    .line 658
    iget-object v5, v5, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v5}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v5

    const-string v6, "/android_v2/handle_exceptions"

    invoke-direct {v4, v5, v6}, Lcrittercism/android/dc;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 660
    invoke-virtual {v4}, Lcrittercism/android/dc;->a()Ljava/net/URL;

    move-result-object v4

    invoke-direct {v3, v4}, Lcrittercism/android/dd;-><init>(Ljava/net/URL;)V

    const/4 v4, 0x0

    invoke-direct {v2, v0, v3, v4}, Lcrittercism/android/dk;-><init>(Lcrittercism/android/cx;Lcrittercism/android/dd;Lcrittercism/android/cz;)V

    invoke-virtual {v2}, Lcrittercism/android/dk;->run()V

    .line 661
    iget-object v0, p0, Lcrittercism/android/az$5;->c:Lcrittercism/android/az;

    iget v2, v0, Lcrittercism/android/az;->B:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v0, Lcrittercism/android/az;->B:I

    .line 662
    iget-object v0, p0, Lcrittercism/android/az$5;->c:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->p:Lcrittercism/android/cw;

    invoke-virtual {v0}, Lcrittercism/android/cw;->b()V

    .line 665
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
