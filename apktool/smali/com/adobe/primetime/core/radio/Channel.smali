.class public Lcom/adobe/primetime/core/radio/Channel;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/primetime/core/radio/Channel$EventHandler;
    }
.end annotation


# static fields
.field public static final SEPARATOR:Ljava/lang/String; = ":"

.field public static final WILDCARD:Ljava/lang/String; = "*"


# instance fields
.field private _commands:Ljava/util/Map;

.field private _isShutDown:Z

.field private _listeners:Ljava/util/Map;

.field private _logTag:Ljava/lang/String;

.field private _logger:Lcom/adobe/primetime/core/ILogger;

.field private _name:Ljava/lang/String;

.field private _requests:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/adobe/primetime/core/radio/Channel;->_name:Ljava/lang/String;

    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_listeners:Ljava/util/Map;

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_requests:Ljava/util/Map;

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_commands:Ljava/util/Map;

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_isShutDown:Z

    .line 75
    if-nez p2, :cond_0

    .line 76
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the logger object cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_0
    const-class v0, Lcom/adobe/primetime/core/radio/Channel;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_logTag:Ljava/lang/String;

    .line 79
    iput-object p2, p0, Lcom/adobe/primetime/core/radio/Channel;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 80
    return-void
.end method

.method private static _matchWildcard(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 237
    if-nez p0, :cond_0

    const-string p0, ""

    .line 238
    :cond_0
    if-nez p1, :cond_1

    const-string p1, ""

    .line 241
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 255
    :goto_0
    return v3

    .line 244
    :cond_2
    const-string v0, ":"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 245
    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 248
    array-length v0, v4

    array-length v2, v5

    if-eq v0, v2, :cond_3

    move v3, v1

    goto :goto_0

    :cond_3
    move v0, v1

    move v2, v3

    .line 251
    :goto_1
    array-length v6, v4

    if-ge v0, v6, :cond_6

    .line 252
    if-eqz v2, :cond_5

    aget-object v2, v4, v0

    const-string v6, "*"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    aget-object v2, v4, v0

    aget-object v6, v5, v0

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    move v2, v3

    .line 251
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_5
    move v2, v1

    .line 252
    goto :goto_2

    :cond_6
    move v3, v2

    .line 255
    goto :goto_0
.end method

.method private _removeListener(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V
    .locals 3

    .prologue
    .line 259
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_listeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 262
    if-nez v0, :cond_1

    .line 272
    :cond_0
    return-void

    .line 264
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 265
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 266
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/radio/Channel$EventHandler;

    .line 267
    if-eqz p2, :cond_3

    invoke-virtual {v0}, Lcom/adobe/primetime/core/radio/Channel$EventHandler;->getCallback()Lcom/adobe/primetime/core/ICallback;

    move-result-object v2

    if-ne p2, v2, :cond_2

    :cond_3
    if-eqz p3, :cond_4

    .line 268
    invoke-virtual {v0}, Lcom/adobe/primetime/core/radio/Channel$EventHandler;->getContext()Ljava/lang/Object;

    move-result-object v0

    if-ne p3, v0, :cond_2

    .line 269
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0
.end method


# virtual methods
.method public command(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4

    .prologue
    .line 188
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_isShutDown:Z

    if-eqz v0, :cond_0

    .line 199
    :goto_0
    return-void

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_commands:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/ICallback;

    .line 192
    if-nez v0, :cond_1

    .line 193
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/core/radio/Channel;->_logTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#command > No command handler for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 197
    :cond_1
    invoke-interface {v0, p2}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public comply(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V
    .locals 1

    .prologue
    .line 177
    monitor-enter p0

    .line 179
    :try_start_0
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_isShutDown:Z

    if-eqz v0, :cond_0

    monitor-exit p0

    .line 183
    :goto_0
    return-void

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_commands:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public off()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 153
    invoke-virtual {p0, v0, v0, v0}, Lcom/adobe/primetime/core/radio/Channel;->off(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 154
    return-void
.end method

.method public off(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V
    .locals 3

    .prologue
    .line 124
    monitor-enter p0

    .line 126
    :try_start_0
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_isShutDown:Z

    if-eqz v0, :cond_0

    monitor-exit p0

    .line 150
    :goto_0
    return-void

    .line 129
    :cond_0
    if-nez p1, :cond_1

    if-nez p2, :cond_1

    if-nez p3, :cond_1

    .line 130
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_listeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 131
    monitor-exit p0

    goto :goto_0

    .line 149
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 134
    :cond_1
    if-nez p1, :cond_4

    .line 135
    :try_start_1
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_listeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 136
    invoke-direct {p0, v0, p2, p3}, Lcom/adobe/primetime/core/radio/Channel;->_removeListener(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    goto :goto_1

    .line 139
    :cond_2
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_listeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 140
    :cond_3
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 141
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 142
    iget-object v2, p0, Lcom/adobe/primetime/core/radio/Channel;->_listeners:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_3

    .line 143
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    .line 147
    :cond_4
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/primetime/core/radio/Channel;->_removeListener(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 149
    :cond_5
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public on(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V
    .locals 2

    .prologue
    .line 110
    monitor-enter p0

    .line 112
    :try_start_0
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_isShutDown:Z

    if-eqz v0, :cond_0

    monitor-exit p0

    .line 121
    :goto_0
    return-void

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_listeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 116
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_listeners:Ljava/util/Map;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    :cond_1
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_listeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    new-instance v1, Lcom/adobe/primetime/core/radio/Channel$EventHandler;

    invoke-direct {v1, p2, p3}, Lcom/adobe/primetime/core/radio/Channel$EventHandler;-><init>(Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public reply(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;)V
    .locals 1

    .prologue
    .line 204
    monitor-enter p0

    .line 206
    :try_start_0
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_isShutDown:Z

    if-eqz v0, :cond_0

    monitor-exit p0

    .line 210
    :goto_0
    return-void

    .line 208
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_requests:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public request(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 213
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/adobe/primetime/core/radio/Channel;->request(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public request(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .prologue
    const/4 v1, 0x0

    .line 217
    monitor-enter p0

    .line 219
    :try_start_0
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_isShutDown:Z

    if-eqz v0, :cond_0

    monitor-exit p0

    move-object v0, v1

    .line 228
    :goto_0
    return-object v0

    .line 221
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_requests:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/ICallback;

    .line 223
    if-nez v0, :cond_1

    .line 224
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v2, p0, Lcom/adobe/primetime/core/radio/Channel;->_logTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#request > No request handler for: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    monitor-exit p0

    move-object v0, v1

    goto :goto_0

    .line 228
    :cond_1
    invoke-interface {v0, p2}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    monitor-exit p0

    goto :goto_0

    .line 229
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public shutdown()V
    .locals 3

    .prologue
    .line 91
    monitor-enter p0

    .line 92
    :try_start_0
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_isShutDown:Z

    if-eqz v0, :cond_0

    .line 93
    monitor-exit p0

    .line 106
    :goto_0
    return-void

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v1, p0, Lcom/adobe/primetime/core/radio/Channel;->_logTag:Ljava/lang/String;

    const-string v2, " #shutdown > Shutting down"

    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/primetime/core/radio/Channel;->off(Ljava/lang/String;Lcom/adobe/primetime/core/ICallback;Ljava/lang/Object;)V

    .line 101
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_requests:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 102
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_commands:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 104
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_isShutDown:Z

    .line 105
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<channel: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/core/radio/Channel;->_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trigger(Lcom/adobe/primetime/core/Event;)V
    .locals 4

    .prologue
    .line 157
    monitor-enter p0

    .line 159
    :try_start_0
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_isShutDown:Z

    if-eqz v0, :cond_0

    monitor-exit p0

    .line 172
    :goto_0
    return-void

    .line 161
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/Channel;->_listeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 162
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 163
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 165
    invoke-virtual {p1}, Lcom/adobe/primetime/core/Event;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/adobe/primetime/core/radio/Channel;->_matchWildcard(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 166
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/radio/Channel$EventHandler;

    .line 167
    invoke-virtual {v0}, Lcom/adobe/primetime/core/radio/Channel$EventHandler;->getCallback()Lcom/adobe/primetime/core/ICallback;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 171
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method
