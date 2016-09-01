.class public abstract Lcom/auditude/ads/session/GroupManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;
.implements Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;


# instance fields
.field private adSettings:Lcom/auditude/ads/core/AdSettings;

.field private api:Lcom/auditude/ads/core/APIBridge;

.field private group:Lcom/auditude/ads/model/smil/Group;

.field private isHandlingGroup:Z

.field private par:Lcom/auditude/ads/model/smil/Par;

.field private viewManager:Lcom/auditude/ads/view/ViewManager;


# direct methods
.method public constructor <init>(Lcom/auditude/ads/core/APIBridge;Lcom/auditude/ads/view/ViewManager;Lcom/auditude/ads/core/AdSettings;)V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/session/GroupManager;->isHandlingGroup:Z

    .line 34
    iput-object p1, p0, Lcom/auditude/ads/session/GroupManager;->api:Lcom/auditude/ads/core/APIBridge;

    .line 35
    iput-object p2, p0, Lcom/auditude/ads/session/GroupManager;->viewManager:Lcom/auditude/ads/view/ViewManager;

    .line 36
    iput-object p3, p0, Lcom/auditude/ads/session/GroupManager;->adSettings:Lcom/auditude/ads/core/AdSettings;

    .line 37
    return-void
.end method

.method private consolidateCompanionAssets([Lcom/auditude/ads/model/OnPageAsset;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 249
    .line 250
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v1, "showStaticImageBanners"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->hasProperty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 252
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v1, "showStaticImageBanners"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    move v1, v0

    .line 255
    :goto_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 256
    array-length v4, p1

    :goto_1
    if-lt v2, v4, :cond_0

    .line 272
    return-object v3

    .line 256
    :cond_0
    aget-object v0, p1, v2

    .line 258
    if-eqz v0, :cond_1

    .line 260
    if-nez v1, :cond_2

    .line 262
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 264
    :cond_2
    invoke-virtual {v0}, Lcom/auditude/ads/model/OnPageAsset;->getStaticAsset()Lcom/auditude/ads/model/IOnPageAsset;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 266
    invoke-virtual {v0}, Lcom/auditude/ads/model/OnPageAsset;->getStaticAsset()Lcom/auditude/ads/model/IOnPageAsset;

    move-result-object v0

    .line 267
    instance-of v5, v0, Lcom/auditude/ads/model/OnPageAsset;

    if-eqz v5, :cond_3

    :goto_3
    check-cast v0, Lcom/auditude/ads/model/OnPageAsset;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    goto :goto_3

    :cond_4
    move v1, v2

    goto :goto_0
.end method

.method private handleBaseAsset(Lcom/auditude/ads/model/Asset;[Lcom/auditude/ads/model/OnPageAsset;)V
    .locals 2

    .prologue
    .line 233
    new-instance v0, Lcom/auditude/ads/view/model/AdViewSource;

    invoke-virtual {p1}, Lcom/auditude/ads/model/Asset;->getAdParameters()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, p2, v1}, Lcom/auditude/ads/view/model/AdViewSource;-><init>(Lcom/auditude/ads/model/IAsset;[Lcom/auditude/ads/model/IOnPageAsset;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/auditude/ads/session/GroupManager;->showAdSource(Lcom/auditude/ads/view/model/AdViewSource;)V

    .line 234
    return-void
.end method

.method private handleCompanionAssets(Ljava/util/ArrayList;)V
    .locals 6

    .prologue
    .line 238
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 240
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 245
    :cond_0
    return-void

    .line 240
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/OnPageAsset;

    .line 242
    iget-object v2, p0, Lcom/auditude/ads/session/GroupManager;->viewManager:Lcom/auditude/ads/view/ViewManager;

    new-instance v3, Lcom/auditude/ads/view/model/AdViewSource;

    const/4 v4, 0x0

    invoke-virtual {v0}, Lcom/auditude/ads/model/OnPageAsset;->getAdParameters()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v0, v4, v5}, Lcom/auditude/ads/view/model/AdViewSource;-><init>(Lcom/auditude/ads/model/IAsset;[Lcom/auditude/ads/model/IOnPageAsset;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Lcom/auditude/ads/view/ViewManager;->showAdSource(Lcom/auditude/ads/view/model/AdViewSource;)V

    goto :goto_0
.end method

.method private showSegment(Lcom/auditude/ads/model/smil/Ref;)V
    .locals 2

    .prologue
    .line 206
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->isWatched()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 208
    :cond_0
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->showNextSegment()V

    .line 229
    :goto_0
    return-void

    .line 212
    :cond_1
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getCompanions()[Lcom/auditude/ads/model/OnPageAsset;

    move-result-object v0

    .line 213
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 215
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/auditude/ads/session/GroupManager;->handleBaseAsset(Lcom/auditude/ads/model/Asset;[Lcom/auditude/ads/model/OnPageAsset;)V

    goto :goto_0

    .line 217
    :cond_2
    if-eqz v0, :cond_3

    array-length v1, v0

    if-lez v1, :cond_3

    .line 219
    const-string v1, "skin"

    invoke-direct {p0, v0, v1}, Lcom/auditude/ads/session/GroupManager;->consolidateCompanionAssets([Lcom/auditude/ads/model/OnPageAsset;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/auditude/ads/session/GroupManager;->handleCompanionAssets(Ljava/util/ArrayList;)V

    .line 220
    const-string v1, "onpage"

    invoke-direct {p0, v0, v1}, Lcom/auditude/ads/session/GroupManager;->consolidateCompanionAssets([Lcom/auditude/ads/model/OnPageAsset;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/ads/session/GroupManager;->handleCompanionAssets(Ljava/util/ArrayList;)V

    .line 222
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->showNextSegment()V

    goto :goto_0

    .line 227
    :cond_3
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->showNextSegment()V

    goto :goto_0
.end method


# virtual methods
.method public begin(Lcom/auditude/ads/model/smil/Group;)V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 55
    iget-boolean v0, p0, Lcom/auditude/ads/session/GroupManager;->isHandlingGroup:Z

    if-eqz v0, :cond_0

    .line 90
    :goto_0
    return-void

    .line 57
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/auditude/ads/session/GroupManager;->isHandlingGroup:Z

    .line 58
    iput-object v3, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    .line 59
    iput-object p1, p0, Lcom/auditude/ads/session/GroupManager;->group:Lcom/auditude/ads/model/smil/Group;

    .line 61
    if-nez p1, :cond_1

    .line 63
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->groupEnd()V

    goto :goto_0

    .line 68
    :cond_1
    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Group;->begin()V

    .line 73
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 74
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v1

    const-string v2, "prefetchNetworkAds"

    invoke-virtual {v1, v2}, Lcom/auditude/ads/core/AdSettings;->hasProperty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 76
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v1, "prefetchNetworkAds"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 78
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 80
    invoke-virtual {p1, p0, v3}, Lcom/auditude/ads/model/smil/Group;->load(Lcom/auditude/ads/model/smil/Group$PrefetchCompleteListener;Ljava/util/HashMap;)V

    goto :goto_0

    .line 85
    :cond_3
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->groupBegin()V

    .line 88
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->showNextSegment()V

    goto :goto_0
.end method

.method public dispose()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 277
    iput-object v0, p0, Lcom/auditude/ads/session/GroupManager;->api:Lcom/auditude/ads/core/APIBridge;

    .line 278
    iput-object v0, p0, Lcom/auditude/ads/session/GroupManager;->viewManager:Lcom/auditude/ads/view/ViewManager;

    .line 279
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/session/GroupManager;->isHandlingGroup:Z

    .line 280
    return-void
.end method

.method public end()V
    .locals 1

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/auditude/ads/session/GroupManager;->end(Z)V

    .line 104
    return-void
.end method

.method public end(Z)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 109
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/auditude/ads/session/GroupManager;->isHandlingGroup:Z

    .line 110
    iput-object v1, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    .line 112
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->group:Lcom/auditude/ads/model/smil/Group;

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->group:Lcom/auditude/ads/model/smil/Group;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/model/smil/Group;->end(Z)V

    .line 115
    iput-object v1, p0, Lcom/auditude/ads/session/GroupManager;->group:Lcom/auditude/ads/model/smil/Group;

    .line 117
    :cond_0
    return-void
.end method

.method public final getAPI()Lcom/auditude/ads/core/APIBridge;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->api:Lcom/auditude/ads/core/APIBridge;

    return-object v0
.end method

.method public final getAdSettings()Lcom/auditude/ads/core/AdSettings;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->adSettings:Lcom/auditude/ads/core/AdSettings;

    return-object v0
.end method

.method public final getGroup()Lcom/auditude/ads/model/smil/Group;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->group:Lcom/auditude/ads/model/smil/Group;

    return-object v0
.end method

.method protected final getNextAdSource()Lcom/auditude/ads/view/model/AdViewSource;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 164
    iget-object v1, p0, Lcom/auditude/ads/session/GroupManager;->group:Lcom/auditude/ads/model/smil/Group;

    if-nez v1, :cond_1

    .line 181
    :cond_0
    :goto_0
    return-object v0

    .line 169
    :cond_1
    iget-object v1, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    .line 170
    :goto_1
    if-eqz v1, :cond_0

    .line 172
    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Par;->getNext()Lcom/auditude/ads/model/smil/Ref;

    move-result-object v2

    .line 173
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 175
    new-instance v1, Lcom/auditude/ads/view/model/AdViewSource;

    invoke-virtual {v2}, Lcom/auditude/ads/model/smil/Ref;->getPrimaryAsset()Lcom/auditude/ads/model/Asset;

    move-result-object v3

    invoke-virtual {v2}, Lcom/auditude/ads/model/smil/Ref;->getCompanions()[Lcom/auditude/ads/model/OnPageAsset;

    move-result-object v2

    invoke-direct {v1, v3, v2, v0}, Lcom/auditude/ads/view/model/AdViewSource;-><init>(Lcom/auditude/ads/model/IAsset;[Lcom/auditude/ads/model/IOnPageAsset;Ljava/lang/Object;)V

    move-object v0, v1

    goto :goto_0

    .line 178
    :cond_2
    iget-object v1, p0, Lcom/auditude/ads/session/GroupManager;->group:Lcom/auditude/ads/model/smil/Group;

    invoke-virtual {v1}, Lcom/auditude/ads/model/smil/Group;->getNext()Lcom/auditude/ads/model/smil/Par;

    move-result-object v1

    goto :goto_1
.end method

.method protected final getPar()Lcom/auditude/ads/model/smil/Par;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    return-object v0
.end method

.method public final getViewManager()Lcom/auditude/ads/view/ViewManager;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->viewManager:Lcom/auditude/ads/view/ViewManager;

    return-object v0
.end method

.method protected groupBegin()V
    .locals 0

    .prologue
    .line 121
    return-void
.end method

.method protected groupEnd()V
    .locals 1

    .prologue
    .line 126
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/auditude/ads/session/GroupManager;->end(Z)V

    .line 127
    return-void
.end method

.method protected final isHandlingGroup()Z
    .locals 1

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/auditude/ads/session/GroupManager;->isHandlingGroup:Z

    return v0
.end method

.method public onParResolutionComplete()V
    .locals 2

    .prologue
    .line 195
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/auditude/ads/model/smil/Par;->setParResolutionCompleteListener(Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;)V

    .line 200
    :cond_0
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->showNextSegment()V

    .line 201
    return-void
.end method

.method public onPrefetchComplete(Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->groupBegin()V

    .line 98
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->showNextSegment()V

    .line 99
    return-void
.end method

.method protected resolvePar(Lcom/auditude/ads/model/smil/Par;)V
    .locals 1

    .prologue
    .line 186
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/auditude/ads/model/smil/Par;->isResolved()Z

    move-result v0

    if-nez v0, :cond_0

    .line 188
    invoke-virtual {p1, p0}, Lcom/auditude/ads/model/smil/Par;->setParResolutionCompleteListener(Lcom/auditude/ads/model/smil/Par$ParResoultionCompleteListener;)V

    .line 189
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/auditude/ads/model/smil/Par;->resolve(Ljava/util/HashMap;)V

    .line 191
    :cond_0
    return-void
.end method

.method protected abstract showAdSource(Lcom/auditude/ads/view/model/AdViewSource;)V
.end method

.method protected showNextSegment()V
    .locals 8

    .prologue
    .line 131
    iget-boolean v0, p0, Lcom/auditude/ads/session/GroupManager;->isHandlingGroup:Z

    if-nez v0, :cond_0

    .line 160
    :goto_0
    return-void

    .line 133
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->moveNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 135
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->getCurrent()Lcom/auditude/ads/model/smil/Ref;

    move-result-object v0

    .line 136
    if-eqz v0, :cond_1

    .line 138
    invoke-direct {p0, v0}, Lcom/auditude/ads/session/GroupManager;->showSegment(Lcom/auditude/ads/model/smil/Ref;)V

    goto :goto_0

    .line 143
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->group:Lcom/auditude/ads/model/smil/Group;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->group:Lcom/auditude/ads/model/smil/Group;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->moveNext()Z

    move-result v0

    if-nez v0, :cond_3

    .line 145
    :cond_2
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->groupEnd()V

    goto :goto_0

    .line 149
    :cond_3
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->group:Lcom/auditude/ads/model/smil/Group;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getCurrent()Lcom/auditude/ads/model/smil/Par;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    .line 150
    iget-object v6, p0, Lcom/auditude/ads/session/GroupManager;->api:Lcom/auditude/ads/core/APIBridge;

    const-string v7, "smilEvent"

    new-instance v0, Lcom/auditude/ads/event/SMILEvent;

    iget-object v1, p0, Lcom/auditude/ads/session/GroupManager;->api:Lcom/auditude/ads/core/APIBridge;

    sget-object v2, Lcom/auditude/ads/event/SMILEvent$SMILEventType;->PAR_BEGIN:Lcom/auditude/ads/event/SMILEvent$SMILEventType;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/auditude/ads/event/SMILEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/event/SMILEvent$SMILEventType;Lcom/auditude/ads/model/smil/Sequence;Lcom/auditude/ads/model/smil/Par;Z)V

    invoke-virtual {v6, v7, v0}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 152
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Par;->isResolved()Z

    move-result v0

    if-nez v0, :cond_4

    .line 154
    iget-object v0, p0, Lcom/auditude/ads/session/GroupManager;->par:Lcom/auditude/ads/model/smil/Par;

    invoke-virtual {p0, v0}, Lcom/auditude/ads/session/GroupManager;->resolvePar(Lcom/auditude/ads/model/smil/Par;)V

    goto :goto_0

    .line 158
    :cond_4
    invoke-virtual {p0}, Lcom/auditude/ads/session/GroupManager;->showNextSegment()V

    goto :goto_0
.end method
