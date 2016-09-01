.class Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$5;
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
    .line 274
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 278
    check-cast p1, Ljava/util/HashMap;

    .line 280
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logger:Lcom/adobe/primetime/core/ILogger;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1100(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/core/ILogger;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_logTag:Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#_executeOpen(id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "videoId"

    .line 281
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", videoName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "videoName"

    .line 282
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "videoLength"

    .line 283
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", playerName="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "playerName"

    .line 284
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", channel="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "channel"

    .line 285
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", isPrimetime="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "isPrimetime"

    .line 286
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 280
    invoke-interface {v0, v1, v2}, Lcom/adobe/primetime/core/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-virtual {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_canProcess()Z

    move-result v0

    if-nez v0, :cond_1

    .line 341
    :cond_0
    :goto_0
    return-object v6

    .line 293
    :cond_1
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_inputDataValidator:Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1200(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;

    move-result-object v0

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "videoId"

    aput-object v3, v1, v2

    const-string v2, "streamType"

    aput-object v2, v1, v7

    const/4 v2, 0x2

    const-string v3, "videoLength"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "playerName"

    aput-object v3, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/adobe/primetime/va/plugins/aa/InputDataValidator;->validateFields(Ljava/util/HashMap;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    const-string v0, "metaVideo"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 300
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 302
    if-eqz v0, :cond_2

    .line 303
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 304
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    iget-object v4, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_customMetadataKeys:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1300(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 309
    :cond_2
    const-string v0, "a.contentType"

    const-string v1, "streamType"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    const-string v0, "a.media.name"

    const-string v1, "videoId"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    const-string v1, "a.media.friendlyName"

    const-string v0, "videoName"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    const-string v0, "videoName"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_2
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    const-string v1, "a.media.length"

    const-string v0, "videoLength"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_4

    const-string v0, "0.0"

    :goto_3
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    const-string v0, "a.media.playerName"

    const-string v1, "playerName"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    const-string v1, "a.media.channel"

    const-string v0, "channel"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v0, "channel"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_4
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    const-string v0, "a.media.view"

    invoke-static {v7}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    const-string v0, "&&pev3"

    const-string v1, "video"

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    const-string v1, "&&pe"

    const-string v0, "isPrimetime"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "msp_s"

    :goto_5
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    const-string v0, "&&cid.userId.id"

    const-string v1, "dpid"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    const-string v0, "&&cid.puuid.id"

    const-string v1, "dpuuid"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    invoke-static {v6, v2}, Lcom/adobe/mobile/Analytics;->trackAction(Ljava/lang/String;Ljava/util/Map;)V

    .line 335
    const-wide/16 v0, 0x0

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 339
    :goto_6
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$5;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    const-string v1, "aa_start"

    # invokes: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_trigger(Ljava/lang/String;Ljava/lang/Object;)V
    invoke-static {v0, v1, p1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1400(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 312
    :cond_3
    const-string v0, ""

    goto :goto_2

    .line 313
    :cond_4
    const-string v0, "videoLength"

    .line 314
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->longValue()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_3

    .line 316
    :cond_5
    const-string v0, ""

    goto :goto_4

    .line 321
    :cond_6
    const-string v0, "ms_s"

    goto :goto_5

    .line 336
    :catch_0
    move-exception v0

    .line 337
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_6
.end method
