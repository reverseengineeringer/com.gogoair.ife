.class Lcom/gogoair/ife/views/PlayerActivity$7$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$1:Lcom/gogoair/ife/views/PlayerActivity$7;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity$7;)V
    .locals 0

    .prologue
    .line 454
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$7$1;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 457
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$7$1;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$7;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->createPlayer()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$2700(Lcom/gogoair/ife/views/PlayerActivity;)V

    .line 458
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$7$1;->this$1:Lcom/gogoair/ife/views/PlayerActivity$7;

    iget-object v0, v0, Lcom/gogoair/ife/views/PlayerActivity$7;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->prepareMedia()V
    invoke-static {v0}, Lcom/gogoair/ife/views/PlayerActivity;->access$2800(Lcom/gogoair/ife/views/PlayerActivity;)V

    .line 459
    return-void
.end method
