.class Lcom/adobe/mediacore/TimelineMonitor$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/adobe/mediacore/ContentMarkerListener;


# instance fields
.field final synthetic this$0:Lcom/adobe/mediacore/TimelineMonitor;


# direct methods
.method constructor <init>(Lcom/adobe/mediacore/TimelineMonitor;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/TimelineMonitor$2;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onContentMarker(IJ)V
    .locals 2

    iget-object v0, p0, Lcom/adobe/mediacore/TimelineMonitor$2;->this$0:Lcom/adobe/mediacore/TimelineMonitor;

    # invokes: Lcom/adobe/mediacore/TimelineMonitor;->contentChanged(IJ)V
    invoke-static {v0, p1, p2, p3}, Lcom/adobe/mediacore/TimelineMonitor;->access$000(Lcom/adobe/mediacore/TimelineMonitor;IJ)V

    return-void
.end method
