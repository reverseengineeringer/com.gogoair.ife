.class Lcom/gogoair/ife/views/MainActivity$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/MainActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/MainActivity;)V
    .locals 0

    .prologue
    .line 95
    iput-object p1, p0, Lcom/gogoair/ife/views/MainActivity$2;->this$0:Lcom/gogoair/ife/views/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 98
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    const-string v2, "http://airbornemedia.gogoinflight.com/app"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 99
    iget-object v1, p0, Lcom/gogoair/ife/views/MainActivity$2;->this$0:Lcom/gogoair/ife/views/MainActivity;

    invoke-virtual {v1, v0}, Lcom/gogoair/ife/views/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 100
    return-void
.end method
