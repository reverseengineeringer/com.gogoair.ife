.class Lcom/gogoair/ife/utils/image/DiskLruImageCache;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final APP_VERSION:I = 0x1

.field private static final VALUE_COUNT:I = 0x1


# instance fields
.field private mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field private mCompressQuality:I

.field private mDiskCache:Lcom/gogoair/ife/utils/image/DiskLruCache;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;ILandroid/graphics/Bitmap$CompressFormat;I)V
    .locals 6

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 20
    const/16 v0, 0x46

    iput v0, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mCompressQuality:I

    .line 28
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->getDiskCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 29
    const/4 v1, 0x1

    const/4 v2, 0x1

    int-to-long v4, p3

    invoke-static {v0, v1, v2, v4, v5}, Lcom/gogoair/ife/utils/image/DiskLruCache;->open(Ljava/io/File;IIJ)Lcom/gogoair/ife/utils/image/DiskLruCache;

    move-result-object v0

    iput-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mDiskCache:Lcom/gogoair/ife/utils/image/DiskLruCache;

    .line 30
    iput-object p4, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 31
    iput p5, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mCompressQuality:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :goto_0
    return-void

    .line 32
    :catch_0
    move-exception v0

    .line 33
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method private getDiskCacheDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .locals 3

    .prologue
    .line 54
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 56
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method private writeBitmapToFile(Landroid/graphics/Bitmap;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    const/4 v2, 0x0

    .line 41
    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v0

    const/16 v3, 0x2000

    invoke-direct {v1, v0, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :try_start_1
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v2, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mCompressQuality:I

    invoke-virtual {p1, v0, v2, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v0

    .line 44
    if-eqz v1, :cond_0

    .line 45
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    :cond_0
    return v0

    .line 44
    :catchall_0
    move-exception v0

    move-object v1, v2

    :goto_0
    if-eqz v1, :cond_1

    .line 45
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    :cond_1
    throw v0

    .line 44
    :catchall_1
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public clearCache()V
    .locals 1

    .prologue
    .line 135
    :try_start_0
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mDiskCache:Lcom/gogoair/ife/utils/image/DiskLruCache;

    invoke-virtual {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->delete()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    :goto_0
    return-void

    .line 136
    :catch_0
    move-exception v0

    .line 137
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public containsKey(Ljava/lang/String;)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 116
    .line 117
    const/4 v2, 0x0

    .line 119
    :try_start_0
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mDiskCache:Lcom/gogoair/ife/utils/image/DiskLruCache;

    invoke-virtual {v1, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->get(Ljava/lang/String;)Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 120
    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 124
    :cond_0
    if-eqz v1, :cond_1

    .line 125
    invoke-virtual {v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->close()V

    .line 129
    :cond_1
    :goto_0
    return v0

    .line 121
    :catch_0
    move-exception v1

    .line 122
    :try_start_1
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    if-eqz v2, :cond_1

    .line 125
    invoke-virtual {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->close()V

    goto :goto_0

    .line 124
    :catchall_0
    move-exception v0

    if-eqz v2, :cond_2

    .line 125
    invoke-virtual {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->close()V

    :cond_2
    throw v0
.end method

.method public getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5

    .prologue
    const/4 v0, 0x0

    .line 88
    .line 92
    :try_start_0
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mDiskCache:Lcom/gogoair/ife/utils/image/DiskLruCache;

    invoke-virtual {v1, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->get(Ljava/lang/String;)Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 93
    if-nez v2, :cond_1

    .line 105
    if-eqz v2, :cond_0

    .line 106
    invoke-virtual {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->close()V

    .line 110
    :cond_0
    :goto_0
    return-object v0

    .line 96
    :cond_1
    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {v2, v1}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->getInputStream(I)Ljava/io/InputStream;

    move-result-object v1

    .line 97
    if-eqz v1, :cond_2

    .line 98
    new-instance v3, Ljava/io/BufferedInputStream;

    const/16 v4, 0x2000

    invoke-direct {v3, v1, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 100
    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v0

    .line 105
    :cond_2
    if-eqz v2, :cond_0

    .line 106
    invoke-virtual {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->close()V

    goto :goto_0

    .line 102
    :catch_0
    move-exception v1

    move-object v2, v0

    .line 103
    :goto_1
    :try_start_2
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 105
    if-eqz v2, :cond_0

    .line 106
    invoke-virtual {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->close()V

    goto :goto_0

    .line 105
    :catchall_0
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    :goto_2
    if-eqz v2, :cond_3

    .line 106
    invoke-virtual {v2}, Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;->close()V

    :cond_3
    throw v0

    .line 105
    :catchall_1
    move-exception v0

    goto :goto_2

    .line 102
    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public getCacheFolder()Ljava/io/File;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mDiskCache:Lcom/gogoair/ife/utils/image/DiskLruCache;

    invoke-virtual {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache;->getDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2

    .prologue
    .line 61
    const/4 v0, 0x0

    .line 63
    :try_start_0
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mDiskCache:Lcom/gogoair/ife/utils/image/DiskLruCache;

    invoke-virtual {v1, p1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->edit(Ljava/lang/String;)Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;

    move-result-object v0

    .line 64
    if-nez v0, :cond_1

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    invoke-direct {p0, p2, v0}, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->writeBitmapToFile(Landroid/graphics/Bitmap;Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 70
    invoke-virtual {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->commit()V

    .line 71
    iget-object v1, p0, Lcom/gogoair/ife/utils/image/DiskLruImageCache;->mDiskCache:Lcom/gogoair/ife/utils/image/DiskLruCache;

    invoke-virtual {v1}, Lcom/gogoair/ife/utils/image/DiskLruCache;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 75
    :catch_0
    move-exception v1

    .line 77
    if-eqz v0, :cond_0

    .line 78
    :try_start_1
    invoke-virtual {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->abort()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 80
    :catch_1
    move-exception v0

    goto :goto_0

    .line 73
    :cond_2
    :try_start_2
    invoke-virtual {v0}, Lcom/gogoair/ife/utils/image/DiskLruCache$Editor;->abort()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0
.end method
