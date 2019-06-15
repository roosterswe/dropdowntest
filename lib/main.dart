import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DropdownMenuTest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _companies = ["PE", "Iteam", "telenor", "sd"];
  String _selectedCompany = "PE";
  bool _open = false;

  void open() {
    setState(() {
      _open = true;
    });
  }

  void select(String company) {
    setState(() {
      _open = false;
      _selectedCompany = company;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListView(
              children: _getListItems(),
              shrinkWrap: true,
              itemExtent: 52,
              padding: EdgeInsets.zero,
            ),
            Text(
              'butts',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .merge(TextStyle(color: Colors.blue)),
            ),
            Text(
              'butts',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .merge(TextStyle(color: Colors.black)),
            ),
            Text(
              'butts',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .merge(TextStyle(color: Colors.red)),
            ),
          ],
        ),
    );
  }

  _getListItems() {
    if (_open) {
      return _getOpenList();
    } else {
      return List.of([
        ListTile(
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _selectedCompany,
                  style: Theme.of(context).textTheme.title,
                ),
                Icon(Icons.expand_more)
              ],
            ),
            alignment: AlignmentDirectional.center,
            constraints: BoxConstraints.expand(),
            color: Theme.of(context).accentColor,
          ),
          onTap: () => open(),
        )
      ]);
    }
  }
  List<ListTile> _getOpenList() {
    List<String> tempcompanies = List();
    tempcompanies.addAll(_companies);
    tempcompanies.remove(_selectedCompany);
    List<ListTile> tiles = List();
    tiles.add(ListTile(
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedCompany,
              style: Theme.of(context).textTheme.title,
            ),
            Icon(Icons.expand_less)
          ],
        ),
        alignment: AlignmentDirectional.center,
        constraints: BoxConstraints.expand(),
        color: Theme.of(context).accentColor,
      ),
      onTap: () => select(_selectedCompany),
    ));
    tiles.addAll(tempcompanies.map((c) {
      return ListTile(title: Container(
        child: Text(c, style: Theme.of(context).textTheme.title),
        alignment: AlignmentDirectional.center,
        constraints: BoxConstraints.expand(),
        color: Theme.of(context).accentColor,
      ),
        onTap: () => select(c),
      );
    }).toList());
    return tiles;
  }
}
