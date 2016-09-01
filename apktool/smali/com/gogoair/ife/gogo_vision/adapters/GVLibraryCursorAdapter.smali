.class public Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;
.super Landroid/widget/CursorAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$VideoV2LibraryCellViewHolder;
    }
.end annotation


# static fields
.field private static final SEC_TO_MILLIS:I = 0x3e8

.field private static placeHolderBitmap:Landroid/graphics/Bitmap;


# instance fields
.field private final context:Landroid/content/Context;

.field private final mImageDownloader:Lcom/gogoair/ife/utils/image/ImageDownloader;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 2

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 36
    iput-object p1, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->context:Landroid/content/Context;

    .line 37
    new-instance v0, Lcom/gogoair/ife/utils/image/ImageDownloader;

    invoke-direct {p0}, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->getPlaceHolderImage()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/gogoair/ife/utils/image/ImageDownloader;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->mImageDownloader:Lcom/gogoair/ife/utils/image/ImageDownloader;

    .line 38
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->mImageDownloader:Lcom/gogoair/ife/utils/image/ImageDownloader;

    sget-object v1, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->CORRECT:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    invoke-virtual {v0, v1}, Lcom/gogoair/ife/utils/image/ImageDownloader;->setMode(Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;)V

    .line 39
    return-void
.end method

.method private formatTime(I)Ljava/lang/String;
    .locals 10

    .prologue
    .line 89
    const-string v0, "%d:%02d:%02d"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v4, p1

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v4, p1

    .line 90
    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v4

    sget-object v3, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v8, p1

    invoke-virtual {v6, v8, v9}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v4, p1

    .line 91
    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v4

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v8, p1

    invoke-virtual {v6, v8, v9}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    .line 89
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized getPlaceHolderImage()Landroid/graphics/Bitmap;
    .locals 2

    .prologue
    .line 95
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->placeHolderBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02004c

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->placeHolderBitmap:Landroid/graphics/Bitmap;

    .line 97
    :cond_0
    sget-object v0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->placeHolderBitmap:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 9

    .prologue
    .line 49
    new-instance v6, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;

    invoke-direct {v6, p3}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;-><init>(Landroid/database/Cursor;)V

    .line 51
    new-instance v7, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$VideoV2LibraryCellViewHolder;

    invoke-direct {v7}, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$VideoV2LibraryCellViewHolder;-><init>()V

    .line 52
    const v0, 0x7f0b005c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, v7, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$VideoV2LibraryCellViewHolder;->imgIcon:Landroid/widget/ImageView;

    .line 53
    const v0, 0x7f0b005d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v7, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$VideoV2LibraryCellViewHolder;->txtTitle:Landroid/widget/TextView;

    .line 54
    const v0, 0x7f0b005e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, v7, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$VideoV2LibraryCellViewHolder;->txtPlayback:Landroid/widget/TextView;

    .line 55
    const v0, 0x7f0b005f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 57
    iget-object v0, v7, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$VideoV2LibraryCellViewHolder;->txtTitle:Landroid/widget/TextView;

    const-string v1, "ti"

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p3, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    const-string v0, "playback_elapsed_time"

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 60
    const-string v0, "duration"

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    mul-int/lit16 v4, v0, 0x3e8

    .line 62
    const-string v0, "%s / %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-direct {p0, v3}, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->formatTime(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v1, v5

    const/4 v5, 0x1

    invoke-direct {p0, v4}, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->formatTime(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v1, v5

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 63
    iget-object v1, v7, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$VideoV2LibraryCellViewHolder;->txtPlayback:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    iget-object v0, v7, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$VideoV2LibraryCellViewHolder;->imgIcon:Landroid/widget/ImageView;

    const v1, 0x7f02004c

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 67
    invoke-virtual {v2}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v8

    new-instance v0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;

    move-object v1, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$1;-><init>(Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;Landroid/widget/ImageView;IILandroid/view/View;)V

    invoke-virtual {v8, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 84
    invoke-virtual {v6}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getIma()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v6}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getIma()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter;->mImageDownloader:Lcom/gogoair/ife/utils/image/ImageDownloader;

    invoke-virtual {v6}, Lcom/gogoair/ife/gogo_vision/model/GVLibraryEntry;->getIma()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v7, Lcom/gogoair/ife/gogo_vision/adapters/GVLibraryCursorAdapter$VideoV2LibraryCellViewHolder;->imgIcon:Landroid/widget/ImageView;

    invoke-virtual {v0, v1, v2}, Lcom/gogoair/ife/utils/image/ImageDownloader;->download(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 86
    :cond_0
    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .prologue
    .line 43
    check-cast p1, Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    .line 44
    const v1, 0x7f03001c

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
