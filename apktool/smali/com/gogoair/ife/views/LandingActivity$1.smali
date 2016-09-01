.class Lcom/gogoair/ife/views/LandingActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/LandingActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/LandingActivity;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/gogoair/ife/views/LandingActivity$1;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity$1;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    new-instance v1, Lcom/gogoair/ife/views/LandingActivity$1$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/gogoair/ife/views/LandingActivity$1$1;-><init>(Lcom/gogoair/ife/views/LandingActivity$1;Landroid/content/Intent;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/views/LandingActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 59
    return-void
.end method
