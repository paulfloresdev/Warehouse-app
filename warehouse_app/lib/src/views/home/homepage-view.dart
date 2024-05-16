import 'package:flutter/material.dart';
import 'package:warehouse_app/src/widgets/sidebar.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(pageIndex: 0),
        ],
      ),
    );
  }
}
