.class public Lcom/auditude/ads/response/AdResponse;
.super Lcom/auditude/ads/util/event/EventDispatcher;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;
.implements Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/ads/response/AdResponse$AdResponseListener;
    }
.end annotation


# static fields
.field public static final VMAP:I


# instance fields
.field private adRequest:Lcom/auditude/ads/loader/AdRequest;

.field private adSettings:Lcom/auditude/ads/core/AdSettings;

.field private ads:Ljava/util/HashMap;

.field private audienceManager:Lcom/auditude/ads/response/AudienceManager;

.field private breaks:Ljava/util/ArrayList;

.field private chapters:Ljava/util/ArrayList;

.field private errorQueue:Ljava/util/ArrayList;

.field private listener:Lcom/auditude/ads/response/AdResponse$AdResponseListener;

.field private parserExceptions:Ljava/util/ArrayList;

.field private responseIndex:I

.field private responseList:Ljava/util/ArrayList;

.field private responseParser:Lcom/auditude/ads/response/IResponseParser;

.field private submissions:Lcom/auditude/ads/model/tracking/Submissions;

.field private timeout:I


# direct methods
.method public constructor <init>(Lcom/auditude/ads/core/AdSettings;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 41
    invoke-direct {p0}, Lcom/auditude/ads/util/event/EventDispatcher;-><init>()V

    .line 24
    new-instance v0, Lcom/auditude/ads/model/tracking/Submissions;

    invoke-direct {v0}, Lcom/auditude/ads/model/tracking/Submissions;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AdResponse;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AdResponse;->breaks:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AdResponse;->chapters:Ljava/util/ArrayList;

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AdResponse;->ads:Ljava/util/HashMap;

    .line 34
    iput v1, p0, Lcom/auditude/ads/response/AdResponse;->responseIndex:I

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseList:Ljava/util/ArrayList;

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AdResponse;->errorQueue:Ljava/util/ArrayList;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AdResponse;->parserExceptions:Ljava/util/ArrayList;

    .line 43
    iput-object p1, p0, Lcom/auditude/ads/response/AdResponse;->adSettings:Lcom/auditude/ads/core/AdSettings;

    .line 44
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseList:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    return-void
.end method

.method private clearResponseParser()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 206
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    invoke-interface {v0, v1}, Lcom/auditude/ads/response/IResponseParser;->setResponseParserListener(Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;)V

    .line 209
    iput-object v1, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    .line 211
    :cond_0
    return-void
.end method

.method private loadNextResponse()V
    .locals 5

    .prologue
    .line 127
    iget v0, p0, Lcom/auditude/ads/response/AdResponse;->responseIndex:I

    iget-object v1, p0, Lcom/auditude/ads/response/AdResponse;->responseList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 129
    iget v0, p0, Lcom/auditude/ads/response/AdResponse;->responseIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/auditude/ads/response/AdResponse;->responseIndex:I

    .line 130
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseList:Ljava/util/ArrayList;

    iget v1, p0, Lcom/auditude/ads/response/AdResponse;->responseIndex:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 154
    :cond_0
    :goto_0
    return-void

    .line 133
    :pswitch_0
    invoke-static {p0}, Lcom/auditude/ads/response/VMAPParser;->isValidParserForResponse(Lcom/auditude/ads/response/AdResponse;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 135
    new-instance v0, Lcom/auditude/ads/response/VMAPParser;

    invoke-direct {v0}, Lcom/auditude/ads/response/VMAPParser;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    .line 136
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    invoke-interface {v0, p0}, Lcom/auditude/ads/response/IResponseParser;->setResponseParserListener(Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;)V

    .line 137
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    iget-object v1, p0, Lcom/auditude/ads/response/AdResponse;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    iget v2, p0, Lcom/auditude/ads/response/AdResponse;->timeout:I

    invoke-interface {v0, p0, v1, v2}, Lcom/auditude/ads/response/IResponseParser;->loadAdRequest(Lcom/auditude/ads/response/AdResponse;Lcom/auditude/ads/loader/AdRequest;I)V

    goto :goto_0

    .line 142
    :cond_1
    invoke-direct {p0}, Lcom/auditude/ads/response/AdResponse;->loadNextResponse()V

    goto :goto_0

    .line 148
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->listener:Lcom/auditude/ads/response/AdResponse$AdResponseListener;

    iget-object v1, p0, Lcom/auditude/ads/response/AdResponse;->parserExceptions:Ljava/util/ArrayList;

    invoke-interface {v0, v1}, Lcom/auditude/ads/response/AdResponse$AdResponseListener;->onRequestComplete(Ljava/util/ArrayList;)V

    .line 149
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->errorQueue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    .line 151
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAPI()Lcom/auditude/ads/core/APIBridge;

    move-result-object v2

    const-string v3, "playerError"

    new-instance v4, Lcom/auditude/ads/event/PlayerErrorEvent;

    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->errorQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/exception/PlayerException;

    invoke-direct {v4, p0, v0}, Lcom/auditude/ads/event/PlayerErrorEvent;-><init>(Lcom/auditude/ads/util/event/IEventDispatcher;Lcom/auditude/ads/exception/PlayerException;)V

    invoke-virtual {v2, v3, v4}, Lcom/auditude/ads/core/APIBridge;->dispatchEvent(Ljava/lang/String;Ljava/lang/Object;)V

    .line 149
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    .line 130
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public GetBreakData()Ljava/util/ArrayList;
    .locals 3

    .prologue
    .line 186
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 187
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v1, v0, :cond_0

    .line 192
    return-object v2

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->getDescription()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    if-eqz v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    invoke-interface {v0}, Lcom/auditude/ads/response/IResponseParser;->cancel()V

    .line 221
    :cond_0
    return-void
.end method

.method public final dispose()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 225
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->breaks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 229
    iput-object v2, p0, Lcom/auditude/ads/response/AdResponse;->breaks:Ljava/util/ArrayList;

    .line 231
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->chapters:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_3

    .line 235
    iput-object v2, p0, Lcom/auditude/ads/response/AdResponse;->chapters:Ljava/util/ArrayList;

    .line 237
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->ads:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_4

    .line 241
    iput-object v2, p0, Lcom/auditude/ads/response/AdResponse;->ads:Ljava/util/HashMap;

    .line 243
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    if-eqz v0, :cond_0

    .line 245
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    invoke-virtual {v0, v2}, Lcom/auditude/ads/response/AudienceManager;->setAudienceManagerListener(Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;)V

    .line 246
    iput-object v2, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    if-eqz v0, :cond_1

    .line 251
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    invoke-interface {v0, v2}, Lcom/auditude/ads/response/IResponseParser;->setResponseParserListener(Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;)V

    .line 252
    invoke-direct {p0}, Lcom/auditude/ads/response/AdResponse;->clearResponseParser()V

    .line 253
    iput-object v2, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    .line 255
    :cond_1
    return-void

    .line 225
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    .line 227
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->dispose()V

    goto :goto_0

    .line 231
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/smil/Group;

    .line 233
    invoke-virtual {v0}, Lcom/auditude/ads/model/smil/Group;->dispose()V

    goto :goto_1

    .line 237
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 239
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/ads/model/Ad;

    invoke-virtual {v0}, Lcom/auditude/ads/model/Ad;->dispose()V

    goto :goto_2
.end method

.method final getAdSettings()Lcom/auditude/ads/core/AdSettings;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->adSettings:Lcom/auditude/ads/core/AdSettings;

    return-object v0
.end method

.method public getAds()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->ads:Ljava/util/HashMap;

    return-object v0
.end method

.method public getBreaks()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->breaks:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getChapters()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->chapters:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getSubmissions()Lcom/auditude/ads/model/tracking/Submissions;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    return-object v0
.end method

.method public loadAdRequest(Lcom/auditude/ads/loader/AdRequest;I)V
    .locals 3

    .prologue
    .line 54
    iput-object p1, p0, Lcom/auditude/ads/response/AdResponse;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    .line 55
    iput p2, p0, Lcom/auditude/ads/response/AdResponse;->timeout:I

    .line 57
    new-instance v0, Lcom/auditude/ads/response/AudienceManager;

    iget v1, p0, Lcom/auditude/ads/response/AdResponse;->timeout:I

    invoke-direct {v0, v1}, Lcom/auditude/ads/response/AudienceManager;-><init>(I)V

    iput-object v0, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    .line 58
    const/4 v0, 0x0

    .line 59
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v1

    invoke-virtual {v1}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v1

    const-string v2, "audienceManagerURL"

    invoke-virtual {v1, v2}, Lcom/auditude/ads/core/AdSettings;->hasProperty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 61
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v1, "audienceManagerURL"

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 64
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 66
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/response/AudienceManager;->setAudienceManagerListener(Lcom/auditude/ads/response/AudienceManager$AudienceManagerListener;)V

    .line 67
    iget-object v1, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    const-string v2, "audienceManagerURL"

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/auditude/ads/response/AudienceManager;->loadSegmentData(Ljava/lang/String;)V

    .line 73
    :goto_0
    return-void

    .line 71
    :cond_1
    invoke-virtual {p0}, Lcom/auditude/ads/response/AdResponse;->onAudienceManagerComplete()V

    goto :goto_0
.end method

.method public onAudienceManagerComplete()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 77
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AudienceManager;->getSegmentsValues()[Ljava/lang/String;

    move-result-object v0

    .line 78
    if-eqz v0, :cond_0

    array-length v0, v0

    if-lez v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    iget-object v1, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    invoke-virtual {v1}, Lcom/auditude/ads/response/AudienceManager;->getSegmentsValues()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/loader/AdRequest;->setAamSegments([Ljava/lang/String;)V

    .line 81
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    invoke-virtual {v1}, Lcom/auditude/ads/response/AudienceManager;->getSegmentsValues()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->setAamSegments([Ljava/lang/String;)V

    .line 89
    :goto_0
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    invoke-virtual {v0}, Lcom/auditude/ads/response/AudienceManager;->getUuid()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 91
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    iget-object v1, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    invoke-virtual {v1}, Lcom/auditude/ads/response/AudienceManager;->getUuid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/loader/AdRequest;->setAamUuid(Ljava/lang/String;)V

    .line 92
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    iget-object v1, p0, Lcom/auditude/ads/response/AdResponse;->audienceManager:Lcom/auditude/ads/response/AudienceManager;

    invoke-virtual {v1}, Lcom/auditude/ads/response/AudienceManager;->getUuid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/auditude/ads/core/AdSettings;->setAamUuid(Ljava/lang/String;)V

    .line 100
    :goto_1
    new-instance v0, Lcom/auditude/ads/response/AuditudeResponseParser;

    invoke-direct {v0}, Lcom/auditude/ads/response/AuditudeResponseParser;-><init>()V

    iput-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    .line 101
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    invoke-interface {v0, p0}, Lcom/auditude/ads/response/IResponseParser;->setResponseParserListener(Lcom/auditude/ads/response/IResponseParser$ResponseParserListener;)V

    .line 102
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->responseParser:Lcom/auditude/ads/response/IResponseParser;

    iget-object v1, p0, Lcom/auditude/ads/response/AdResponse;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    iget v2, p0, Lcom/auditude/ads/response/AdResponse;->timeout:I

    invoke-interface {v0, p0, v1, v2}, Lcom/auditude/ads/response/IResponseParser;->loadAdRequest(Lcom/auditude/ads/response/AdResponse;Lcom/auditude/ads/loader/AdRequest;I)V

    .line 103
    return-void

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    invoke-virtual {v0, v2}, Lcom/auditude/ads/loader/AdRequest;->setAamSegments([Ljava/lang/String;)V

    .line 86
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/AdSettings;->setAamSegments([Ljava/lang/String;)V

    goto :goto_0

    .line 96
    :cond_1
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->adRequest:Lcom/auditude/ads/loader/AdRequest;

    invoke-virtual {v0, v2}, Lcom/auditude/ads/loader/AdRequest;->setAamUuid(Ljava/lang/String;)V

    .line 97
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/auditude/ads/core/AdSettings;->setAamUuid(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onAudienceManagerFailed(Ljava/lang/Throwable;)V
    .locals 3

    .prologue
    .line 107
    new-instance v0, Lcom/auditude/ads/exception/AssetException;

    const/16 v1, 0x457

    const-string v2, "Audience Manager Failed"

    invoke-direct {v0, v1, v2}, Lcom/auditude/ads/exception/AssetException;-><init>(ILjava/lang/String;)V

    .line 108
    iget-object v1, p0, Lcom/auditude/ads/response/AdResponse;->errorQueue:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    invoke-virtual {p0}, Lcom/auditude/ads/response/AdResponse;->onAudienceManagerComplete()V

    .line 110
    return-void
.end method

.method public onRequestComplete(Lcom/auditude/ads/exception/AssetException;)V
    .locals 1

    .prologue
    .line 114
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->parserExceptions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    :cond_0
    invoke-direct {p0}, Lcom/auditude/ads/response/AdResponse;->clearResponseParser()V

    .line 116
    invoke-direct {p0}, Lcom/auditude/ads/response/AdResponse;->loadNextResponse()V

    .line 117
    return-void
.end method

.method public onRequestFailed(Ljava/lang/Throwable;)V
    .locals 1

    .prologue
    .line 121
    invoke-direct {p0}, Lcom/auditude/ads/response/AdResponse;->clearResponseParser()V

    .line 122
    iget-object v0, p0, Lcom/auditude/ads/response/AdResponse;->listener:Lcom/auditude/ads/response/AdResponse$AdResponseListener;

    invoke-interface {v0, p1}, Lcom/auditude/ads/response/AdResponse$AdResponseListener;->onRequestFailed(Ljava/lang/Throwable;)V

    .line 123
    return-void
.end method

.method public setAdResponseListener(Lcom/auditude/ads/response/AdResponse$AdResponseListener;)V
    .locals 0

    .prologue
    .line 213
    iput-object p1, p0, Lcom/auditude/ads/response/AdResponse;->listener:Lcom/auditude/ads/response/AdResponse$AdResponseListener;

    return-void
.end method

.method public setAds(Ljava/util/HashMap;)V
    .locals 0

    .prologue
    .line 201
    iput-object p1, p0, Lcom/auditude/ads/response/AdResponse;->ads:Ljava/util/HashMap;

    .line 202
    return-void
.end method

.method public setBreaks(Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 163
    iput-object p1, p0, Lcom/auditude/ads/response/AdResponse;->breaks:Ljava/util/ArrayList;

    .line 164
    return-void
.end method

.method public setChapters(Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 172
    iput-object p1, p0, Lcom/auditude/ads/response/AdResponse;->chapters:Ljava/util/ArrayList;

    .line 173
    return-void
.end method

.method public setSubmissions(Lcom/auditude/ads/model/tracking/Submissions;)V
    .locals 0

    .prologue
    .line 181
    iput-object p1, p0, Lcom/auditude/ads/response/AdResponse;->submissions:Lcom/auditude/ads/model/tracking/Submissions;

    .line 182
    return-void
.end method
