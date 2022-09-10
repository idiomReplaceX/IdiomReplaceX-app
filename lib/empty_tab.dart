import 'package:flutter/material.dart';
import 'package:flutter_browser/webview_tab.dart';
import 'package:provider/provider.dart';

import 'models/browser_model.dart';
import 'models/webview_model.dart';

class EmptyTab extends StatefulWidget {
  EmptyTab({Key? key}) : super(key: key);

  @override
  _EmptyTabState createState() => _EmptyTabState();
}

class _EmptyTabState extends State<EmptyTab> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var browserModel = Provider.of<BrowserModel>(context, listen: false);
    //var settings = browserModel.getSettings();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30,),
            Text("IdiomReplaceX",
              style: TextStyle(color: Colors.black, fontSize: 30.0,),
            ),
            SizedBox(height: 18,),
            Image(image: AssetImage('assets/images/idiomscreen2x.png')),
            SizedBox(height: 18,),
            Text("Literarische Filter für das Internet",
              style: TextStyle(color: Colors.black, fontSize: 18.0,),
            ),
            SizedBox(height: 18,),
            Text("IdiomReplaceX ist ein Kunstprojekt zur literarischen Bearbeitung "
                "von Webseiten. Über eine App können literarische Filter auf "
                "beliebige Webseiten angewendet werden. Wie sieht ihre "
                "Lieblingsseite wohl mit dem Filter \"Weichspüler\" aus?",
              style: TextStyle(color: Colors.black, fontSize: 12.0,),
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    openNewTab(value);
                  },
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    hintText: "Suche oder Eingabe einer Webadresse",
                    hintStyle: TextStyle(
                        color: Colors.black54, fontSize: 18.0),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 18.0,),
                )),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.black54, size: 25.0),
                  onPressed: () {
                    openNewTab(_controller.text);
                    FocusScope.of(context).unfocus();
                  },
                )
              ],
            ),
          ],
          )
        ),
      ),
    );
  }

  void openNewTab(value) {
    var browserModel = Provider.of<BrowserModel>(context, listen: false);
    var settings = browserModel.getSettings();

    browserModel.addTab(WebViewTab(
      key: GlobalKey(),
      webViewModel: WebViewModel(
          url: Uri.parse(value.startsWith("http") ? value : settings.searchEngine.searchUrl + value)
      ),
    ));
  }
}