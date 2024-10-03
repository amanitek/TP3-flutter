import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular TV Series',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: SeriesListScreen(),
    );
  }
}

class SeriesListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> series = [
    {
      'title': 'Breaking Bad',
      'image': 'assets/breaking_bad.jpg',
      'isAsset': true,
    },
    {
      'title': 'Stranger Things',
      'image': 'assets/stranger.jpg',
      'isAsset': false,
    },
    {
      'title': 'Anne with an E',
      'image': 'assets/anne.jpg',
      'isAsset': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular TV Series'),
      ),
      body: ListView.builder(
        itemCount: series.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: series[index]['isAsset']
                  ? Image.asset(series[index]['image'])
                  : Image.network(series[index]['image']),
              title: Text(series[index]['title']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeriesDetailScreen(series[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class SeriesDetailScreen extends StatelessWidget {
  final Map<String, dynamic> series;

  SeriesDetailScreen(this.series);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image.asset(
      series['image'],
      width: 200,
      height: 300,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(series['title']!),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageWidget,
              SizedBox(height: 20),
              Text(
                series['title']!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Details section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Details about ${series['title']}',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
