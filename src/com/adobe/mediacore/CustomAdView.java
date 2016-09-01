package com.adobe.mediacore;

import android.content.Context;
import android.os.Build.VERSION;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;

public class CustomAdView
  extends WebView
{
  private static final String JS_NAMESPACE = "Primetime";
  private static final String LOG_TAG = "[PSDK]::" + CustomAdView.class.getSimpleName();
  private String WEB_HTML = "<!DOCTYPE html><html lang=\"en\"><head> <meta charset=\"UTF-8\"> <meta name=\"viewport\" content=\"width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, target-densityDpi=device-dpi\"> <title>VPAIDHTML5Client</title> <style>iframe,video{border:0}body,html{margin:0}</style> <script type=\"text/javascript\">!function t(e,i,n){function o(s,c){if(!i[s]){if(!e[s]){var a=\"function\"==typeof require&&require;if(!c&&a)return a(s,!0);if(r)return r(s,!0);var u=new Error(\"Cannot find module '\"+s+\"'\");throw u.code=\"MODULE_NOT_FOUND\",u}var d=i[s]={exports:{}};e[s][0].call(d.exports,function(t){var i=e[s][1][t];return o(i?i:t)},d,d.exports,t,e,i,n)}return i[s].exports}for(var r=\"function\"==typeof require&&require,s=0;s<n.length;s++)o(n[s]);return o}({1:[function(t,e,i){\"use strict\";function n(t,e,i){}function o(t,e,i){Object.defineProperty(t,e,{writable:!1,configurable:!1,value:i})}var r=[\"handshakeVersion\",\"initAd\",\"startAd\",\"stopAd\",\"skipAd\",\"resizeAd\",\"pauseAd\",\"resumeAd\",\"expandAd\",\"collapseAd\",\"subscribe\",\"unsubscribe\"],s=[\"AdLoaded\",\"AdStarted\",\"AdStopped\",\"AdSkipped\",\"AdSkippableStateChange\",\"AdSizeChange\",\"AdLinearChange\",\"AdDurationChange\",\"AdExpandedChange\",\"AdRemainingTimeChange\",\"AdVolumeChange\",\"AdImpression\",\"AdVideoStart\",\"AdVideoFirstQuartile\",\"AdVideoMidpoint\",\"AdVideoThirdQuartile\",\"AdVideoComplete\",\"AdClickThru\",\"AdInteraction\",\"AdUserAcceptInvitation\",\"AdUserMinimize\",\"AdUserClose\",\"AdPaused\",\"AdPlaying\",\"AdLog\",\"AdError\"],c=[\"getAdLinear\",\"getAdWidth\",\"getAdHeight\",\"getAdExpanded\",\"getAdSkippableState\",\"getAdRemainingTime\",\"getAdDuration\",\"getAdVolume\",\"getAdCompanions\",\"getAdIcons\"],a=[\"setAdVolume\"];n.prototype.handshakeVersion=function(t,e){},n.prototype.initAd=function(t,e,i,n,o,r,s){},n.prototype.startAd=function(t){},n.prototype.stopAd=function(t){},n.prototype.skipAd=function(t){},n.prototype.resizeAd=function(t,e,i,n){},n.prototype.pauseAd=function(t){},n.prototype.resumeAd=function(t){},n.prototype.expandAd=function(t){},n.prototype.collapseAd=function(t){},n.prototype.subscribe=function(t,e,i){},n.prototype.unsubscribe=function(t,e){},n.prototype.getAdLinear=function(t){},n.prototype.getAdWidth=function(t){},n.prototype.getAdHeight=function(t){},n.prototype.getAdExpanded=function(t){},n.prototype.getAdSkippableState=function(t){},n.prototype.getAdRemainingTime=function(t){},n.prototype.getAdDuration=function(t){},n.prototype.getAdVolume=function(t){},n.prototype.getAdCompanions=function(t){},n.prototype.getAdIcons=function(t){},n.prototype.setAdVolume=function(t,e){},o(n,\"METHODS\",r),o(n,\"GETTERS\",c),o(n,\"SETTERS\",a),o(n,\"EVENTS\",s);var u=r.filter(function(t){return-1===[\"skipAd\"].indexOf(t)});o(n,\"checkVPAIDInterface\",function(t){var e=u.every(function(e){return\"function\"==typeof t[e]});return e}),e.exports=n},{}],2:[function(t,e,i){\"use strict\";function n(t,e,i,n){this._isValid=d(t),this._isValid&&(this._creative=t,this._el=e,this._videoEl=i,this._iframe=n,this._subscribers=new u,o.call(this))}function o(){if(h.forEach(function(t){this._creative.subscribe(s.bind(this,t),t)}.bind(this)),this._creative.subscribe(r.bind(this),f),this._videoEl){var t=this._iframe.contentDocument.documentElement,e=this._videoEl;t.addEventListener(\"click\",function(i){i.target===t&&e.click()})}}function r(t,e,i){this._subscribers.triggerSync(f,{url:t,id:e,playerHandles:i})}function s(t){this._subscribers.trigger(t,Array.prototype.slice(arguments,1))}function c(t,e,i,n){t?t(i,n):i&&e.trigger(l,i)}var a=t(\"./IVPAIDAdUnit\"),u=t(\"./subscriber\"),d=a.checkVPAIDInterface,p=t(\"./utils\"),l=(a.METHODS,\"AdError\"),f=\"AdClickThru\",h=a.EVENTS.filter(function(t){return t!=f});n.prototype=Object.create(a.prototype),n.prototype.isValidVPAIDAd=function(){return this._isValid},a.METHODS.forEach(function(t){var e=[\"subscribe\",\"unsubscribe\",\"initAd\"];-1===e.indexOf(t)&&(n.prototype[t]=function(){var e=a.prototype[t].length,i=Array.prototype.slice.call(arguments),n=e===i.length?i.pop():void 0;setTimeout(function(){var e,o=null;try{e=this._creative[t].apply(this._creative,i)}catch(r){o=r}c(n,this._subscribers,o,e)}.bind(this),0)})}),n.prototype.initAd=function(t,e,i,n,o,r,s){o=o||{},r=p.extend({slot:this._el,videoSlot:this._videoEl},r||{}),setTimeout(function(){var a;try{this._creative.initAd(t,e,i,n,o,r)}catch(u){a=u}c(s,this._subscribers,a)}.bind(this),0)},n.prototype.subscribe=function(t,e,i){this._subscribers.subscribe(e,t,i)},n.prototype.unsubscribe=function(t,e){this._subscribers.unsubscribe(e,t)},n.prototype.on=n.prototype.subscribe,n.prototype.off=n.prototype.unsubscribe,a.GETTERS.forEach(function(t){n.prototype[t]=function(e){setTimeout(function(){var i,n=null;try{i=this._creative[t]()}catch(o){n=o}c(e,this._subscribers,n,i)}.bind(this),0)}}),n.prototype.setAdVolume=function(t,e){setTimeout(function(){var i,n=null;try{this._creative.setAdVolume(t),i=this._creative.getAdVolume()}catch(o){n=o}n||(n=p.validate(i===t,\"failed to apply volume: \"+t)),c(e,this._subscribers,n,i)}.bind(this),0)},n.prototype._destroy=function(){this.stopAd(),this._subscribers.unsubscribeAll()},e.exports=n},{\"./IVPAIDAdUnit\":1,\"./subscriber\":4,\"./utils\":5}],3:[function(t,e,i){\"use strict\";function n(t,e,i,n){i=i||{},this._id=l(),this._destroyed=!1,this._frameContainer=p.createElementInEl(t,\"div\"),this._videoEl=e,this._vpaidOptions=n||{timeout:1e4},this._templateConfig={template:i.template||h,extraOptions:i.extraOptions||{}}}function o(t){var e=this[t];e&&(e.remove(),delete this[t])}function r(){c.call(this),delete this._adUnit}function s(){c.call(this),u.call(this)}function c(){o.call(this,\"_frame\"),a.call(this)}function a(){this._onLoad&&(window.removeEventListener(\"message\",this._onLoad),p.clearCallbackTimeout(this._onLoad),delete this._onLoad)}function u(){this._adUnit&&(this._adUnit.stopAd(),delete this._adUnit)}function d(){if(this._destroyed)throw new Error(\"VPAIDHTML5Client already destroyed!\")}var p=t(\"./utils\"),l=p.unique(\"vpaidIframe\"),f=t(\"./VPAIDAdUnit\"),h='<!DOCTYPE html>\\n<html lang=\"en\">\\n<head>\\n <meta charset=\"UTF-8\">\\n <style>\\n body{\\n margin: 0;\\n padding: 0;\\n}\\n </style>\\n</head>\\n<body>\\n <script type=\"text/javascript\" src=\"{{iframeURL_JS}}\"><\\/script>\\n <script>\\n parent.postMessage(\\'{\"event\": \"ready\", \"id\": \"{{iframeID}}\"}\\', window.location.origin);\\n <\\/script>\\n <div class=\"ad-element\">\\n </div>\\n</body>\\n</html>\\n',A=\"AdStopped\";n.prototype.destroy=function(){this._destroyed||(this._destroyed=!0,s.call(this))},n.prototype.isDestroyed=function(){return this._destroyed},n.prototype.loadAdUnit=function(t,e){d.call(this),s.call(this);var i=p.createIframeWithContent(this._frameContainer,this._templateConfig.template,p.extend({iframeURL_JS:t,iframeID:this.getID()},this._templateConfig.extraOptions));this._frame=i;var n,o,c,u=this;setTimeout(function(){if(u._frame.contentWindow?(c=u._frame.contentWindow.getVPAIDAd,o=p.validate(\"function\"==typeof c,\"the ad didn't return a function to create an ad\")):o=\"the iframe is not anymore in the DOM tree\",!o){var t=u._frame.contentWindow.document.querySelector(\".ad-element\");n=new f(c(),t,u._videoEl,u._frame),n.subscribe(A,r.bind(this)),o=p.validate(n.isValidVPAIDAd(),\"the add is not fully complaint with VPAID specification\")}u._adUnit=n,a.call(this),e(o,o?null:n)},3e3)},n.prototype.unloadAdUnit=function(){s.call(this)},n.prototype.getID=function(){return this._id},n.prototype.STATE={IDLE:0,READY:1,LOADED:2,STARTED:3},e.exports=n,window.VPAIDHTML5Client=n},{\"./VPAIDAdUnit\":2,\"./utils\":5}],4:[function(t,e,i){\"use strict\";function n(){this._subscribers={}}n.prototype.subscribe=function(t,e,i){this.get(e).push({handler:t,context:i})},n.prototype.unsubscribe=function(t,e){this._subscribers[e]=this.get(e).filter(function(e){return t===e.handler})},n.prototype.unsubscribeAll=function(){this._subscribers={}},n.prototype.trigger=function(t,e){var i=this;i.get(t).forEach(function(n){setTimeout(function(){i.get(t)&&n.handler.call(n.context,e)},0)})},n.prototype.triggerSync=function(t,e){this.get(t).forEach(function(t){t.handler.call(t.context,e)})},n.prototype.get=function(t){return this._subscribers[t]||(this._subscribers[t]=[]),this._subscribers[t]},e.exports=n},{}],5:[function(t,e,i){\"use strict\";function n(){}function o(t,e){return t?null:new Error(e)}function r(t){var e=h[t];e&&(clearTimeout(e),delete h[t])}function s(t,e,i){var o,s;return s=setTimeout(function(){e=n,delete s[o],i()},t),o=function(){e.apply(this,arguments)&&r(o)},h[o]=s,o}function c(t,e,i){var n=document.createElement(e);return i&&(n.id=i),t.appendChild(n),n}function a(t,e,i){var n=u(t);if(p(n,d(e,i)))return n}function u(t,e){var i=document.createElement(\"iframe\");return i.src=e||\"about:blank\",i.marginWidth=\"0\",i.marginHeight=\"0\",i.frameBorder=\"0\",i.width=\"100%%\",i.height=\"100%%\",i.style.position=\"absolute\",i.style.left=\"0\",i.style.top=\"0\",i.style.margin=\"0px\",i.style.padding=\"0px\",i.style.border=\"none\",i.setAttribute(\"SCROLLING\",\"NO\"),t.innerHTML=\"\",t.appendChild(i),i}function d(t,e){return Object.keys(e).forEach(function(i){var n=\"object\"==typeof n?JSON.stringify(e[i]):e[i];t=t.replace(new RegExp(\"{{\"+i+\"}}\",\"g\"),n)}),t}function p(t,e){var i=t.contentWindow&&t.contentWindow.document;return i?(i.write(e),!0):!1}function l(t,e){return Object.keys(e).forEach(function(i){t[i]=e[i]}),t}function f(t){var e=-1;return function(){return t+\"_\"+ ++e}}var h={};e.exports={noop:n,validate:o,clearCallbackTimeout:r,callbackTimeout:s,createElementInEl:c,createIframeWithContent:a,createIframe:u,simpleTemplate:d,setIframeContent:p,extend:l,unique:f}},{}]},{},[3]); </script></head><body> <div id=\"container\" style=\"position: relative;\"> <video id=\"myVideo\"> </video> <div id=\"myContent\" style=\"position: absolute; top: 0; left: 0; z-index: 1;\"></div></div><script>var PrimetimeJS=function(){function e(e,n){function r(){n.initAd(t.width,t.height,\"fullscreen\",t.bitrate,{AdParameters:s.adParameters},u,function(e){console.log(\"error?\",e)})}function d(){a=o.STATE.LOADED,i=n,n.startAd(function(){})}return e?void console.log(e):(a=o.STATE.READY,n.subscribe(\"AdLoaded\",d),[\"AdSizeChange\",\"AdLinearChange\",\"AdExpandedChange\",\"AdVolumeChange\",\"AdImpression\",\"AdVideoStart\",\"AdVideoFirstQuartile\",\"AdVideoMidpoint\",\"AdVideoThirdQuartile\",\"AdVideoComplete\",\"AdInteraction\",\"AdUserAcceptInvitation\",\"AdUserMinimize\",\"AdUserClose\"].forEach(function(e){n.subscribe(e,function(){Primetime[\"on\"+e]()})}),n.subscribe(\"AdError\",function(){clearInterval(m),Primetime.onAdError(\"AdError received from VPAID unit\")}),n.subscribe(\"AdDurationChange\",function(){n.getAdDuration(function(){})}),n.subscribe(\"AdPlaying\",function(){Primetime.onAdPlaying()}),n.subscribe(\"AdPaused\",function(){Primetime.onAdPaused()}),n.subscribe(\"AdSkippableStateChange\",function(){Primetime.onAdSkippableStateChange()}),n.subscribe(\"AdRemainingTimeChange\",function(){Primetime.onAdRemainingTimeChange(i._creative.getAdDuration(),i._creative.getAdRemainingTime())}),n.subscribe(\"AdSkipped\",function(){Primetime.onAdSkipped()}),n.subscribe(\"AdStopped\",function(){clearInterval(m),Primetime.onAdStopped(),console.log(\"---------------------------------------> AdStopped\",\"arguments:\",arguments)}),n.subscribe(\"AdClickThru\",function(e){Primetime.onAdClickThru(e.url,e.playerHandles)}),n.subscribe(\"AdStarted\",function(){a=o.STATE.STARTED,clearTimeout(c),m=setInterval(function(){var e=i._creative.getAdDuration(),t=i._creative.getAdRemainingTime();Primetime.onAdRemainingTimeChange(e,t)},500),Primetime.onAdStarted()}),void n.handshakeVersion(\"2.0\",r))}var i,t={width:%d,height:%d,bitrate:%d,url:\"%s\",parameters:\"%s\",timeout:%d},n=document.getElementById(\"container\"),r=document.getElementById(\"myContent\"),d=document.getElementById(\"myVideo\"),o=new VPAIDHTML5Client(r,null,{}),a=o.STATE.IDLE,s={},u={};u.videoSlot=d;var m;n.style.width=t.width+\"px\",n.style.height=t.height+\"px\",r.style.width=t.width+\"px\",r.style.height=t.height+\"px\",d.style.width=t.width+\"px\",d.style.height=t.height+\"px\",s.url=t.url,s.adParameters=t.parameters;var c=setTimeout(function(){switch(a){case o.STATE.IDLE:Primetime.onAdError(\"Timeout from loading VPAID asset\");break;case o.STATE.READY:Primetime.onAdError(\"Timeout from initAd\");break;case o.STATE.LOADED:Primetime.onAdError(\"Timeout from startAd\");break;default:Primetime.onAdError(\"Timeout\")}},t.timeout);return o.loadAdUnit(s.url,e),{setOptions:function(e,i,n,r,d,o){t.width=e,t.height=i,t.bitrate=n,t.url=r,t.parameters=d,t.timeout=o},pause:function(){i.pauseAd(function(){})},resume:function(){i.resumeAd(function(){})},resize:function(e,t){n.style.width=e+\"px\",n.style.height=t+\"px\",r.style.width=e+\"px\",r.style.height=t+\"px\",d.style.width=e+\"px\",d.style.height=t+\"px\",i.resizeAd(e,t,\"fullscreen\",function(){})}}}(); </script></body></html>";
  private long _bitrate = -1L;
  private String _customAdClient = "http://cdn.auditude.com/player/tvsdk/vpaid/2.0/vpaid.html";
  private CustomAdJSInterface _jsInterface = null;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private String _parameters = "";
  private MediaPlayer _player = null;
  private int _timeout = 10000;
  private String _url = "";
  private VideoEngineDispatcher _videoEngineDispatcher;
  
  public CustomAdView(VideoEngineDispatcher paramVideoEngineDispatcher, Context paramContext, MediaPlayer paramMediaPlayer)
  {
    super(paramContext);
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    _player = paramMediaPlayer;
    setVisibility(4);
    paramVideoEngineDispatcher = getSettings();
    paramVideoEngineDispatcher.setJavaScriptEnabled(true);
    paramVideoEngineDispatcher.setLoadWithOverviewMode(true);
    paramVideoEngineDispatcher.setUseWideViewPort(true);
    if (Build.VERSION.SDK_INT >= 17) {
      paramVideoEngineDispatcher.setMediaPlaybackRequiresUserGesture(false);
    }
    if (Build.VERSION.SDK_INT >= 19) {
      setWebContentsDebuggingEnabled(true);
    }
    setWebViewClient(new CustomAdView.1(this));
    setWebChromeClient(new CustomAdView.2(this));
    setScrollBarStyle(0);
    _jsInterface = new CustomAdJSInterface();
    _jsInterface.addEventListener(new CustomAdView.3(this));
    addJavascriptInterface(_jsInterface, "Primetime");
  }
  
  public boolean isActive()
  {
    return getVisibility() == 0;
  }
  
  public void onPause()
  {
    super.onPause();
    loadUrl("javascript:PrimetimeJS.pause()");
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    loadUrl("javascript:PrimetimeJS.resize(" + paramInt1 + ", " + paramInt2 + ")");
  }
  
  void playCustomAd(String paramString1, String paramString2)
  {
    if (paramString2 != null) {}
    for (;;)
    {
      try
      {
        paramString2 = paramString2.replaceAll("\"", "\\\\\"");
        _parameters = paramString2;
        loadData(String.format(WEB_HTML, new Object[] { Integer.valueOf(getWidth()), Integer.valueOf(getHeight()), Long.valueOf(_bitrate), paramString1, _parameters, Integer.valueOf(_timeout) }), "text/html", "utf-8");
        setVisibility(0);
        return;
      }
      catch (Exception paramString2)
      {
        _videoEngineDispatcher.dispatch(CustomAdEvent.createAdError("Error loading VPAID URL: " + paramString1 + "Parameters: " + "parameters"));
      }
      paramString2 = "";
    }
  }
  
  void reset()
  {
    setVisibility(4);
    loadUrl("about:blank");
  }
  
  void setBitrate(long paramLong)
  {
    _bitrate = paramLong;
  }
  
  void setCustomAdClient(String paramString)
  {
    _customAdClient = paramString;
  }
  
  void setTimeout(int paramInt)
  {
    _timeout = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */