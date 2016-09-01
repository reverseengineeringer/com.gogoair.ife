.class final Lcrittercism/android/az$8;
.super Lcrittercism/android/dj;


# instance fields
.field final synthetic a:Lcrittercism/android/c;

.field final synthetic b:Lcrittercism/android/az;


# direct methods
.method constructor <init>(Lcrittercism/android/az;Lcrittercism/android/c;)V
    .locals 0

    .prologue
    .line 737
    iput-object p1, p0, Lcrittercism/android/az$8;->b:Lcrittercism/android/az;

    iput-object p2, p0, Lcrittercism/android/az$8;->a:Lcrittercism/android/c;

    invoke-direct {p0}, Lcrittercism/android/dj;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .prologue
    .line 739
    iget-object v0, p0, Lcrittercism/android/az$8;->b:Lcrittercism/android/az;

    iget-object v0, v0, Lcrittercism/android/az;->l:Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/az$8;->a:Lcrittercism/android/c;

    invoke-virtual {v0, v1}, Lcrittercism/android/bs;->a(Lcrittercism/android/ch;)Z

    .line 740
    return-void
.end method
