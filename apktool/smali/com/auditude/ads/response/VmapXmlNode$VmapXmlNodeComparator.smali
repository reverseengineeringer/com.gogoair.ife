.class public Lcom/auditude/ads/response/VmapXmlNode$VmapXmlNodeComparator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/auditude/ads/response/VmapXmlNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VmapXmlNodeComparator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/auditude/ads/response/VmapXmlNode;Lcom/auditude/ads/response/VmapXmlNode;)I
    .locals 2

    .prologue
    .line 66
    iget v0, p1, Lcom/auditude/ads/response/VmapXmlNode;->index:I

    iget v1, p2, Lcom/auditude/ads/response/VmapXmlNode;->index:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/auditude/ads/response/VmapXmlNode;

    check-cast p2, Lcom/auditude/ads/response/VmapXmlNode;

    invoke-virtual {p0, p1, p2}, Lcom/auditude/ads/response/VmapXmlNode$VmapXmlNodeComparator;->compare(Lcom/auditude/ads/response/VmapXmlNode;Lcom/auditude/ads/response/VmapXmlNode;)I

    move-result v0

    return v0
.end method
