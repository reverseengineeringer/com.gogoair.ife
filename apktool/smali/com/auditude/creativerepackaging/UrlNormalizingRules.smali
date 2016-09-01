.class public Lcom/auditude/creativerepackaging/UrlNormalizingRules;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/auditude/creativerepackaging/UrlNormalizingRules$UrlNormalizingRulesListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_TIMEOUT:I = 0x5

.field public static final NORMALIZE_RULES_URL:Ljava/lang/String; = "http://cdn2.auditude.com/crs/rules.xml"

.field private static instance:Lcom/auditude/creativerepackaging/UrlNormalizingRules;


# instance fields
.field private _loaded:Ljava/lang/Boolean;

.field private _loading:Ljava/lang/Boolean;

.field private dataLoader:Lcom/auditude/ads/loader/DataLoader;

.field private listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

.field private parser:Lorg/xmlpull/v1/XmlPullParser;

.field private rules:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loaded:Ljava/lang/Boolean;

    .line 36
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loading:Ljava/lang/Boolean;

    .line 37
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 45
    return-void
.end method

.method private dispatchLoaded(Ljava/lang/Boolean;)V
    .locals 2

    .prologue
    .line 223
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 227
    return-void

    .line 223
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/creativerepackaging/UrlNormalizingRules$UrlNormalizingRulesListener;

    .line 225
    invoke-interface {v0, p1}, Lcom/auditude/creativerepackaging/UrlNormalizingRules$UrlNormalizingRulesListener;->onRulesLoaded(Ljava/lang/Boolean;)V

    goto :goto_0
.end method

.method public static getInstance()Lcom/auditude/creativerepackaging/UrlNormalizingRules;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->instance:Lcom/auditude/creativerepackaging/UrlNormalizingRules;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;

    invoke-direct {v0}, Lcom/auditude/creativerepackaging/UrlNormalizingRules;-><init>()V

    sput-object v0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->instance:Lcom/auditude/creativerepackaging/UrlNormalizingRules;

    .line 32
    :cond_0
    sget-object v0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->instance:Lcom/auditude/creativerepackaging/UrlNormalizingRules;

    return-object v0
.end method

.method private parseCraterias()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x2

    .line 140
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move v0, v1

    .line 144
    :goto_0
    iget-object v3, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 145
    if-ne v0, v1, :cond_1

    .line 147
    const-string v0, "Domain"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    const-string v3, "\t"

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0

    .line 152
    :cond_1
    const/4 v4, 0x3

    if-ne v0, v4, :cond_0

    const-string v0, "Criteria"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    return-object v2
.end method

