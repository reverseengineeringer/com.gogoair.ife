.class Lcom/gogoair/ife/views/LandingActivity$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/LandingActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/LandingActivity;)V
    .locals 0

    .prologue
    .line 81
    iput-object p1, p0, Lcom/gogoair/ife/views/LandingActivity$2;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 84
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "http://airbornemedia.gogoinflight.com/app"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 85
    iget-object v1, p0, Lcom/gogoair/ife/views/LandingActivity$2;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    invoke-virtual {v1, v0}, Lcom/gogoair/ife/views/LandingActivity;->startActivity(Landroid/content/Intent;)V

    .line 86
    return-void
.end method
