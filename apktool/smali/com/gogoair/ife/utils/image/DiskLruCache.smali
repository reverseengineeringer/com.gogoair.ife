.class public final Lcom/gogoair/ife/utils/image/DiskLruCache;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;,
        Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;,
        Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;
    }
.end annotation


# static fields
.field private static final ANY_SEQUENCE_NUMBER:J = -0x1L

.field private static final CLEAN:Ljava/lang/String; = "CLEAN"

.field private static final DIRTY:Ljava/lang/String; = "DIRTY"

.field private static final JOURNAL_FILE:Ljava/lang/String; = "journal"

.field private static final JOURNAL_FILE_TMP:Ljava/lang/String; = "journal.tmp"

.field private static final LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

.field private static final MAGIC:Ljava/lang/String; = "libcore.io.DiskLruCache"

.field private static final NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

.field private static final READ:Ljava/lang/String; = "READ"

.field private static final REMOVE:Ljava/lang/String; = "REMOVE"

.field private static final VERSION_1:Ljava/lang/String; = "1"


# instance fields
.field private final appVersion:I

.field private final cleanupCallable:Ljava/util/concurrent/Callable;

.field private final directory:Ljava/io/File;

.field private final executorService:Ljava/util/concurrent/ThreadPoolExecutor;

.field private final journalFile:Ljava/io/File;

.field private final journalFileTmp:Ljava/io/File;

.field private journalWriter:Ljava/io/Writer;

.field private final lruEntries:Ljava/util/LinkedHashMap;

.field private maxSize:J

.field private nextSequenceNumber:J

.field private redundantOpCount:I

.field private size:J

