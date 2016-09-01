.class Lcom/gogoair/ife/utils/image/ImageDownloader$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$0:Lcom/gogoair/ife/utils/image/ImageDownloader;


# direct methods
.method constructor <init>(Lcom/gogoair/ife/utils/image/ImageDownloader;)V
    .locals 0

    .prologue
    .line 324
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$2;->this$0:Lcom/gogoair/ife/utils/image/ImageDownloader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 326
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$2;->this$0:Lcom/gogoair/ife/utils/image/ImageDownloader;

    # invokes: Lcom/gogoair/ife/utils/image/ImageDownloader;->clearCache()V
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/ImageDownloader;->access$600(Lcom/gogoair/ife/utils/image/ImageDownloader;)V

    .line 327
    return-void
.end method
