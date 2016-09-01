.class Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;
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
    .line 511
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 514
    check-cast p1, Ljava/lang/String;

    .line 515
    const-string v1, "\\."

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 517
    array-length v2, v1

    const/4 v3, 0x2

    if-ge v2, v3, :cond_1

    .line 554
    :cond_0
    :goto_0
    return-object v0

    .line 521
    :cond_1
    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;->valueOf(Ljava/lang/String;)Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;

    move-result-object v1

    .line 522
    const-string v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 524
    if-eqz v1, :cond_0

    .line 525
    sget-object v3, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$21;->$SwitchMap$com$adobe$primetime$va$plugins$aa$AdobeAnalyticsPlugin$Domain:[I

    invoke-virtual {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$Domain;->ordinal()I

    move-result v1

    aget v1, v3, v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 527
    :pswitch_0
    const-string v1, "*"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 528
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_videoMetadata:Ljava/util/Map;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1900(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0

    .line 530
    :cond_2
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_videoMetadata:Ljava/util/Map;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1900(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_videoMetadata:Ljava/util/Map;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1900(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    .line 531
    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_videoMetadata:Ljava/util/Map;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$1900(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    .line 535
    :pswitch_1
    const-string v0, "*"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 536
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_adMetadata:Ljava/util/Map;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$2000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0

    .line 538
    :cond_3
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_adMetadata:Ljava/util/Map;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$2000(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    .line 542
    :pswitch_2
    const-string v1, "*"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 543
    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_chapterMetadata:Ljava/util/Map;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$2100(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0

    .line 545
    :cond_4
    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_chapterMetadata:Ljava/util/Map;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$2100(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_chapterMetadata:Ljava/util/Map;
    invoke-static {v1}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$2100(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin$16;->this$0:Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;

    .line 546
    # getter for: Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->_chapterMetadata:Ljava/util/Map;
    invoke-static {v0}, Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;->access$2100(Lcom/adobe/primetime/va/plugins/aa/AdobeAnalyticsPlugin;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto/16 :goto_0

    .line 525
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