.field private final valueCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 101
    const-string v0, "[a-z0-9_]{1,64}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/gogoair/ife/utils/image/DiskLruCache;->LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

    .line 692
    new-instance v0, Lcom/gogoair/ife/utils/image/DiskLruCache$2;

    invoke-direct {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$2;-><init>()V

    sput-object v0, Lcom/gogoair/ife/utils/image/DiskLruCache;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-void
.end method

.method private constructor <init>(Ljava/io/File;IIJ)V
    .locals 8

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    iput-wide v4, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->size:J

    .line 155
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {v0, v2, v1, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    .line 164
    iput-wide v4, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->nextSequenceNumber:J

    .line 167
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v4, 0x3c

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 169
    new-instance v0, Lcom/gogoair/ife/utils/image/DiskLruCache$1;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/utils/image/DiskLruCache$1;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache;)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    .line 186
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->directory:Ljava/io/File;

    .line 187
    iput p2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->appVersion:I

    .line 188
    new-instance v0, Ljava/io/File;

    const-string v1, "journal"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalFile:Ljava/io/File;

    .line 189
    new-instance v0, Ljava/io/File;

    const-string v1, "journal.tmp"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalFileTmp:Ljava/io/File;

    .line 190
    iput p3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    .line 191
    iput-wide p4, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->maxSize:J

    .line 192
    return-void
.end method

.method static synthetic access$000(Lcom/gogoair/ife/utils/image/DiskLruCache;)Ljava/io/Writer;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    return-object v0
.end method

.method static synthetic access$100(Lcom/gogoair/ife/utils/image/DiskLruCache;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->trimToSize()V

    return-void
.end method

.method static synthetic access$1600(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;J)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-direct {p0, p1, p2, p3}, Lcom/gogoair/ife/utils/image/DiskLruCache;->edit(Ljava/lang/String;J)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1700(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-static {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800(Lcom/gogoair/ife/utils/image/DiskLruCache;)I
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    return v0
.end method

.method static synthetic access$1900(Lcom/gogoair/ife/utils/image/DiskLruCache;)Ljava/io/File;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$200(Lcom/gogoair/ife/utils/image/DiskLruCache;)Z
    .locals 1

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalRebuildRequired()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2000()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 95
    sget-object v0, Lcom/gogoair/ife/utils/image/DiskLruCache;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/gogoair/ife/utils/image/DiskLruCache;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/utils/image/DiskLruCache;->completeEdit(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)V

    return-void
.end method

.method static synthetic access$2300(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->remove(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/gogoair/ife/utils/image/DiskLruCache;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->rebuildJournal()V

    return-void
.end method

.method static synthetic access$402(Lcom/gogoair/ife/utils/image/DiskLruCache;I)I
    .locals 0

    .prologue
    .line 95
    iput p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->redundantOpCount:I

    return p1
.end method

.method private checkNotClosed()V
    .locals 2

    .prologue
    .line 578
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    if-nez v0, :cond_0

    .line 579
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cache is closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 581
    :cond_0
    return-void
.end method

.method private declared-synchronized completeEdit(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 472
    monitor-enter p0

    :try_start_0
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;
    invoke-static {p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->access$1400(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    move-result-object v2

    .line 473
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$700(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v1

    if-eq v1, p1, :cond_0

    .line 474
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 472
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 478
    :cond_0
    if-eqz p2, :cond_4

    :try_start_1
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$600(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Z

    move-result v1

    if-nez v1, :cond_4

    move v1, v0

    .line 479
    :goto_0
    iget v3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    if-ge v1, v3, :cond_4

    .line 480
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->written:[Z
    invoke-static {p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->access$1500(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)[Z

    move-result-object v3

    aget-boolean v3, v3, v1

    if-nez v3, :cond_1

    .line 481
    invoke-virtual {p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->abort()V

    .line 482
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Newly created entry didn\'t create value for index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 484
    :cond_1
    invoke-virtual {v2, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_3

    .line 485
    invoke-virtual {p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->abort()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 523
    :cond_2
    :goto_1
    monitor-exit p0

    return-void

    .line 479
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 491
    :cond_4
    :goto_2
    :try_start_2
    iget v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    if-ge v0, v1, :cond_7

    .line 492
    invoke-virtual {v2, v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v1

    .line 493
    if-eqz p2, :cond_6

    .line 494
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 495
    invoke-virtual {v2, v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v3

    .line 496
    invoke-virtual {v1, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 497
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->lengths:[J
    invoke-static {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1000(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)[J

    move-result-object v1

    aget-wide v4, v1, v0

    .line 498
    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v6

    .line 499
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->lengths:[J
    invoke-static {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1000(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)[J

    move-result-object v1

    aput-wide v6, v1, v0

    .line 500
    iget-wide v8, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->size:J

    sub-long v4, v8, v4

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->size:J

    .line 491
    :cond_5
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 503
    :cond_6
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    goto :goto_3

    .line 507
    :cond_7
    iget v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->redundantOpCount:I

    .line 508
    const/4 v0, 0x0

    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v2, v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$702(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    .line 509
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->readable:Z
    invoke-static {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$600(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Z

    move-result v0

    or-int/2addr v0, p2

    if-eqz v0, :cond_a

    .line 510
    const/4 v0, 0x1

    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->readable:Z
    invoke-static {v2, v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$602(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Z)Z

    .line 511
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CLEAN "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1100(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getLengths()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v3, 0xa

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 512
    if-eqz p2, :cond_8

    .line 513
    iget-wide v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->nextSequenceNumber:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v0

    iput-wide v4, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->nextSequenceNumber:J

    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v2, v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1202(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;J)J

    .line 520
    :cond_8
    :goto_4
    iget-wide v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->size:J

    iget-wide v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->maxSize:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_9

    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalRebuildRequired()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 521
    :cond_9
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    goto/16 :goto_1

    .line 516
    :cond_a
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1100(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 517
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "REMOVE "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1100(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_4
.end method

.method private static deleteIfExists(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 360
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 361
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0

    .line 363
    :cond_0
    return-void
.end method

.method private declared-synchronized edit(Ljava/lang/String;J)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 415
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->checkNotClosed()V

    .line 416
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 417
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    .line 418
    const-wide/16 v2, -0x1

    cmp-long v2, p2, v2

    if-eqz v2, :cond_1

    if-eqz v0, :cond_0

    .line 419
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1200(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    cmp-long v2, v2, p2

    if-eqz v2, :cond_1

    :cond_0
    move-object v0, v1

    .line 435
    :goto_0
    monitor-exit p0

    return-object v0

    .line 422
    :cond_1
    if-nez v0, :cond_2

    .line 423
    :try_start_1
    new-instance v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;Lcom/gogoair/ife/utils/image/DiskLruCache$1;)V

    .line 424
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 429
    :goto_1
    new-instance v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Lcom/gogoair/ife/utils/image/DiskLruCache$1;)V

    .line 430
    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v1, v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$702(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    .line 433
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DIRTY "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 434
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 415
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 425
    :cond_2
    :try_start_2
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$700(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    if-eqz v2, :cond_3

    move-object v0, v1

    .line 426
    goto :goto_0

    :cond_3
    move-object v1, v0

    goto :goto_1
.end method

.method private static inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 635
    new-instance v0, Ljava/io/InputStreamReader;

    sget-object v1, Lcom/gogoair/ife/utils/image/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-static {v0}, Lcom/gogoair/ife/utils/image/Streams;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private journalRebuildRequired()Z
    .locals 2

    .prologue
    .line 530
    .line 531
    iget v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->redundantOpCount:I

    const/16 v1, 0x7d0

    if-lt v0, v1, :cond_0

    iget v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->redundantOpCount:I

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    .line 532
    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static open(Ljava/io/File;IIJ)Lcom/gogoair/ife/utils/image/DiskLruCache;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 206
    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-gtz v0, :cond_0

    .line 207
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxSize <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_0
    if-gtz p2, :cond_1

    .line 210
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "valueCount <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_1
    new-instance v0, Lcom/gogoair/ife/utils/image/DiskLruCache;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/gogoair/ife/utils/image/DiskLruCache;-><init>(Ljava/io/File;IIJ)V

    .line 215
    iget-object v1, v0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 217
    :try_start_0
    invoke-direct {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->readJournal()V

    .line 218
    invoke-direct {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->processJournal()V

    .line 219
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/FileWriter;

    iget-object v3, v0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalFile:Ljava/io/File;

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v1, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v1, v0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    :goto_0
    return-object v0

    .line 221
    :catch_0
    move-exception v1

    .line 222
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DiskLruCache "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is corrupt: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 223
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", removing"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 222
    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 224
    invoke-virtual {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->delete()V

    .line 229
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 230
    new-instance v0, Lcom/gogoair/ife/utils/image/DiskLruCache;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/gogoair/ife/utils/image/DiskLruCache;-><init>(Ljava/io/File;IIJ)V

    .line 231
    invoke-direct {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->rebuildJournal()V

    goto :goto_0
.end method

.method private processJournal()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 301
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalFileTmp:Ljava/io/File;

    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 302
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 303
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    .line 304
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$700(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v1

    if-nez v1, :cond_1

    move v1, v2

    .line 305
    :goto_1
    iget v4, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    if-ge v1, v4, :cond_0

    .line 306
    iget-wide v4, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->size:J

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1000(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)[J

    move-result-object v6

    aget-wide v6, v6, v1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->size:J

    .line 305
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 309
    :cond_1
    const/4 v1, 0x0

    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$702(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move v1, v2

    .line 310
    :goto_2
    iget v4, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    if-ge v1, v4, :cond_2

    .line 311
    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lcom/gogoair/ife/utils/image/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 312
    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lcom/gogoair/ife/utils/image/DiskLruCache;->deleteIfExists(Ljava/io/File;)V

    .line 310
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 314
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 317
    :cond_3
    return-void
.end method

.method private readJournal()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    new-instance v1, Lcom/gogoair/ife/utils/image/StrictLineReader;

    new-instance v0, Ljava/io/FileInputStream;

    iget-object v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    sget-object v2, Lcom/gogoair/ife/utils/image/Charsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v1, v0, v2}, Lcom/gogoair/ife/utils/image/StrictLineReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 239
    :try_start_0
    invoke-virtual {v1}, Lcom/gogoair/ife/utils/image/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 240
    invoke-virtual {v1}, Lcom/gogoair/ife/utils/image/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 241
    invoke-virtual {v1}, Lcom/gogoair/ife/utils/image/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 242
    invoke-virtual {v1}, Lcom/gogoair/ife/utils/image/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 243
    invoke-virtual {v1}, Lcom/gogoair/ife/utils/image/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .line 244
    const-string v6, "libcore.io.DiskLruCache"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "1"

    .line 245
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget v6, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->appVersion:I

    .line 246
    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget v3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    .line 247
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, ""

    .line 248
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 249
    :cond_0
    new-instance v3, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "unexpected journal header: ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, ", "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 261
    :catchall_0
    move-exception v0

    invoke-static {v1}, Lcom/gogoair/ife/utils/image/IoUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v0

    .line 255
    :cond_1
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Lcom/gogoair/ife/utils/image/StrictLineReader;->readLine()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->readJournalLine(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 256
    :catch_0
    move-exception v0

    .line 261
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/IoUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 263
    return-void
.end method

.method private readJournalLine(Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x2

    .line 266
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 267
    array-length v0, v2

    if-ge v0, v4, :cond_0

    .line 268
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected journal line: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 271
    :cond_0
    aget-object v1, v2, v7

    .line 272
    aget-object v0, v2, v5

    const-string v3, "REMOVE"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    array-length v0, v2

    if-ne v0, v4, :cond_2

    .line 273
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    :cond_1
    :goto_0
    return-void

    .line 277
    :cond_2
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    .line 278
    if-nez v0, :cond_6

    .line 279
    new-instance v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    invoke-direct {v0, p0, v1, v6}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;Lcom/gogoair/ife/utils/image/DiskLruCache$1;)V

    .line 280
    iget-object v3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 283
    :goto_1
    aget-object v0, v2, v5

    const-string v3, "CLEAN"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    array-length v0, v2

    iget v3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    add-int/lit8 v3, v3, 0x2

    if-ne v0, v3, :cond_3

    .line 284
    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->readable:Z
    invoke-static {v1, v7}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$602(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Z)Z

    .line 285
    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v1, v6}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$702(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    .line 286
    array-length v0, v2

    invoke-static {v2, v4, v0}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->setLengths([Ljava/lang/String;)V
    invoke-static {v1, v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$800(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;[Ljava/lang/String;)V

    goto :goto_0

    .line 287
    :cond_3
    aget-object v0, v2, v5

    const-string v3, "DIRTY"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    array-length v0, v2

    if-ne v0, v4, :cond_4

    .line 288
    new-instance v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    invoke-direct {v0, p0, v1, v6}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Lcom/gogoair/ife/utils/image/DiskLruCache$1;)V

    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v1, v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$702(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    goto :goto_0

    .line 289
    :cond_4
    aget-object v0, v2, v5

    const-string v1, "READ"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    array-length v0, v2

    if-eq v0, v4, :cond_1

    .line 292
    :cond_5
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected journal line: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    move-object v1, v0

    goto :goto_1
.end method

.method private declared-synchronized rebuildJournal()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    if-eqz v0, :cond_0

    .line 325
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    .line 328
    :cond_0
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v0, Ljava/io/FileWriter;

    iget-object v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalFileTmp:Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 329
    const-string v0, "libcore.io.DiskLruCache"

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 330
    const-string v0, "\n"

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 331
    const-string v0, "1"

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 332
    const-string v0, "\n"

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 333
    iget v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->appVersion:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 334
    const-string v0, "\n"

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 335
    iget v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 336
    const-string v0, "\n"

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 337
    const-string v0, "\n"

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 339
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    .line 340
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$700(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 341
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DIRTY "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1100(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 324
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 343
    :cond_1
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CLEAN "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1100(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getLengths()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 347
    :cond_2
    invoke-virtual {v1}, Ljava/io/Writer;->close()V

    .line 348
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalFileTmp:Ljava/io/File;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalFile:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 349
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v1, Ljava/io/FileWriter;

    iget-object v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalFile:Ljava/io/File;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 350
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized remove(Ljava/lang/String;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 542
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->checkNotClosed()V

    .line 543
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 544
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    .line 545
    if-eqz v0, :cond_0

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$700(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    if-eqz v2, :cond_2

    :cond_0
    move v0, v1

    .line 567
    :goto_0
    monitor-exit p0

    return v0

    .line 554
    :cond_1
    :try_start_1
    iget-wide v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->size:J

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1000(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)[J

    move-result-object v4

    aget-wide v4, v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->size:J

    .line 555
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1000(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)[J

    move-result-object v2

    const-wide/16 v4, 0x0

    aput-wide v4, v2, v1

    .line 549
    add-int/lit8 v1, v1, 0x1

    :cond_2
    iget v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    if-ge v1, v2, :cond_3

    .line 550
    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v2

    .line 551
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_1

    .line 552
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "failed to delete "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 542
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 558
    :cond_3
    :try_start_2
    iget v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->redundantOpCount:I

    .line 559
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "REMOVE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 560
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v0

    const-string v1, "DISKCACHE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "REMOVE 2! LRUEntries is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/GVLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 561
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 563
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalRebuildRequired()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 564
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 567
    :cond_4
    const/4 v0, 0x1

    goto/16 :goto_0
.end method

.method private trimToSize()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 610
    :goto_0
    iget-wide v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->size:J

    iget-wide v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->maxSize:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 611
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 612
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->remove(Ljava/lang/String;)Z

    goto :goto_0

    .line 614
    :cond_0
    return-void
.end method

.method private validateKey(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 627
    sget-object v0, Lcom/gogoair/ife/utils/image/DiskLruCache;->LEGAL_KEY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 628
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-nez v0, :cond_0

    .line 629
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "keys must match regex [a-z0-9_]{1,64}: \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 632
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 596
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 607
    :goto_0
    monitor-exit p0

    return-void

    .line 599
    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    .line 600
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$700(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 601
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$700(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->abort()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 596
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 604
    :cond_2
    :try_start_2
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->trimToSize()V

    .line 605
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    .line 606
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public delete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 622
    invoke-virtual {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->close()V

    .line 623
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->directory:Ljava/io/File;

    invoke-static {v0}, Lcom/gogoair/ife/utils/image/IoUtils;->deleteContents(Ljava/io/File;)V

    .line 624
    return-void
.end method

.method public edit(Ljava/lang/String;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 411
    const-wide/16 v0, -0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->edit(Ljava/lang/String;J)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 587
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->checkNotClosed()V

    .line 588
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->trimToSize()V

    .line 589
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 590
    monitor-exit p0

    return-void

    .line 587
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/String;)Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 371
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->checkNotClosed()V

    .line 372
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->validateKey(Ljava/lang/String;)V

    .line 373
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 374
    if-nez v0, :cond_1

    .line 403
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v1

    .line 378
    :cond_1
    :try_start_1
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->readable:Z
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$600(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 387
    iget v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    new-array v6, v2, [Ljava/io/InputStream;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 389
    const/4 v2, 0x0

    :goto_1
    :try_start_2
    iget v3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I

    if-ge v2, v3, :cond_2

    .line 390
    new-instance v3, Ljava/io/FileInputStream;

    invoke-virtual {v0, v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    aput-object v3, v6, v2
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 389
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 397
    :cond_2
    :try_start_3
    iget v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->redundantOpCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->redundantOpCount:I

    .line 398
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "READ "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 399
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalRebuildRequired()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 400
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 403
    :cond_3
    new-instance v1, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->sequenceNumber:J
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1200(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)J

    move-result-wide v4

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->lengths:[J
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1000(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)[J

    move-result-object v7

    const/4 v8, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v8}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;[JLcom/gogoair/ife/utils/image/DiskLruCache$1;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 371
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 392
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public getDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 442
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->directory:Ljava/io/File;

    return-object v0
.end method

.method public getMaxSize()J
    .locals 2

    .prologue
    .line 450
    iget-wide v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->maxSize:J

    return-wide v0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 574
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->journalWriter:Ljava/io/Writer;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized setMaxSize(J)V
    .locals 3

    .prologue
    .line 458
    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->maxSize:J

    .line 459
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->executorService:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->cleanupCallable:Ljava/util/concurrent/Callable;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 460
    monitor-exit p0

    return-void

    .line 458
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()J
    .locals 2

    .prologue
    .line 468
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache;->size:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
