/* share42.com | 28.05.2014 | (c) Dimox */
(function($){$(function(){$('div.share42init').each(function(idx){var el=$(this),u=el.attr('data-url'),t=el.attr('data-title'),i=el.attr('data-image'),d=el.attr('data-description'),f=el.attr('data-path'),fn=el.attr('data-icons-file'),z=el.attr("data-zero-counter");if(!u)u=location.href;if(!fn)fn='icons.png';if(!z)z=0;if(!f){function path(name){var sc=document.getElementsByTagName('script'),sr=new RegExp('^(.*/|)('+name+')([#?]|$)');for(var p=0,scL=sc.length;p<scL;p++){var m=String(sc[p].src).match(sr);if(m){if(m[1].match(/^((https?|file)\:\/{2,}|\w:[\/\\])/))return m[1];if(m[1].indexOf("/")==0)return m[1];b=document.getElementsByTagName('base');if(b[0]&&b[0].href)return b[0].href+m[1];else return document.location.pathname.match(/(.*[\/\\])/)[0]+m[1];}}return null;}f=path('share42.js');}if(!t)t=document.title;if(!d){var meta=$('meta[name="description"]').attr('content');if(meta!==undefined)d=meta;else d='';}u=encodeURIComponent(u);t=encodeURIComponent(t);t=t.replace(/\'/g,'%27');i=encodeURIComponent(i);d=encodeURIComponent(d);d=d.replace(/\'/g,'%27');var fbQuery='u='+u;if(i!='null'&&i!='')fbQuery='s=100&p[url]='+u+'&p[title]='+t+'&p[summary]='+d+'&p[images][0]='+i;var s=new Array('"#" data-count="fb" onclick="window.open(\'http://www.facebook.com/sharer.php?m2w&'+fbQuery+'\', \'_blank\', \'scrollbars=0, resizable=1, menubar=0, left=100, top=100, width=550, height=440, toolbar=0, status=0\');return false" title="Share on Facebook"','"#" data-count="gplus" onclick="window.open(\'https://plus.google.com/share?url='+u+'\', \'_blank\', \'scrollbars=0, resizable=1, menubar=0, left=100, top=100, width=550, height=440, toolbar=0, status=0\');return false" title="Share on Google+"','"#" data-count="lnkd" onclick="window.open(\'http://www.linkedin.com/shareArticle?mini=true&url='+u+'&title='+t+'\', \'_blank\', \'scrollbars=0, resizable=1, menubar=0, left=100, top=100, width=600, height=400, toolbar=0, status=0\');return false" title="Share on Linkedin"','"#" data-count="pin" onclick="window.open(\'http://pinterest.com/pin/create/button/?url='+u+'&media='+i+'&description='+t+'\', \'_blank\', \'scrollbars=0, resizable=1, menubar=0, left=100, top=100, width=600, height=300, toolbar=0, status=0\');return false" title="Pin It"','"#" onclick="window.open(\'http://www.tumblr.com/share?v=3&u='+u+'&t='+t+'&s='+d+'\', \'_blank\', \'scrollbars=0, resizable=1, menubar=0, left=100, top=100, width=450, height=440, toolbar=0, status=0\');return false" title="Share on Tumblr"','"#" data-count="twi" onclick="window.open(\'https://twitter.com/intent/tweet?text='+t+'&url='+u+'\', \'_blank\', \'scrollbars=0, resizable=1, menubar=0, left=100, top=100, width=550, height=440, toolbar=0, status=0\');return false" title="Share on Twitter"','"" onclick="return fav(this);" title="Save to Browser Favorites"','"#" onclick="print();return false" title="Print"');var l='';for(j=0;j<s.length;j++)l+='<span class="share42-item" style="display:inline-block;margin:0 6px 6px 0;height:16px;"><a rel="nofollow" style="display:inline-block;width:16px;height:16px;margin:0;padding:0;outline:none;background:url('+f+fn+') -'+16*j+'px 0 no-repeat" href='+s[j]+' target="_blank"></a></span>';el.html('<span id="share42">'+l+'</span>'+'');})})})(jQuery);function fav(a){var title=document.title;var url=document.location;try{window.external.AddFavorite(url,title);}catch(e){try{window.sidebar.addPanel(title,url,'');}catch(e){if(typeof(opera)=='object'||window.sidebar){a.rel='sidebar';a.title=title;a.url=url;a.href=url;return true;}else{alert('Press Ctrl-D to add the page to browser favorites');}}}return false;};