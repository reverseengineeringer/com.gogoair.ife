.class public Lcom/adobe/primetime/core/radio/Command;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private _callback:Lcom/adobe/primetime/core/ICallback;

.field private _param:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/ICallback;)V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/primetime/core/radio/Command;-><init>(Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/adobe/primetime/core/radio/Command;->_callback:Lcom/adobe/primetime/core/ICallback;

    .line 32
    iput-object p2, p0, Lcom/adobe/primetime/core/radio/Command;->_param:Ljava/lang/Object;

    .line 33
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Command;->_callback:Lcom/adobe/primetime/core/ICallback;

    if-nez v0, :cond_0

    .line 41
    :goto_0
    return-void

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Command;->_callback:Lcom/adobe/primetime/core/ICallback;

    iget-object v1, p0, Lcom/adobe/primetime/core/radio/Command;->_param:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
