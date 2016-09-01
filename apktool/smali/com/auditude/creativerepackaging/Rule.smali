.class Lcom/auditude/creativerepackaging/Rule;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public domains:Ljava/util/ArrayList;

.field public find:Ljava/lang/String;

.field public replace:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 1

    .prologue
    .line 253
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 252
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/auditude/creativerepackaging/Rule;->domains:Ljava/util/ArrayList;

    .line 255
    iput-object p1, p0, Lcom/auditude/creativerepackaging/Rule;->find:Ljava/lang/String;

    .line 256
    iput-object p2, p0, Lcom/auditude/creativerepackaging/Rule;->replace:Ljava/lang/String;

    .line 257
    iput-object p3, p0, Lcom/auditude/creativerepackaging/Rule;->domains:Ljava/util/ArrayList;

    .line 258
    return-void
.end method
