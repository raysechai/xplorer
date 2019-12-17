import 'package:flutter/material.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark'),
        bottom: TabBar(
          tabs: [
            Tab(text: 'Location'),
            Tab(text: 'Itinerary'),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        children: [
          BookmarkLocation(),
          BookmarkItinerary(),
        ],
        controller: _tabController,
      ),
    );
  }
}

class BookmarkLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Location'),
    );
  }
}

class BookmarkItinerary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Itinerary'),
    );
  }
}
