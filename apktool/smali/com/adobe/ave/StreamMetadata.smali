.class public Lcom/adobe/ave/StreamMetadata;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public frameRate:F

.field public level:I

.field public outputHeight:I

.field public outputWidth:I

.field public profile:I


# direct methods
.method constructor <init>(IIFII)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput p1, p0, Lcom/adobe/ave/StreamMetadata;->outputWidth:I

    .line 30
    iput p2, p0, Lcom/adobe/ave/StreamMetadata;->outputHeight:I

    .line 31
    iput p3, p0, Lcom/adobe/ave/StreamMetadata;->frameRate:F

    .line 32
    iput p4, p0, Lcom/adobe/ave/StreamMetadata;->profile:I

    .line 33
    iput p5, p0, Lcom/adobe/ave/StreamMetadata;->level:I

    .line 34
    return-void
.end method
