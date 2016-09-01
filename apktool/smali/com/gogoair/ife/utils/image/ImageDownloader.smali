.class public Lcom/gogoair/ife/utils/image/ImageDownloader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/utils/image/ImageDownloader$DownloadedDrawable;,
        Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;,
        Lcom/gogoair/ife/utils/image/ImageDownloader$FlushedInputStream;,
        Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;
    }
.end annotation


# static fields
.field private static final DELAY_BEFORE_PURGE:I = 0x2710

.field private static final HARD_CACHE_CAPACITY:I = 0xa

.field private static final LOG_TAG:Ljava/lang/String; = "ImageDownloader"

.field private static final sSoftBitmapCache:Ljava/util/concurrent/ConcurrentHashMap;


# instance fields
.field private final context:Landroid/content/Context;

.field private final diskCache:Lcom/gogoair/ife/utils/image/DiskLruImageCache;

.field private final imageHolder:Landroid/graphics/Bitmap;

.field private mode:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

.field private final purgeHandler:Landroid/os/Handler;

.field private final purger:Ljava/lang/Runnable;

.field private final sHardBitmapCache:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 319
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    sput-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sSoftBitmapCache:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V
    .locals 6

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    sget-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->NO_ASYNC_TASK:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->mode:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    .line 300
    new-instance v0, Lcom/gogoair/ife/utils/image/ImageDownloader$1;

    const/4 v1, 0x5

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/gogoair/ife/utils/image/ImageDownloader$1;-><init>(Lcom/gogoair/ife/utils/image/ImageDownloader;IFZ)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sHardBitmapCache:Ljava/util/HashMap;

    .line 322
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->purgeHandler:Landroid/os/Handler;

    .line 324
    new-instance v0, Lcom/gogoair/ife/utils/image/ImageDownloader$2;

    invoke-direct {v0, p0}, Lcom/gogoair/ife/utils/image/ImageDownloader$2;-><init>(Lcom/gogoair/ife/utils/image/ImageDownloader;)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->purger:Ljava/lang/Runnable;

    .line 64
    new-instance v0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;

    const-string v2, "GogoCache"

    const v3, 0x1e8480

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x64

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/gogoair/ife/utils/image/DiskLruImageCache;-><init>(Landroid/content/Context;Ljava/lang/String;ILandroid/graphics/Bitmap$CompressFormat;I)V

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->diskCache:Lcom/gogoair/ife/utils/image/DiskLruImageCache;

    .line 65
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->context:Landroid/content/Context;

    .line 66
    iput-object p2, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->imageHolder:Landroid/graphics/Bitmap;

    .line 67
    return-void
.end method

.method static synthetic access$100(Lcom/gogoair/ife/utils/image/ImageDownloader;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/ImageDownloader;->downloadBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/gogoair/ife/utils/image/ImageDownloader;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/utils/image/ImageDownloader;->addBitmapToCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$300(Landroid/widget/ImageView;)Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;
    .locals 1

    .prologue
    .line 54
    invoke-static {p0}, Lcom/gogoair/ife/utils/image/ImageDownloader;->getBitmapDownloaderTask(Landroid/widget/ImageView;)Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/gogoair/ife/utils/image/ImageDownloader;)Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->mode:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    return-object v0
.end method

.method static synthetic access$500()Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sSoftBitmapCache:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$600(Lcom/gogoair/ife/utils/image/ImageDownloader;)V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/ImageDownloader;->clearCache()V

    return-void
.end method

.method private addBitmapToCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .prologue
    .line 336
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/utils/image/ImageDownloader;->addBitmapToHardCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 337
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/utils/image/ImageDownloader;->addBitmapToDiskCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 338
    return-void
.end method

