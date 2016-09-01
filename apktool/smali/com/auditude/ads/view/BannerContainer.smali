.class public Lcom/auditude/ads/view/BannerContainer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public height:I

.field public viewGroup:Landroid/view/ViewGroup;

.field public width:I


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;II)V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/auditude/ads/view/BannerContainer;->viewGroup:Landroid/view/ViewGroup;

    .line 14
    iput p2, p0, Lcom/auditude/ads/view/BannerContainer;->width:I

    .line 15
    iput p3, p0, Lcom/auditude/ads/view/BannerContainer;->height:I

    .line 16
    return-void
.end method
