.class public Lcom/adobe/primetime/core/Event;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ERROR:Ljava/lang/String; = "error"

.field public static final SUCCESS:Ljava/lang/String; = "success"


# instance fields
.field private _data:Ljava/lang/Object;

.field private _name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/adobe/primetime/core/Event;->_name:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/adobe/primetime/core/Event;->_data:Ljava/lang/Object;

    .line 35
    return-void
.end method

.method public static createFromTrigger(Lcom/adobe/primetime/core/Trigger;)Lcom/adobe/primetime/core/Event;
    .locals 3

    .prologue
    .line 29
    new-instance v0, Lcom/adobe/primetime/core/Event;

    invoke-virtual {p0}, Lcom/adobe/primetime/core/Trigger;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/primetime/core/Event;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public getData()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/adobe/primetime/core/Event;->_data:Ljava/lang/Object;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/primetime/core/Event;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public setData(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 42
    iput-object p1, p0, Lcom/adobe/primetime/core/Event;->_data:Ljava/lang/Object;

    .line 43
    return-void
.end method
