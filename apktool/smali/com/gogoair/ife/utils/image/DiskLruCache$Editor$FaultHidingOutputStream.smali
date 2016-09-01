.class Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;
.super Ljava/io/FilterOutputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FaultHidingOutputStream"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;


# direct methods
.method private constructor <init>(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Ljava/io/OutputStream;)V
    .locals 0

    .prologue
    .line 821
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;->this$1:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    .line 822
    invoke-direct {p0, p2}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 823
    return-void
.end method

.method synthetic constructor <init>(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Ljava/io/OutputStream;Lcom/gogoair/ife/utils/image/DiskLruCache$1;)V
    .locals 0

    .prologue
    .line 820
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Ljava/io/OutputStream;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 843
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 847
    :goto_0
    return-void

    .line 844
    :catch_0
    move-exception v0

    .line 845
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;->this$1:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    const/4 v1, 0x1

    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->hasErrors:Z
    invoke-static {v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->access$2402(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)Z

    goto :goto_0
.end method

.method public flush()V
    .locals 2

    .prologue
    .line 851
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 855
    :goto_0
    return-void

    .line 852
    :catch_0
    move-exception v0

    .line 853
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;->this$1:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    const/4 v1, 0x1

    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->hasErrors:Z
    invoke-static {v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->access$2402(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)Z

    goto :goto_0
.end method

.method public write(I)V
    .locals 2

    .prologue
    .line 827
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 831
    :goto_0
    return-void

    .line 828
    :catch_0
    move-exception v0

    .line 829
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;->this$1:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    const/4 v1, 0x1

    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->hasErrors:Z
    invoke-static {v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->access$2402(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)Z

    goto :goto_0
.end method

.method public write([BII)V
    .locals 2
    .param p1    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 835
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 839
    :goto_0
    return-void

    .line 836
    :catch_0
    move-exception v0

    .line 837
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor$FaultHidingOutputStream;->this$1:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    const/4 v1, 0x1

    # setter for: Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->hasErrors:Z
    invoke-static {v0, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->access$2402(Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;Z)Z

    goto :goto_0
.end method
