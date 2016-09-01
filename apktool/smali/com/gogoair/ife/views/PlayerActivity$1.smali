.class Lcom/gogoair/ife/views/PlayerActivity$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/views/PlayerActivity;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity;)V
    .locals 0

    .prologue
    .line 90
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$1;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 93
    iget-object v0, p0, Lcom/gogoair/ife/views/PlayerActivity$1;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    iget-object v1, p0, Lcom/gogoair/ife/views/PlayerActivity$1;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const v2, 0x7f05001c

    invoke-virtual {v1, v2}, Lcom/gogoair/ife/views/PlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/gogoair/ife/views/PlayerActivity$1;->this$0:Lcom/gogoair/ife/views/PlayerActivity;

    const v3, 0x7f05001b

    invoke-virtual {v2, v3}, Lcom/gogoair/ife/views/PlayerActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    # invokes: Lcom/gogoair/ife/views/PlayerActivity;->showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v1, v2}, Lcom/gogoair/ife/views/PlayerActivity;->access$000(Lcom/gogoair/ife/views/PlayerActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    return-void
.end method
