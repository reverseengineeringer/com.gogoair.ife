.class final Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/image/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Entry"
.end annotation


# instance fields
.field private currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private readable:Z

.field private sequenceNumber:J

.field final synthetic this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;


# direct methods
.method private constructor <init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 874
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 875
    iput-object p2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->key:Ljava/lang/String;

    .line 876
    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I
    invoke-static {p1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$1800(Lcom/gogoair/ife/utils/image/DiskLruCache;)I

    move-result v0

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->lengths:[J

    .line 877
    return-void
.end method

.method synthetic constructor <init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;Lcom/gogoair/ife/utils/image/DiskLruCache$1;)V
    .locals 0

    .prologue
    .line 859
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;-><init>(Lcom/gogoair/ife/utils/image/DiskLruCache;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)[J
    .locals 1

    .prologue
    .line 859
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->lengths:[J

    return-object v0
.end method

.method static synthetic access$1100(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 859
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->key:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)J
    .locals 2

    .prologue
    .line 859
    iget-wide v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->sequenceNumber:J

    return-wide v0
.end method

.method static synthetic access$1202(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;J)J
    .locals 1

    .prologue
    .line 859
    iput-wide p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->sequenceNumber:J

    return-wide p1
.end method

.method static synthetic access$600(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Z
    .locals 1

    .prologue
    .line 859
    iget-boolean v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->readable:Z

    return v0
.end method

.method static synthetic access$602(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Z)Z
    .locals 0

    .prologue
    .line 859
    iput-boolean p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->readable:Z

    return p1
.end method

.method static synthetic access$700(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    .locals 1

    .prologue
    .line 859
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    return-object v0
.end method

.method static synthetic access$702(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;
    .locals 0

    .prologue
    .line 859
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->currentEditor:Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    return-object p1
.end method

.method static synthetic access$800(Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;[Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 859
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->setLengths([Ljava/lang/String;)V

    return-void
.end method

.method private invalidLengths([Ljava/lang/String;)Ljava/io/IOException;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 905
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unexpected journal line: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setLengths([Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 891
    array-length v0, p1

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache;->valueCount:I
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$1800(Lcom/gogoair/ife/utils/image/DiskLruCache;)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 892
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->invalidLengths([Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 896
    :cond_0
    const/4 v0, 0x0

    :goto_0
    :try_start_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 897
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->lengths:[J

    aget-object v2, p1, v0

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    aput-wide v2, v1, v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 896
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 899
    :catch_0
    move-exception v0

    .line 900
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->invalidLengths([Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 902
    :cond_1
    return-void
.end method


# virtual methods
.method public getCleanFile(I)Ljava/io/File;
    .locals 4

    .prologue
    .line 909
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache;->directory:Ljava/io/File;
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$1900(Lcom/gogoair/ife/utils/image/DiskLruCache;)Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getDirtyFile(I)Ljava/io/File;
    .locals 4

    .prologue
    .line 913
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->this$0:Lcom/gogoair/ife/utils/image/DiskLruCache;

    # getter for: Lcom/gogoair/ife/utils/image/DiskLruCache;->directory:Ljava/io/File;
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->access$1900(Lcom/gogoair/ife/utils/image/DiskLruCache;)Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".tmp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getLengths()Ljava/lang/String;
    .locals 7

    .prologue
    .line 880
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 881
    iget-object v2, p0, Lcom/gogoair/ife/utils/image/DiskLruCache$Entry;->lengths:[J

    array-length v3, v2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_0

    aget-wide v4, v2, v0

    .line 882
    const/16 v6, 0x20

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 881
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 884
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
