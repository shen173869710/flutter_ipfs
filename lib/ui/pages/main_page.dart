
import 'package:flutter/material.dart';
import 'package:ipfsnets/generated/l10n.dart';


class MainPage extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }

}
//启动页面
class _MainPageState extends State<MainPage> {
  int count = 0;
  onChangeLanguage() {
    print(count);
    if (count == 0) {
      setState(() {
        S.load(Locale('zh'));
        print("zh");
      });
    }
    if (count == 1) {
      setState(() {
        S.load(Locale('en'));
        print("en");
      });
    }
    if (count == 2) {
      setState(() {
        S.load(Locale('zh',"hk"));
        print("zh_hk");
      });
    }
    if (count == 3) {
      setState(() {
        count = -1;
        S.load(Locale('zh',"TW"));
        print("zh_tw");
      });
    }
    count ++;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(S.current.language_title),
        ),
        body: new Center(
          child: new Text(S.current.language_en),
        ),
        floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.language), onPressed: onChangeLanguage));
  }

}