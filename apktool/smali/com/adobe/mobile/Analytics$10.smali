.class final Lcom/adobe/mobile/Analytics$10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 209
    iput-object p1, p0, Lcom/adobe/mobile/Analytics$10;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lcom/adobe/mobile/Analytics$10;->val$intent:Landroid/content/Intent;

    invoke-static {v0}, Lcom/adobe/mobile/ReferrerHandler;->processIntent(Landroid/content/Intent;)V

    .line 212
    return-void
.end method
