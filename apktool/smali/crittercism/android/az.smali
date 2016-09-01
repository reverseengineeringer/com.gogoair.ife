.class public final Lcrittercism/android/az;
.super Ljava/lang/Object;

# interfaces
.implements Lcrittercism/android/au;
.implements Lcrittercism/android/aw;
.implements Lcrittercism/android/ax;
.implements Lcrittercism/android/f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcrittercism/android/az$a;
    }
.end annotation


# static fields
.field static a:Lcrittercism/android/az;


# instance fields
.field public A:Lcrittercism/android/du;

.field B:I

.field public C:Z

.field private D:Ljava/lang/String;

.field private E:Lcrittercism/android/bs;

.field private F:Lcrittercism/android/bs;

.field private G:Lcrittercism/android/g;

.field private H:Lcrittercism/android/at;

.field private I:Z

.field private J:Ljava/lang/String;

.field public b:Z

.field public c:Landroid/content/Context;

.field public final d:Landroid/os/ConditionVariable;

.field public final e:Landroid/os/ConditionVariable;

.field public f:Lcrittercism/android/dx;

.field g:Lcrittercism/android/bs;

.field h:Lcrittercism/android/bs;

.field i:Lcrittercism/android/bs;

.field j:Lcrittercism/android/bs;

.field k:Lcrittercism/android/bs;

.field l:Lcrittercism/android/bs;

.field m:Lcrittercism/android/bs;

.field n:Lcrittercism/android/bs;

.field o:Lcrittercism/android/bs;

.field p:Lcrittercism/android/cw;

.field public q:Lcrittercism/android/dh;

.field r:Ljava/util/concurrent/ExecutorService;

.field public s:Ljava/util/concurrent/ExecutorService;

.field public t:Z

.field public u:Lcrittercism/android/bb;

.field protected v:Lcrittercism/android/e;

.field public w:Lcrittercism/android/ds;

.field x:Lcrittercism/android/dw;

.field public y:Lcrittercism/android/bi;

.field public z:Ljava/util/Map;


# direct methods
.method protected constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-boolean v1, p0, Lcrittercism/android/az;->b:Z

    .line 96
    iput-object v2, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    .line 97
    iput-object v2, p0, Lcrittercism/android/az;->D:Ljava/lang/String;

    .line 100
    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0, v1}, Landroid/os/ConditionVariable;-><init>(Z)V

    iput-object v0, p0, Lcrittercism/android/az;->d:Landroid/os/ConditionVariable;

    .line 103
    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0, v1}, Landroid/os/ConditionVariable;-><init>(Z)V

    iput-object v0, p0, Lcrittercism/android/az;->e:Landroid/os/ConditionVariable;

    .line 105
    new-instance v0, Lcrittercism/android/dx;

    invoke-direct {v0}, Lcrittercism/android/dx;-><init>()V

    iput-object v0, p0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    .line 118
    iput-object v2, p0, Lcrittercism/android/az;->p:Lcrittercism/android/cw;

    .line 120
    iput-object v2, p0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    .line 121
    iput-object v2, p0, Lcrittercism/android/az;->G:Lcrittercism/android/g;

    .line 124
    new-instance v0, Lcrittercism/android/ea;

    invoke-direct {v0}, Lcrittercism/android/ea;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcrittercism/android/az;->r:Ljava/util/concurrent/ExecutorService;

    .line 127
    new-instance v0, Lcrittercism/android/ea;

    invoke-direct {v0}, Lcrittercism/android/ea;-><init>()V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcrittercism/android/az;->s:Ljava/util/concurrent/ExecutorService;

    .line 131
    iput-boolean v1, p0, Lcrittercism/android/az;->I:Z

    .line 132
    iput-boolean v1, p0, Lcrittercism/android/az;->t:Z

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lcrittercism/android/az;->J:Ljava/lang/String;

    .line 142
    iput-object v2, p0, Lcrittercism/android/az;->x:Lcrittercism/android/dw;

    .line 145
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcrittercism/android/az;->z:Ljava/util/Map;

    .line 146
    iput-object v2, p0, Lcrittercism/android/az;->A:Lcrittercism/android/du;

    .line 151
    iput v1, p0, Lcrittercism/android/az;->B:I

    .line 152
    iput-boolean v1, p0, Lcrittercism/android/az;->C:Z

    .line 157
    new-instance v0, Lcrittercism/android/e;

    iget-object v1, p0, Lcrittercism/android/az;->s:Ljava/util/concurrent/ExecutorService;

    invoke-direct {v0, v1}, Lcrittercism/android/e;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcrittercism/android/az;->v:Lcrittercism/android/e;

    .line 158
    return-void
.end method

.method public static A()Lcrittercism/android/az;
    .locals 1

    .prologue
    .line 161
    sget-object v0, Lcrittercism/android/az;->a:Lcrittercism/android/az;

    if-nez v0, :cond_0

    .line 162
    new-instance v0, Lcrittercism/android/az;

    invoke-direct {v0}, Lcrittercism/android/az;-><init>()V

    sput-object v0, Lcrittercism/android/az;->a:Lcrittercism/android/az;

    .line 165
    :cond_0
    sget-object v0, Lcrittercism/android/az;->a:Lcrittercism/android/az;

    return-object v0
.end method

.method private static F()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 228
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    move v0, v1

    .line 230
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 231
    aget-object v3, v2, v0

    .line 232
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "onCreate"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 233
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "onResume"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 234
    :cond_0
    const/4 v1, 0x1

    .line 237
    :cond_1
    return v1

    .line 230
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private G()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v3, 0x0

    .line 291
    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v4

    .line 292
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    .line 295
    iget-object v0, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    const-string v1, "activity"

    .line 296
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 298
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v1

    .line 300
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v2, v3

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 301
    iget v1, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->uid:I

    if-ne v1, v4, :cond_4

    .line 302
    add-int/lit8 v1, v2, 0x1

    :goto_1
    move v2, v1

    .line 304
    goto :goto_0

    .line 306
    :cond_0
    if-gt v2, v7, :cond_2

    .line 307
    iput-boolean v3, p0, Lcrittercism/android/az;->t:Z

    .line 322
    :cond_1
    :goto_2
    return-void

    .line 311
    :cond_2
    const v1, 0x7fffffff

    .line 312
    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v0

    .line 316
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 317
    iget v0, v0, Landroid/app/ActivityManager$RunningServiceInfo;->pid:I

    if-ne v0, v5, :cond_3

    .line 318
    iput-boolean v7, p0, Lcrittercism/android/az;->t:Z

    goto :goto_2

    :cond_4
    move v1, v2

    goto :goto_1
