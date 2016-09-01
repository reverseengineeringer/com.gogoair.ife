.class Lcom/gogoair/ife/utils/image/ImageDownloader$DownloadedDrawable;
.super Landroid/graphics/drawable/BitmapDrawable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/image/ImageDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DownloadedDrawable"
.end annotation


# instance fields
.field private final bitmapDownloaderTaskReference:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    .locals 1

    .prologue
    .line 271
    invoke-direct {p0, p2, p3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 272
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$DownloadedDrawable;->bitmapDownloaderTaskReference:Ljava/lang/ref/WeakReference;

    .line 274
    return-void
.end method


# virtual methods
.method public getBitmapDownloaderTask()Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;
    .locals 1

    .prologue
    .line 277
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$DownloadedDrawable;->bitmapDownloaderTaskReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;

    return-object v0
.end method
