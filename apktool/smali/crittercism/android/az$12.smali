.class final Lcrittercism/android/az$12;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcrittercism/android/az;


# direct methods
.method constructor <init>(Lcrittercism/android/az;)V
    .locals 0

    .prologue
    .line 1300
    iput-object p1, p0, Lcrittercism/android/az$12;->a:Lcrittercism/android/az;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .prologue
    .line 1303
    :try_start_0
    invoke-static {}, Lcrittercism/android/az;->A()Lcrittercism/android/az;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1307
    :goto_0
    return-void

    .line 1305
    :catch_0
    move-exception v0

    const-string v0, "MAYBE LATER button failed.  Email support@crittercism.com."

    invoke-static {v0}, Lcrittercism/android/dy;->c(Ljava/lang/String;)V

    goto :goto_0
.end method
