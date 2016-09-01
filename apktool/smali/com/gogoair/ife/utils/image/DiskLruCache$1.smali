.class Lcom/gogoair/ife/utils/image/DiskLruCache$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/utils/image/DiskLruCache;)V
    .locals 0

    .prologue
    .line 169
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$1;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 169
    invoke-virtual {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache$1;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 171
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$1;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    monitor-enter v1

    .line 172
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$1;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$000(Lcom/gogoair/ife/utils/image/DiskLruCache;)Ljava/io/Writer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 173
    monitor-exit v1

    .line 181
    :goto_0
    return-object v3

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$1;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache;->trimToSize()V
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$100(Lcom/gogoair/ife/utils/image/DiskLruCache;)V

    .line 176
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$1;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache;->journalRebuildRequired()Z
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$200(Lcom/gogoair/ife/utils/image/DiskLruCache;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 177
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$1;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache;->rebuildJournal()V
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$300(Lcom/gogoair/ife/utils/image/DiskLruCache;)V

    .line 178
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$1;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    const/4 v2, 0x0

    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache;->redundantOpCount:I
    invoke-static {v0, v2}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$402(Lcom/gogoair/ife/utils/image/DiskLruCache;I)I

    .line 180
    :cond_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