.method private parseRule()Lcom/auditude/creativerepackaging/Rule;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x2

    const/4 v0, 0x0

    .line 106
    move v3, v4

    move-object v1, v0

    move-object v2, v0

    .line 113
    :goto_0
    iget-object v5, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v5}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 114
    if-ne v3, v4, :cond_3

    .line 116
    const-string v3, "Find"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 118
    iget-object v2, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    const-string v3, "\t"

    const-string v5, ""

    invoke-virtual {v2, v3, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 133
    :cond_0
    :goto_1
    iget-object v3, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    goto :goto_0

    .line 120
    :cond_1
    const-string v3, "Replace"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 122
    iget-object v1, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    const-string v3, "\t"

    const-string v5, ""

    invoke-virtual {v1, v3, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 124
    :cond_2
    const-string v3, "Criteria"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 126
    invoke-direct {p0}, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parseCraterias()Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_1

    .line 129
    :cond_3
    const/4 v6, 0x3

    if-ne v3, v6, :cond_0

    const-string v3, "Rule"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 135
    new-instance v3, Lcom/auditude/creativerepackaging/Rule;

    invoke-direct {v3, v2, v1, v0}, Lcom/auditude/creativerepackaging/Rule;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    return-object v3
.end method


# virtual methods
.method public addEventListener(Lcom/auditude/creativerepackaging/UrlNormalizingRules$UrlNormalizingRulesListener;)V
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 232
    return-void
.end method

.method public getIsRulesLoaded()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loaded:Ljava/lang/Boolean;

    return-object v0
.end method

.method public loadRules()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 49
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->rules:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loaded:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loading:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    .line 51
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loading:Ljava/lang/Boolean;

    .line 53
    new-instance v0, Lcom/auditude/ads/loader/DataLoader;

    invoke-direct {v0}, Lcom/auditude/ads/loader/DataLoader;-><init>()V

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    .line 54
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    invoke-virtual {v0, p0}, Lcom/auditude/ads/loader/DataLoader;->setDataLoaderListener(Lcom/auditude/ads/loader/DataLoader$DataLoaderListener;)V

    .line 55
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    const-string v1, "http://cdn2.auditude.com/crs/rules.xml"

    const/4 v2, 0x0

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Lcom/auditude/ads/loader/DataLoader;->load(Ljava/lang/String;Ljava/lang/String;I)V

    .line 61
    :cond_0
    :goto_0
    return-void

    .line 57
    :cond_1
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loading:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->dispatchLoaded(Ljava/lang/Boolean;)V

    goto :goto_0
.end method

.method public normalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 163
    .line 166
    :try_start_0
    new-instance v3, Ljava/net/URI;

    invoke-direct {v3, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->rules:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->rules:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 176
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->rules:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 206
    :cond_1
    :goto_1
    return-object p1

    .line 176
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/auditude/creativerepackaging/Rule;

    .line 178
    iget-object v1, v0, Lcom/auditude/creativerepackaging/Rule;->replace:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/auditude/creativerepackaging/Rule;->find:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 181
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 182
    iget-object v2, v0, Lcom/auditude/creativerepackaging/Rule;->domains:Ljava/util/ArrayList;

    if-eqz v2, :cond_5

    iget-object v2, v0, Lcom/auditude/creativerepackaging/Rule;->domains:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_5

    .line 184
    iget-object v2, v0, Lcom/auditude/creativerepackaging/Rule;->domains:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-object v2, v1

    :cond_3
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4

    .line 197
    :goto_3
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 199
    iget-object v1, v0, Lcom/auditude/creativerepackaging/Rule;->find:Ljava/lang/String;

    .line 200
    iget-object v0, v0, Lcom/auditude/creativerepackaging/Rule;->replace:Ljava/lang/String;

    .line 201
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 184
    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 186
    invoke-virtual {v3}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 188
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    move-object v2, v1

    goto :goto_2

    .line 194
    :cond_5
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    goto :goto_3

    .line 168
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method public onRequestComplete(Ljava/lang/String;)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->dataLoader:Lcom/auditude/ads/loader/DataLoader;

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->rules:Ljava/util/ArrayList;

    .line 70
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    .line 72
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 74
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 75
    :goto_0
    if-ne v0, v4, :cond_0

    .line 99
    :goto_1
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loaded:Ljava/lang/Boolean;

    .line 100
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loading:Ljava/lang/Boolean;

    .line 101
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->dispatchLoaded(Ljava/lang/Boolean;)V

    .line 102
    return-void

    .line 77
    :cond_0
    packed-switch v0, :pswitch_data_0

    .line 92
    :cond_1
    :goto_2
    :try_start_1
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    goto :goto_0

    .line 80
    :pswitch_0
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parser:Lorg/xmlpull/v1/XmlPullParser;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 81
    const-string v1, "Rule"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 83
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->rules:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->parseRule()Lcom/auditude/creativerepackaging/Rule;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 95
    :catch_0
    move-exception v0

    .line 96
    const-string v1, "UrlNormalizingRules"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error Parsing : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 77
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public onRequestFailed(Ljava/lang/Throwable;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 211
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loaded:Ljava/lang/Boolean;

    .line 212
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->_loading:Ljava/lang/Boolean;

    .line 213
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->dispatchLoaded(Ljava/lang/Boolean;)V

    .line 214
    return-void
.end method

.method public removeEventListener(Lcom/auditude/creativerepackaging/UrlNormalizingRules$UrlNormalizingRulesListener;)V
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 237
    iget-object v0, p0, Lcom/auditude/creativerepackaging/UrlNormalizingRules;->listeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 239
    :cond_0
    return-void
.end method
