.class final Lcrittercism/android/az$10;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcrittercism/android/az;


# direct methods
.method constructor <init>(Lcrittercism/android/az;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1280
    iput-object p1, p0, Lcrittercism/android/az$10;->b:Lcrittercism/android/az;

    iput-object p2, p0, Lcrittercism/android/az$10;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .prologue
    .line 1283
    :try_start_0
    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;

    move-result-object v0

    iget-object v1, p0, Lcrittercism/android/az$10;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcrittercism/android/az;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1287
    :goto_0
    return-void

    .line 1285
    :catch_0
    move-exception v0

    const-string v0, "YES button failed.  Email support@crittercism.com."

    invoke-static {v0}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V

    goto :goto_0
.end method