.method private addBitmapToDiskCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 369
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 370
    array-length v1, v0

    if-nez v1, :cond_1

    .line 381
    :cond_0
    :goto_0
    return-void

    .line 373
    :cond_1
    if-eqz p2, :cond_0

    .line 374
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->diskCache:Lcom/gogoair/ife/utils/image/DiskLruImageCache;

    monitor-enter v1

    .line 375
    :try_start_0
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-object v0, v0, v2

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v2, "\\."

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    aget-object v0, v0, v2

    .line 376
    iget-object v2, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->diskCache:Lcom/gogoair/ife/utils/image/DiskLruImageCache;

    invoke-virtual {v2, v0}, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 377
    iget-object v2, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->diskCache:Lcom/gogoair/ife/utils/image/DiskLruImageCache;

    invoke-virtual {v2, v0, p2}, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->put(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 379
    :cond_2
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private addBitmapToHardCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2

    .prologue
    .line 341
    if-eqz p2, :cond_0

    .line 342
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sHardBitmapCache:Ljava/util/HashMap;

    monitor-enter v1

    .line 343
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sHardBitmapCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    monitor-exit v1

    .line 346
    :cond_0
    return-void

    .line 344
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static cancelPotentialDownload(Ljava/lang/String;Landroid/widget/ImageView;)Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 144
    invoke-static {p1}, Lcom/gogoair/ife/utils/image/ImageDownloader;->getBitmapDownloaderTask(Landroid/widget/ImageView;)Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;

    move-result-object v1

    .line 146
    if-eqz v1, :cond_1

    .line 147
    # getter for: Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->url:Ljava/lang/String;
    invoke-static {v1}, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->access$000(Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;)Ljava/lang/String;

    move-result-object v2

    .line 148
    if-eqz v2, :cond_0

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 149
    :cond_0
    invoke-virtual {v1, v0}, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->cancel(Z)Z

    .line 155
    :cond_1
    :goto_0
    return v0

    .line 152
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private clearCache()V
    .locals 1

    .prologue
    .line 425
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sHardBitmapCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 426
    sget-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sSoftBitmapCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 427
    return-void
.end method

.method private downloadBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 175
    .line 177
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 178
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 179
    :try_start_1
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 180
    new-instance v3, Lcom/gogoair/ife/utils/image/ImageDownloader$FlushedInputStream;

    invoke-direct {v3, v2}, Lcom/gogoair/ife/utils/image/ImageDownloader$FlushedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v1

    .line 184
    if-eqz v0, :cond_0

    .line 185
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_0
    move-object v0, v1

    .line 188
    :goto_0
    return-object v0

    .line 181
    :catch_0
    move-exception v0

    move-object v2, v1

    .line 182
    :goto_1
    :try_start_2
    invoke-static {}, Lcom/gogoair/ife/utils/GVLogger;->getDefaultLogger()Lcom/gogoair/ife/utils/GVLogger;

    move-result-object v3

    const-string v4, "ImageDownloader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "I/O error while retrieving bitmap from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v0}, Lcom/gogoair/ife/utils/GVLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 184
    if-eqz v2, :cond_1

    .line 185
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_1
    move-object v0, v1

    .line 188
    goto :goto_0

    .line 184
    :catchall_0
    move-exception v0

    move-object v2, v1

    :goto_2
    if-eqz v2, :cond_2

    .line 185
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_2
    throw v0

    .line 184
    :catchall_1
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    goto :goto_2

    :catchall_2
    move-exception v0

    goto :goto_2

    .line 181
    :catch_1
    move-exception v2

    move-object v7, v2

    move-object v2, v0

    move-object v0, v7

    goto :goto_1
.end method

