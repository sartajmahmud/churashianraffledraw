import 'dart:async';
import 'package:churashianraffle/guests.dart' as guest_list;
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Churashian Day Out Raffle Draw',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CHURASHIAN DAY OUT 2022'),
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

  @override
  void initState() {
    super.initState();
    controller = InfiniteScrollController(initialItem: Random().nextInt(1309));
  }

  int posCounter = 20;
  List x = guest_list.guests;
  List winners = [
    {'name': 'NAME', 'pos': 'POSITION'}
  ];
  var currentName = '';
  var currentId = '';
  var currentRaffle = '';
  var currentImage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            widget.title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
        ),
        body: Container(
          color: const Color(0xFFffd15e),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(children: [
            Expanded(
                flex: 2,
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
                                  "${winners[index]['name']}",
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
              flex: 3,
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
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Center(
                                  child: Text(
                                '${x[itemIndex]['code']}',
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
                            var y = rng.nextInt(1309);
                            controller.animateToItem(y);

                            await Future.delayed(
                                const Duration(milliseconds: 500), () async {
                              y = rng.nextInt(1309);
                              controller.animateToItem(y);
                              await Future.delayed(
                                  const Duration(milliseconds: 500), () async {
                                y = rng.nextInt(1309);
                                controller.animateToItem(y);
                                await Future.delayed(
                                    const Duration(milliseconds: 500),
                                    () async {
                                  y = rng.nextInt(1309);
                                  controller.animateToItem(y);
                                  await Future.delayed(
                                      const Duration(milliseconds: 500),
                                      () async {
                                    y = rng.nextInt(1309);
                                    controller.animateToItem(y);
                                    await Future.delayed(
                                        const Duration(milliseconds: 500),
                                        () async {
                                      y = rng.nextInt(1309);
                                      controller.animateToItem(y);
                                      await Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () async {
                                        y = rng.nextInt(1309);
                                        controller.animateToItem(y);
                                        await Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () async {
                                          y = rng.nextInt(1309);
                                          controller.animateToItem(y);
                                          await Future.delayed(
                                              const Duration(milliseconds: 500),
                                              () async {
                                            y = rng.nextInt(1309);
                                            controller.animateToItem(y);
                                            await Future.delayed(
                                                const Duration(
                                                    milliseconds: 500),
                                                () async {
                                              y = rng.nextInt(1309);
                                              controller.animateToItem(y);
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500),
                                                  () async {
                                                y = rng.nextInt(1309);
                                                controller.animateToItem(y);
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500),
                                                    () async {
                                                  y = rng.nextInt(1309);
                                                  controller.animateToItem(y);
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 500),
                                                      () async {
                                                    y = rng.nextInt(1309);
                                                    controller.animateToItem(y);
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 500),
                                                        () async {
                                                      y = rng.nextInt(1309);
                                                      controller
                                                          .animateToItem(y);
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  500),
                                                          () async {
                                                        y = rng.nextInt(1309);
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

                            x[y]['pos'] = posCounter;
                            posCounter--;
                            // winners.add(x[y]);
                            winners.insert(1, x[y]);
                            currentName = x[y]['name'];
                            currentId = x[y]['id'].toString();
                            currentRaffle = x[y]['code'].toString();
                            currentImage = x[y]['media_id'].toString();
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
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
              flex: 2,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Text(
                            "~ Latest Winner! ~",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        currentImage == ''
                            ? Container()
                            : Container(
                                margin: const EdgeInsets.all(40),
                                color: Colors.white,
                                child: Image.asset("assets/idcard.jpg"),
                              ),
                      ],
                    ),
                  ),
                  currentImage == ''
                      ? Container()
                      : Positioned(
                          top: 625,
                          left: 96,
                          child: Text(
                            currentName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )),
                  currentImage == ''
                      ? Container()
                      : Positioned(
                          top: 651,
                          left: 170,
                          child: Text(
                            currentId,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                          )),
                  currentImage == ''
                      ? Container()
                      : Positioned(
                          top: 675,
                          left: 170,
                          child: Text(
                            currentRaffle,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                          )),
                  currentImage == ''
                      ? Container()
                      : Positioned(
                          top: 379,
                          left: 174,
                          child: Container(
                              color: Colors.red,
                              height: 211,
                              width: 210,
                              child: Image.network(
                                "http://churashianuttara.com/assets/images/$currentImage",
                                fit: BoxFit.fill,
                              )),
                        ),
                ],
              ),
            )
          ]),
        ));
  }
}
