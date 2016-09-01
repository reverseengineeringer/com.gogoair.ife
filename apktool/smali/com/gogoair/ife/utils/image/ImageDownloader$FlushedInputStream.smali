.class Lcom/gogoair/ife/utils/image/ImageDownloader$FlushedInputStream;
.super Ljava/io/FilterInputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/image/ImageDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FlushedInputStream"
.end annotation


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0

    .prologue
    .line 196
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 197
    return-void
.end method


# virtual methods
.method public skip(J)J
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x0

    .line 201
    move-wide v2, v4

    .line 202
    :goto_0
    cmp-long v0, v2, p1

    if-gez v0, :cond_0

    .line 203
    iget-object v0, p0, Lcom/gogoair/ife/utils/image/ImageDownloader$FlushedInputStream;->in:Ljava/io/InputStream;

    sub-long v6, p1, v2

    invoke-virtual {v0, v6, v7}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 204
    cmp-long v6, v0, v4

    if-nez v6, :cond_2

    .line 205
    invoke-virtual {p0}, Lcom/gogoair/ife/utils/image/ImageDownloader$FlushedInputStream;->read()I

    move-result v0

    .line 206
    if-gez v0, :cond_1

    .line 214
    :cond_0
    return-wide v2

    .line 209
    :cond_1
    const-wide/16 v0, 0x1

    .line 212
    :cond_2
    add-long/2addr v0, v2

    move-wide v2, v0

    .line 213
    goto :goto_0
.end method
