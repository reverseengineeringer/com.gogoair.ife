.class Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final KEY_CHECK_STATUS_INTERVAL:Ljava/lang/String; = "check_status_interval"

.field private static final KEY_REPORTING_INTERVAL:Ljava/lang/String; = "reporting_interval"

.field private static final KEY_TRACK_EXTERNAL_ERRORS:Ljava/lang/String; = "track_external_errors"


# instance fields
.field private final _data:Ljava/lang/String;

.field private _logTag:Ljava/lang/String;

.field private _logger:Lcom/adobe/primetime/core/ILogger;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/adobe/primetime/core/ILogger;)V
    .locals 2

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    if-nez p1, :cond_0

    .line 44
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to the data object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_0
    iput-object p1, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;->_data:Ljava/lang/String;

    .line 48
    if-nez p2, :cond_1

    .line 49
    new-instance v0, Ljava/lang/Error;

    const-string v1, "Reference to logger object cannot be NULL."

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_1
    iput-object p2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;->_logger:Lcom/adobe/primetime/core/ILogger;

    .line 52
    const-class v0, Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;->_logTag:Ljava/lang/String;

    .line 53
    return-void
.end method


# virtual methods
.method public parse()Ljava/util/Map;
    .locals 10

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 60
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v2

    .line 61
    new-instance v3, Lorg/xml/sax/InputSource;

    invoke-direct {v3}, Lorg/xml/sax/InputSource;-><init>()V

    .line 62
    new-instance v4, Ljava/io/StringReader;

    iget-object v5, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;->_data:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/xml/sax/InputSource;->setCharacterStream(Ljava/io/Reader;)V

    .line 63
    invoke-virtual {v2, v3}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v5

    .line 64
    invoke-interface {v5}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Element;->normalize()V

    .line 70
    const-string v2, "trackingInterval"

    invoke-interface {v5, v2}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 71
    if-eqz v2, :cond_4

    .line 72
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    move-object v4, v2

    .line 75
    :goto_0
    const-string v2, "setupCheckInterval"

    invoke-interface {v5, v2}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 76
    if-eqz v2, :cond_3

    .line 77
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    move-object v3, v2

    .line 80
    :goto_1
    const-string v2, "trackExternalErrors"

    invoke-interface {v5, v2}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    const/4 v5, 0x0

    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 81
    if-eqz v2, :cond_2

    .line 82
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, v6, v8

    if-nez v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    move-object v2, v0

    .line 85
    :goto_2
    if-eqz v4, :cond_1

    if-eqz v3, :cond_1

    if-eqz v2, :cond_1

    .line 86
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 87
    const-string v5, "reporting_interval"

    invoke-interface {v0, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    const-string v4, "check_status_interval"

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    const-string v3, "track_external_errors"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 102
    :goto_3
    return-object v0

    .line 96
    :catch_0
    move-exception v0

    .line 97
    throw v0

    .line 98
    :catch_1
    move-exception v0

    .line 99
    iget-object v2, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;->_logger:Lcom/adobe/primetime/core/ILogger;

    iget-object v3, p0, Lcom/adobe/primetime/va/plugins/ah/engine/network/SettingsParser;->_logTag:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "#parse() - Failed to parse configuration settings: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Lcom/adobe/primetime/core/ILogger;->warn(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    move-object v0, v1

    .line 102
    goto :goto_3

    :cond_2
    move-object v2, v1

    goto :goto_2

    :cond_3
    move-object v3, v1

    goto :goto_1

    :cond_4
    move-object v4, v1

    goto/16 :goto_0
.end method