.end method

.method private H()Ljava/lang/String;
    .locals 2

    .prologue
    .line 524
    :try_start_0
    iget-object v0, p0, Lcrittercism/android/az;->J:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcrittercism/android/az;->J:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 525
    :cond_0
    iget-object v0, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcrittercism/android/az;->J:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 532
    :cond_1
    :goto_0
    iget-object v0, p0, Lcrittercism/android/az;->J:Ljava/lang/String;

    return-object v0

    .line 529
    :catch_0
    move-exception v0

    const-string v0, "Call to getPackageName() failed.  Please contact us at support@crittercism.com."

    invoke-static {v0}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V

    .line 530
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lcrittercism/android/az;->J:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public final B()Z
    .locals 1

    .prologue
    .line 1124
    iget-object v0, p0, Lcrittercism/android/az;->d:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 1125
    iget-object v0, p0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    invoke-virtual {v0}, Lcrittercism/android/dx;->b()Z

    move-result v0

    return v0
.end method

.method public final C()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x5
    .end annotation

    .prologue
    .line 1148
    iget-object v0, p0, Lcrittercism/android/az;->A:Lcrittercism/android/du;

    .line 1150
    iget-object v0, p0, Lcrittercism/android/az;->A:Lcrittercism/android/du;

    if-eqz v0, :cond_0

    .line 1151
    iget-object v0, p0, Lcrittercism/android/az;->A:Lcrittercism/android/du;

    invoke-virtual {v0}, Lcrittercism/android/du;->d()V

    .line 1153
    :cond_0
    return-void
.end method

