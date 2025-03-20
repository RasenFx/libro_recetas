import 'package:flutter/material.dart';
import 'package:libro_recetas/screens/home_screen.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Libro de recetas',
      home: RecipeBook(),
    );
  }

}

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Libro de recetas',
              style: TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.green,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Inicio',),
            ]
          )
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}