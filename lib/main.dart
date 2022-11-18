import 'dart:async';
// import 'package:churashianraffle/Repository/ParticipantRepository.dart';
import 'package:churashianraffle/Repository/File.dart';
import 'package:churashianraffle/guests.dart' as guest_list;
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'dart:math';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raffle Draw',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Raffle Draw'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rng = Random();
  late InfiniteScrollController controller;
  // Set up two players with different audio files
  final player1 = AudioPlayer();
  final player2 = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // getParticipants();
    renameFiles();
    setSounds();
    controller = InfiniteScrollController(initialItem: Random().nextInt(1309));
  }

  int posCounter = 20;
  List x = guest_list.guests;
  List winners = [
    {'Full Name': 'NAME', 'pos': 'POSITION'}
  ];
  int totalParticipants = guest_list.guests.length;
  var currentName = '';
  var currentId = '';
  var currentRaffle = '';
  var currentImage = '';

  setSounds() async {
    await player1.setAsset('assets/spin2.mp3');
    await player2.setAsset('assets/win3.mp3');
    await player1.setLoopMode(LoopMode.one);
    await player2.setLoopMode(LoopMode.one);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
              child: Text(
            widget.title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.green.shade300,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Row(children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          '~ List of Winners ~',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .82,
                        width: MediaQuery.of(context).size.width * .25,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListView.builder(
                            itemCount: winners.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  // leading: Text("$index"),
                                  trailing: Text(
                                    "${winners[index]['pos']}",
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  title: Text(
                                    "${winners[index]['Full Name']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ));
                            }),
                      ),
                    ],
                  )),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 150,
                      child: Image.asset('assets/raffleheader.png'),
                    ),
                    Container(
                      height: 200,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.black, width: 3)),
                      child: InfiniteCarousel.builder(
                        itemCount: x.length,
                        itemExtent: 120,
                        center: true,
                        anchor: 0.0,
                        velocityFactor: 0.9,
                        onIndexChanged: (index) {
                          // print(index);
                        },
                        controller: controller,
                        axisDirection: Axis.vertical,
                        loop: true,
                        itemBuilder: (context, itemIndex, realIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                //height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                ),
                                child: Center(
                                    child: Text(
                                  '${x[itemIndex]['ID']}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                          );
                        },
                      ),
                    ),

                    posCounter != 0
                        ? ElevatedButton(
                            onPressed: () async {
                              var y = rng.nextInt(x.length);
                              controller.animateToItem(y);
                              player1.play();
                              await Future.delayed(
                                  const Duration(milliseconds: 500), () async {
                                y = rng.nextInt(x.length);
                                controller.animateToItem(y);
                                await Future.delayed(
                                    const Duration(milliseconds: 500),
                                    () async {
                                  y = rng.nextInt(x.length);
                                  controller.animateToItem(y);
                                  await Future.delayed(
                                      const Duration(milliseconds: 500),
                                      () async {
                                    y = rng.nextInt(x.length);
                                    controller.animateToItem(y);
                                    await Future.delayed(
                                        const Duration(milliseconds: 500),
                                        () async {
                                      y = rng.nextInt(x.length);
                                      controller.animateToItem(y);
                                      await Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () async {
                                        y = rng.nextInt(x.length);
                                        controller.animateToItem(y);
                                        await Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () async {
                                          y = rng.nextInt(x.length);
                                          controller.animateToItem(y);
                                          await Future.delayed(
                                              const Duration(milliseconds: 500),
                                              () async {
                                            y = rng.nextInt(x.length);
                                            controller.animateToItem(y);
                                            await Future.delayed(
                                                const Duration(
                                                    milliseconds: 500),
                                                () async {
                                              y = rng.nextInt(x.length);
                                              controller.animateToItem(y);
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500),
                                                  () async {
                                                y = rng.nextInt(x.length);
                                                controller.animateToItem(y);
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500),
                                                    () async {
                                                  y = rng.nextInt(x.length);
                                                  controller.animateToItem(y);
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 500),
                                                      () async {
                                                    y = rng.nextInt(x.length);
                                                    controller.animateToItem(y);
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 500),
                                                        () async {
                                                      y = rng.nextInt(x.length);
                                                      controller
                                                          .animateToItem(y);
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  500),
                                                          () async {
                                                        y = rng
                                                            .nextInt(x.length);
                                                        controller
                                                            .animateToItem(y);
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                            () async {
                                                          y = rng.nextInt(
                                                              x.length);
                                                          controller
                                                              .animateToItem(y);
                                                        });
                                                      });
                                                    });
                                                  });
                                                });
                                              });
                                            });
                                          });
                                        });
                                      });
                                    });
                                  });
                                });
                              });
                              player1.stop();
                              x[y]['pos'] = posCounter.toString();
                              posCounter--;
                              // winners.add(x[y]);
                              winners.insert(1, x[y]);
                              currentName = x[y]['Full Name'];
                              currentId = "ID : "+x[y]['ID'].toString();
                              currentRaffle = x[y]['ID'].toString();
                              currentImage = x[y]['ID'].toString();
                              x.remove(x[y]);
                              print(x.length);
                              player2.play();
                              Future.delayed(Duration(milliseconds: 3675), () {
                                player2.stop();
                              });
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            child: const Text(
                              'SPIN',
                            ),
                          )
                        : Container(),
                    // ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: MediaQuery.of(context).size.height * .82,
                  width: MediaQuery.of(context).size.width * .25,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(child: Text('Winner!',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold
                        ),)),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                        child: currentImage == ''?Container():Image.asset(
                              "assets/participant_picture/$currentImage.png"),
                      ),
                          )),
                      Expanded(
                        flex: 2,
                          child: Container(
                        child: Column(
                          children: [
                            Text(currentId,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold
                              ),),
                            Text(currentName,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold
                              ),),
                          ],
                        ),
                      )),
                    ],
                  ),
                  // child: Image.asset('path'),
                ),
              )
            ]),
          ),
        ));
  }
}
