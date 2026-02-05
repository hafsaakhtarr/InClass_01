import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() =>
      __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo> {
  
  @override
  Widget build(BuildContext context) {
    final tabs = ['Text Tab', 'Image Tab', 'Button tab', 'ListView Tab'];
    final TabController _tabController = DefaultTabController.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Tabs Demo',
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Tab1TextWidget(),
          Tab2ImageWidget(),
          Tab3ButtonWidget(),
          Tab4ListViewWidget(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                _tabController.animateTo(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                _tabController.animateTo(1);
              },
            ),
            IconButton(
              icon: Icon(Icons.circle),
              onPressed: () {
                _tabController.animateTo(2);
              },
            ),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                _tabController.animateTo(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}


//Tab 1
class Tab1TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Text Tab',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'This is the text widget.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Alert Dialog'),
                    content: Text('This is an alert dialog'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Clicke for Alert'),
          ),
        ],
      ),
    );
  }
}

//Tab 2 - Image
class Tab2ImageWidget extends StatefulWidget {
  @override
  _Tab2ImageWidgetState createState() => _Tab2ImageWidgetState();
}

class _Tab2ImageWidgetState extends State<Tab2ImageWidget> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image Widget
            Image.network(
              'https://occ-0-8407-2219.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABVf3fwEcXJQpPxf6u931NubgW5qpVHweYP0v-AlXnKIiNm5mZ_fcy-4CHhBtQZ504p_reIy0XNsNMCqvocAdPOXFd8EocMckz6UI.jpg?r=815',
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 150,
                  height: 150,
                  color: Colors.grey[300],
                  child: Center(
                    child: Text('Image not loaded'),
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            // Input Text Widget
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Enter your text here',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Text',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You entered: ${_textController.text}'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    )
    );
  }
}

//Tab 3 - Button
class Tab3ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[50],
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Button pressed!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: Text('Click me'),
      ),
    );
  }
}

//Tab 4 - ListView
class Tab4ListViewWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Item 1',
      'color': Colors.blue[100],
      'elevation': 4.0,
      'borderRadius': 8.0,
    },
    {
      'title': 'Item 2',
      'color': Colors.green[100],
      'elevation': 8.0,
      'borderRadius': 12.0,
    },
    {
      'title': 'Item 3',
      'color': Colors.orange[100],
      'elevation': 6.0,
      'borderRadius': 16.0,
    },
    {
      'title': 'Item 4',
      'color': Colors.pink[100],
      'elevation': 10.0,
      'borderRadius': 20.0,
    },
    {
      'title': 'Item 5',
      'color': Colors.purple[100],
      'elevation': 5.0,
      'borderRadius': 10.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[50],
      child: ListView(
        children: [
          for (int i = 0; i < items.length; i++)
            Card(
              color: items[i]['color'],
              elevation: items[i]['elevation'],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(items[i]['borderRadius']),
              ),
              margin: EdgeInsets.all(12),
              child: ListTile(
                title: Text(
                  items[i]['title'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Description here'),
              ),
            ),
        ],
      ),
    );
  }
}
