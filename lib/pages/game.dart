import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mosquito_project/appbarmain.dart';
import 'package:mosquito_project/maindrawer.dart';
import 'package:mosquito_project/utils/colour.dart';
import 'package:url_launcher/url_launcher.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final CollectionReference game =
      FirebaseFirestore.instance.collection('game');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(title: 'Geme'),
      drawer: MainDrawer(),
      body: SafeArea(
        child: StreamBuilder(
            stream: game.orderBy('g_name').snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot gameSnap =
                          snapshot.data.docs[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            gameSnap['g_name'],
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: greenPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: FractionallySizedBox(
                                widthFactor: 0.9,
                                child: Image.network(gameSnap['g_imgs'])),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              if (await canLaunch(gameSnap['g_url'])) {
                                await launch(gameSnap['g_url']);
                              } else {
                                throw 'Could not launch Pre-Testing}';
                              }
                            },
                            child: Text(
                              'คลิกที่นี่เพื่อดาวน์โหลดเกม',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: litBlack,
                                  ),
                            ),
                          )
                        ],
                      );
                    });
              }
              return Container();
            }),
      ),
    );
  }
}
