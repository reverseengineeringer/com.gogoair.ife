.class public Lcom/adobe/ave/ABRProfileInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public bitsPerSecond:I

.field public codecs:Ljava/lang/String;

.field public height:I

.field public width:I


# direct methods
.method private constructor <init>(IIILjava/lang/String;)V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput p1, p0, Lcom/adobe/ave/ABRProfileInfo;->bitsPerSecond:I

    .line 29
    iput p2, p0, Lcom/adobe/ave/ABRProfileInfo;->width:I

    .line 30
    iput p3, p0, Lcom/adobe/ave/ABRProfileInfo;->height:I

    .line 31
    iput-object p4, p0, Lcom/adobe/ave/ABRProfileInfo;->codecs:Ljava/lang/String;

    .line 32
    return-void
.end method
