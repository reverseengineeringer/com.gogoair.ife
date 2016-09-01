.class Lcom/gogoair/ife/views/PlayerActivity$4$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic this$1:Lcom/gogoair/ife/views/PlayerActivity$4;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/views/PlayerActivity$4;)V
    .locals 0

    .prologue
    .line 323
    iput-object p1, p0, Lcom/gogoair/ife/views/PlayerActivity$4$1;->this$1:Lcom/gogoair/ife/views/PlayerActivity$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .prologue
    .line 325
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 326
    return-void
.end method
