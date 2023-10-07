import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/utility/exception/custom_exception.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    CollectionReference news = FirebaseFirestore.instance.collection('news');

    final response = news.withConverter(
      fromFirestore: (snapshot, options) {
        return News().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        if (value != null) {
          return value.toJson();
        } else {
          throw FirebaseCustomException('value is null');
        }
      },
    ).get();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: response,
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<News?>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Placeholder();
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final values =
                      snapshot.data!.docs.map((e) => e.data()).toList();

                  return ListView.builder(
                    itemCount: values.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Image.network( 
                              values[index]?.backgroundImage ?? '',
                              height: context.dynamicHeight(.1),
                            ),
                            Text(
                              values[index]?.title ?? '',
                              style: context.textTheme.labelLarge,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Placeholder();
                }
            }
            return const Text('loading');
          },
        ),
      ),
    );
  }
}
