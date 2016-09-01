.class public Lcom/auditude/ads/network/vast/model/VASTDocument;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final VERSION_2_0:Ljava/lang/String; = "2.0"

.field public static final VERSION_2_0_0:Ljava/lang/String; = "2.0.0"

.field public static final VERSION_2_0_1:Ljava/lang/String; = "2.0.1"

.field public static final VERSION_3_0:Ljava/lang/String; = "3.0"


# instance fields
.field public adTagURI:Ljava/lang/String;

.field private ads:Ljava/util/ArrayList;

.field public parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

.field private podAds:Ljava/util/ArrayList;

.field public reachedMaxWrapper:Z

.field private standAloneAds:Ljava/util/ArrayList;

.field private ununsedAds:Ljava/util/ArrayList;

.field private usedAds:Ljava/util/ArrayList;

.field public version:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/network/vast/model/VASTAd;)V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const-string v0, "2.0"

    iput-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->version:Ljava/lang/String;

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->reachedMaxWrapper:Z

    .line 26
    iput-object p1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ads:Ljava/util/ArrayList;

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->podAds:Ljava/util/ArrayList;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->standAloneAds:Ljava/util/ArrayList;

    .line 30
    return-void
.end method


# virtual methods
.method public final addVASTAd(Lcom/auditude/ads/network/vast/model/VASTAd;)V
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 92
    if-eqz p1, :cond_0

    .line 95
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v1}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v1}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v1

    iget-object v1, v1, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->followAdditionalWrappers:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1

    .line 133
    :cond_0
    :goto_0
    return-void

    .line 101
    :cond_1
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v1}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 102
    iget-object v1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v1}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v1

    iget-object v1, v1, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->allowMultipleAds:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v1}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v1

    iget-object v1, v1, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->allowMultipleAds:Ljava/lang/String;

    const-string v2, "false"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 104
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v1

    const-string v2, "false"

    iput-object v2, v1, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->allowMultipleAds:Ljava/lang/String;

    .line 107
    :cond_2
    invoke-virtual {p1, p0}, Lcom/auditude/ads/network/vast/model/VASTAd;->setDocument(Lcom/auditude/ads/network/vast/model/VASTDocument;)V

    .line 108
    iget-object v1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ads:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTAd;->getSequence()I

    move-result v1

    if-ltz v1, :cond_5

    .line 113
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    move v1, v0

    .line 114
    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->podAds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v1, v0, :cond_3

    move-object v0, v2

    .line 123
    :goto_2
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 125
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->podAds:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 116
    :cond_3
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->podAds:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTAd;->getSequence()I

    move-result v0

    invoke-virtual {p1}, Lcom/auditude/ads/network/vast/model/VASTAd;->getSequence()I

    move-result v3

    if-le v0, v3, :cond_4

    .line 118
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 119
    iget-object v2, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->podAds:Ljava/util/ArrayList;

    invoke-virtual {v2, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2

    .line 114
    :cond_4
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    .line 130
    :cond_5
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->standAloneAds:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method

.method public final getAds()Ljava/util/ArrayList;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 34
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ads:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ads:Ljava/util/ArrayList;

    .line 86
    :goto_0
    return-object v0

    .line 40
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    goto :goto_0

    .line 43
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ununsedAds:Ljava/util/ArrayList;

    .line 47
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v0

    iget-object v0, v0, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->allowMultipleAds:Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v0

    iget-object v0, v0, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->allowMultipleAds:Ljava/lang/String;

    const-string v2, "false"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 49
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->standAloneAds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    .line 51
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->podAds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    iget-object v2, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->podAds:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->standAloneAds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v1, v0, :cond_9

    .line 86
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    goto :goto_0

    .line 53
    :cond_4
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->podAds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_5

    .line 55
    iget-object v2, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->standAloneAds:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 59
    :cond_5
    iget-object v2, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->standAloneAds:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 62
    :cond_6
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v0

    iget-object v0, v0, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->allowMultipleAds:Ljava/lang/String;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v0}, Lcom/auditude/ads/network/vast/model/VASTAd;->getWrapperAd()Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    move-result-object v0

    iget-object v0, v0, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->allowMultipleAds:Ljava/lang/String;

    const-string v2, "true"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 64
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->podAds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_7

    .line 66
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->podAds:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 68
    :cond_7
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->standAloneAds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 70
    iget-object v2, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->standAloneAds:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 75
    :cond_8
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ads:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 81
    :cond_9
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->standAloneAds:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_a

    .line 83
    iget-object v2, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ununsedAds:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->standAloneAds:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_a
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_1
.end method

.method public final getNextUnusedAd()Lcom/auditude/ads/network/vast/model/VASTAd;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 137
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ununsedAds:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ununsedAds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 140
    :goto_0
    return-object v0

    .line 138
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ununsedAds:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/network/vast/model/VASTAd;

    .line 139
    iget-object v1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->ununsedAds:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0
.end method

.method public final replaceAd(Lcom/auditude/ads/network/vast/model/VASTAd;Lcom/auditude/ads/network/vast/model/VASTAd;)V
    .locals 2

    .prologue
    .line 146
    invoke-virtual {p0}, Lcom/auditude/ads/network/vast/model/VASTDocument;->getAds()Ljava/util/ArrayList;

    .line 148
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 151
    if-ltz v0, :cond_0

    .line 153
    iget-object v1, p0, Lcom/auditude/ads/network/vast/model/VASTDocument;->usedAds:Ljava/util/ArrayList;

    invoke-virtual {v1, v0, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 157
    :cond_0
    return-void
.end method
