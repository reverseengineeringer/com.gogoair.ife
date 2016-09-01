.class final Lcrittercism/android/bg$3;
.super Lcrittercism/android/dj;


# instance fields
.field final synthetic a:Lcrittercism/android/az;

.field final synthetic b:Lcrittercism/android/bg;


# direct methods
.method constructor <init>(Lcrittercism/android/az;Lcrittercism/android/bg;)V
    .locals 0

    .prologue
    .line 484
    iput-object p1, p0, Lcrittercism/android/bg$3;->a:Lcrittercism/android/az;

    iput-object p2, p0, Lcrittercism/android/bg$3;->b:Lcrittercism/android/bg;

    invoke-direct {p0}, Lcrittercism/android/dj;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .prologue
    .line 487
    iget-object v0, p0, Lcrittercism/android/bg$3;->a:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->q:Lcrittercism/android/dh;

    iget-object v0, v0, Lcrittercism/android/dh;->a:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 488
    iget-object v0, p0, Lcrittercism/android/bg$3;->a:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->n:Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/bg$3;->b:Lcrittercism/android/bg;

    invoke-virtual {v0, v1}, Lcrittercism/android/bs;->a(Lcrittercism/android/ch;)Z

    .line 489
    return-void
.end method
