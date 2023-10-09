import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mosquito_project/appbarmain.dart';
import 'package:mosquito_project/maindrawer.dart';
import 'package:mosquito_project/utils/colour.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Learningpage extends StatefulWidget {
  const Learningpage({super.key});

  @override
  State<Learningpage> createState() => _LearningpageState();
}

class _LearningpageState extends State<Learningpage> {
  final CollectionReference lesson =
      FirebaseFirestore.instance.collection('lesson');

  void deleteLesson(docId) {
    lesson.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(title: 'Lesson'),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Pre-Test & Post-Test', // Added heading text
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: litBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: darkRed,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Pre-Testing',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: whitePerl,
                                      ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: whitePerl,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (await canLaunch(
                                        'https://forms.gle/nhe28i5DFN3EYNz3A')) {
                                      await launch(
                                          'https://forms.gle/nhe28i5DFN3EYNz3A');
                                    } else {
                                      throw 'Could not launch Pre-Testing}';
                                    }
                                  },
                                  child: Text(
                                    "Start Testing",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: greenPrimary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: darkRed,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Post-Testing',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: whitePerl,
                                      ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: whitePerl,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (await canLaunch(
                                        'https://forms.gle/k7Qas97ASJ9G1XyX7')) {
                                      await launch(
                                          'https://forms.gle/k7Qas97ASJ9G1XyX7');
                                    } else {
                                      throw 'Could not launch Post-Testing}';
                                    }
                                  },
                                  child: Text(
                                    "Start Testing",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: greenPrimary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'List Learning', // Added heading text
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: litBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                  stream: lesson.orderBy('l_name').snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot lessonSnap =
                              snapshot.data.docs[index];
                          return Container(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: midGreen,
                                ),
                                padding: EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Image.network(
                                      lessonSnap['l_imgs'],
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            lessonSnap['l_name'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: whitePerl,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: whitePerl,
                                                  padding: EdgeInsets.all(5),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  String? videoUrl =
                                                      lessonSnap['l_video'];
                                                  if (videoUrl != null) {
                                                    String? videoId =
                                                        YoutubePlayer
                                                            .convertUrlToId(
                                                                videoUrl);
                                                    if (videoId != null) {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              YoutubePlayer(
                                                            controller:
                                                                YoutubePlayerController(
                                                              initialVideoId:
                                                                  videoId,
                                                              flags:
                                                                  YoutubePlayerFlags(
                                                                autoPlay: true,
                                                                mute: false,
                                                                isLive:
                                                                    true, // Set to true to center the video
                                                                forceHD: false,
                                                                enableCaption:
                                                                    true,
                                                              ),
                                                            ),
                                                            showVideoProgressIndicator:
                                                                true, // แสดงตัวบ่งชี้ความคืบหน้าของวิดีโอ
                                                            progressIndicatorColor:
                                                                darkRed, // สีของตัวบ่งชี้ความคืบหน้า
                                                            bottomActions: [
                                                              CurrentPosition(),
                                                              ProgressBar(
                                                                  isExpanded:
                                                                      true),
                                                            ],
                                                            controlsTimeOut:
                                                                Duration(
                                                                    seconds:
                                                                        5), // ระยะเวลาก่อนที่ตัวควบคุมจะถูกซ่อน
                                                            onReady: () {
                                                              // Add your code here if needed
                                                            },
                                                            onEnded: (data) {
                                                              // Add your code here if needed
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      // Handle case where videoUrl is not a valid YouTube URL
                                                    }
                                                  } else {
                                                    // Handle case where lessonSnap['l_video'] is null
                                                  }
                                                },
                                                child: Text(
                                                  "Get started",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        color: greenPrimary,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
