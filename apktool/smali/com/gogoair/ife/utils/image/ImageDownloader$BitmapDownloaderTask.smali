.class Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/image/ImageDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BitmapDownloaderTask"
.end annotation


# instance fields
.field private final imageViewReference:Ljava/lang/ref/WeakReference;

.field final synthetic this$0:Lcom/gogoair/ife/utils/image/ImageDownloader;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/gogoair/ife/utils/image/ImageDownloader;Landroid/widget/ImageView;)V
    .locals 1

    .prologue
    .line 225
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->this$0:Lcom/gogoair/ife/utils/image/ImageDownloader;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 226
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    .line 227
    return-void
.end method

.method static synthetic access$000(Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->url:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2

    .prologue
    .line 234
    const/4 v0, 0x0

    aget-object v0, p1, v0

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->url:Ljava/lang/String;

    .line 235
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->this$0:Lcom/gogoair/ife/utils/image/ImageDownloader;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->url:Ljava/lang/String;

    # invokes: Lcom/gogoair/ife/utils/image/ImageDownloader;->downloadBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    invoke-static {v0, v1}, Lcom/gogoair/ife/utils/image/ImageDownloader;->access$100(Lcom/gogoair/ife/utils/image/ImageDownloader;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 221
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->doInBackground([Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 3

    .prologue
    .line 243
    invoke-virtual {p0}, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 244
    const/4 p1, 0x0

    .line 247
    :cond_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->this$0:Lcom/gogoair/ife/utils/image/ImageDownloader;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->url:Ljava/lang/String;

    # invokes: Lcom/gogoair/ife/utils/image/ImageDownloader;->addBitmapToCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    invoke-static {v0, v1, p1}, Lcom/gogoair/ife/utils/image/ImageDownloader;->access$200(Lcom/gogoair/ife/utils/image/ImageDownloader;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 249
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->imageViewReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 250
    # invokes: Lcom/gogoair/ife/utils/image/ImageDownloader;->getBitmapDownloaderTask(Landroid/widget/ImageView;)Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;
    invoke-static {v0}, Lcom/gogoair/ife/utils/image/ImageDownloader;->access$300(Landroid/widget/ImageView;)Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;

    move-result-object v1

    .line 253
    if-eq p0, v1, :cond_1

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->this$0:Lcom/gogoair/ife/utils/image/ImageDownloader;

    # getter for: Lcom/gogoair/ife/utils/image/ImageDownloader;->mode:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/ImageDownloader;->access$400(Lcom/gogoair/ife/utils/image/ImageDownloader;)Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    move-result-object v1

    sget-object v2, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->CORRECT:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    if-eq v1, v2, :cond_2

    .line 254
    :cond_1
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 256
    :cond_2
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 221
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
