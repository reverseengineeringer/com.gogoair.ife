.class public final enum Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gogoair/ife/utils/image/ImageDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Mode"
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

.field public static final enum CORRECT:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

.field public static final enum NO_ASYNC_TASK:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

.field public static final enum NO_DOWNLOADED_DRAWABLE:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 57
    new-instance v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    const-string v1, "NO_ASYNC_TASK"

    invoke-direct {v0, v1, v2}, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->NO_ASYNC_TASK:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    new-instance v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    const-string v1, "NO_DOWNLOADED_DRAWABLE"

    invoke-direct {v0, v1, v3}, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->NO_DOWNLOADED_DRAWABLE:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    new-instance v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    const-string v1, "CORRECT"

    invoke-direct {v0, v1, v4}, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->CORRECT:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    sget-object v1, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->NO_ASYNC_TASK:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->NO_DOWNLOADED_DRAWABLE:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->CORRECT:Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    aput-object v1, v0, v4

    sput-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->$VALUES:[Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;
    .locals 1

    .prologue
    .line 57
    const-class v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    return-object v0
.end method

.method public static values()[Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->$VALUES:[Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    invoke-virtual {v0}, [Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/gogoair/ife/utils/image/ImageDownloader$Mode;

    return-object v0
.end method
