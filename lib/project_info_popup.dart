import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_browser/models/browser_model.dart';
import 'package:flutter_browser/models/webview_model.dart';
import 'package:flutter_browser/webview_tab.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'animated_flutter_browser_logo.dart';

class ProjectInfoPopup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProjectInfoPopupState();
}

class _ProjectInfoPopupState extends State<ProjectInfoPopup> {

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      RichText(
        text: TextSpan(
            children: [
              TextSpan(
                text: "The IdiomReplaceX Browser App is a special browser app from "
                    "the net art project IdiomReplaceX. An art project founded as"
                    " contribution to the UNESCO City of Media Arts Karlsruhe: ",
                style: TextStyle(color: Colors.black),

              ),
              TextSpan(
                text: "https://www.cityofmediaarts.de",
                style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      String url = "https://www.cityofmediaarts.de";
                      var urlIsLaunchable = await canLaunchUrlString(url);
                      if(urlIsLaunchable){
                        await launchUrlString(url); //launch is from url_launcher package to launch URL
                      } else {
                        print("URL can't be launched.");
                      }
                    }

              ),
            ]
        ),
      ),
      SizedBox(height: 20.0,),
      RichText(
        text: TextSpan(
            children: [
              TextSpan(
                text: "When using this browser, the IdiomReplaceX toolbox is "
                    "added to almost any web page, allowing literary filters to "
                    "be applied to the content of the web page. For further "
                    "information on the net art project IdiomReplaceX please "
                    "see: ",
                style: TextStyle(color: Colors.black),

              ),
              TextSpan(
                  text: "https://idiomreplacex.de/",
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      String url = "https://idiomreplacex.de/";
                      var urlIsLaunchable = await canLaunchUrlString(url);
                      if(urlIsLaunchable){
                        await launchUrlString(url); //launch is from url_launcher package to launch URL
                      } else {
                        print("URL can't be launched.");
                      }
                    }
              ),
            ]
        ),
      ),
      SizedBox(height: 20.0,),
      RichText(
        text: TextSpan(
            children: [
              TextSpan(
                text: "The IdiomReplaceX Browser App is based on the excellent ",
                style: TextStyle(color: Colors.black),

              ),
              TextSpan(
                  text: "Flutter Browser App",
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      String url = "https://github.com/pichillilorenzo/flutter_browser_app";
                      var urlIsLaunchable = await canLaunchUrlString(url);
                      if(urlIsLaunchable){
                        await launchUrlString(url); //launch is from url_launcher package to launch URL
                      } else {
                        print("URL can't be launched.");
                      }
                    }
              ),
              TextSpan(
                text: ". We are very grateful for this open source project, "
                    "without which developing the IdiomReplaceX Browser App "
                    "would have been a much greater effort.",
                style: TextStyle(color: Colors.black),

              ),
            ]
        ),
      ),
      /*
      ElevatedButton.icon(
        icon: Icon(FlutterIcons.github_box_mco, size: 40.0,),
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300)
        ),
        label: RichText(
          text: TextSpan(
              children: [
                TextSpan(
                    text: "Github: ",
                    style: TextStyle(color: Colors.black)
                ),
                TextSpan(
                    text: "pichillilorenzo/flutter_browser_app",
                    style: TextStyle(color: Colors.blue)
                )
              ]
          ),
        ),
        onPressed: () {
          var browserModel = Provider.of<BrowserModel>(context, listen: false);
          browserModel.addTab(WebViewTab(
            key: GlobalKey(),
            webViewModel: WebViewModel(url: Uri.parse("https://github.com/pichillilorenzo/flutter_browser_app")),
          ));
          Navigator.pop(context);
        },
      ),
      */
    ];

    if (Platform.isIOS) {
      children.addAll(<Widget>[
        SizedBox(height: 20.0,),
        ElevatedButton.icon(
          icon: Icon(Icons.arrow_back_ios, size: 30.0,),
          label: Text("Go Back", style: TextStyle(fontSize: 20.0),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ]);
    }

    return Scaffold(
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (Orientation.landscape == orientation) {
              var rowChildren = <Widget>[
                AnimatedFlutterBrowserLogo(),
                SizedBox(width: 80.0,),
              ];
              rowChildren.add(
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  )
              );

              return Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: rowChildren,
              );
            }

            var columnChildren = <Widget>[
              AnimatedFlutterBrowserLogo(),
              SizedBox(height: 80.0,),
            ];
            columnChildren.addAll(children);

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: columnChildren,
            );
          },
        ),
      ),
    );
  }
}