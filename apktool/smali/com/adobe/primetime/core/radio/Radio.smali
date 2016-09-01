.class public Lcom/adobe/primetime/core/radio/Radio;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private _channels:Ljava/util/Map;

.field private _logger:Lcom/adobe/primetime/core/ILogger;


# direct methods
.method public constructor <init>(Lcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    if-nez p1, :cond_0

    .line 34
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the logger object cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_0
    iput-object p1, p0, Lcom/adobe/primetime/core/radio/Radio;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/core/radio/Radio;->_channels:Ljava/util/Map;

    .line 40
    return-void
.end method


# virtual methods
.method public channel(Ljava/lang/String;)Lcom/adobe/primetime/core/radio/Channel;
    .locals 3

    .prologue
    .line 46
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Radio;->_channels:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Radio;->_channels:Ljava/util/Map;

    new-instance v1, Lcom/adobe/primetime/core/radio/Channel;

    iget-object v2, p0, Lcom/adobe/primetime/core/radio/Radio;->_logger:Lcom/adobe/primetime/core/ILogger;

    invoke-direct {v1, p1, v2}, Lcom/adobe/primetime/core/radio/Channel;-><init>(Ljava/lang/String;Lcom/adobe/primetime/core/ILogger;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Radio;->_channels:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/radio/Channel;

    return-object v0
.end method

.method public shutdown()V
    .locals 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Radio;->_channels:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/radio/Channel;

    .line 55
    invoke-virtual {v0}, Lcom/adobe/primetime/core/radio/Channel;->shutdown()V

    goto :goto_0

    .line 57
    :cond_0
    return-void
.end method
