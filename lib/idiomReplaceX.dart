/**
 * how to inject https://inappwebview.dev/docs/javascript/injection/
 * 
 */
class IdiomReplaceX {

  static final clientScriptsBaseUrl = "https://bgbm14463lap/";
  static final filterServiceBaseUrl = "https://bgbm14463lap/service/";

  static jsInjectScript() {
    return "(function(d, clientScriptsBaseUrl, filterServiceBaseUrl) { " +
        " script = d.createElement('script');" +
        "    script.type = 'text/javascript';" +
        "    script.async = true;" +
        "    script.onload = function(){" +
        "        idiomReplacex.ui('" + clientScriptsBaseUrl +"');"
        "        idiomReplaceX.ui(clientScriptsBaseUrl);" +
        "        // idiomReplaceX.minWordThreshold = 2;" +
        "        idiomReplaceX.filterServiceBaseUrl = filterServiceBaseUrl; " +
        "        idiomReplaceX.extractTextBlocks(true);" +
        "        idiomReplaceX.requestForReplaceX();" +
        "    };" +
        "    script.src = " + clientScriptsBaseUrl + "'js/idiomReplaceX.js';" +
        "    d.getElementsByTagName('head')[0].appendChild(script);" +
        "}(document, 'https://bgbm14463lap/', 'https://bgbm14463lap/service/'));";
  }

  static jsTestScript() {
    return "(function(d, clientScriptsBaseUrl, filterServiceBaseUrl) { " +
        " d.body.style" +
        "}(document, 'https://bgbm14463lap/', 'https://bgbm14463lap/service/'));";

  }

}
