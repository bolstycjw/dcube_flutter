import 'package:flutter/material.dart';
import 'package:movies_flutter/util/mediaproviders.dart';
import 'package:movies_flutter/util/projectprovider.dart';
import 'package:movies_flutter/widgets/media_list/media_list.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController _pageController;

  final MediaProvider movieProvider = MovieProvider();
  final ProjectProvider projectProvider = DCubeProjectProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DCube"),
      ),
      body: PageView(
        children: _getProjectList(),
        pageSnapping: true,
        controller: _pageController,
      ),
    );
  }

  List<Widget> _getProjectList() {
    return <Widget>[
            MediaList(
              movieProvider,
              "popular",
              key: Key("movies-popular"),
            ),
          ];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
