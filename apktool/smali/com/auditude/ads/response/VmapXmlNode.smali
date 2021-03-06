.class public Lcom/auditude/ads/response/VmapXmlNode;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/response/VmapXmlNode$VmapXmlNodeComparator;
    }
.end annotation


# instance fields
.field private attributes:Ljava/util/HashMap;

.field private childNodes:Ljava/util/HashMap;

.field public index:I

.field private name:Ljava/lang/String;

.field private value:Ljava/lang/String;

.field private vastDocuments:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->index:I

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->attributes:Ljava/util/HashMap;

    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->childNodes:Ljava/util/HashMap;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->vastDocuments:Ljava/util/ArrayList;

    .line 24
    return-void
.end method


# virtual methods
.method public addChild(Lcom/auditude/ads/response/VmapXmlNode;)V
    .locals 3

    .prologue
    .line 37
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->childNodes:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/auditude/ads/response/VmapXmlNode;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 39
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->childNodes:Ljava/util/HashMap;

    iget-object v1, p1, Lcom/auditude/ads/response/VmapXmlNode;->name:Ljava/lang/String;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->childNodes:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    iput v0, p1, Lcom/auditude/ads/response/VmapXmlNode;->index:I

    .line 42
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->childNodes:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/auditude/ads/response/VmapXmlNode;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    return-void
.end method

.method public addVastDocument(Lcom/auditude/ads/network/vast/model/VASTDocument;)V
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->vastDocuments:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    return-void
.end method

.method public getAttributeByName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->attributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getChildNodes()Ljava/util/ArrayList;
    .locals 4

    .prologue
    .line 47
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 49
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->childNodes:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 55
    new-instance v0, Lcom/auditude/ads/response/VmapXmlNode$VmapXmlNodeComparator;

    invoke-direct {v0}, Lcom/auditude/ads/response/VmapXmlNode$VmapXmlNodeComparator;-><init>()V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 57
    return-object v1

    .line 49
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 50
    iget-object v3, p0, Lcom/auditude/ads/response/VmapXmlNode;->childNodes:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 51
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0
.end method

.method public getChildeNodesByName(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->childNodes:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getVastDocuments()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->vastDocuments:Ljava/util/ArrayList;

    return-object v0
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlNode;->attributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 81
    iput-object p1, p0, Lcom/auditude/ads/response/VmapXmlNode;->name:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 90
    iput-object p1, p0, Lcom/auditude/ads/response/VmapXmlNode;->value:Ljava/lang/String;

    .line 91
    return-void
.end method
