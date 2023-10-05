import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {


    CollectionReference news = FirebaseFirestore.instance.collection('news');

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: news.get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                break;

            }
            return const Text('loading');
          },
        ),
      ),
    );
  }
}
