.class public final Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/image/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Editor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;
    }
.end annotation


# instance fields
.field private committed:Z

.field private final entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

.field private hasErrors:Z

.field final synthetic this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

.field private final written:[Z


# direct methods
.method private constructor <init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)V
    .locals 1

    .prologue
    .line 709
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 710
    iput-object p2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    .line 711
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->readable:Z
    invoke-static {p2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$600(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->written:[Z

    .line 712
    return-void

    .line 711
    :cond_0
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I
    invoke-static {p1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$1800(Lcom/gogoair/ife/utils/image/DiskLruCache;)I

    move-result v0

    new-array v0, v0, [Z

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Lcom/gogoair/ife/utils/image/DiskLruCache$1;)V
    .locals 0

    .prologue
    .line 703
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;
    .locals 1

    .prologue
    .line 703
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)[Z
    .locals 1

    .prologue
    .line 703
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->written:[Z

    return-object v0
.end method

.method static synthetic access$2402(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)Z
    .locals 0

    .prologue
    .line 703
    iput-boolean p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->hasErrors:Z

    return p1
.end method


# virtual methods
.method public abort()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 808
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    const/4 v1, 0x0

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache;->completeEdit(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$2200(Lcom/gogoair/ife/utils/image/DiskLruCache;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)V

    .line 809
    return-void
.end method

.method public abortUnlessCommitted()V
    .locals 1

    .prologue
    .line 812
    iget-boolean v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->committed:Z

    if-nez v0, :cond_0

    .line 814
    :try_start_0
    invoke-virtual {p0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->abort()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 818
    :cond_0
    :goto_0
    return-void

    .line 815
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public commit()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 794
    iget-boolean v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->hasErrors:Z

    if-eqz v0, :cond_0

    .line 795
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    const/4 v1, 0x0

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache;->completeEdit(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$2200(Lcom/gogoair/ife/utils/image/DiskLruCache;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)V

    .line 796
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->key:Ljava/lang/String;
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$1100(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache;->remove(Ljava/lang/String;)Z
    invoke-static {v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$2300(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;)Z

    .line 800
    :goto_0
    iput-boolean v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->committed:Z

    .line 801
    return-void

    .line 798
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache;->completeEdit(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)V
    invoke-static {v0, p0, v2}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$2200(Lcom/gogoair/ife/utils/image/DiskLruCache;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)V

    goto :goto_0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 739
    invoke-virtual {p0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->newInputStream(I)Ljava/io/InputStream;

    move-result-object v0

    .line 740
    if-eqz v0, :cond_0

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$1700(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public newInputStream(I)Ljava/io/InputStream;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 719
    iget-object v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    monitor-enter v2

    .line 720
    :try_start_0
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$700(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v1

    if-eq v1, p0, :cond_0

    .line 721
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 731
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 723
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->readable:Z
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$600(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 724
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 729
    :goto_0
    return-object v0

    .line 727
    :cond_1
    :try_start_2
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    invoke-virtual {v3, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    monitor-exit v2

    move-object v0, v1

    goto :goto_0

    .line 728
    :catch_0
    move-exception v1

    .line 729
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method public newOutputStream(I)Ljava/io/OutputStream;
    .locals 4

    .prologue
    .line 751
    iget-object v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    monitor-enter v2

    .line 752
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$700(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 753
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 773
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 755
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->readable:Z
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->access$600(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 756
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->written:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p1

    .line 758
    :cond_1
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->entry:Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;

    invoke-virtual {v0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 761
    :try_start_2
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v1, v0

    .line 772
    :goto_0
    :try_start_3
    new-instance v0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v1, v3}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Ljava/io/OutputStream;Lcom/gogoair/ife/utils/image/DiskLruCache$1;)V

    monitor-exit v2

    :goto_1
    return-object v0

    .line 762
    :catch_0
    move-exception v0

    .line 764
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache;->directory:Ljava/io/File;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$1900(Lcom/gogoair/ife/utils/image/DiskLruCache;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 766
    :try_start_4
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object v1, v0

    .line 770
    goto :goto_0

    .line 767
    :catch_1
    move-exception v0

    .line 769
    :try_start_5
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache;->NULL_OUTPUT_STREAM:Ljava/io/OutputStream;
    invoke-static {}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$2000()Ljava/io/OutputStream;

    move-result-object v0

    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1
.end method

.method public set(ILjava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 780
    const/4 v2, 0x0

    .line 782
    :try_start_0
    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-virtual {p0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v0

    sget-object v3, Lcom/gogoair/ife/utils/image/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v0, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 783
    :try_start_1
    invoke-virtual {v1, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 785
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/IoUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 787
    return-void

    .line 785
    :catchall_0
    move-exception v0

    move-object v1, v2

    :goto_0
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/IoUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_0
.end method
