import 'dart:async';

import 'package:flutter/material.dart';
import 'package:profile/ui/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'contact_us.dart';
import 'footer.dart';
import 'header.dart';
import 'icon.dart';
import 'my_projects.dart';
import 'statistics.dart';
import 'working_process.dart';
import '../config/colors.dart';
import '../config/constants.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _headerGlobalKey = GlobalKey();
  final _aboutGlobaleKey = GlobalKey();
  final _statisticsGlobaleKey = GlobalKey();
  final _workingProcessGlobaleKye = GlobalKey();
  final _recentProjectsGlobaleKey = GlobalKey();
  final _contactUsGlobaleKey = GlobalKey();

  final _scrollController = ScrollController();

  final _fabStream = StreamController<bool>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _fabStream.sink.add(_scrollController.offset > 500);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1510519138101-570d1dca3d66?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2047&q=80"),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                toolbarHeight: 100,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1510519138101-570d1dca3d66?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2047&q=80"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black87,
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .15,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.cyan,
                      child: Image.asset('images/icon.jpg'),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(500),
                  child: Header(),
                ),
                actions: [
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: _scrollToAbout,
                        highlightColor: Colors.white60,
                        child: Text(
                          'About Me',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToStatistics,
                        child: Text(
                          'Experience',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToWorkingProcess,
                        child: Text(
                          'Education',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      MaterialButton(
                        onPressed: _scrollToRecentProjects,
                        child: Text(
                          'Project',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _scrollToContactUs,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .cyan, // Change this color to your desired background color
                          onPrimary: Colors
                              .white, // Change this color to your desired text color
                          // You can customize other visual properties here as well
                        ),
                        child: Text(
                          'Contact Me',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .15),
                ],
              ),
              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
      mobileScreen: Scaffold(
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.asset(
                      'images/icon.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: _scrollToAbout,
                  title: Text(
                    'About Me',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToStatistics,
                  title: Text(
                    'Experience',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToWorkingProcess,
                  title: Text(
                    'Education',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: _scrollToRecentProjects,
                  title: Text(
                    'Project',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                const SizedBox(height: 20),
                ListTile(
                  title: ElevatedButton(
                    onPressed: _scrollToContactUs,
                    child: Text(
                      'Contact Me',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        launch(AppConstants.github);
                      },
                      child: AppIcon(
                        'icons/github.png',
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        launch(AppConstants.linkedin);
                      },
                      child: AppIcon(
                        'icons/linkedin.png',
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        launch(AppConstants.twitter);
                      },
                      child: AppIcon(
                        'icons/twitter.png',
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        launch(AppConstants.facebook);
                      },
                      child: AppIcon(
                        'icons/instagram.png',
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1510519138101-570d1dca3d66?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2047&q=80"),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                key: _headerGlobalKey,
                titleSpacing: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                leading: Align(
                  child: Builder(
                    builder: (ctx) => InkWell(
                      onTap: () {
                        Scaffold.of(ctx).openDrawer();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Container(
                          width: 40,
                          height: 40,
                          color: Colors.cyan,
                          child: Image.asset('images/icon.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1510519138101-570d1dca3d66?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2047&q=80"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black87,
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(350),
                  child: Header(),
                ),
              ),
              ..._slivers(),
            ],
          ),
        ),
        floatingActionButton: _buildFab(),
      ),
    );
  }

  List<Widget> _slivers() => [
        SliverToBoxAdapter(
          key: _aboutGlobaleKey,
          child: About(),
        ),
        SliverToBoxAdapter(
          key: _statisticsGlobaleKey,
          child: Statistics(),
        ),
        SliverToBoxAdapter(
          key: _workingProcessGlobaleKye,
          child: WorkingProcess(),
        ),
        SliverToBoxAdapter(
          key: _recentProjectsGlobaleKey,
          child: MyProjects(),
        ),
        SliverToBoxAdapter(
          key: _contactUsGlobaleKey,
          child: ContactUs(),
        ),
        SliverToBoxAdapter(
          child: Footer(),
        ),
      ];

  Widget _buildFab() {
    return StreamBuilder<bool>(
      stream: _fabStream.stream,
      builder: (_, data) {
        final bool showFab = data.hasData && data.data!;
        return AnimatedOpacity(
          opacity: showFab ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: FloatingActionButton(
            onPressed: showFab
                ? _scrollToHeader
                : null, // make sure user cannot click when button hidden
            mini: true,
            child: AppIcon('icons/double-up-arrow.png', size: 20),
          ),
        );
      },
    );
  }

  void _scrollToHeader() {
    Scrollable.ensureVisible(
      _headerGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToAbout() {
    Scrollable.ensureVisible(
      _aboutGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToStatistics() {
    Scrollable.ensureVisible(
      _statisticsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToWorkingProcess() {
    Scrollable.ensureVisible(
      _workingProcessGlobaleKye.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToRecentProjects() {
    Scrollable.ensureVisible(
      _recentProjectsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToContactUs() {
    Scrollable.ensureVisible(
      _contactUsGlobaleKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _fabStream.close();
    super.dispose();
  }
}
