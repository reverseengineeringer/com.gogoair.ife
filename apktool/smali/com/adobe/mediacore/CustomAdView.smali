.class public Lcom/adobe/mediacore/CustomAdView;
.super Landroid/webkit/WebView;


# static fields
.field private static final JS_NAMESPACE:Ljava/lang/String; = "Primetime"

.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private WEB_HTML:Ljava/lang/String;

.field private _bitrate:J

.field private _customAdClient:Ljava/lang/String;

.field private _jsInterface:Lcom/adobe/mediacore/CustomAdJSInterface;

.field private final _logger:Lcom/adobe/mediacore/logging/Logger;

.field private _parameters:Ljava/lang/String;

.field private _player:Lcom/adobe/mediacore/MediaPlayer;

.field private _timeout:I

.field private _url:Ljava/lang/String;

.field private _videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[PSDK]::"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/adobe/mediacore/CustomAdView;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/mediacore/CustomAdView;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/adobe/mediacore/VideoEngineDispatcher;Landroid/content/Context;Lcom/adobe/mediacore/MediaPlayer;)V
    .locals 5

    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    invoke-direct {p0, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    sget-object v0, Lcom/adobe/mediacore/CustomAdView;->LOG_TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/adobe/mediacore/logging/Log;->getLogger(Ljava/lang/String;)Lcom/adobe/mediacore/logging/Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_logger:Lcom/adobe/mediacore/logging/Logger;

    iput-object v1, p0, Lcom/adobe/mediacore/CustomAdView;->_player:Lcom/adobe/mediacore/MediaPlayer;

    iput-object v1, p0, Lcom/adobe/mediacore/CustomAdView;->_jsInterface:Lcom/adobe/mediacore/CustomAdJSInterface;

    const-string v0, "http://cdn.auditude.com/player/tvsdk/vpaid/2.0/vpaid.html"

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_customAdClient:Ljava/lang/String;

    const/16 v0, 0x2710

    iput v0, p0, Lcom/adobe/mediacore/CustomAdView;->_timeout:I

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/mediacore/CustomAdView;->_bitrate:J

    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_parameters:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_url:Ljava/lang/String;

    const-string v0, "<!DOCTYPE html><html lang=\"en\"><head> <meta charset=\"UTF-8\"> <meta name=\"viewport\" content=\"width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, target-densityDpi=device-dpi\"> <title>VPAIDHTML5Client</title> <style>iframe,video{border:0}body,html{margin:0}</style> <script type=\"text/javascript\">!function t(e,i,n){function o(s,c){if(!i[s]){if(!e[s]){var a=\"function\"==typeof require&&require;if(!c&&a)return a(s,!0);if(r)return r(s,!0);var u=new Error(\"Cannot find module \'\"+s+\"\'\");throw u.code=\"MODULE_NOT_FOUND\",u}var d=i[s]={exports:{}};e[s][0].call(d.exports,function(t){var i=e[s][1][t];return o(i?i:t)},d,d.exports,t,e,i,n)}return i[s].exports}for(var r=\"function\"==typeof require&&require,s=0;s<n.length;s++)o(n[s]);return o}({1:[function(t,e,i){\"use strict\";function n(t,e,i){}function o(t,e,i){Object.defineProperty(t,e,{writable:!1,configurable:!1,value:i})}var r=[\"handshakeVersion\",\"initAd\",\"startAd\",\"stopAd\",\"skipAd\",\"resizeAd\",\"pauseAd\",\"resumeAd\",\"expandAd\",\"collapseAd\",\"subscribe\",\"unsubscribe\"],s=[\"AdLoaded\",\"AdStarted\",\"AdStopped\",\"AdSkipped\",\"AdSkippableStateChange\",\"AdSizeChange\",\"AdLinearChange\",\"AdDurationChange\",\"AdExpandedChange\",\"AdRemainingTimeChange\",\"AdVolumeChange\",\"AdImpression\",\"AdVideoStart\",\"AdVideoFirstQuartile\",\"AdVideoMidpoint\",\"AdVideoThirdQuartile\",\"AdVideoComplete\",\"AdClickThru\",\"AdInteraction\",\"AdUserAcceptInvitation\",\"AdUserMinimize\",\"AdUserClose\",\"AdPaused\",\"AdPlaying\",\"AdLog\",\"AdError\"],c=[\"getAdLinear\",\"getAdWidth\",\"getAdHeight\",\"getAdExpanded\",\"getAdSkippableState\",\"getAdRemainingTime\",\"getAdDuration\",\"getAdVolume\",\"getAdCompanions\",\"getAdIcons\"],a=[\"setAdVolume\"];n.prototype.handshakeVersion=function(t,e){},n.prototype.initAd=function(t,e,i,n,o,r,s){},n.prototype.startAd=function(t){},n.prototype.stopAd=function(t){},n.prototype.skipAd=function(t){},n.prototype.resizeAd=function(t,e,i,n){},n.prototype.pauseAd=function(t){},n.prototype.resumeAd=function(t){},n.prototype.expandAd=function(t){},n.prototype.collapseAd=function(t){},n.prototype.subscribe=function(t,e,i){},n.prototype.unsubscribe=function(t,e){},n.prototype.getAdLinear=function(t){},n.prototype.getAdWidth=function(t){},n.prototype.getAdHeight=function(t){},n.prototype.getAdExpanded=function(t){},n.prototype.getAdSkippableState=function(t){},n.prototype.getAdRemainingTime=function(t){},n.prototype.getAdDuration=function(t){},n.prototype.getAdVolume=function(t){},n.prototype.getAdCompanions=function(t){},n.prototype.getAdIcons=function(t){},n.prototype.setAdVolume=function(t,e){},o(n,\"METHODS\",r),o(n,\"GETTERS\",c),o(n,\"SETTERS\",a),o(n,\"EVENTS\",s);var u=r.filter(function(t){return-1===[\"skipAd\"].indexOf(t)});o(n,\"checkVPAIDInterface\",function(t){var e=u.every(function(e){return\"function\"==typeof t[e]});return e}),e.exports=n},{}],2:[function(t,e,i){\"use strict\";function n(t,e,i,n){this._isValid=d(t),this._isValid&&(this._creative=t,this._el=e,this._videoEl=i,this._iframe=n,this._subscribers=new u,o.call(this))}function o(){if(h.forEach(function(t){this._creative.subscribe(s.bind(this,t),t)}.bind(this)),this._creative.subscribe(r.bind(this),f),this._videoEl){var t=this._iframe.contentDocument.documentElement,e=this._videoEl;t.addEventListener(\"click\",function(i){i.target===t&&e.click()})}}function r(t,e,i){this._subscribers.triggerSync(f,{url:t,id:e,playerHandles:i})}function s(t){this._subscribers.trigger(t,Array.prototype.slice(arguments,1))}function c(t,e,i,n){t?t(i,n):i&&e.trigger(l,i)}var a=t(\"./IVPAIDAdUnit\"),u=t(\"./subscriber\"),d=a.checkVPAIDInterface,p=t(\"./utils\"),l=(a.METHODS,\"AdError\"),f=\"AdClickThru\",h=a.EVENTS.filter(function(t){return t!=f});n.prototype=Object.create(a.prototype),n.prototype.isValidVPAIDAd=function(){return this._isValid},a.METHODS.forEach(function(t){var e=[\"subscribe\",\"unsubscribe\",\"initAd\"];-1===e.indexOf(t)&&(n.prototype[t]=function(){var e=a.prototype[t].length,i=Array.prototype.slice.call(arguments),n=e===i.length?i.pop():void 0;setTimeout(function(){var e,o=null;try{e=this._creative[t].apply(this._creative,i)}catch(r){o=r}c(n,this._subscribers,o,e)}.bind(this),0)})}),n.prototype.initAd=function(t,e,i,n,o,r,s){o=o||{},r=p.extend({slot:this._el,videoSlot:this._videoEl},r||{}),setTimeout(function(){var a;try{this._creative.initAd(t,e,i,n,o,r)}catch(u){a=u}c(s,this._subscribers,a)}.bind(this),0)},n.prototype.subscribe=function(t,e,i){this._subscribers.subscribe(e,t,i)},n.prototype.unsubscribe=function(t,e){this._subscribers.unsubscribe(e,t)},n.prototype.on=n.prototype.subscribe,n.prototype.off=n.prototype.unsubscribe,a.GETTERS.forEach(function(t){n.prototype[t]=function(e){setTimeout(function(){var i,n=null;try{i=this._creative[t]()}catch(o){n=o}c(e,this._subscribers,n,i)}.bind(this),0)}}),n.prototype.setAdVolume=function(t,e){setTimeout(function(){var i,n=null;try{this._creative.setAdVolume(t),i=this._creative.getAdVolume()}catch(o){n=o}n||(n=p.validate(i===t,\"failed to apply volume: \"+t)),c(e,this._subscribers,n,i)}.bind(this),0)},n.prototype._destroy=function(){this.stopAd(),this._subscribers.unsubscribeAll()},e.exports=n},{\"./IVPAIDAdUnit\":1,\"./subscriber\":4,\"./utils\":5}],3:[function(t,e,i){\"use strict\";function n(t,e,i,n){i=i||{},this._id=l(),this._destroyed=!1,this._frameContainer=p.createElementInEl(t,\"div\"),this._videoEl=e,this._vpaidOptions=n||{timeout:1e4},this._templateConfig={template:i.template||h,extraOptions:i.extraOptions||{}}}function o(t){var e=this[t];e&&(e.remove(),delete this[t])}function r(){c.call(this),delete this._adUnit}function s(){c.call(this),u.call(this)}function c(){o.call(this,\"_frame\"),a.call(this)}function a(){this._onLoad&&(window.removeEventListener(\"message\",this._onLoad),p.clearCallbackTimeout(this._onLoad),delete this._onLoad)}function u(){this._adUnit&&(this._adUnit.stopAd(),delete this._adUnit)}function d(){if(this._destroyed)throw new Error(\"VPAIDHTML5Client already destroyed!\")}var p=t(\"./utils\"),l=p.unique(\"vpaidIframe\"),f=t(\"./VPAIDAdUnit\"),h=\'<!DOCTYPE html>\\n<html lang=\"en\">\\n<head>\\n <meta charset=\"UTF-8\">\\n <style>\\n body{\\n margin: 0;\\n padding: 0;\\n}\\n </style>\\n</head>\\n<body>\\n <script type=\"text/javascript\" src=\"{{iframeURL_JS}}\"><\\/script>\\n <script>\\n parent.postMessage(\\\'{\"event\": \"ready\", \"id\": \"{{iframeID}}\"}\\\', window.location.origin);\\n <\\/script>\\n <div class=\"ad-element\">\\n </div>\\n</body>\\n</html>\\n\',A=\"AdStopped\";n.prototype.destroy=function(){this._destroyed||(this._destroyed=!0,s.call(this))},n.prototype.isDestroyed=function(){return this._destroyed},n.prototype.loadAdUnit=function(t,e){d.call(this),s.call(this);var i=p.createIframeWithContent(this._frameContainer,this._templateConfig.template,p.extend({iframeURL_JS:t,iframeID:this.getID()},this._templateConfig.extraOptions));this._frame=i;var n,o,c,u=this;setTimeout(function(){if(u._frame.contentWindow?(c=u._frame.contentWindow.getVPAIDAd,o=p.validate(\"function\"==typeof c,\"the ad didn\'t return a function to create an ad\")):o=\"the iframe is not anymore in the DOM tree\",!o){var t=u._frame.contentWindow.document.querySelector(\".ad-element\");n=new f(c(),t,u._videoEl,u._frame),n.subscribe(A,r.bind(this)),o=p.validate(n.isValidVPAIDAd(),\"the add is not fully complaint with VPAID specification\")}u._adUnit=n,a.call(this),e(o,o?null:n)},3e3)},n.prototype.unloadAdUnit=function(){s.call(this)},n.prototype.getID=function(){return this._id},n.prototype.STATE={IDLE:0,READY:1,LOADED:2,STARTED:3},e.exports=n,window.VPAIDHTML5Client=n},{\"./VPAIDAdUnit\":2,\"./utils\":5}],4:[function(t,e,i){\"use strict\";function n(){this._subscribers={}}n.prototype.subscribe=function(t,e,i){this.get(e).push({handler:t,context:i})},n.prototype.unsubscribe=function(t,e){this._subscribers[e]=this.get(e).filter(function(e){return t===e.handler})},n.prototype.unsubscribeAll=function(){this._subscribers={}},n.prototype.trigger=function(t,e){var i=this;i.get(t).forEach(function(n){setTimeout(function(){i.get(t)&&n.handler.call(n.context,e)},0)})},n.prototype.triggerSync=function(t,e){this.get(t).forEach(function(t){t.handler.call(t.context,e)})},n.prototype.get=function(t){return this._subscribers[t]||(this._subscribers[t]=[]),this._subscribers[t]},e.exports=n},{}],5:[function(t,e,i){\"use strict\";function n(){}function o(t,e){return t?null:new Error(e)}function r(t){var e=h[t];e&&(clearTimeout(e),delete h[t])}function s(t,e,i){var o,s;return s=setTimeout(function(){e=n,delete s[o],i()},t),o=function(){e.apply(this,arguments)&&r(o)},h[o]=s,o}function c(t,e,i){var n=document.createElement(e);return i&&(n.id=i),t.appendChild(n),n}function a(t,e,i){var n=u(t);if(p(n,d(e,i)))return n}function u(t,e){var i=document.createElement(\"iframe\");return i.src=e||\"about:blank\",i.marginWidth=\"0\",i.marginHeight=\"0\",i.frameBorder=\"0\",i.width=\"100%%\",i.height=\"100%%\",i.style.position=\"absolute\",i.style.left=\"0\",i.style.top=\"0\",i.style.margin=\"0px\",i.style.padding=\"0px\",i.style.border=\"none\",i.setAttribute(\"SCROLLING\",\"NO\"),t.innerHTML=\"\",t.appendChild(i),i}function d(t,e){return Object.keys(e).forEach(function(i){var n=\"object\"==typeof n?JSON.stringify(e[i]):e[i];t=t.replace(new RegExp(\"{{\"+i+\"}}\",\"g\"),n)}),t}function p(t,e){var i=t.contentWindow&&t.contentWindow.document;return i?(i.write(e),!0):!1}function l(t,e){return Object.keys(e).forEach(function(i){t[i]=e[i]}),t}function f(t){var e=-1;return function(){return t+\"_\"+ ++e}}var h={};e.exports={noop:n,validate:o,clearCallbackTimeout:r,callbackTimeout:s,createElementInEl:c,createIframeWithContent:a,createIframe:u,simpleTemplate:d,setIframeContent:p,extend:l,unique:f}},{}]},{},[3]); </script></head><body> <div id=\"container\" style=\"position: relative;\"> <video id=\"myVideo\"> </video> <div id=\"myContent\" style=\"position: absolute; top: 0; left: 0; z-index: 1;\"></div></div><script>var PrimetimeJS=function(){function e(e,n){function r(){n.initAd(t.width,t.height,\"fullscreen\",t.bitrate,{AdParameters:s.adParameters},u,function(e){console.log(\"error?\",e)})}function d(){a=o.STATE.LOADED,i=n,n.startAd(function(){})}return e?void console.log(e):(a=o.STATE.READY,n.subscribe(\"AdLoaded\",d),[\"AdSizeChange\",\"AdLinearChange\",\"AdExpandedChange\",\"AdVolumeChange\",\"AdImpression\",\"AdVideoStart\",\"AdVideoFirstQuartile\",\"AdVideoMidpoint\",\"AdVideoThirdQuartile\",\"AdVideoComplete\",\"AdInteraction\",\"AdUserAcceptInvitation\",\"AdUserMinimize\",\"AdUserClose\"].forEach(function(e){n.subscribe(e,function(){Primetime[\"on\"+e]()})}),n.subscribe(\"AdError\",function(){clearInterval(m),Primetime.onAdError(\"AdError received from VPAID unit\")}),n.subscribe(\"AdDurationChange\",function(){n.getAdDuration(function(){})}),n.subscribe(\"AdPlaying\",function(){Primetime.onAdPlaying()}),n.subscribe(\"AdPaused\",function(){Primetime.onAdPaused()}),n.subscribe(\"AdSkippableStateChange\",function(){Primetime.onAdSkippableStateChange()}),n.subscribe(\"AdRemainingTimeChange\",function(){Primetime.onAdRemainingTimeChange(i._creative.getAdDuration(),i._creative.getAdRemainingTime())}),n.subscribe(\"AdSkipped\",function(){Primetime.onAdSkipped()}),n.subscribe(\"AdStopped\",function(){clearInterval(m),Primetime.onAdStopped(),console.log(\"---------------------------------------> AdStopped\",\"arguments:\",arguments)}),n.subscribe(\"AdClickThru\",function(e){Primetime.onAdClickThru(e.url,e.playerHandles)}),n.subscribe(\"AdStarted\",function(){a=o.STATE.STARTED,clearTimeout(c),m=setInterval(function(){var e=i._creative.getAdDuration(),t=i._creative.getAdRemainingTime();Primetime.onAdRemainingTimeChange(e,t)},500),Primetime.onAdStarted()}),void n.handshakeVersion(\"2.0\",r))}var i,t={width:%d,height:%d,bitrate:%d,url:\"%s\",parameters:\"%s\",timeout:%d},n=document.getElementById(\"container\"),r=document.getElementById(\"myContent\"),d=document.getElementById(\"myVideo\"),o=new VPAIDHTML5Client(r,null,{}),a=o.STATE.IDLE,s={},u={};u.videoSlot=d;var m;n.style.width=t.width+\"px\",n.style.height=t.height+\"px\",r.style.width=t.width+\"px\",r.style.height=t.height+\"px\",d.style.width=t.width+\"px\",d.style.height=t.height+\"px\",s.url=t.url,s.adParameters=t.parameters;var c=setTimeout(function(){switch(a){case o.STATE.IDLE:Primetime.onAdError(\"Timeout from loading VPAID asset\");break;case o.STATE.READY:Primetime.onAdError(\"Timeout from initAd\");break;case o.STATE.LOADED:Primetime.onAdError(\"Timeout from startAd\");break;default:Primetime.onAdError(\"Timeout\")}},t.timeout);return o.loadAdUnit(s.url,e),{setOptions:function(e,i,n,r,d,o){t.width=e,t.height=i,t.bitrate=n,t.url=r,t.parameters=d,t.timeout=o},pause:function(){i.pauseAd(function(){})},resume:function(){i.resumeAd(function(){})},resize:function(e,t){n.style.width=e+\"px\",n.style.height=t+\"px\",r.style.width=e+\"px\",r.style.height=t+\"px\",d.style.width=e+\"px\",d.style.height=t+\"px\",i.resizeAd(e,t,\"fullscreen\",function(){})}}}(); </script></body></html>"

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->WEB_HTML:Ljava/lang/String;

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    iput-object p3, p0, Lcom/adobe/mediacore/CustomAdView;->_player:Lcom/adobe/mediacore/MediaPlayer;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/CustomAdView;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/adobe/mediacore/CustomAdView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_0

    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1

    invoke-static {v3}, Lcom/adobe/mediacore/CustomAdView;->setWebContentsDebuggingEnabled(Z)V

    :cond_1
    new-instance v0, Lcom/adobe/mediacore/CustomAdView$1;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/CustomAdView$1;-><init>(Lcom/adobe/mediacore/CustomAdView;)V

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/CustomAdView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    new-instance v0, Lcom/adobe/mediacore/CustomAdView$2;

    invoke-direct {v0, p0}, Lcom/adobe/mediacore/CustomAdView$2;-><init>(Lcom/adobe/mediacore/CustomAdView;)V

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/CustomAdView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    invoke-virtual {p0, v4}, Lcom/adobe/mediacore/CustomAdView;->setScrollBarStyle(I)V

    new-instance v0, Lcom/adobe/mediacore/CustomAdJSInterface;

    invoke-direct {v0}, Lcom/adobe/mediacore/CustomAdJSInterface;-><init>()V

    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_jsInterface:Lcom/adobe/mediacore/CustomAdJSInterface;

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_jsInterface:Lcom/adobe/mediacore/CustomAdJSInterface;

    new-instance v1, Lcom/adobe/mediacore/CustomAdView$3;

    invoke-direct {v1, p0}, Lcom/adobe/mediacore/CustomAdView$3;-><init>(Lcom/adobe/mediacore/CustomAdView;)V

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/CustomAdJSInterface;->addEventListener(Lcom/adobe/mediacore/CustomAdJSInterface$JSEventListener;)V

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_jsInterface:Lcom/adobe/mediacore/CustomAdJSInterface;

    const-string v1, "Primetime"

    invoke-virtual {p0, v0, v1}, Lcom/adobe/mediacore/CustomAdView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/VideoEngineDispatcher;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/adobe/mediacore/CustomAdView;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/mediacore/CustomAdView;)Lcom/adobe/mediacore/logging/Logger;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_logger:Lcom/adobe/mediacore/logging/Logger;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/mediacore/CustomAdView;)J
    .locals 2

    iget-wide v0, p0, Lcom/adobe/mediacore/CustomAdView;->_bitrate:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/adobe/mediacore/CustomAdView;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_url:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/mediacore/CustomAdView;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_parameters:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/mediacore/CustomAdView;)I
    .locals 1

    iget v0, p0, Lcom/adobe/mediacore/CustomAdView;->_timeout:I

    return v0
