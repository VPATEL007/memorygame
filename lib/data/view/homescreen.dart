import 'package:flutter/material.dart';
import 'package:memorygame/data/TileModel.dart';
import 'package:memorygame/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TileModel> questionPairs = [];

  @override
  void initState() {
    super.initState();
    reStart();
  }

  void reStart() {
    pairs2.shuffle();
    setState(() {
      questionPairs = pairs;
      selected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            const Text(
                              "Matches",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '$points',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 23.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            const Text(
                              "Trails",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '${trails ~/ 2}',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 0.0, maxCrossAxisExtent: 100.0),
                children: List.generate(questionPairs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (!selected) {
                        if (pairs2[index].isSelected == false) {
                          setState(() {
                            pairs2[index].setIsSelected(true);
                            (trails++);
                          });
                          if (selectedTile != "") {
                            print('Selected 2===$selected');
                            if (selectedTile ==
                                pairs2[index].getImageAssetPath()) {
                              print('Selected 3===$selected');
                              points = points + 100;
                              TileModel tileModel = TileModel();
                              print('MatchedIndex==${index}');
                              selected = true;
                              Future.delayed(const Duration(seconds: 1), () {
                                tileModel.setImageAssetPath("");
                                pairs2[index] = tileModel;
                                pairs2[selectedIndex!] = tileModel;
                                setState(() {});
                                setState(() {
                                  selected = false;
                                });
                                selectedTile = "";
                              });
                            } else {
                              selected = true;
                              Future.delayed(const Duration(seconds: 1), () {
                                setState(() {
                                  pairs2[index].setIsSelected(false);
                                  pairs2[selectedIndex!].setIsSelected(false);
                                });
                                setState(() {
                                  selected = false;
                                });
                              });
                              selectedTile = "";
                            }
                          } else {
                            setState(() {
                              selectedTile =
                                  pairs2[index].getImageAssetPath().toString();
                              selectedIndex = index;
                            });
                          }
                        } else {
                          print('Already Tap');
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: pairs2[index].getImageAssetPath() != ""
                          ? pairs2[index].getIsSelected()
                              ? Container(
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle),
                                  child: Text(
                                    pairs2[index].imageAssetPath.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 35.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : Image.asset(
                                  questionPairs[index].imageAssetPath ?? '')
                          : Container(
                              color: Colors.white,
                              child: Image.asset("assets/correct.png"),
                            ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 30,
              ),
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       points = 0;
              //       trails = 0;
              //       questionPairs=pairs;
              //
              //     });
              //
              //   },
              //   child: Container(
              //     height: 50,
              //     width: 200,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         color: Colors.red,
              //         borderRadius: BorderRadius.circular(10.0)),
              //     child: const Text(
              //       "Restart",
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 25,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
