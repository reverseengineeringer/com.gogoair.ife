.class public Lcom/adobe/primetime/core/radio/CommandQueue;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final _delay:J

.field private _drainInProgress:Z

.field private final _executorService:Ljava/util/concurrent/ExecutorService;

.field private _isSuspended:Z

.field private _queue:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 38
    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/adobe/primetime/core/radio/CommandQueue;-><init>(JZ)V

    .line 39
    return-void
.end method

.method public constructor <init>(JZ)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-boolean v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_isSuspended:Z

    .line 34
    iput-boolean v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_drainInProgress:Z

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_queue:Ljava/util/List;

    .line 47
    iput-wide p1, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_delay:J

    .line 48
    iput-boolean p3, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_isSuspended:Z

    .line 50
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_executorService:Ljava/util/concurrent/ExecutorService;

    .line 51
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2

    .prologue
    .line 42
    const-wide/16 v0, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/adobe/primetime/core/radio/CommandQueue;-><init>(JZ)V

    .line 43
    return-void
.end method

.method private __drain()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 98
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 99
    iput-boolean v2, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_drainInProgress:Z

    .line 114
    :goto_0
    return-void

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_queue:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/primetime/core/radio/Command;

    .line 102
    iget-object v1, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_queue:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 104
    new-instance v1, Lcom/adobe/primetime/core/radio/CommandQueue$1;

    invoke-direct {v1, p0}, Lcom/adobe/primetime/core/radio/CommandQueue$1;-><init>(Lcom/adobe/primetime/core/radio/CommandQueue;)V

    invoke-direct {p0, v0, v1}, Lcom/adobe/primetime/core/radio/CommandQueue;->_runCommand(Lcom/adobe/primetime/core/radio/Command;Lcom/adobe/primetime/core/ICallback;)V

    goto :goto_0
.end method

.method private _drain()V
    .locals 1

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_isSuspended:Z

    if-eqz v0, :cond_1

    .line 94
    :cond_0
    :goto_0
    return-void

    .line 90
    :cond_1
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_drainInProgress:Z

    if-nez v0, :cond_0

    .line 91
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_drainInProgress:Z

    .line 93
    invoke-direct {p0}, Lcom/adobe/primetime/core/radio/CommandQueue;->__drain()V

    goto :goto_0
.end method

.method private declared-synchronized _runCommand(Lcom/adobe/primetime/core/radio/Command;Lcom/adobe/primetime/core/ICallback;)V
    .locals 4

    .prologue
    .line 117
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_delay:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_executorService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/adobe/primetime/core/radio/CommandQueue$2;

    invoke-direct {v1, p0}, Lcom/adobe/primetime/core/radio/CommandQueue$2;-><init>(Lcom/adobe/primetime/core/radio/CommandQueue;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 132
    if-eqz p2, :cond_1

    .line 133
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lcom/adobe/primetime/core/ICallback;->call(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    :cond_1
    monitor-exit p0

    return-void

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic access$000(Lcom/adobe/primetime/core/radio/CommandQueue;)Z
    .locals 1

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_isSuspended:Z

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/primetime/core/radio/CommandQueue;)V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/adobe/primetime/core/radio/CommandQueue;->__drain()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/primetime/core/radio/CommandQueue;)J
    .locals 2

    .prologue
    .line 29
    iget-wide v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_delay:J

    return-wide v0
.end method


# virtual methods
.method public declared-synchronized addCommand(Lcom/adobe/primetime/core/radio/Command;)V
    .locals 1

    .prologue
    .line 54
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_queue:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    invoke-direct {p0}, Lcom/adobe/primetime/core/radio/CommandQueue;->_drain()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    monitor-exit p0

    return-void

    .line 54
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized cancelAllCommands()V
    .locals 1

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 60
    invoke-virtual {p0}, Lcom/adobe/primetime/core/radio/CommandQueue;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    monitor-exit p0

    return-void

    .line 59
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized destroy()V
    .locals 1

    .prologue
    .line 81
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    monitor-exit p0

    return-void

    .line 81
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isEmpty()Z
    .locals 1

    .prologue
    .line 64
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_queue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isSuspended()Z
    .locals 1

    .prologue
    .line 72
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_isSuspended:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized resume()V
    .locals 1

    .prologue
    .line 76
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_isSuspended:Z

    .line 77
    invoke-direct {p0}, Lcom/adobe/primetime/core/radio/CommandQueue;->_drain()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    monitor-exit p0

    return-void

    .line 76
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized suspend()V
    .locals 1

    .prologue
    .line 68
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/adobe/primetime/core/radio/CommandQueue;->_isSuspended:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    monitor-exit p0

    return-void

    .line 68
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