.end method


# virtual methods
.method public isActive()Z
    .locals 1

    invoke-virtual {p0}, Lcom/adobe/mediacore/CustomAdView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Landroid/webkit/WebView;->onPause()V

    const-string v0, "javascript:PrimetimeJS.pause()"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/CustomAdView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 2

    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebView;->onSizeChanged(IIII)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:PrimetimeJS.resize("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/CustomAdView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method playCustomAd(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    if-eqz p2, :cond_0

    :try_start_0
    const-string v0, "\""

    const-string v1, "\\\\\""

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_parameters:Ljava/lang/String;

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->WEB_HTML:Ljava/lang/String;

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/adobe/mediacore/CustomAdView;->getWidth()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/adobe/mediacore/CustomAdView;->getHeight()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-wide v4, p0, Lcom/adobe/mediacore/CustomAdView;->_bitrate:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object p1, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/adobe/mediacore/CustomAdView;->_parameters:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget v3, p0, Lcom/adobe/mediacore/CustomAdView;->_timeout:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "text/html"

    const-string v2, "utf-8"

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/mediacore/CustomAdView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/CustomAdView;->setVisibility(I)V

    :goto_1
    return-void

    :cond_0
    const-string v0, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/adobe/mediacore/CustomAdView;->_videoEngineDispatcher:Lcom/adobe/mediacore/VideoEngineDispatcher;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error loading VPAID URL: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Parameters: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "parameters"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/mediacore/CustomAdEvent;->createAdError(Ljava/lang/String;)Lcom/adobe/mediacore/CustomAdEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/mediacore/VideoEngineDispatcher;->dispatch(Lcom/adobe/mediacore/MediaPlayerEvent;)V

    goto :goto_1
.end method

.method reset()V
    .locals 1

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/CustomAdView;->setVisibility(I)V

    const-string v0, "about:blank"

    invoke-virtual {p0, v0}, Lcom/adobe/mediacore/CustomAdView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method setBitrate(J)V
    .locals 1

    iput-wide p1, p0, Lcom/adobe/mediacore/CustomAdView;->_bitrate:J

    return-void
.end method

.method setCustomAdClient(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/mediacore/CustomAdView;->_customAdClient:Ljava/lang/String;

    return-void
.end method

.method setTimeout(I)V
    .locals 0

    iput p1, p0, Lcom/adobe/mediacore/CustomAdView;->_timeout:I

    return-void
.end method