.method public final D()Ljava/lang/String;
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x5
    .end annotation

    .prologue
    .line 1186
    iget-object v0, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 1187
    invoke-direct {p0}, Lcrittercism/android/az;->H()Ljava/lang/String;

    move-result-object v2

    .line 1188
    const/4 v0, 0x0

    .line 1189
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 1190
    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1191
    invoke-static {v0}, Lcrittercism/android/dq;->a(Ljava/lang/String;)Lcrittercism/android/do;

    move-result-object v0

    .line 1192
    if-eqz v0, :cond_1

    .line 1193
    invoke-interface {v0, v2}, Lcrittercism/android/do;->a(Ljava/lang/String;)Lcrittercism/android/dn;

    move-result-object v0

    invoke-virtual {v0}, Lcrittercism/android/dn;->a()Ljava/lang/String;

    move-result-object v0

    .line 1199
    :cond_0
    :goto_0
    return-object v0

    .line 1195
    :cond_1
    const-string v0, "Could not find app market for this app.  Will try rate-my-app test target in config."

    invoke-static {v0}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V

    .line 1196
    iget-object v0, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v0}, Lcrittercism/android/bb;->getRateMyAppTestTarget()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final E()V
    .locals 2

    .prologue
    .line 1352
    iget-boolean v0, p0, Lcrittercism/android/az;->t:Z

    if-eqz v0, :cond_1

    .line 1381
    :cond_0
    :goto_0
    return-void

    .line 1358
    :cond_1
    new-instance v0, Lcrittercism/android/az$3;

    invoke-direct {v0, p0, p0}, Lcrittercism/android/az$3;-><init>(Lcrittercism/android/az;Lcrittercism/android/az;)V

    .line 1378
    iget-object v1, p0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    invoke-virtual {v1, v0}, Lcrittercism/android/dh;->a(Ljava/lang/Runnable;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1379
    iget-object v1, p0, Lcrittercism/android/az;->r:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public final a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/app/AlertDialog;
    .locals 5

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1258
    iget-object v2, p0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    invoke-virtual {v2}, Lcrittercism/android/dx;->b()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "User has opted out of crittercism.  generateRateMyAppAlertDialog returning null."

    invoke-static {v2}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    :goto_0
    if-nez v1, :cond_5

    .line 1309
    :goto_1
    return-object v0

    .line 1258
    :cond_0
    instance-of v2, p1, Landroid/app/Activity;

    if-nez v2, :cond_1

    const-string v2, "Context object must be an instance of Activity for AlertDialog to form correctly.  generateRateMyAppAlertDialog returning null."

    invoke-static {v2}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    if-eqz p3, :cond_2

    if-eqz p3, :cond_3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_3

    :cond_2
    const-string v2, "Message has to be a non-empty string.  generateRateMyAppAlertDialog returning null."

    invoke-static {v2}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v3, 0x5

    if-ge v2, v3, :cond_4

    const-string v2, "Rate my app not supported below api level 5"

    invoke-static {v2}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    const/4 v1, 0x1

    goto :goto_0

    .line 1262
    :cond_5
    invoke-virtual {p0}, Lcrittercism/android/az;->D()Ljava/lang/String;

    move-result-object v1

    .line 1263
    if-nez v1, :cond_6

    .line 1264
    const-string v1, "Cannot create proper URI to open app market.  Returning null."

    invoke-static {v1}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    goto :goto_1

    .line 1268
    :cond_6
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1269
    invoke-virtual {v2, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 1270
    invoke-virtual {v3, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1272
    :try_start_0
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 1280
    const/4 v2, -0x1

    const-string v3, "Yes"

    new-instance v4, Lcrittercism/android/az$10;

    invoke-direct {v4, p0, v1}, Lcrittercism/android/az$10;-><init>(Lcrittercism/android/az;Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3, v4}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 1290
    const/4 v1, -0x2

    const-string v2, "No"

    new-instance v3, Lcrittercism/android/az$11;

    invoke-direct {v3, p0}, Lcrittercism/android/az$11;-><init>(Lcrittercism/android/az;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 1300
    const/4 v1, -0x3

    const-string v2, "Maybe Later"

    new-instance v3, Lcrittercism/android/az$12;

    invoke-direct {v3, p0}, Lcrittercism/android/az$12;-><init>(Lcrittercism/android/az;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    goto :goto_1

    .line 1276
    :catch_0
    move-exception v1

    const-string v1, "Failed to create AlertDialog instance from AlertDialog.Builder.  Did you remember to call Looper.prepare() before calling Crittercism.generateRateMyAppAlertDialog()?"

    invoke-static {v1}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public final a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 771
    iget-object v0, p0, Lcrittercism/android/az;->D:Ljava/lang/String;

    .line 773
    if-nez v0, :cond_0

    .line 774
    const-string v0, ""

    .line 777
    :cond_0
    return-object v0
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 950
    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 953
    if-eqz v1, :cond_0

    .line 954
    invoke-interface {v1, p2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 957
    :cond_0
    return-object v0
.end method

.method public final a(Landroid/content/Context;Ljava/lang/String;Lcom/crittercism/app/CrittercismConfig;)V
    .locals 6

    .prologue
    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Initializing Crittercism 5.0.6 for App ID "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcrittercism/android/dy;->a(Ljava/lang/String;)V

    .line 175
    iput-object p2, p0, Lcrittercism/android/az;->D:Ljava/lang/String;

    .line 176
    new-instance v0, Lcrittercism/android/bb;

    invoke-direct {v0, p2, p3}, Lcrittercism/android/bb;-><init>(Ljava/lang/String;Lcom/crittercism/app/CrittercismConfig;)V

    iput-object v0, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    .line 177
    iput-object p1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    .line 178
    new-instance v0, Lcrittercism/android/at;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    iget-object v2, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/at;-><init>(Landroid/content/Context;Lcom/crittercism/app/CrittercismConfig;)V

    iput-object v0, p0, Lcrittercism/android/az;->H:Lcrittercism/android/at;

    .line 179
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcrittercism/android/az;->J:Ljava/lang/String;

    .line 181
    new-instance v0, Lcrittercism/android/ds;

    invoke-direct {v0, p1}, Lcrittercism/android/ds;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcrittercism/android/az;->w:Lcrittercism/android/ds;

    .line 183
    invoke-direct {p0}, Lcrittercism/android/az;->G()V

    .line 184
    const-wide v0, 0xdf8475800L

    .line 185
    iget-boolean v2, p0, Lcrittercism/android/az;->t:Z

    if-eqz v2, :cond_0

    .line 186
    const-wide v0, 0x2cb417800L

    .line 188
    :cond_0
    new-instance v2, Lcrittercism/android/cw;

    invoke-direct {v2, v0, v1}, Lcrittercism/android/cw;-><init>(J)V

    iput-object v2, p0, Lcrittercism/android/az;->p:Lcrittercism/android/cw;

    .line 191
    invoke-static {}, Lcrittercism/android/az;->F()Z

    move-result v0

    if-nez v0, :cond_1

    .line 192
    const-string v0, "Crittercism should be initialized in onCreate() of MainActivity"

    invoke-static {v0}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V

    .line 195
    :cond_1
    iget-object v0, p0, Lcrittercism/android/az;->H:Lcrittercism/android/at;

    invoke-static {v0}, Lcrittercism/android/bx;->a(Lcrittercism/android/at;)V

    .line 196
    iget-object v0, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-static {v0}, Lcrittercism/android/bx;->a(Landroid/content/Context;)V

    .line 197
    new-instance v0, Lcrittercism/android/cc;

    invoke-direct {v0}, Lcrittercism/android/cc;-><init>()V

    invoke-static {v0}, Lcrittercism/android/bx;->a(Lcrittercism/android/cb;)V

    .line 198
    new-instance v0, Lcrittercism/android/bf;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    iget-object v2, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bf;-><init>(Landroid/content/Context;Lcom/crittercism/app/CrittercismConfig;)V

    invoke-static {v0}, Lcrittercism/android/bx;->a(Lcrittercism/android/bf;)V

    .line 200
    :try_start_0
    iget-object v0, p0, Lcrittercism/android/az;->v:Lcrittercism/android/e;

    iget-object v1, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v1}, Lcrittercism/android/bb;->a()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcrittercism/android/e;->a(Ljava/util/List;)V

    iget-object v0, p0, Lcrittercism/android/az;->v:Lcrittercism/android/e;

    iget-object v1, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v1}, Lcrittercism/android/bb;->getPreserveQueryStringPatterns()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcrittercism/android/e;->b(Ljava/util/List;)V

    new-instance v0, Ljava/net/URL;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v2}, Lcrittercism/android/bb;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/api/apm/network"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcrittercism/android/g;

    invoke-direct {v1, p0, v0}, Lcrittercism/android/g;-><init>(Lcrittercism/android/au;Ljava/net/URL;)V

    iput-object v1, p0, Lcrittercism/android/az;->G:Lcrittercism/android/g;

    iget-object v0, p0, Lcrittercism/android/az;->v:Lcrittercism/android/e;

    iget-object v1, p0, Lcrittercism/android/az;->G:Lcrittercism/android/g;

    invoke-virtual {v0, v1}, Lcrittercism/android/e;->a(Lcrittercism/android/f;)V

    iget-object v0, p0, Lcrittercism/android/az;->v:Lcrittercism/android/e;

    invoke-virtual {v0, p0}, Lcrittercism/android/e;->a(Lcrittercism/android/f;)V

    new-instance v0, Lcrittercism/android/dz;

    iget-object v1, p0, Lcrittercism/android/az;->G:Lcrittercism/android/g;

    const-string v2, "OPTMZ"

    invoke-direct {v0, v1, v2}, Lcrittercism/android/dz;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    iget-object v0, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-static {v0}, Lcrittercism/android/h;->a(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    invoke-virtual {v0}, Lcrittercism/android/bb;->isServiceMonitoringEnabled()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-nez v0, :cond_6

    .line 201
    :cond_2
    :goto_0
    new-instance v0, Lcrittercism/android/dh;

    iget-object v1, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    move-object v2, p1

    move-object v3, p0

    move-object v4, p0

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcrittercism/android/dh;-><init>(Lcrittercism/android/bb;Landroid/content/Context;Lcrittercism/android/aw;Lcrittercism/android/ax;Lcrittercism/android/au;)V

    iput-object v0, p0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    .line 202
    iget-boolean v0, p0, Lcrittercism/android/az;->t:Z

    if-nez v0, :cond_3

    .line 203
    new-instance v0, Lcrittercism/android/ed;

    iget-object v1, p0, Lcrittercism/android/az;->s:Ljava/util/concurrent/ExecutorService;

    iget-object v2, p0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    iget-object v3, p0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    invoke-direct {v0, p0, v1, v2, v3}, Lcrittercism/android/ed;-><init>(Lcrittercism/android/aw;Ljava/util/concurrent/ExecutorService;Lcrittercism/android/dh;Lcrittercism/android/dx;)V

    invoke-static {v0}, Lcrittercism/android/dy;->a(Lcrittercism/android/ed;)V

    .line 211
    :cond_3
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    .line 212
    instance-of v1, v0, Lcrittercism/android/ay;

    if-nez v1, :cond_4

    .line 213
    new-instance v1, Lcrittercism/android/ay;

    invoke-direct {v1, p0, v0}, Lcrittercism/android/ay;-><init>(Lcrittercism/android/az;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 215
    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 218
    :cond_4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_8

    iget-object v0, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Application;

    if-nez v0, :cond_7

    const-string v0, "Application context not provided. Automatic breadcrumbs will not be recorded."

    invoke-static {v0}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V

    .line 219
    :goto_1
    iget-boolean v0, p0, Lcrittercism/android/az;->t:Z

    if-nez v0, :cond_5

    .line 220
    invoke-static {p0}, Lcrittercism/android/bg;->b(Lcrittercism/android/az;)V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_5

    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object v0

    new-instance v1, Lcrittercism/android/az$a;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcrittercism/android/az$a;-><init>(B)V

    invoke-virtual {v0, v1}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 223
    :cond_5
    new-instance v0, Lcrittercism/android/dz;

    iget-object v1, p0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    invoke-direct {v0, v1}, Lcrittercism/android/dz;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Lcrittercism/android/dz;->start()V

    .line 224
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcrittercism/android/az;->b:Z

    .line 225
    return-void

    .line 200
    :cond_6
    :try_start_1
    new-instance v0, Lcrittercism/android/d;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcrittercism/android/d;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcrittercism/android/i;

    iget-object v2, p0, Lcrittercism/android/az;->v:Lcrittercism/android/e;

    invoke-direct {v1, v2, v0}, Lcrittercism/android/i;-><init>(Lcrittercism/android/e;Lcrittercism/android/d;)V

    invoke-virtual {v1}, Lcrittercism/android/i;->a()Z

    move-result v0

    iput-boolean v0, p0, Lcrittercism/android/az;->I:Z

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "installedApm = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lcrittercism/android/az;->I:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-static {}, Lcrittercism/android/dy;->b()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Exception in startApm: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcrittercism/android/dy;->b()V

    invoke-static {}, Lcrittercism/android/dy;->c()V

    goto/16 :goto_0

    .line 218
    :cond_7
    invoke-static {}, Lcrittercism/android/dy;->b()V

    iget-object v0, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    check-cast v0, Landroid/app/Application;

    new-instance v1, Lcrittercism/android/av;

    iget-object v2, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-direct {v1, v2, p0}, Lcrittercism/android/av;-><init>(Landroid/content/Context;Lcrittercism/android/az;)V

    invoke-virtual {v0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    goto :goto_1

    :cond_8
    const-string v0, "API Level is less than 14. Automatic breadcrumbs are not supported."

    invoke-static {v0}, Lcrittercism/android/dy;->a(Ljava/lang/String;)V

    goto/16 :goto_1
.end method

.method public final a(Lcrittercism/android/bh;)V
    .locals 3

    .prologue
    .line 974
    iget-object v0, p0, Lcrittercism/android/az;->y:Lcrittercism/android/bi;

    .line 975
    iget-object v0, p0, Lcrittercism/android/az;->y:Lcrittercism/android/bi;

    if-nez v0, :cond_1

    .line 986
    :cond_0
    :goto_0
    return-void

    .line 979
    :cond_1
    invoke-static {p1}, Lcrittercism/android/bg;->a(Lcrittercism/android/bh;)V

    .line 980
    invoke-static {}, Lcrittercism/android/bg;->i()V

    .line 982
    iget-boolean v0, p1, Lcrittercism/android/bh;->a:Z

    if-eqz v0, :cond_0

    .line 983
    iget-object v0, p0, Lcrittercism/android/az;->y:Lcrittercism/android/bi;

    iget v1, p1, Lcrittercism/android/bh;->b:I

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2}, Lcrittercism/android/bi;->a(ILjava/util/concurrent/TimeUnit;)V

    .line 984
    iget-object v0, p0, Lcrittercism/android/az;->y:Lcrittercism/android/bi;

    invoke-virtual {v0}, Lcrittercism/android/bi;->b()V

    goto :goto_0
.end method

.method public final a(Lcrittercism/android/c;)V
    .locals 2

    .prologue
    .line 737
    new-instance v0, Lcrittercism/android/az$8;

    invoke-direct {v0, p0, p1}, Lcrittercism/android/az$8;-><init>(Lcrittercism/android/az;Lcrittercism/android/c;)V

    .line 743
    iget-object v1, p0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    invoke-virtual {v1, v0}, Lcrittercism/android/dh;->a(Ljava/lang/Runnable;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 744
    iget-object v1, p0, Lcrittercism/android/az;->s:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 746
    :cond_0
    return-void
.end method

.method public final a(Lcrittercism/android/ci;)V
    .locals 2

    .prologue
    .line 749
    iget-object v0, p0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    invoke-virtual {v0}, Lcrittercism/android/dx;->b()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 763
    :cond_0
    :goto_0
    return-void

    .line 753
    :cond_1
    new-instance v0, Lcrittercism/android/az$9;

    invoke-direct {v0, p0, p1}, Lcrittercism/android/az$9;-><init>(Lcrittercism/android/az;Lcrittercism/android/ci;)V

    .line 760
    iget-object v1, p0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    invoke-virtual {v1, v0}, Lcrittercism/android/dh;->a(Ljava/lang/Runnable;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 761
    iget-object v1, p0, Lcrittercism/android/az;->s:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public final a(Lcrittercism/android/h;)V
    .locals 3

    .prologue
    .line 1006
    iget-object v0, p0, Lcrittercism/android/az;->G:Lcrittercism/android/g;

    if-nez v0, :cond_1

    .line 1015
    :cond_0
    :goto_0
    return-void

    .line 1010
    :cond_1
    iget-boolean v0, p1, Lcrittercism/android/h;->a:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p1, Lcrittercism/android/h;->c:Z

    if-nez v0, :cond_0

    .line 1011
    const-string v0, "Enabling OPTMZ"

    invoke-static {v0}, Lcrittercism/android/dy;->a(Ljava/lang/String;)V

    .line 1012
    iget-object v0, p0, Lcrittercism/android/az;->G:Lcrittercism/android/g;

    iget v1, p1, Lcrittercism/android/h;->d:I

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2}, Lcrittercism/android/g;->a(ILjava/util/concurrent/TimeUnit;)V

    .line 1013
    iget-object v0, p0, Lcrittercism/android/az;->G:Lcrittercism/android/g;

    invoke-virtual {v0}, Lcrittercism/android/g;->a()V

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x5
    .end annotation

    .prologue
    .line 1134
    iget-object v0, p0, Lcrittercism/android/az;->A:Lcrittercism/android/du;

    .line 1136
    iget-object v0, p0, Lcrittercism/android/az;->A:Lcrittercism/android/du;

    if-eqz v0, :cond_0

    .line 1137
    iget-object v0, p0, Lcrittercism/android/az;->A:Lcrittercism/android/du;

    invoke-virtual {v0}, Lcrittercism/android/du;->d()V

    .line 1140
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1141
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1142
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1143
    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 1144
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2

    .prologue
    .line 1035
    iget-object v0, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1036
    if-eqz v0, :cond_0

    .line 1037
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1038
    if-eqz v0, :cond_0

    .line 1039
    invoke-interface {v0, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1040
    invoke-interface {v0, p2, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1041
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1044
    :cond_0
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 961
    iget-object v0, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 963
    if-eqz v0, :cond_0

    .line 964
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 965
    if-eqz v0, :cond_0

    .line 966
    invoke-interface {v0, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 967
    invoke-interface {v0, p2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 968
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 971
    :cond_0
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/net/URL;JJJILjava/lang/Exception;J)V
    .locals 7

    .prologue
    .line 427
    if-nez p1, :cond_0

    .line 429
    const-string v2, "Null HTTP request method provided. Endpoint will not be logged."

    invoke-static {v2}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    .line 516
    :goto_0
    return-void

    .line 432
    :cond_0
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 433
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 434
    const-string v4, "GET"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 435
    const-string v4, "POST"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 436
    const-string v4, "HEAD"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 437
    const-string v4, "PUT"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 438
    const-string v4, "DELETE"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 439
    const-string v4, "TRACE"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 440
    const-string v4, "OPTIONS"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 441
    const-string v4, "CONNECT"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 442
    const-string v4, "PATCH"

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 443
    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 444
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Logging endpoint with invalid HTTP request method: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V

    .line 449
    :cond_1
    if-nez p2, :cond_2

    .line 450
    const-string v2, "Null URL provided. Endpoint will not be logged"

    invoke-static {v2}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    goto :goto_0

    .line 454
    :cond_2
    const-wide/16 v4, 0x0

    cmp-long v3, p5, v4

    if-ltz v3, :cond_3

    const-wide/16 v4, 0x0

    cmp-long v3, p7, v4

    if-gez v3, :cond_4

    .line 455
    :cond_3
    const-string v2, "Invalid byte values. Bytes need to be non-negative. Endpoint will not be logged."

    invoke-static {v2}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    goto :goto_0

    .line 459
    :cond_4
    if-eqz p9, :cond_7

    .line 460
    const/16 v3, 0x64

    move/from16 v0, p9

    if-lt v0, v3, :cond_5

    const/16 v3, 0x258

    move/from16 v0, p9

    if-lt v0, v3, :cond_6

    .line 461
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Logging endpoint with invalid HTTP response code: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 462
    invoke-static/range {p9 .. p9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 461
    invoke-static {v3}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V

    .line 468
    :cond_6
    :goto_1
    new-instance v3, Lcrittercism/android/d;

    iget-object v4, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcrittercism/android/d;-><init>(Landroid/content/Context;)V

    .line 475
    invoke-virtual {v3}, Lcrittercism/android/d;->a()Lcrittercism/android/b;

    move-result-object v3

    .line 476
    const-wide/16 v4, 0x0

    cmp-long v4, p3, v4

    if-gez v4, :cond_8

    .line 483
    const-string v2, "Invalid latency. Endpoint will not be logged."

    invoke-static {v2}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 464
    :cond_7
    if-nez p10, :cond_6

    .line 465
    const-string v3, "Logging endpoint with null error and response code of 0."

    invoke-static {v3}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V

    goto :goto_1

    .line 489
    :cond_8
    const-wide/16 v4, 0x0

    cmp-long v4, p11, v4

    if-gez v4, :cond_9

    .line 490
    const-string v2, "Invalid start time. Endpoint will not be logged."

    invoke-static {v2}, Lcrittercism/android/dy;->b(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 494
    :cond_9
    new-instance v4, Lcrittercism/android/c;

    invoke-direct {v4}, Lcrittercism/android/c;-><init>()V

    .line 495
    iput-object v2, v4, Lcrittercism/android/c;->f:Ljava/lang/String;

    .line 496
    invoke-virtual {p2}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcrittercism/android/c;->a(Ljava/lang/String;)V

    .line 497
    invoke-virtual {v4, p5, p6}, Lcrittercism/android/c;->b(J)V

    .line 498
    invoke-virtual {v4, p7, p8}, Lcrittercism/android/c;->d(J)V

    .line 499
    move/from16 v0, p9

    iput v0, v4, Lcrittercism/android/c;->e:I

    .line 500
    iput-object v3, v4, Lcrittercism/android/c;->j:Lcrittercism/android/b;

    .line 501
    move-wide/from16 v0, p11

    invoke-virtual {v4, v0, v1}, Lcrittercism/android/c;->e(J)V

    .line 502
    add-long v2, p11, p3

    invoke-virtual {v4, v2, v3}, Lcrittercism/android/c;->f(J)V

    .line 504
    invoke-static {}, Lcrittercism/android/bc;->b()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 508
    invoke-static {}, Lcrittercism/android/bc;->a()Landroid/location/Location;

    move-result-object v2

    invoke-virtual {v4, v2}, Lcrittercism/android/c;->a(Landroid/location/Location;)V

    .line 512
    :cond_a
    move-object/from16 v0, p10

    invoke-virtual {v4, v0}, Lcrittercism/android/c;->a(Ljava/lang/Throwable;)V

    .line 513
    iget-object v2, p0, Lcrittercism/android/az;->v:Lcrittercism/android/e;

    sget-object v3, Lcrittercism/android/c$a;->l:Lcrittercism/android/c$a;

    invoke-virtual {v2, v4, v3}, Lcrittercism/android/e;->a(Lcrittercism/android/c;Lcrittercism/android/c$a;)V

    goto/16 :goto_0
.end method

.method final a(Ljava/lang/Throwable;)V
    .locals 12

    .prologue
    const/4 v5, 0x0

    .line 359
    instance-of v0, p1, Lcrittercism/android/cq;

    invoke-static {p0, v0}, Lcrittercism/android/bg;->a(Lcrittercism/android/az;Z)Ljava/util/List;

    move-result-object v2

    .line 361
    new-instance v3, Lcrittercism/android/bk;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    invoke-direct {v3, p1, v0, v1}, Lcrittercism/android/bk;-><init>(Ljava/lang/Throwable;J)V

    .line 362
    const-string v0, "crashed_session"

    iget-object v1, p0, Lcrittercism/android/az;->k:Lcrittercism/android/bs;

    invoke-virtual {v3, v0, v1}, Lcrittercism/android/bk;->a(Ljava/lang/String;Lcrittercism/android/bs;)V

    .line 364
    iget-object v0, p0, Lcrittercism/android/az;->F:Lcrittercism/android/bs;

    invoke-virtual {v0}, Lcrittercism/android/bs;->b()I

    move-result v0

    if-lez v0, :cond_0

    .line 365
    const-string v0, "previous_session"

    iget-object v1, p0, Lcrittercism/android/az;->F:Lcrittercism/android/bs;

    invoke-virtual {v3, v0, v1}, Lcrittercism/android/bk;->a(Ljava/lang/String;Lcrittercism/android/bs;)V

    .line 368
    :cond_0
    iget-object v0, p0, Lcrittercism/android/az;->l:Lcrittercism/android/bs;

    invoke-virtual {v3, v0}, Lcrittercism/android/bk;->a(Lcrittercism/android/bs;)V

    .line 369
    iget-object v0, p0, Lcrittercism/android/az;->m:Lcrittercism/android/bs;

    new-instance v1, Lcrittercism/android/bo;

    invoke-direct {v1, v0}, Lcrittercism/android/bo;-><init>(Lcrittercism/android/bs;)V

    iget-object v0, v1, Lcrittercism/android/bo;->a:Lorg/json/JSONArray;

    iput-object v0, v3, Lcrittercism/android/bk;->b:Lorg/json/JSONArray;

    .line 370
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, v3, Lcrittercism/android/bk;->e:Lorg/json/JSONArray;

    invoke-static {}, Ljava/lang/Thread;->getAllStackTraces()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v8

    iget-wide v10, v3, Lcrittercism/android/bk;->a:J

    cmp-long v7, v8, v10

    if-eqz v7, :cond_1

    const-string v7, "name"

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "id"

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "state"

    invoke-virtual {v1}, Ljava/lang/Thread;->getState()Ljava/lang/Thread$State;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread$State;->name()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "stacktrace"

    new-instance v7, Lorg/json/JSONArray;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v7, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-interface {v6, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v3, Lcrittercism/android/bk;->e:Lorg/json/JSONArray;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v6}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 371
    :cond_2
    invoke-virtual {v3, v2}, Lcrittercism/android/bk;->a(Ljava/util/List;)V

    .line 372
    iget-object v0, p0, Lcrittercism/android/az;->j:Lcrittercism/android/bs;

    invoke-virtual {v0, v3}, Lcrittercism/android/bs;->a(Lcrittercism/android/ch;)Z

    .line 374
    new-instance v0, Lcrittercism/android/dg;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcrittercism/android/dg;-><init>(Landroid/content/Context;)V

    .line 376
    iget-object v1, p0, Lcrittercism/android/az;->g:Lcrittercism/android/bs;

    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v3, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    .line 378
    invoke-virtual {v3}, Lcrittercism/android/bb;->e()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/v0/appload/"

    new-instance v7, Lcrittercism/android/ct$b;

    invoke-direct {v7}, Lcrittercism/android/ct$b;-><init>()V

    move-object v6, p0

    .line 375
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 385
    iget-object v1, p0, Lcrittercism/android/az;->h:Lcrittercism/android/bs;

    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v3, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    .line 387
    invoke-virtual {v3}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_exceptions"

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    move-object v6, p0

    .line 384
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 394
    iget-object v1, p0, Lcrittercism/android/az;->i:Lcrittercism/android/bs;

    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v3, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    .line 396
    invoke-virtual {v3}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_ndk_crashes"

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    move-object v6, p0

    .line 393
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 403
    iget-object v1, p0, Lcrittercism/android/az;->j:Lcrittercism/android/bs;

    new-instance v2, Lcrittercism/android/db$a;

    invoke-direct {v2}, Lcrittercism/android/db$a;-><init>()V

    iget-object v3, p0, Lcrittercism/android/az;->u:Lcrittercism/android/bb;

    .line 405
    invoke-virtual {v3}, Lcrittercism/android/bb;->b()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_v2/handle_crashes"

    new-instance v7, Lcrittercism/android/cv$a;

    invoke-direct {v7}, Lcrittercism/android/cv$a;-><init>()V

    move-object v6, p0

    .line 402
    invoke-virtual/range {v0 .. v7}, Lcrittercism/android/dg;->a(Lcrittercism/android/bs;Lcrittercism/android/da;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcrittercism/android/au;Lcrittercism/android/cy;)V

    .line 412
    :try_start_0
    invoke-virtual {v0}, Lcrittercism/android/dg;->a()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 421
    :goto_1
    return-void

    .line 413
    :catch_0
    move-exception v0

    .line 414
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "InterruptedException in logCrashException: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcrittercism/android/dy;->b()V

    .line 415
    invoke-static {}, Lcrittercism/android/dy;->c()V

    goto :goto_1

    .line 417
    :catch_1
    move-exception v0

    .line 418
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected throwable in logCrashException: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcrittercism/android/dy;->b()V

    .line 419
    invoke-static {}, Lcrittercism/android/dy;->c()V

    goto :goto_1
.end method

.method public final a(Lorg/json/JSONObject;)V
    .locals 2

    .prologue
    .line 1323
    iget-boolean v0, p0, Lcrittercism/android/az;->t:Z

    if-eqz v0, :cond_1

    .line 1349
    :cond_0
    :goto_0
    return-void

    .line 1329
    :cond_1
    new-instance v0, Lcrittercism/android/az$2;

    invoke-direct {v0, p0, p0, p1}, Lcrittercism/android/az$2;-><init>(Lcrittercism/android/az;Lcrittercism/android/az;Lorg/json/JSONObject;)V

    .line 1345
    iget-object v1, p0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    invoke-virtual {v1, v0}, Lcrittercism/android/dh;->a(Ljava/lang/Runnable;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1346
    iget-object v1, p0, Lcrittercism/android/az;->s:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public final b(Ljava/lang/String;)I
    .locals 3

    .prologue
    const/4 v1, -0x1

    .line 1483
    .line 1485
    iget-boolean v0, p0, Lcrittercism/android/az;->t:Z

    if-eqz v0, :cond_0

    .line 1486
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Transactions are not supported for services. Returning default value of -1 for "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V

    move v0, v1

    .line 1497
    :goto_0
    return v0

    .line 1491
    :cond_0
    iget-object v2, p0, Lcrittercism/android/az;->z:Ljava/util/Map;

    monitor-enter v2

    .line 1492
    :try_start_0
    iget-object v0, p0, Lcrittercism/android/az;->z:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/crittercism/app/Transaction;

    .line 1493
    if-eqz v0, :cond_1

    .line 1494
    invoke-virtual {v0}, Lcom/crittercism/app/Transaction;->d()I

    move-result v0

    .line 1496
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 1024
    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-virtual {v1, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1027
    if-eqz v1, :cond_0

    .line 1028
    invoke-interface {v1, p2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 1031
    :cond_0
    return v0
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1089
    iget-object v0, p0, Lcrittercism/android/az;->H:Lcrittercism/android/at;

    iget-object v0, v0, Lcrittercism/android/at;->a:Ljava/lang/String;

    return-object v0
.end method

.method public final declared-synchronized b(Ljava/lang/Throwable;)V
    .locals 3

    .prologue
    .line 616
    monitor-enter p0

    if-nez p1, :cond_1

    .line 617
    :try_start_0
    const-string v0, "Calling logHandledException with a null java.lang.Throwable. Nothing will be reported to Crittercism"

    invoke-static {v0}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 626
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 621
    :cond_1
    :try_start_1
    iget-boolean v0, p0, Lcrittercism/android/az;->t:Z

    if-eqz v0, :cond_2

    .line 622
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    new-instance v2, Lcrittercism/android/az$5;

    invoke-direct {v2, p0, p1, v0, v1}, Lcrittercism/android/az$5;-><init>(Lcrittercism/android/az;Ljava/lang/Throwable;J)V

    iget-object v0, p0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    invoke-virtual {v0, v2}, Lcrittercism/android/dh;->a(Ljava/lang/Runnable;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcrittercism/android/az;->s:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 616
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 624
    :cond_2
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    new-instance v2, Lcrittercism/android/az$6;

    invoke-direct {v2, p0, p1, v0, v1}, Lcrittercism/android/az$6;-><init>(Lcrittercism/android/az;Ljava/lang/Throwable;J)V

    iget-object v0, p0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    invoke-virtual {v0, v2}, Lcrittercism/android/dh;->a(Ljava/lang/Runnable;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcrittercism/android/az;->s:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public final c()Ljava/lang/String;
    .locals 2

    .prologue
    .line 783
    const-string v0, ""

    .line 785
    iget-object v1, p0, Lcrittercism/android/az;->w:Lcrittercism/android/ds;

    if-eqz v1, :cond_0

    .line 786
    iget-object v0, p0, Lcrittercism/android/az;->w:Lcrittercism/android/ds;

    invoke-virtual {v0}, Lcrittercism/android/ds;->a()Ljava/lang/String;

    move-result-object v0

    .line 789
    :cond_0
    return-object v0
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 1047
    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    invoke-virtual {v1, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1050
    if-eqz v1, :cond_0

    .line 1051
    invoke-interface {v1, p2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1054
    :cond_0
    return v0
.end method

.method public final d()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1099
    const-string v0, "5.0.6"

    return-object v0
.end method

.method public final e()I
    .locals 2

    .prologue
    .line 818
    const/4 v0, -0x1

    .line 819
    iget-object v1, p0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    if-eqz v1, :cond_0

    .line 820
    iget-object v0, p0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    invoke-virtual {v0}, Lcrittercism/android/dx;->a()Lcrittercism/android/dv;

    move-result-object v0

    iget v0, v0, Lcrittercism/android/dv;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 822
    :cond_0
    return v0
.end method

.method public final f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 799
    new-instance v0, Lcrittercism/android/bx$f;

    invoke-direct {v0}, Lcrittercism/android/bx$f;-><init>()V

    iget-object v0, v0, Lcrittercism/android/bx$f;->a:Ljava/lang/String;

    return-object v0
.end method

.method public final g()I
    .locals 1

    .prologue
    .line 804
    new-instance v0, Lcrittercism/android/bx$o;

    invoke-direct {v0}, Lcrittercism/android/bx$o;-><init>()V

    iget-object v0, v0, Lcrittercism/android/bx$o;->a:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public final h()I
    .locals 1

    .prologue
    .line 809
    new-instance v0, Lcrittercism/android/bx$p;

    invoke-direct {v0}, Lcrittercism/android/bx$p;-><init>()V

    iget-object v0, v0, Lcrittercism/android/bx$p;->a:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public final i()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1104
    const-string v0, "Android"

    return-object v0
.end method

.method public final j()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1109
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public final k()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1114
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    return-object v0
.end method

.method public final l()Lcrittercism/android/dx;
    .locals 1

    .prologue
    .line 874
    iget-object v0, p0, Lcrittercism/android/az;->f:Lcrittercism/android/dx;

    return-object v0
.end method

.method public final m()Lcrittercism/android/du;
    .locals 1

    .prologue
    .line 1541
    iget-object v0, p0, Lcrittercism/android/az;->A:Lcrittercism/android/du;

    return-object v0
.end method

.method public final n()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 854
    iget-object v0, p0, Lcrittercism/android/az;->g:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final o()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 858
    iget-object v0, p0, Lcrittercism/android/az;->h:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final p()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 862
    iget-object v0, p0, Lcrittercism/android/az;->E:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final q()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 866
    iget-object v0, p0, Lcrittercism/android/az;->i:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final r()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 870
    iget-object v0, p0, Lcrittercism/android/az;->j:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final s()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 1070
    iget-object v0, p0, Lcrittercism/android/az;->k:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final t()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 1079
    iget-object v0, p0, Lcrittercism/android/az;->l:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final u()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 1075
    iget-object v0, p0, Lcrittercism/android/az;->F:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final v()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 1084
    iget-object v0, p0, Lcrittercism/android/az;->m:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final w()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 896
    iget-object v0, p0, Lcrittercism/android/az;->n:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final x()Lcrittercism/android/bs;
    .locals 1

    .prologue
    .line 901
    iget-object v0, p0, Lcrittercism/android/az;->o:Lcrittercism/android/bs;

    return-object v0
.end method

.method public final y()Lcrittercism/android/dw;
    .locals 1

    .prologue
    .line 1394
    iget-object v0, p0, Lcrittercism/android/az;->x:Lcrittercism/android/dw;

    return-object v0
.end method

.method public final z()V
    .locals 3

    .prologue
    .line 829
    iget-boolean v0, p0, Lcrittercism/android/az;->t:Z

    if-eqz v0, :cond_1

    .line 830
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->f:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    .line 832
    invoke-virtual {v0, v1}, Lcrittercism/android/bs;->a(Landroid/content/Context;)Lcrittercism/android/bs;

    move-result-object v0

    iput-object v0, p0, Lcrittercism/android/az;->k:Lcrittercism/android/bs;

    .line 837
    :goto_0
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->h:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->F:Lcrittercism/android/bs;

    .line 838
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->g:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->l:Lcrittercism/android/bs;

    .line 839
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->k:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->m:Lcrittercism/android/bs;

    .line 841
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->a:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->g:Lcrittercism/android/bs;

    .line 842
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->b:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->h:Lcrittercism/android/bs;

    .line 843
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->c:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->E:Lcrittercism/android/bs;

    .line 844
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->d:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->i:Lcrittercism/android/bs;

    .line 845
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->e:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->j:Lcrittercism/android/bs;

    .line 846
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->i:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->n:Lcrittercism/android/bs;

    .line 847
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->j:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->o:Lcrittercism/android/bs;

    .line 848
    iget-boolean v0, p0, Lcrittercism/android/az;->t:Z

    if-nez v0, :cond_0

    .line 849
    new-instance v0, Lcrittercism/android/dw;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    iget-object v2, p0, Lcrittercism/android/az;->D:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/dw;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcrittercism/android/az;->x:Lcrittercism/android/dw;

    .line 851
    :cond_0
    return-void

    .line 834
    :cond_1
    new-instance v0, Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az;->c:Landroid/content/Context;

    sget-object v2, Lcrittercism/android/br;->f:Lcrittercism/android/br;

    invoke-direct {v0, v1, v2}, Lcrittercism/android/bs;-><init>(Landroid/content/Context;Lcrittercism/android/br;)V

    iput-object v0, p0, Lcrittercism/android/az;->k:Lcrittercism/android/bs;

    goto/16 :goto_0
.end method
