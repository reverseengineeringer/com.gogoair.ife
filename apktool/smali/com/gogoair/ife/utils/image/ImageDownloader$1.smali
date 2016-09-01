.class Lcom/gogoair/ife/utils/image/ImageDownloader$1;
.super Ljava/util/LinkedHashMap;
.source "SourceFile"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/utils/image/ImageDownloader;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/utils/image/ImageDownloader;IFZ)V
    .locals 0

    .prologue
    .line 301
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$1;->this$0:Lcom/gogoair/ife/utils/image/ImageDownloader;

    invoke-direct {p0, p2, p3, p4}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    return-void
.end method


# virtual methods
.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .locals 4

    .prologue
    .line 309
    invoke-virtual {p0}, Lcom/gogoair/ife/utils/image/ImageDownloader$1;->size()I

    move-result v0

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 311
    # getter for: Lcom/gogoair/ife/utils/image/ImageDownloader;->sSoftBitmapCache:Ljava/util/concurrent/ConcurrentHashMap;
    invoke-static {}, Lcom/gogoair/ife/utils/image/ImageDownloader;->access$500()Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    new-instance v2, Ljava/lang/ref/SoftReference;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    const/4 v0, 0x1

    .line 314
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
