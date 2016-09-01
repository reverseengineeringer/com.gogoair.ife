.class public final Lcrittercism/android/az$1;
.super Lcrittercism/android/dj;


# instance fields
.field final synthetic a:Lcrittercism/android/az;


# direct methods
.method public constructor <init>(Lcrittercism/android/az;)V
    .locals 0

    .prologue
    .line 556
    iput-object p1, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    invoke-direct {p0}, Lcrittercism/android/dj;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 558
    iget-object v0, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    invoke-virtual {v0}, Lcrittercism/android/dx;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 604
    :goto_0
    return-void

    .line 560
    :cond_0
    iget-object v0, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    iget-object v0, v0, Lcrittercism/android/dh;->b:Lcrittercism/android/bm;

    .line 561
    if-eqz v0, :cond_1

    .line 563
    iget-object v1, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    iget-object v1, v1, Lcrittercism/android/az;->g:Lcrittercism/android/bs;

    invoke-virtual {v1, v0}, Lcrittercism/android/bs;->a(Lcrittercism/android/ch;)Z

    .line 566
    :cond_1
    new-instance v0, Lcrittercism/android/dg;

    iget-object v1, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    iget-object v1, v1, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcrittercism/android/dg;-><init>(Landroid/content/Context;)V

    .line 567
    iget-object v1, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    .line 568
    iget-object v1, v1, Lcrittercism/android/az;->g:Lcrittercism/android/bs;

    new-instance v2, Lcrittercism/android/cu$a;

    invoke-direct {v2}, Lcrittercism/android/cu$a;-><init>()V

    iget-object v3, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    .line 570
    iget-object v3, v3, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v3}, Lcrittercism/android/bb;->e()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/v0/appload/"

    iget-object v5, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    .line 572
    iget-object v5, v5, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v5}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v5

    .line 573
    sget-object v6, Lcrittercism/android/az;->a:Lcrittercism/android/az;

    new-instance v7, Lcrittercism/android/ct$b;

    invoke-direct {v7}, Lcrittercism/android/ct$b;-><init>()V

    .line 567
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 576
    iget-object v1, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    .line 577
    iget-object v1, v1, Lcrittercism/android/az;->h:Lcrittercism/android/bs;

    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v3, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    .line 579
    iget-object v3, v3, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v3}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_exceptions"

    .line 582
    sget-object v6, Lcrittercism/android/az;->a:Lcrittercism/android/az;

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    move-object v5, v8

    .line 576
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 585
    iget-object v1, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    .line 586
    iget-object v1, v1, Lcrittercism/android/az;->i:Lcrittercism/android/bs;

    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v3, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    .line 588
    iget-object v3, v3, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v3}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_ndk_crashes"

    .line 591
    sget-object v6, Lcrittercism/android/az;->a:Lcrittercism/android/az;

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    move-object v5, v8

    .line 585
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 594
    iget-object v1, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    .line 595
    iget-object v1, v1, Lcrittercism/android/az;->j:Lcrittercism/android/bs;

    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v3, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    .line 597
    iget-object v3, v3, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v3}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_crashes"

    .line 600
    sget-object v6, Lcrittercism/android/az;->a:Lcrittercism/android/az;

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    move-object v5, v8

    .line 594
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 603
    iget-object v1, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    iget-object v1, v1, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    iget-object v2, p0, Lcrittercism/android/az$1;->a:Lcrittercism/android/az;

    iget-object v2, v2, Lcrittercism/android/az;->r:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0, v1, v2}, Lcrittercism/android/dg;->a(Lcrittercism/android/dh;Ljava/util/concurrent/ExecutorService;)V

    goto/16 :goto_0
.end method
