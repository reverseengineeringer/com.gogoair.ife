.class final Lcom/adobe/mobile/Config$12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic val$resourceId:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 239
    iput p1, p0, Lcom/adobe/mobile/Config$12;->val$resourceId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 241
    iget v0, p0, Lcom/adobe/mobile/Config$12;->val$resourceId:I

    invoke-static {v0}, Lcom/adobe/mobile/Messages;->setLargeIconResourceId(I)V

    .line 242
    return-void
.end method
