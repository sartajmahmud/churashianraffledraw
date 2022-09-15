import 'dart:async';
import 'package:churashianraffle/guests.dart' as guestList;
import 'package:churashianraffle/guestrepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CHURASHIAN DAY OUT 2022 RAFFLE DRAW'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rng = Random();
  int _counter = 0;
  late InfiniteScrollController controller;

  StreamController<int> scontroller = StreamController<int>();
  List<FortuneItem>fortuneitems = [];
  void _fortuneitembuilder() {
    setState(() {
      for(int i =0; i<x.length/8; i++){
        fortuneitems.add(FortuneItem(child: Text("${x[i]['name']}")));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = InfiniteScrollController(initialItem: Random().nextInt(1325));
    // _fortuneitembuilder();
  }

  List x = guestList.guests;
  List winners = [];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width*.25,
                  child: ListView.builder(
                      itemCount: winners.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            print(x.length);

                          },
                          child: ListTile(
                              leading: Text("$index"),
                              trailing: const Text(
                                "GFG",
                                style: TextStyle(color: Colors.green, fontSize: 15),
                              ),
                              title: Text("name ${winners[index]['name']}")),
                        );
                      }),
            )),

            Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // controller.add(
                      //   Fortune.randomInt(0, x.length),
                      // );
                      // print(controller.stream);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Expanded(
                        // child: FortuneWheel(
                        //   selected: controller.stream,
                        //   items: [
                        //     for (var it in x) FortuneItem(child: Text(it['name'])),
                        //   ],
                        // ),
                        // child:
                        SizedBox(
                          height: 200,
                          width: 400,
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
                              return Container(
                                height: 100,
                                  width: 200,
                                  color: Colors.grey,
                                  child: Center(child: Text('${x[itemIndex]['code']}')));
                            },
                          ),
                        ),

                      ElevatedButton(onPressed: () {
                        var y = rng.nextInt(1325);
                        controller.animateToItem(y);
                        print("var = $y");
                        print( x[y]['code']);
                        winners.add(x[y]);
                        setState(() {

                        });
                      }, child: Text('SPIN'),),
                      // ),
                    ],
                  ),
                ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green
              ),
            )
        ]
        ),
      )
    );
  }
}