.method private forceDownload(Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 7

    .prologue
    const/16 v6, 0x9c

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 104
    if-nez p1, :cond_1

    .line 105
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 135
    :cond_0
    :goto_0
    return-void

    .line 109
    :cond_1
    invoke-static {p1, p2}, Lcom/gogoair/ife/utils/image/ImageDownloader;->cancelPotentialDownload(Ljava/lang/String;Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    sget-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader$3;->$SwitchMap$com$gogoair$ife$utils$image$ImageDownloader$Mode:[I

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->mode:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    invoke-virtual {v1}, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 112
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/ImageDownloader;->downloadBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 113
    invoke-direct {p0, p1, v0}, Lcom/gogoair/ife/utils/image/ImageDownloader;->addBitmapToCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 114
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 119
    :pswitch_1
    invoke-virtual {p2, v6}, Landroid/widget/ImageView;->setMinimumHeight(I)V

    .line 120
    new-instance v0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;

    invoke-direct {v0, p0, p2}, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;-><init>(Lcom/gogoair/ife/utils/image/ImageDownloader;Landroid/widget/ImageView;)V

    .line 121
    new-array v1, v5, [Ljava/lang/String;

    aput-object p1, v1, v4

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 126
    :pswitch_2
    new-instance v0, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;

    invoke-direct {v0, p0, p2}, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;-><init>(Lcom/gogoair/ife/utils/image/ImageDownloader;Landroid/widget/ImageView;)V

    .line 127
    new-instance v1, Lcom/gogoair/ife/utils/image/ImageDownloader$DownloadedDrawable;

    iget-object v2, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v3, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->imageHolder:Landroid/graphics/Bitmap;

    invoke-direct {v1, v0, v2, v3}, Lcom/gogoair/ife/utils/image/ImageDownloader$DownloadedDrawable;-><init>(Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 128
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 129
    invoke-virtual {p2, v6}, Landroid/widget/ImageView;->setMinimumHeight(I)V

    .line 130
    new-array v1, v5, [Ljava/lang/String;

    aput-object p1, v1, v4

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 110
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static getBitmapDownloaderTask(Landroid/widget/ImageView;)Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;
    .locals 2

    .prologue
    .line 164
    if-eqz p0, :cond_0

    .line 165
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 166
    instance-of v1, v0, Lcom/gogoair/ife/utils/image/ImageDownloader$DownloadedDrawable;

    if-eqz v1, :cond_0

    .line 167
    check-cast v0, Lcom/gogoair/ife/utils/image/ImageDownloader$DownloadedDrawable;

    .line 168
    invoke-virtual {v0}, Lcom/gogoair/ife/utils/image/ImageDownloader$DownloadedDrawable;->getBitmapDownloaderTask()Lcom/gogoair/ife/utils/image/ImageDownloader$BitmapDownloaderTask;

    move-result-object v0

    .line 171
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getBitmapFromCache(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3

    .prologue
    .line 389
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sHardBitmapCache:Ljava/util/HashMap;

    monitor-enter v1

    .line 390
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sHardBitmapCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 391
    if-eqz v0, :cond_1

    .line 394
    iget-object v2, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sHardBitmapCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    iget-object v2, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sHardBitmapCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    monitor-exit v1

    .line 417
    :cond_0
    :goto_0
    return-object v0

    .line 398
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 401
    sget-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sSoftBitmapCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/SoftReference;

    .line 402
    if-eqz v0, :cond_2

    .line 403
    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 404
    if-nez v0, :cond_0

    .line 409
    sget-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader;->sSoftBitmapCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    :cond_2
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/ImageDownloader;->getBitmapFromDiskCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 414
    if-eqz v0, :cond_0

    .line 415
    invoke-direct {p0, p1, v0}, Lcom/gogoair/ife/utils/image/ImageDownloader;->addBitmapToHardCache(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 398
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private getBitmapFromDiskCache(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 350
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 351
    array-length v2, v1

    if-nez v2, :cond_0

    .line 363
    :goto_0
    return-object v0

    .line 354
    :cond_0
    iget-object v2, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->diskCache:Lcom/gogoair/ife/utils/image/DiskLruImageCache;

    monitor-enter v2

    .line 355
    :try_start_0
    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    aget-object v1, v1, v3

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v3, "\\."

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    aget-object v1, v1, v3

    .line 356
    iget-object v3, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->diskCache:Lcom/gogoair/ife/utils/image/DiskLruImageCache;

    invoke-virtual {v3, v1}, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 357
    iget-object v3, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->diskCache:Lcom/gogoair/ife/utils/image/DiskLruImageCache;

    invoke-virtual {v3, v1}, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 358
    if-eqz v1, :cond_1

    .line 359
    monitor-exit v2

    move-object v0, v1

    goto :goto_0

    .line 362
    :cond_1
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private resetPurgeTimer()V
    .locals 4

    .prologue
    .line 433
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->purgeHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->purger:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 434
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->purgeHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->purger:Ljava/lang/Runnable;

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 435
    return-void
.end method


# virtual methods
.method public download(Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 1

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/ImageDownloader;->resetPurgeTimer()V

    .line 80
    invoke-direct {p0, p1}, Lcom/gogoair/ife/utils/image/ImageDownloader;->getBitmapFromCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 82
    if-nez v0, :cond_0

    .line 83
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/utils/image/ImageDownloader;->forceDownload(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 88
    :goto_0
    return-void

    .line 85
    :cond_0
    invoke-static {p1, p2}, Lcom/gogoair/ife/utils/image/ImageDownloader;->cancelPotentialDownload(Ljava/lang/String;Landroid/widget/ImageView;)Z

    .line 86
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method public setMode(Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;)V
    .locals 0

    .prologue
    .line 283
    iput-object p1, p0, Lcom/gogoair/ife/utils/image/ImageDownloader;->mode:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    .line 284
    invoke-direct {p0}, Lcom/gogoair/ife/utils/image/ImageDownloader;->clearCache()V

    .line 285
    return-void
.end method
