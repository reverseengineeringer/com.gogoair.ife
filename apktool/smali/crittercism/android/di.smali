.class final Lcrittercism/android/di;
.super Lcrittercism/android/dj;


# instance fields
.field private a:Lcrittercism/android/bs;

.field private b:Lcrittercism/android/bs;

.field private c:Lcrittercism/android/au;

.field private d:Ljava/net/URL;

.field private e:Lcrittercism/android/cz;

.field private f:Lcrittercism/android/cy;


# direct methods
.method constructor <init>(Lcrittercism/android/bs;Lcrittercism/android/bs;Lcrittercism/android/au;Ljava/net/URL;Lcrittercism/android/cz;Lcrittercism/android/cy;)V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lcrittercism/android/dj;-><init>()V

    .line 26
    iput-object p1, p0, Lcrittercism/android/di;->b:Lcrittercism/android/bs;

    .line 34
    iput-object p2, p0, Lcrittercism/android/di;->a:Lcrittercism/android/bs;

    .line 35
    iput-object p3, p0, Lcrittercism/android/di;->c:Lcrittercism/android/au;

    .line 36
    iput-object p4, p0, Lcrittercism/android/di;->d:Ljava/net/URL;

    .line 37
    iput-object p5, p0, Lcrittercism/android/di;->e:Lcrittercism/android/cz;

    .line 38
    iput-object p6, p0, Lcrittercism/android/di;->f:Lcrittercism/android/cy;

    .line 39
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .prologue
    .line 43
    iget-object v0, p0, Lcrittercism/android/di;->a:Lcrittercism/android/bs;

    iget-object v1, p0, Lcrittercism/android/di;->b:Lcrittercism/android/bs;

    invoke-virtual {v0, v1}, Lcrittercism/android/bs;->a(Lcrittercism/android/bs;)V

    .line 44
    iget-object v0, p0, Lcrittercism/android/di;->f:Lcrittercism/android/cy;

    iget-object v1, p0, Lcrittercism/android/di;->c:Lcrittercism/android/au;

    invoke-interface {v0, v1}, Lcrittercism/android/cy;->a(Lcrittercism/android/au;)Lcrittercism/android/cx;

    move-result-object v0

    iget-object v1, p0, Lcrittercism/android/di;->b:Lcrittercism/android/bs;

    invoke-interface {v0, v1}, Lcrittercism/android/cx;->a(Lcrittercism/android/bs;)Lcrittercism/android/cx;

    move-result-object v0

    .line 45
    new-instance v1, Lcrittercism/android/dd;

    iget-object v2, p0, Lcrittercism/android/di;->d:Ljava/net/URL;

    invoke-direct {v1, v2}, Lcrittercism/android/dd;-><init>(Ljava/net/URL;)V

    .line 46
    new-instance v2, Lcrittercism/android/dk;

    const/4 v3, 0x1

    iget-object v4, p0, Lcrittercism/android/di;->e:Lcrittercism/android/cz;

    invoke-direct {v2, v0, v1, v3, v4}, Lcrittercism/android/dk;-><init>(Lcrittercism/android/cx;Lcrittercism/android/dd;ZLcrittercism/android/cz;)V

    .line 47
    invoke-virtual {v2}, Lcrittercism/android/dk;->run()V

    .line 48
    return-void
.end method
