.class public final Lcrittercism/android/dh;
.super Lcrittercism/android/dj;


# instance fields
.field public a:Landroid/os/ConditionVariable;

.field public b:Lcrittercism/android/bm;

.field private c:Landroid/os/ConditionVariable;

.field private d:Lcrittercism/android/bb;

.field private e:Landroid/content/Context;

.field private f:Lcrittercism/android/aw;

.field private g:Lcrittercism/android/ax;

.field private h:Lcrittercism/android/au;

.field private i:Ljava/util/List;

.field private j:Z

.field private k:Z

.field private l:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Lcrittercism/android/bb;Landroid/content/Context;Lcrittercism/android/aw;Lcrittercism/android/ax;Lcrittercism/android/au;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Lcrittercism/android/dj;-><init>()V

    .line 45
    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v0, p0, Lcrittercism/android/dh;->c:Landroid/os/ConditionVariable;

    .line 46
    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v0, p0, Lcrittercism/android/dh;->a:Landroid/os/ConditionVariable;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrittercism/android/dh;->i:Ljava/util/List;

    .line 53
    iput-boolean v1, p0, Lcrittercism/android/dh;->j:Z

    .line 55
    iput-object v2, p0, Lcrittercism/android/dh;->b:Lcrittercism/android/bm;

    .line 57
    iput-object v2, p0, Lcrittercism/android/dh;->l:Ljava/lang/Exception;

    .line 65
    iput-object p1, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    .line 72
    iput-object p2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    .line 73
    iput-object p3, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    .line 74
    iput-object p4, p0, Lcrittercism/android/dh;->g:Lcrittercism/android/ax;

    .line 75
    iput-object p5, p0, Lcrittercism/android/dh;->h:Lcrittercism/android/au;

    .line 76
    iput-boolean v1, p0, Lcrittercism/android/dh;->k:Z

    .line 77
    return-void
.end method

