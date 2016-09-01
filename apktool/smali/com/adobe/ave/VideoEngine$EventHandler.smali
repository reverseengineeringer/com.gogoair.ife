.class Lcom/adobe/ave/VideoEngine$EventHandler;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/ave/VideoEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EventHandler"
.end annotation


# instance fields
.field private mVideoEngine:Lcom/adobe/ave/VideoEngine;

.field final synthetic this$0:Lcom/adobe/ave/VideoEngine;


# direct methods
.method public constructor <init>(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/VideoEngine;Landroid/os/Looper;)V
    .locals 0

    .prologue
    .line 1171
    iput-object p1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->this$0:Lcom/adobe/ave/VideoEngine;

    .line 1172
    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1173
    iput-object p2, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    .line 1174
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 1178
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mNativeContext:J
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$100(Lcom/adobe/ave/VideoEngine;)J

    move-result-wide v0

    const-wide/16 v4, 0x0

    cmp-long v0, v0, v4

    if-nez v0, :cond_1

    .line 1494
    :cond_0
    :goto_0
    return-void

    .line 1183
    :cond_1
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1186
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 1190
    :sswitch_0
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->ERROR:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1192
    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->GENERIC_ERROR:Lcom/adobe/ave/MediaErrorCode;

    .line 1193
    invoke-static {}, Lcom/adobe/ave/MediaErrorCode;->values()[Lcom/adobe/ave/MediaErrorCode;

    move-result-object v3

    array-length v4, v3

    :goto_1
    if-ge v2, v4, :cond_2

    aget-object v0, v3, v2

    .line 1195
    invoke-virtual {v0}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v5

    iget v6, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v6, :cond_3

    move-object v1, v0

    .line 1202
    :cond_2
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v3, v1, v0}, Lcom/adobe/ave/VideoEngineListener;->onError(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/MediaErrorCode;Ljava/lang/String;)V

    goto :goto_0

    .line 1193
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1210
    :sswitch_1
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->PLAY_STATE:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1212
    sget-object v1, Lcom/adobe/ave/PlayState;->UNINITIALIZED:Lcom/adobe/ave/PlayState;

    .line 1213
    invoke-static {}, Lcom/adobe/ave/PlayState;->values()[Lcom/adobe/ave/PlayState;

    move-result-object v3

    array-length v4, v3

    :goto_2
    if-ge v2, v4, :cond_1a

    aget-object v0, v3, v2

    .line 1215
    invoke-virtual {v0}, Lcom/adobe/ave/PlayState;->getValue()I

    move-result v5

    iget v6, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v6, :cond_4

    .line 1222
    :goto_3
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v1}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    invoke-virtual {v1, v2, v0}, Lcom/adobe/ave/VideoEngineListener;->onPlayState(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/PlayState;)V

    goto :goto_0

    .line 1213
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1230
    :sswitch_2
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->STREAM_SWITCH:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1232
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lcom/adobe/ave/VideoEngine$customMessage;

    .line 1234
    sget-object v0, Lcom/adobe/ave/SwitchInfo;->ABR:Lcom/adobe/ave/SwitchInfo;

    .line 1235
    invoke-static {}, Lcom/adobe/ave/SwitchInfo;->values()[Lcom/adobe/ave/SwitchInfo;

    move-result-object v1

    array-length v3, v1

    :goto_4
    if-ge v2, v3, :cond_19

    aget-object v4, v1, v2

    .line 1237
    invoke-virtual {v4}, Lcom/adobe/ave/SwitchInfo;->getValue()I

    move-result v5

    iget v7, v6, Lcom/adobe/ave/VideoEngine$customMessage;->m_n1:I

    if-ne v5, v7, :cond_5

    .line 1244
    :goto_5
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget-wide v2, v6, Lcom/adobe/ave/VideoEngine$customMessage;->m_l1:J

    iget v5, v6, Lcom/adobe/ave/VideoEngine$customMessage;->m_n2:I

    iget-wide v6, v6, Lcom/adobe/ave/VideoEngine$customMessage;->m_l2:J

    long-to-int v6, v6

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/ave/VideoEngineListener;->onStreamSwitch(Lcom/adobe/ave/VideoEngine;JLcom/adobe/ave/SwitchInfo;II)V

    goto/16 :goto_0

    .line 1235
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 1252
    :sswitch_3
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->STREAM_METADATA:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1254
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/ave/StreamMetadata;

    invoke-virtual {v1, v2, v0}, Lcom/adobe/ave/VideoEngineListener;->onStreamMetadata(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/StreamMetadata;)V

    goto/16 :goto_0

    .line 1262
    :sswitch_4
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->DRM_METADATA:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1265
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lcom/adobe/ave/VideoEngine$customMessage;

    .line 1266
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget-object v2, v4, Lcom/adobe/ave/VideoEngine$customMessage;->m_obj:Ljava/lang/Object;

    check-cast v2, [B

    check-cast v2, [B

    iget v3, v4, Lcom/adobe/ave/VideoEngine$customMessage;->m_n1:I

    iget-wide v4, v4, Lcom/adobe/ave/VideoEngine$customMessage;->m_l1:J

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/ave/VideoEngineListener;->onDRMMetadata(Lcom/adobe/ave/VideoEngine;[BIJ)V

    goto/16 :goto_0

    .line 1274
    :sswitch_5
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->TIMELINE:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1276
    sget-object v1, Lcom/adobe/ave/UpdateType;->INITIAL:Lcom/adobe/ave/UpdateType;

    .line 1277
    invoke-static {}, Lcom/adobe/ave/UpdateType;->values()[Lcom/adobe/ave/UpdateType;

    move-result-object v3

    array-length v4, v3

    :goto_6
    if-ge v2, v4, :cond_18

    aget-object v0, v3, v2

    .line 1279
    invoke-virtual {v0}, Lcom/adobe/ave/UpdateType;->getValue()I

    move-result v5

    iget v6, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v6, :cond_6

    .line 1286
    :goto_7
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v1}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    invoke-virtual {v1, v2, v0}, Lcom/adobe/ave/VideoEngineListener;->onTimeline(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/UpdateType;)V

    goto/16 :goto_0

    .line 1277
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 1294
    :sswitch_6
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->DATA:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1296
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lcom/adobe/ave/VideoEngine$customMessage;

    .line 1298
    sget-object v0, Lcom/adobe/ave/DataType;->DT_3GPP_CAPTION_METADATA:Lcom/adobe/ave/DataType;

    .line 1299
    invoke-static {}, Lcom/adobe/ave/DataType;->values()[Lcom/adobe/ave/DataType;

    move-result-object v1

    array-length v3, v1

    :goto_8
    if-ge v2, v3, :cond_17

    aget-object v4, v1, v2

    .line 1301
    invoke-virtual {v4}, Lcom/adobe/ave/DataType;->getValue()I

    move-result v5

    iget v7, v6, Lcom/adobe/ave/VideoEngine$customMessage;->m_n1:I

    if-ne v5, v7, :cond_7

    .line 1308
    :goto_9
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget-wide v2, v6, Lcom/adobe/ave/VideoEngine$customMessage;->m_l1:J

    iget-object v5, v6, Lcom/adobe/ave/VideoEngine$customMessage;->m_obj:Ljava/lang/Object;

    check-cast v5, [B

    check-cast v5, [B

    iget v6, v6, Lcom/adobe/ave/VideoEngine$customMessage;->m_n2:I

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/ave/VideoEngineListener;->onData(Lcom/adobe/ave/VideoEngine;JLcom/adobe/ave/DataType;[BI)V

    goto/16 :goto_0

    .line 1299
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 1316
    :sswitch_7
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->MANIFEST_LOAD:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1318
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/ave/VideoEngine$customMessage;

    .line 1320
    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->GENERIC_ERROR:Lcom/adobe/ave/MediaErrorCode;

    .line 1321
    invoke-static {}, Lcom/adobe/ave/MediaErrorCode;->values()[Lcom/adobe/ave/MediaErrorCode;

    move-result-object v4

    array-length v5, v4

    :goto_a
    if-ge v2, v5, :cond_16

    aget-object v3, v4, v2

    .line 1323
    invoke-virtual {v3}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v6

    iget v7, v0, Lcom/adobe/ave/VideoEngine$customMessage;->m_n1:I

    if-ne v6, v7, :cond_8

    .line 1330
    :goto_b
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v1}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget v4, v0, Lcom/adobe/ave/VideoEngine$customMessage;->m_n2:I

    iget-wide v6, v0, Lcom/adobe/ave/VideoEngine$customMessage;->m_l1:J

    long-to-int v5, v6

    iget-wide v6, v0, Lcom/adobe/ave/VideoEngine$customMessage;->m_l2:J

    invoke-virtual/range {v1 .. v7}, Lcom/adobe/ave/VideoEngineListener;->onManifestLoad(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/MediaErrorCode;IIJ)V

    goto/16 :goto_0

    .line 1321
    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 1338
    :sswitch_8
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->SEEK_COMPLETE:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1340
    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->GENERIC_ERROR:Lcom/adobe/ave/MediaErrorCode;

    .line 1341
    invoke-static {}, Lcom/adobe/ave/MediaErrorCode;->values()[Lcom/adobe/ave/MediaErrorCode;

    move-result-object v3

    array-length v4, v3

    :goto_c
    if-ge v2, v4, :cond_15

    aget-object v0, v3, v2

    .line 1343
    invoke-virtual {v0}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v5

    iget v6, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v6, :cond_9

    .line 1350
    :goto_d
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v1}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    invoke-virtual {v1, v2, v0}, Lcom/adobe/ave/VideoEngineListener;->onSeekComplete(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/MediaErrorCode;)V

    goto/16 :goto_0

    .line 1341
    :cond_9
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 1358
    :sswitch_9
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->WARNING:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1360
    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->GENERIC_ERROR:Lcom/adobe/ave/MediaErrorCode;

    .line 1361
    invoke-static {}, Lcom/adobe/ave/MediaErrorCode;->values()[Lcom/adobe/ave/MediaErrorCode;

    move-result-object v3

    array-length v4, v3

    :goto_e
    if-ge v2, v4, :cond_a

    aget-object v0, v3, v2

    .line 1363
    invoke-virtual {v0}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v5

    iget v6, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v6, :cond_b

    move-object v1, v0

    .line 1370
    :cond_a
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v3, v1, v0}, Lcom/adobe/ave/VideoEngineListener;->onWarning(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/MediaErrorCode;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1361
    :cond_b
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 1378
    :sswitch_a
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->DICTIONARY_DATA:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1380
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/ave/VideoEngine$customMessage;

    .line 1381
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v1}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget-object v1, v0, Lcom/adobe/ave/VideoEngine$customMessage;->m_obj:Ljava/lang/Object;

    check-cast v1, Lcom/adobe/ave/Dictionary;

    iget-wide v4, v0, Lcom/adobe/ave/VideoEngine$customMessage;->m_l1:J

    invoke-virtual {v2, v3, v1, v4, v5}, Lcom/adobe/ave/VideoEngineListener;->onDictionaryData(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/Dictionary;J)V

    goto/16 :goto_0

    .line 1389
    :sswitch_b
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->LOAD_INFO:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1391
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lcom/adobe/ave/VideoEngineListener;->onLoadInfo(Lcom/adobe/ave/VideoEngine;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1399
    :sswitch_c
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->TRICK_PLAY_ENDED:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1401
    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->GENERIC_ERROR:Lcom/adobe/ave/MediaErrorCode;

    .line 1402
    invoke-static {}, Lcom/adobe/ave/MediaErrorCode;->values()[Lcom/adobe/ave/MediaErrorCode;

    move-result-object v3

    array-length v4, v3

    :goto_f
    if-ge v2, v4, :cond_14

    aget-object v0, v3, v2

    .line 1404
    invoke-virtual {v0}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v5

    iget v6, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v6, :cond_c

    .line 1410
    :goto_10
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v1}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    invoke-virtual {v1, v2, v0}, Lcom/adobe/ave/VideoEngineListener;->onTrickPlayEnded(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/MediaErrorCode;)V

    goto/16 :goto_0

    .line 1402
    :cond_c
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 1417
    :sswitch_d
    const-string v0, "VideoEngine(j)"

    const-string v1, "Handler : kCTDRMError!!!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1418
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/ave/drm/DRMError;

    .line 1419
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v1}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v1

    sget-object v2, Lcom/adobe/ave/ListenerType;->DRM_ERROR:Lcom/adobe/ave/ListenerType;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 1422
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v1}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    invoke-virtual {v1, v2, v0}, Lcom/adobe/ave/VideoEngineListener;->onDRMError(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/drm/DRMError;)V

    .line 1425
    :cond_d
    invoke-virtual {v0}, Lcom/adobe/ave/drm/DRMError;->getMajorError()J

    move-result-wide v2

    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->AAXS_UnknownConnectionType:Lcom/adobe/ave/MediaErrorCode;

    invoke-virtual {v1}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v1

    int-to-long v4, v1

    cmp-long v1, v2, v4

    if-ltz v1, :cond_e

    invoke-virtual {v0}, Lcom/adobe/ave/drm/DRMError;->getMajorError()J

    move-result-wide v2

    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->AAXS_NoDigitalProtectionAvail:Lcom/adobe/ave/MediaErrorCode;

    invoke-virtual {v1}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v1

    int-to-long v4, v1

    cmp-long v1, v2, v4

    if-lez v1, :cond_f

    .line 1426
    :cond_e
    invoke-virtual {v0}, Lcom/adobe/ave/drm/DRMError;->getMajorError()J

    move-result-wide v2

    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->AAXS_NoOPConstraintInPixelConstraints:Lcom/adobe/ave/MediaErrorCode;

    invoke-virtual {v1}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v1

    int-to-long v4, v1

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    invoke-virtual {v0}, Lcom/adobe/ave/drm/DRMError;->getMajorError()J

    move-result-wide v0

    sget-object v2, Lcom/adobe/ave/MediaErrorCode;->AAXS_MinorErr_DisplayResolutionLargerThanConstraint:Lcom/adobe/ave/MediaErrorCode;

    invoke-virtual {v2}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 1429
    :cond_f
    :try_start_0
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    invoke-virtual {v0}, Lcom/adobe/ave/VideoEngine;->reset()V
    :try_end_0
    .catch Lcom/adobe/ave/VideoEngineException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1431
    :catch_0
    move-exception v0

    .line 1432
    const-string v1, "VideoEngine(j)"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error while calling VideoEngine.reset() for output protection error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1443
    :sswitch_e
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->BACKGROUND_MANIFEST_ERROR:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1445
    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->GENERIC_ERROR:Lcom/adobe/ave/MediaErrorCode;

    .line 1446
    invoke-static {}, Lcom/adobe/ave/MediaErrorCode;->values()[Lcom/adobe/ave/MediaErrorCode;

    move-result-object v3

    array-length v4, v3

    :goto_11
    if-ge v2, v4, :cond_10

    aget-object v0, v3, v2

    .line 1448
    invoke-virtual {v0}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v5

    iget v6, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v6, :cond_11

    move-object v1, v0

    .line 1455
    :cond_10
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v3, v1, v0}, Lcom/adobe/ave/VideoEngineListener;->onBackgroundManifestError(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/MediaErrorCode;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1446
    :cond_11
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 1463
    :sswitch_f
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->BACKGROUND_MANIFEST_WARNING:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1465
    sget-object v1, Lcom/adobe/ave/MediaErrorCode;->GENERIC_ERROR:Lcom/adobe/ave/MediaErrorCode;

    .line 1466
    invoke-static {}, Lcom/adobe/ave/MediaErrorCode;->values()[Lcom/adobe/ave/MediaErrorCode;

    move-result-object v3

    array-length v4, v3

    :goto_12
    if-ge v2, v4, :cond_12

    aget-object v0, v3, v2

    .line 1468
    invoke-virtual {v0}, Lcom/adobe/ave/MediaErrorCode;->getValue()I

    move-result v5

    iget v6, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v6, :cond_13

    move-object v1, v0

    .line 1475
    :cond_12
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v3, v1, v0}, Lcom/adobe/ave/VideoEngineListener;->onBackgroundManifestWarning(Lcom/adobe/ave/VideoEngine;Lcom/adobe/ave/MediaErrorCode;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1466
    :cond_13
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_12

    .line 1482
    :sswitch_10
    const-string v0, "VideoEngine(j)"

    const-string v1, "Handler : kCTPauseAtPeriodEnd!!!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1483
    iget-object v0, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListenerTypeSet:Ljava/util/Set;
    invoke-static {v0}, Lcom/adobe/ave/VideoEngine;->access$300(Lcom/adobe/ave/VideoEngine;)Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/adobe/ave/ListenerType;->PAUSE_AT_PERIOD_END:Lcom/adobe/ave/ListenerType;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1485
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/ave/VideoEngine$customMessage;

    .line 1487
    iget-object v1, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    # getter for: Lcom/adobe/ave/VideoEngine;->mListener:Lcom/adobe/ave/VideoEngineListener;
    invoke-static {v1}, Lcom/adobe/ave/VideoEngine;->access$200(Lcom/adobe/ave/VideoEngine;)Lcom/adobe/ave/VideoEngineListener;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/ave/VideoEngine$EventHandler;->mVideoEngine:Lcom/adobe/ave/VideoEngine;

    iget v0, v0, Lcom/adobe/ave/VideoEngine$customMessage;->m_n1:I

    invoke-virtual {v1, v2, v0}, Lcom/adobe/ave/VideoEngineListener;->onPauseAtPeriodEnd(Lcom/adobe/ave/VideoEngine;I)V

    goto/16 :goto_0

    :cond_14
    move-object v0, v1

    goto/16 :goto_10

    :cond_15
    move-object v0, v1

    goto/16 :goto_d

    :cond_16
    move-object v3, v1

    goto/16 :goto_b

    :cond_17
    move-object v4, v0

    goto/16 :goto_9

    :cond_18
    move-object v0, v1

    goto/16 :goto_7

    :cond_19
    move-object v4, v0

    goto/16 :goto_5

    :cond_1a
    move-object v0, v1

    goto/16 :goto_3

    .line 1186
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x4 -> :sswitch_2
        0x8 -> :sswitch_3
        0x10 -> :sswitch_4
        0x20 -> :sswitch_5
        0x40 -> :sswitch_6
        0x80 -> :sswitch_7
        0x100 -> :sswitch_8
        0x200 -> :sswitch_9
        0x400 -> :sswitch_a
        0x800 -> :sswitch_b
        0x1000 -> :sswitch_c
        0x2000 -> :sswitch_d
        0x4000 -> :sswitch_e
        0x8000 -> :sswitch_f
        0x10000 -> :sswitch_10
    .end sparse-switch
.end method
