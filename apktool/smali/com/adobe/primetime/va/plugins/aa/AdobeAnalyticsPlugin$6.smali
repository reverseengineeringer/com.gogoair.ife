.class Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/adobe/primetime/core/ICallback;


# instance fields
.field final synthetic this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;


# direct methods
.method constructor <init>(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)V
    .locals 0

    .prologue
    .line 345
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .prologue
    const/4 v9, 0x1

    const-wide/16 v10, 0x0

    const/4 v8, 0x0

    .line 349
    check-cast p1, Ljava/util/HashMap;

    .line 351
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "videoId"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/adobe/primetime/utils/MD5;->hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "podPosition"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 353
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1600(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1500(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "#_executeOpenAd(id="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "adId"

    .line 354
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", length="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "adLength"

    .line 355
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", podPlayerName="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "podPlayerName"

    .line 356
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", parentId="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "videoId"

    .line 357
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", podId="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", parentPodPosition="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "adPosition"

    .line 359
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", podSecond="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "podSecond"

    .line 360
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ")"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 353
    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 439
    :cond_0
    :goto_0
    return-object v8

    .line 367
    :cond_1
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1200(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;

    move-result-object v0

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v4, "videoId"

    aput-object v4, v1, v2

    const-string v2, "streamType"

    aput-object v2, v1, v9

    const/4 v2, 0x2

    const-string v4, "playerName"

    aput-object v4, v1, v2

    const/4 v2, 0x3

    const-string v4, "adId"

    aput-object v4, v1, v2

    const/4 v2, 0x4

    const-string v4, "adLength"

    aput-object v4, v1, v2

    const/4 v2, 0x5

    const-string v4, "podPlayerName"

    aput-object v4, v1, v2

    const/4 v2, 0x6

    const-string v4, "adPosition"

    aput-object v4, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 372
    const-string v1, "podSecond"

    const-string v0, "podSecond"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Ljava/lang/Double;

    if-nez v0, :cond_2

    const-string v0, "playhead"

    .line 373
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 372
    :goto_1
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    const-string v0, "metaVideo"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 380
    const-string v1, "metaAd"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 381
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 383
    if-eqz v0, :cond_3

    .line 384
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 385
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v2, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    iget-object v6, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_customMetadataKeys:Ljava/util/ArrayList;
    invoke-static {v6}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1300(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 373
    :cond_2
    const-string v0, "podSecond"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1

    .line 391
    :cond_3
    if-eqz v1, :cond_4

    .line 392
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 393
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_customMetadataKeys:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1300(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 398
    :cond_4
    const-string v0, "a.contentType"

    const-string v1, "streamType"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    const-string v0, "a.media.name"

    const-string v1, "videoId"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    const-string v0, "a.media.playerName"

    const-string v1, "playerName"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    const-string v1, "a.media.channel"

    const-string v0, "channel"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v0, "channel"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_4
    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    const-string v0, "a.media.ad.name"

    const-string v1, "adId"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    const-string v1, "a.media.ad.friendlyName"

    const-string v0, "adName"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_6

    const-string v0, "adName"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_5
    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    const-string v1, "a.media.ad.podFriendlyName"

    const-string v0, "podName"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_7

    const-string v0, "podName"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_6
    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    const-string v1, "a.media.ad.length"

    const-string v0, "adLength"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->longValue()J

    move-result-wide v6

    cmp-long v0, v6, v10

    if-nez v0, :cond_8

    const-string v0, "0.0"

    :goto_7
    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    const-string v0, "a.media.ad.playerName"

    const-string v1, "podPlayerName"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    const-string v0, "a.media.ad.pod"

    invoke-virtual {v4, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 411
    const-string v1, "a.media.ad.podPosition"

    const-string v0, "adPosition"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_9

    const-string v0, "0.0"

    :goto_8
    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    const-string v1, "a.media.ad.podSecond"

    const-string v0, "podSecond"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->longValue()J

    move-result-wide v2

    cmp-long v0, v2, v10

    if-nez v0, :cond_a

    const-string v0, "0.0"

    :goto_9
    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    const-string v0, "a.media.ad.view"

    invoke-static {v9}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    const-string v0, "&&pev3"

    const-string v1, "videoAd"

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    const-string v1, "&&pe"

    const-string v0, "isPrimetime"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "mspa_s"

    :goto_a
    invoke-virtual {v4, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    const-string v0, "&&cid.userId.id"

    const-string v1, "dpid"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    const-string v0, "&&cid.puuid.id"

    const-string v1, "dpuuid"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    invoke-static {v8, v4}, Lcom/adobe/mobile/Analytics;->trackAction(Ljava/lang/String;Ljava/util/Map;)V

    .line 433
    const-wide/16 v0, 0x0

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 437
    :goto_b
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$6;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    const-string v1, "sc_ad_start"

    # invokes: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {v0, v1, p1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1700(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 402
    :cond_5
    const-string v0, ""

    goto/16 :goto_4

    .line 405
    :cond_6
    const-string v0, ""

    goto/16 :goto_5

    .line 406
    :cond_7
    const-string v0, ""

    goto/16 :goto_6

    .line 407
    :cond_8
    const-string v0, "adLength"

    .line 408
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->longValue()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto/16 :goto_7

    .line 411
    :cond_9
    const-string v0, "adPosition"

    .line 412
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    goto/16 :goto_8

    .line 413
    :cond_a
    const-string v0, "podSecond"

    .line 414
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto/16 :goto_9

    .line 418
    :cond_b
    const-string v0, "msa_s"

    goto :goto_a

    .line 434
    :catch_0
    move-exception v0

    .line 435
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_b
.end method