.method private a(Ljava/io/File;)V
    .locals 9

    .prologue
    const/4 v1, 0x0

    const/4 v5, 0x0

    .line 356
    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    new-instance v0, Lcrittercism/android/h;

    invoke-direct {v0, v2}, Lcrittercism/android/h;-><init>(Landroid/content/Context;)V

    const-string v3, "com.crittercism.optmz.config"

    invoke-virtual {v2, v3, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "interval"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    const-string v3, "interval"

    const/16 v4, 0xa

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, v0, Lcrittercism/android/h;->d:I

    const-string v3, "kill"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    const-string v3, "kill"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v0, Lcrittercism/android/h;->c:Z

    const-string v3, "persist"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    const-string v3, "persist"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v0, Lcrittercism/android/h;->b:Z

    const-string v3, "enabled"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    const-string v1, "enabled"

    invoke-interface {v2, v1, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcrittercism/android/h;->a:Z

    :goto_0
    if-eqz v0, :cond_0

    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcrittercism/android/az;->a(Lcrittercism/android/h;)V

    .line 357
    :cond_0
    iget-boolean v0, p0, Lcrittercism/android/dh;->k:Z

    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->z()V

    .line 358
    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v0

    iget-boolean v0, v0, Lcrittercism/android/az;->t:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    invoke-static {v0}, Lcrittercism/android/bh;->a(Landroid/content/Context;)Lcrittercism/android/bh;

    move-result-object v8

    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->x()Lcrittercism/android/bs;

    move-result-object v3

    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->s()Lcrittercism/android/bs;

    move-result-object v4

    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->t()Lcrittercism/android/bs;

    move-result-object v5

    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->v()Lcrittercism/android/bs;

    move-result-object v6

    new-instance v0, Lcrittercism/android/bi;

    iget-object v1, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    iget-object v2, p0, Lcrittercism/android/dh;->h:Lcrittercism/android/au;

    iget-object v7, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    invoke-virtual {v7}, Lcrittercism/android/bb;->d()Ljava/lang/String;

    move-result-object v7

    invoke-direct/range {v0 .. v7}, Lcrittercism/android/bi;-><init>(Landroid/content/Context;Lcrittercism/android/au;Lcrittercism/android/bs;Lcrittercism/android/bs;Lcrittercism/android/bs;Lcrittercism/android/bs;Ljava/lang/String;)V

    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v1

    iput-object v0, v1, Lcrittercism/android/az;->y:Lcrittercism/android/bi;

    new-instance v2, Lcrittercism/android/dz;

    const-string v3, "TXN Thread"

    invoke-direct {v2, v0, v3}, Lcrittercism/android/dz;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    invoke-virtual {v1, v8}, Lcrittercism/android/az;->a(Lcrittercism/android/bh;)V

    .line 359
    :cond_1
    iget-boolean v0, p0, Lcrittercism/android/dh;->k:Z

    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v0

    iget-boolean v1, v0, Lcrittercism/android/az;->t:Z

    if-nez v1, :cond_3

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    :cond_2
    iget-object v1, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    iget-object v1, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v1}, Lcrittercism/android/aw;->s()Lcrittercism/android/bs;

    move-result-object v2

    iget-object v1, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v1}, Lcrittercism/android/aw;->t()Lcrittercism/android/bs;

    move-result-object v4

    iget-object v1, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v1}, Lcrittercism/android/aw;->u()Lcrittercism/android/bs;

    move-result-object v3

    iget-object v1, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v1}, Lcrittercism/android/aw;->v()Lcrittercism/android/bs;

    move-result-object v5

    iget-object v1, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v1}, Lcrittercism/android/aw;->q()Lcrittercism/android/bs;

    move-result-object v6

    if-eqz p1, :cond_9

    const/4 v1, 0x1

    sput-boolean v1, Lcrittercism/android/dr;->a:Z

    iget-object v0, v0, Lcrittercism/android/az;->e:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    new-instance v0, Lcrittercism/android/cd;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcrittercism/android/cd;-><init>(Ljava/io/File;Lcrittercism/android/bs;Lcrittercism/android/bs;Lcrittercism/android/bs;Lcrittercism/android/bs;)V

    invoke-virtual {v6, v0}, Lcrittercism/android/bs;->a(Lcrittercism/android/ch;)Z

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->w()Lcrittercism/android/bs;

    move-result-object v0

    invoke-virtual {v0}, Lcrittercism/android/bs;->a()V

    :goto_1
    invoke-virtual {v3}, Lcrittercism/android/bs;->a()V

    invoke-virtual {v4}, Lcrittercism/android/bs;->a()V

    invoke-virtual {v5}, Lcrittercism/android/bs;->a()V

    invoke-virtual {v2, v3}, Lcrittercism/android/bs;->a(Lcrittercism/android/bs;)V

    .line 364
    :cond_3
    iget-object v0, p0, Lcrittercism/android/dh;->a:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 366
    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->s()Lcrittercism/android/bs;

    move-result-object v0

    sget-object v1, Lcrittercism/android/cf;->a:Lcrittercism/android/cf;

    invoke-virtual {v0, v1}, Lcrittercism/android/bs;->a(Lcrittercism/android/ch;)Z

    .line 367
    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v0

    iget-boolean v0, v0, Lcrittercism/android/az;->t:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    invoke-virtual {v0}, Lcrittercism/android/bb;->isNdkCrashReportingEnabled()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcrittercism/android/dy;->b()V

    :try_start_0
    iget-object v0, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    iget-object v1, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    invoke-virtual {v1}, Lcrittercism/android/bb;->g()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/crittercism/app/CrittercismNDK;->installNdkLib(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 368
    :cond_4
    :goto_2
    invoke-direct {p0}, Lcrittercism/android/dh;->f()V

    .line 369
    return-void

    :cond_5
    move-object v0, v1

    .line 356
    goto/16 :goto_0

    :cond_6
    move-object v0, v1

    goto/16 :goto_0

    :cond_7
    move-object v0, v1

    goto/16 :goto_0

    :cond_8
    move-object v0, v1

    goto/16 :goto_0

    .line 359
    :cond_9
    iget-object v0, v0, Lcrittercism/android/az;->e:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-static {v0}, Lcrittercism/android/bg;->a(Lcrittercism/android/aw;)V

    goto :goto_1

    .line 367
    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception installing ndk library: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcrittercism/android/dy;->b()V

    goto :goto_2
.end method

.method private declared-synchronized c()V
    .locals 1

    .prologue
    .line 80
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcrittercism/android/dh;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    monitor-exit p0

    return-void

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized d()Z
    .locals 1

    .prologue
    .line 84
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcrittercism/android/dh;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private e()Ljava/io/File;
    .locals 5

    .prologue
    const/4 v0, 0x0

    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 96
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    invoke-virtual {v3}, Lcrittercism/android/bb;->g()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 97
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 98
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_1

    .line 118
    :cond_0
    :goto_0
    return-object v0

    .line 104
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 105
    if-eqz v2, :cond_0

    .line 106
    array-length v3, v2

    if-ne v3, v4, :cond_2

    .line 107
    aget-object v1, v2, v1

    .line 108
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    .line 109
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v0, v1

    goto :goto_0

    .line 110
    :cond_2
    array-length v3, v2

    if-le v3, v4, :cond_0

    .line 111
    array-length v3, v2

    :goto_1
    if-ge v1, v3, :cond_0

    aget-object v4, v2, v1

    .line 112
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    .line 113
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 111
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private f()V
    .locals 14

    .prologue
    const/4 v13, 0x0

    .line 270
    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v0

    iget-boolean v0, v0, Lcrittercism/android/az;->t:Z

    if-eqz v0, :cond_1

    .line 351
    :cond_0
    :goto_0
    return-void

    .line 274
    :cond_1
    iget-boolean v0, p0, Lcrittercism/android/dh;->k:Z

    .line 275
    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->n()Lcrittercism/android/bs;

    move-result-object v1

    .line 276
    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->o()Lcrittercism/android/bs;

    move-result-object v8

    .line 277
    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->p()Lcrittercism/android/bs;

    move-result-object v9

    .line 278
    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->q()Lcrittercism/android/bs;

    move-result-object v10

    .line 279
    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->r()Lcrittercism/android/bs;

    move-result-object v11

    .line 280
    iget-object v0, p0, Lcrittercism/android/dh;->f:Lcrittercism/android/aw;

    invoke-interface {v0}, Lcrittercism/android/aw;->y()Lcrittercism/android/dw;

    move-result-object v12

    .line 282
    iget-object v0, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    invoke-virtual {v0}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    .line 288
    new-instance v0, Lcrittercism/android/bm;

    iget-object v2, p0, Lcrittercism/android/dh;->h:Lcrittercism/android/au;

    invoke-direct {v0, v2}, Lcrittercism/android/bm;-><init>(Lcrittercism/android/au;)V

    iput-object v0, p0, Lcrittercism/android/dh;->b:Lcrittercism/android/bm;

    .line 291
    iget-object v0, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    invoke-virtual {v0}, Lcrittercism/android/bb;->delaySendingAppLoad()Z

    move-result v0

    if-nez v0, :cond_2

    .line 292
    iget-object v0, p0, Lcrittercism/android/dh;->b:Lcrittercism/android/bm;

    invoke-virtual {v1, v0}, Lcrittercism/android/bs;->a(Lcrittercism/android/ch;)Z

    .line 293
    new-instance v0, Lcrittercism/android/dg;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcrittercism/android/dg;-><init>(Landroid/content/Context;)V

    .line 294
    new-instance v2, Lcrittercism/android/cu$a;

    invoke-direct {v2}, Lcrittercism/android/cu$a;-><init>()V

    iget-object v3, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    .line 297
    invoke-virtual {v3}, Lcrittercism/android/bb;->e()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/v0/appload/"

    iget-object v5, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    .line 299
    invoke-virtual {v5}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcrittercism/android/dh;->h:Lcrittercism/android/au;

    new-instance v7, Lcrittercism/android/ct$b;

    invoke-direct {v7}, Lcrittercism/android/ct$b;-><init>()V

    .line 294
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 303
    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v1, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    .line 306
    invoke-virtual {v1}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_exceptions"

    iget-object v6, p0, Lcrittercism/android/dh;->h:Lcrittercism/android/au;

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    move-object v1, v8

    move-object v5, v13

    .line 303
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 312
    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v1, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    .line 315
    invoke-virtual {v1}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_ndk_crashes"

    iget-object v6, p0, Lcrittercism/android/dh;->h:Lcrittercism/android/au;

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    move-object v1, v10

    move-object v5, v13

    .line 312
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 321
    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v1, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    .line 324
    invoke-virtual {v1}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_crashes"

    iget-object v6, p0, Lcrittercism/android/dh;->h:Lcrittercism/android/au;

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    move-object v1, v11

    move-object v5, v13

    .line 321
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 330
    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v1, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    .line 333
    invoke-virtual {v1}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_exceptions"

    new-instance v6, Lcrittercism/android/ba;

    iget-object v1, p0, Lcrittercism/android/dh;->h:Lcrittercism/android/au;

    iget-object v5, p0, Lcrittercism/android/dh;->d:Lcrittercism/android/bb;

    invoke-direct {v6, v1, v5}, Lcrittercism/android/ba;-><init>(Lcrittercism/android/au;Lcrittercism/android/bb;)V

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    move-object v1, v9

    move-object v5, v13

    .line 330
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 339
    invoke-virtual {v0}, Lcrittercism/android/dg;->a()V

    .line 342
    :cond_2
    invoke-virtual {v12}, Lcrittercism/android/dw;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 349
    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v0

    invoke-virtual {v0}, Lcrittercism/android/az;->E()V

    goto/16 :goto_0
.end method


# virtual methods
.method public final a()V
    .locals 5

    .prologue
    .line 374
    :try_start_0
    invoke-static {}, Lcrittercism/android/dy;->b()V

    .line 375
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/com.crittercism/pending"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Lcrittercism/android/dy;->b()V

    .line 379
    :goto_0
    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v0

    .line 381
    iget-object v1, v0, Lcrittercism/android/az;->w:Lcrittercism/android/ds;

    invoke-virtual {v1}, Lcrittercism/android/ds;->a()Ljava/lang/String;

    .line 384
    iget-object v1, p0, Lcrittercism/android/dh;->h:Lcrittercism/android/au;

    invoke-interface {v1}, Lcrittercism/android/au;->l()Lcrittercism/android/dx;

    move-result-object v1

    .line 385
    iget-object v0, v0, Lcrittercism/android/az;->d:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 387
    iget-object v0, p0, Lcrittercism/android/dh;->g:Lcrittercism/android/ax;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    invoke-virtual {v1, v0}, Lcrittercism/android/dx;->a(Lcrittercism/android/ax;)V

    .line 389
    iget-object v0, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    invoke-static {v0}, Lcrittercism/android/dr;->a(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Lcrittercism/android/dr;->a:Z

    .line 390
    iget-object v0, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcrittercism/android/dr;->a(Landroid/content/Context;Z)V

    .line 392
    invoke-virtual {v1}, Lcrittercism/android/dx;->b()Z

    move-result v0

    if-nez v0, :cond_0

    .line 393
    new-instance v0, Lcrittercism/android/du;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcrittercism/android/du;-><init>(Landroid/content/Context;)V

    .line 394
    invoke-virtual {v0}, Lcrittercism/android/du;->a()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    iget-object v3, v0, Lcrittercism/android/du;->a:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "numAppLoads"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 395
    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v2

    iput-object v0, v2, Lcrittercism/android/az;->A:Lcrittercism/android/du;

    .line 397
    invoke-virtual {v1}, Lcrittercism/android/dx;->a()Lcrittercism/android/dv;

    move-result-object v0

    iget-object v2, p0, Lcrittercism/android/dh;->g:Lcrittercism/android/ax;

    sget-object v3, Lcrittercism/android/cr;->j:Lcrittercism/android/cr;

    .line 398
    invoke-virtual {v3}, Lcrittercism/android/cr;->a()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcrittercism/android/cr;->j:Lcrittercism/android/cr;

    .line 399
    invoke-virtual {v4}, Lcrittercism/android/cr;->b()Ljava/lang/String;

    move-result-object v4

    .line 397
    invoke-virtual {v0, v2, v3, v4}, Lcrittercism/android/dv;->a(Lcrittercism/android/ax;Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    :cond_0
    invoke-virtual {v1}, Lcrittercism/android/dx;->b()Z

    move-result v0

    iput-boolean v0, p0, Lcrittercism/android/dh;->k:Z

    .line 404
    invoke-direct {p0}, Lcrittercism/android/dh;->e()Ljava/io/File;

    move-result-object v0

    .line 406
    iget-boolean v1, p0, Lcrittercism/android/dh;->k:Z

    if-eqz v1, :cond_4

    .line 407
    iget-boolean v1, p0, Lcrittercism/android/dh;->k:Z

    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v1

    iget-boolean v1, v1, Lcrittercism/android/az;->t:Z

    if-nez v1, :cond_2

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    :cond_1
    new-instance v1, Lcrittercism/android/bs;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    sget-object v3, Lcrittercism/android/br;->a:Lcrittercism/android/br;

    invoke-direct {v1, v2, v3}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    invoke-virtual {v1}, Lcrittercism/android/bs;->a()V

    new-instance v1, Lcrittercism/android/bs;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    sget-object v3, Lcrittercism/android/br;->b:Lcrittercism/android/br;

    invoke-direct {v1, v2, v3}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    invoke-virtual {v1}, Lcrittercism/android/bs;->a()V

    new-instance v1, Lcrittercism/android/bs;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    sget-object v3, Lcrittercism/android/br;->c:Lcrittercism/android/br;

    invoke-direct {v1, v2, v3}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    invoke-virtual {v1}, Lcrittercism/android/bs;->a()V

    new-instance v1, Lcrittercism/android/bs;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    sget-object v3, Lcrittercism/android/br;->d:Lcrittercism/android/br;

    invoke-direct {v1, v2, v3}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    invoke-virtual {v1}, Lcrittercism/android/bs;->a()V

    new-instance v1, Lcrittercism/android/bs;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    sget-object v3, Lcrittercism/android/br;->e:Lcrittercism/android/br;

    invoke-direct {v1, v2, v3}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    invoke-virtual {v1}, Lcrittercism/android/bs;->a()V

    new-instance v1, Lcrittercism/android/bs;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    sget-object v3, Lcrittercism/android/br;->f:Lcrittercism/android/br;

    invoke-direct {v1, v2, v3}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    invoke-virtual {v1}, Lcrittercism/android/bs;->a()V

    new-instance v1, Lcrittercism/android/bs;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    sget-object v3, Lcrittercism/android/br;->h:Lcrittercism/android/br;

    invoke-direct {v1, v2, v3}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    invoke-virtual {v1}, Lcrittercism/android/bs;->a()V

    new-instance v1, Lcrittercism/android/bs;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    sget-object v3, Lcrittercism/android/br;->g:Lcrittercism/android/br;

    invoke-direct {v1, v2, v3}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    invoke-virtual {v1}, Lcrittercism/android/bs;->a()V

    new-instance v1, Lcrittercism/android/bs;

    iget-object v2, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    sget-object v3, Lcrittercism/android/br;->k:Lcrittercism/android/br;

    invoke-direct {v1, v2, v3}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    invoke-virtual {v1}, Lcrittercism/android/bs;->a()V

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_2
    iget-object v0, p0, Lcrittercism/android/dh;->e:Landroid/content/Context;

    invoke-static {v0}, Lcrittercism/android/h;->b(Landroid/content/Context;)V

    .line 412
    :goto_1
    invoke-direct {p0}, Lcrittercism/android/dh;->c()V

    .line 415
    iget-object v0, p0, Lcrittercism/android/dh;->i:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 416
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 418
    :catch_0
    move-exception v0

    .line 419
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception in run(): "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcrittercism/android/dy;->b()V

    .line 420
    invoke-static {}, Lcrittercism/android/dy;->c()V

    .line 421
    iput-object v0, p0, Lcrittercism/android/dh;->l:Ljava/lang/Exception;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 423
    iget-object v0, p0, Lcrittercism/android/dh;->c:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 424
    :goto_3
    return-void

    .line 375
    :cond_3
    :try_start_2
    invoke-static {v1}, Lcrittercism/android/ec;->a(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 423
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcrittercism/android/dh;->c:Landroid/os/ConditionVariable;

    invoke-virtual {v1}, Landroid/os/ConditionVariable;->open()V

    throw v0

    .line 409
    :cond_4
    :try_start_3
    invoke-direct {p0, v0}, Lcrittercism/android/dh;->a(Ljava/io/File;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 423
    :cond_5
    iget-object v0, p0, Lcrittercism/android/dh;->c:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    goto :goto_3
.end method

.method public final declared-synchronized a(Ljava/lang/Runnable;)Z
    .locals 1

    .prologue
    .line 88
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcrittercism/android/dh;->d()Z

    move-result v0

    if-nez v0, :cond_0

    .line 89
    iget-object v0, p0, Lcrittercism/android/dh;->i:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    const/4 v0, 0x1

    .line 92
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 88
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final b()V
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lcrittercism/android/dh;->c:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 429
    return-void
.end method
