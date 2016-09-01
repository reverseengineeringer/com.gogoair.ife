.class public final Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/image/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Snapshot"
.end annotation


# instance fields
.field private final ins:[Ljava/io/InputStream;

.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private final sequenceNumber:J

.field final synthetic this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;


# direct methods
.method private constructor <init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;[J)V
    .locals 1

    .prologue
    .line 648
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 649
    iput-object p2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->key:Ljava/lang/String;

    .line 650
    iput-wide p3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->sequenceNumber:J

    .line 651
    iput-object p5, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->ins:[Ljava/io/InputStream;

    .line 652
    iput-object p6, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->lengths:[J

    .line 653
    return-void
.end method

.method synthetic constructor <init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;[JLcom/gogoair/ife/utils/image/DiskLruCache$1;)V
    .locals 1

    .prologue
    .line 642
    invoke-direct/range {p0 .. p6}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;J[Ljava/io/InputStream;[J)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 4

    .prologue
    .line 686
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->ins:[Ljava/io/InputStream;

    array-length v2, v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    .line 687
    invoke-static {v3}, Lcom/gogoair/ife/utils/image/IoUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 686
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 689
    :cond_0
    return-void
.end method

.method public edit()Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 661
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->key:Ljava/lang/String;

    iget-wide v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->sequenceNumber:J

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache;->edit(Ljava/lang/String;J)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    invoke-static {v0, v1, v2, v3}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$1600(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;J)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream(I)Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 668
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->ins:[Ljava/io/InputStream;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getLength(I)J
    .locals 2

    .prologue
    .line 682
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->lengths:[J

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 675
    invoke-virtual {p0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->getInputStream(I)Ljava/io/InputStream;

    move-result-object v0

    # invokes: Lcom/gogoair/ife/utils/image/DiskLruCache;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$1700(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
