.class final Lcrittercism/android/az$6;
.super Lcrittercism/android/dj;


# instance fields
.field final synthetic a:Ljava/lang/Throwable;

.field final synthetic b:J

.field final synthetic c:Lcrittercism/android/az;


# direct methods
.method constructor <init>(Lcrittercism/android/az;Ljava/lang/Throwable;J)V
    .locals 1

    .prologue
    .line 677
    iput-object p1, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    iput-object p2, p0, Lcrittercism/android/az$6;->a:Ljava/lang/Throwable;

    iput-wide p3, p0, Lcrittercism/android/az$6;->b:J

    invoke-direct {p0}, Lcrittercism/android/dj;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 8

    .prologue
    .line 679
    iget-object v0, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    invoke-virtual {v0}, Lcrittercism/android/dx;->b()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 708
    :cond_0
    :goto_0
    return-void

    .line 681
    :cond_1
    new-instance v0, Lcrittercism/android/bk;

    iget-object v1, p0, Lcrittercism/android/az$6;->a:Ljava/lang/Throwable;

    iget-wide v2, p0, Lcrittercism/android/az$6;->b:J

    invoke-direct {v0, v1, v2, v3}, Lcrittercism/android/bk;-><init>(Ljava/lang/Throwable;J)V

    .line 682
    const-string v1, "current_session"

    iget-object v2, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    .line 683
    iget-object v2, v2, Lcrittercism/android/az;->k:Lcrittercism/android/bs;

    .line 682
    invoke-virtual {v0, v1, v2}, Lcrittercism/android/bk;->a(Ljava/lang/String;Lcrittercism/android/bs;)V

    .line 684
    const-string v1, "he"

    iput-object v1, v0, Lcrittercism/android/bk;->f:Ljava/lang/String;

    .line 688
    iget-object v1, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    iget-object v1, v1, Lcrittercism/android/az;->h:Lcrittercism/android/bs;

    invoke-virtual {v1, v0}, Lcrittercism/android/bs;->a(Lcrittercism/android/ch;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 689
    sget-object v1, Lcrittercism/android/az;->a:Lcrittercism/android/az;

    new-instance v2, Lcrittercism/android/by;

    .line 690
    iget-object v3, v0, Lcrittercism/android/bk;->c:Ljava/lang/String;

    iget-object v0, v0, Lcrittercism/android/bk;->d:Ljava/lang/String;

    invoke-direct {v2, v3, v0}, Lcrittercism/android/by;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 689
    invoke-virtual {v1, v2}, Lcrittercism/android/az;->a(Lcrittercism/android/ci;)V

    .line 692
    iget-object v0, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->p:Lcrittercism/android/cw;

    invoke-virtual {v0}, Lcrittercism/android/cw;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 693
    new-instance v0, Lcrittercism/android/dg;

    iget-object v1, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    iget-object v1, v1, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcrittercism/android/dg;-><init>(Landroid/content/Context;)V

    .line 695
    iget-object v1, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    .line 696
    iget-object v1, v1, Lcrittercism/android/az;->h:Lcrittercism/android/bs;

    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v3, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    .line 698
    iget-object v3, v3, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v3}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_exceptions"

    const/4 v5, 0x0

    .line 701
    sget-object v6, Lcrittercism/android/az;->a:Lcrittercism/android/az;

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    .line 695
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 704
    iget-object v1, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    iget-object v1, v1, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    iget-object v2, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    iget-object v2, v2, Lcrittercism/android/az;->r:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0, v1, v2}, Lcrittercism/android/dg;->a(Lcrittercism/android/dh;Ljava/util/concurrent/ExecutorService;)V

    .line 705
    iget-object v0, p0, Lcrittercism/android/az$6;->c:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->p:Lcrittercism/android/cw;

    invoke-virtual {v0}, Lcrittercism/android/cw;->b()V

    goto :goto_0
.end method
