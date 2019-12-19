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
      child:ListView(
        children: [
          _buildListtile('Restaurant name','Penang'),
          Divider(),
          _buildListtile('Restaurant name','Penang'),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildListtile(String name, String location) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(
                  0.0,
                  2.0,
                ),
                blurRadius: 6.0,
              )
            ]),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                'https://www.penang-insider.com/livingpenang/wp-content/uploads/2017/04/DSCF5563.jpg',
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      title: Text(name),
      subtitle: Text(
        location,
        style: TextStyle(color: Colors.green),
      ),
    );
  }
}

class BookmarkItinerary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          _buildlist('Penang', '3 days'),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildlist(String place, String day) {
    return ListTile(
      leading: Icon(Icons.bookmark, color: Colors.red),
      title: Text(
        place,
        style: TextStyle(color: Colors.orange),
      ),
      subtitle: Text(day),
    );
  }
}
