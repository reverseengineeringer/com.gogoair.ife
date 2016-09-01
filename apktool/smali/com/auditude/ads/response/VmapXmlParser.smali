.class public Lcom/auditude/ads/response/VmapXmlParser;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

.field private parser:Lorg/xmlpull/v1/XmlPullParser;

.field private rootNode:Lcom/auditude/ads/response/VmapXmlNode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    .line 20
    return-void
.end method

.method private parseNode()Lcom/auditude/ads/response/VmapXmlNode;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    new-instance v1, Lcom/auditude/ads/response/VmapXmlNode;

    invoke-direct {v1}, Lcom/auditude/ads/response/VmapXmlNode;-><init>()V

    .line 59
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/auditude/ads/response/VmapXmlNode;->setName(Ljava/lang/String;)V

    .line 60
    invoke-direct {p0, v1}, Lcom/auditude/ads/response/VmapXmlParser;->setAttributes(Lcom/auditude/ads/response/VmapXmlNode;)V

    .line 62
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 63
    :goto_0
    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    .line 101
    return-object v1

    .line 65
    :cond_0
    const/4 v2, 0x2

    if-ne v0, v2, :cond_5

    .line 67
    const-string v0, "VAST"

    iget-object v2, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 69
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-direct {p0, v0}, Lcom/auditude/ads/response/VmapXmlParser;->parseVAST(Lcom/auditude/ads/network/vast/model/VASTAd;)Lcom/auditude/ads/network/vast/model/VASTDocument;

    move-result-object v0

    .line 70
    if-eqz v0, :cond_1

    .line 72
    invoke-virtual {v1, v0}, Lcom/auditude/ads/response/VmapXmlNode;->addVastDocument(Lcom/auditude/ads/network/vast/model/VASTDocument;)V

    .line 99
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0

    .line 77
    :cond_2
    const-string v0, "AdSource"

    iget-object v2, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 79
    new-instance v2, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;

    invoke-direct {v2}, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;-><init>()V

    .line 81
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v3, "followRedirects"

    const/4 v4, 0x1

    invoke-static {v0, v3, v4}, Lcom/auditude/ads/util/XMLUtil;->attributeAsBoolOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v2, Lcom/auditude/ads/network/vast/model/VASTWrapperAd;->followAdditionalWrappers:Ljava/lang/Boolean;

    .line 83
    const/4 v0, 0x0

    .line 84
    invoke-static {}, Lcom/auditude/ads/core/AuditudeEnv;->getInstance()Lcom/auditude/ads/core/AuditudeEnv;

    move-result-object v3

    invoke-virtual {v3}, Lcom/auditude/ads/core/AuditudeEnv;->getAdSettings()Lcom/auditude/ads/core/AdSettings;

    move-result-object v3

    .line 85
    const-string v4, "fallbackOnInvalidCreative"

    invoke-virtual {v3, v4}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 87
    const-string v0, "fallbackOnInvalidCreative"

    invoke-virtual {v3, v0}, Lcom/auditude/ads/core/AdSettings;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 89
    :cond_3
    new-instance v3, Lcom/auditude/ads/network/vast/model/VASTAd;

    iget-object v4, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    const-string v5, "id"

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    const-wide v8, 0x408f400000000000L    # 1000.0

    mul-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/auditude/ads/util/XMLUtil;->attributeAsStringOrDefault(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {v3, v4, v0}, Lcom/auditude/ads/network/vast/model/VASTAd;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object v3, p0, Lcom/auditude/ads/response/VmapXmlParser;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    .line 90
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    invoke-virtual {v0, v2}, Lcom/auditude/ads/network/vast/model/VASTAd;->setWrapperAd(Lcom/auditude/ads/network/vast/model/VASTWrapperAd;)V

    .line 92
    :cond_4
    invoke-direct {p0}, Lcom/auditude/ads/response/VmapXmlParser;->parseNode()Lcom/auditude/ads/response/VmapXmlNode;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/auditude/ads/response/VmapXmlNode;->addChild(Lcom/auditude/ads/response/VmapXmlNode;)V

    goto :goto_1

    .line 95
    :cond_5
    const/4 v2, 0x4

    if-ne v0, v2, :cond_1

    .line 97
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/auditude/ads/response/VmapXmlNode;->setValue(Ljava/lang/String;)V

    goto/16 :goto_1
.end method

.method private parseVAST(Lcom/auditude/ads/network/vast/model/VASTAd;)Lcom/auditude/ads/network/vast/model/VASTDocument;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    const/4 v1, 0x0

    .line 107
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    .line 108
    iget-object v2, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 111
    :goto_0
    iget-object v2, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 113
    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    const-string v3, "VAST"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 115
    new-instance v0, Lcom/auditude/ads/network/vast/loader/VASTXMLParser;

    invoke-direct {v0}, Lcom/auditude/ads/network/vast/loader/VASTXMLParser;-><init>()V

    .line 116
    iput-object p1, v0, Lcom/auditude/ads/network/vast/loader/VASTXMLParser;->parentAd:Lcom/auditude/ads/network/vast/model/VASTAd;

    .line 117
    iget-object v1, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-virtual {v0, v1}, Lcom/auditude/ads/network/vast/loader/VASTXMLParser;->parse(Lorg/xmlpull/v1/XmlPullParser;)Lcom/auditude/ads/network/vast/model/VASTDocument;

    move-result-object v2

    .line 119
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    .line 120
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    move v4, v1

    move-object v1, v2

    move v2, v4

    .line 124
    :goto_1
    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    const-string v2, "VAST"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    return-object v1

    .line 129
    :cond_0
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0

    :cond_1
    move-object v4, v2

    move v2, v0

    move-object v0, v4

    goto :goto_1
.end method

.method private setAttributes(Lcom/auditude/ads/response/VmapXmlNode;)V
    .locals 4

    .prologue
    .line 137
    if-eqz p1, :cond_0

    .line 139
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v1

    .line 140
    const/4 v0, 0x0

    :goto_0
    if-lt v0, v1, :cond_1

    .line 145
    :cond_0
    return-void

    .line 142
    :cond_1
    iget-object v2, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v3, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/auditude/ads/response/VmapXmlNode;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public getChildNodes()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->rootNode:Lcom/auditude/ads/response/VmapXmlNode;

    invoke-virtual {v0}, Lcom/auditude/ads/response/VmapXmlNode;->getChildNodes()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getChildeNodesByName(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->rootNode:Lcom/auditude/ads/response/VmapXmlNode;

    invoke-virtual {v0, p1}, Lcom/auditude/ads/response/VmapXmlNode;->getChildeNodesByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public parseXML(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 28
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 30
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v0

    .line 31
    invoke-virtual {v0, v2}, Lorg/xmlpull/v1/XmlPullParserFactory;->setNamespaceAware(Z)V

    .line 32
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    .line 33
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 35
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    .line 36
    :goto_0
    if-ne v0, v2, :cond_1

    .line 54
    :cond_0
    return-void

    .line 39
    :cond_1
    if-eqz v0, :cond_2

    .line 43
    if-eq v0, v2, :cond_2

    .line 47
    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 49
    invoke-direct {p0}, Lcom/auditude/ads/response/VmapXmlParser;->parseNode()Lcom/auditude/ads/response/VmapXmlNode;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->rootNode:Lcom/auditude/ads/response/VmapXmlNode;

    .line 51
    :cond_2
    iget-object v0, p0, Lcom/auditude/ads/response/VmapXmlParser;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0
.end method
