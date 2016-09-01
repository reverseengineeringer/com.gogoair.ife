.class Lcom/gogoair/ife/views/LandingActivity$3;
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
    .line 150
    iput-object p1, p0, Lcom/gogoair/ife/views/LandingActivity$3;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 153
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/gogoair/ife/views/LandingActivity$3;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    # getter for: Lcom/gogoair/ife/views/LandingActivity;->context:Landroid/content/Context;
    invoke-static {v1}, Lcom/gogoair/ife/views/LandingActivity;->access$200(Lcom/gogoair/ife/views/LandingActivity;)Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 154
    const-string v1, "INTENT_EXTRA_GV_LIBRARY_ENTRY"

    iget-object v2, p0, Lcom/gogoair/ife/views/LandingActivity$3;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    # getter for: Lcom/gogoair/ife/views/LandingActivity;->movie:Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;
    invoke-static {v2}, Lcom/gogoair/ife/views/LandingActivity;->access$300(Lcom/gogoair/ife/views/LandingActivity;)Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 155
    iget-object v1, p0, Lcom/gogoair/ife/views/LandingActivity$3;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    invoke-virtual {v1, v0}, Lcom/gogoair/ife/views/LandingActivity;->startActivity(Landroid/content/Intent;)V

    .line 156
    iget-object v0, p0, Lcom/gogoair/ife/views/LandingActivity$3;->this$0:Lcom/gogoair/ife/views/LandingActivity;

    # getter for: Lcom/gogoair/ife/views/LandingActivity;->landingActivity:Landroid/app/Activity;
    invoke-static {v0}, Lcom/gogoair/ife/views/LandingActivity;->access$400(Lcom/gogoair/ife/views/LandingActivity;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 157
    return-void
.end method
