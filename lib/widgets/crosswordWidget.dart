import 'package:flutter/material.dart';
import 'package:word_search_safety/word_search_safety.dart';

class CrosswordWidget extends StatefulWidget {
  CrosswordWidget({required Key key}) : super(key: key);

  @override
  _CrosswordWidgetState createState() => _CrosswordWidgetState();
}

class _CrosswordWidgetState extends State<CrosswordWidget> {
  int numBoxPerRow = 6;
  double padding = 5;
  Size sizeBox = Size.zero;

  late ValueNotifier<List<List<String>>> listChars;
  late ValueNotifier<List<CrosswordAnswer>> answerList;
  late ValueNotifier<CurrentDragObj> currentDragObj;
  late ValueNotifier<List<int>> charsDone;

  @override
  void initState() {
    super.initState();
    listChars = ValueNotifier<List<List<String>>>([]);
    answerList = ValueNotifier<List<CrosswordAnswer>>([]);
    currentDragObj = ValueNotifier<CurrentDragObj>(
        CurrentDragObj(indexArrayOnTouch: 0, currentTouch: Offset.zero));
    charsDone = ValueNotifier<List<int>>([]);
    generateRandomWord();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.maxFinite,
            height: size.width - padding * 2,
            color: Colors.blue,
            padding: EdgeInsets.all(padding),
            margin: EdgeInsets.all(padding),
            child: drawCrosswordBox(),
          ),
          Container(
            alignment: Alignment.center,
            child: drawAnswerList(),
          ),
        ],
      ),
    );
  }

  void onDragEnd(PointerUpEvent? event) {
    print("PointerUpEvent");
    if (currentDragObj.value.currentDragLine.isEmpty) return;

    currentDragObj.value.currentDragLine.clear();
    currentDragObj.notifyListeners();
  }

  void onDragUpdate(PointerMoveEvent event) {
    print("PointerMoveEvent");
    generateLineOnDrag(event);

    int indexFound = answerList.value.indexWhere((answer) {
      return answer.answerLines.join("-") ==
          currentDragObj.value.currentDragLine.join("-");
    });

    if (indexFound >= 0) {
      answerList.value[indexFound].done = true;
      charsDone.value.addAll(answerList.value[indexFound].answerLines);
      charsDone.notifyListeners();
      answerList.notifyListeners();
    }
  }

  int calculateIndexBasePosLocal(Offset localPosition) {
    double maxSizeBox =
        ((sizeBox.width - (numBoxPerRow - 1) * padding) / numBoxPerRow);

    if (localPosition.dy > sizeBox.width || localPosition.dx > sizeBox.width)
      return -1;

    int x = 0, y = 0;
    double yAxis = 0, xAxis = 0;
    double yAxisStart = 0, xAxisStart = 0;

    for (var i = 0; i < numBoxPerRow; i++) {
      xAxisStart = xAxis;
      xAxis += maxSizeBox +
          (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

      if (xAxisStart < localPosition.dx && xAxis > localPosition.dx) {
        x = i;
        break;
      }
    }
    for (var i = 0; i < numBoxPerRow; i++) {
      yAxisStart = yAxis;
      yAxis += maxSizeBox +
          (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

      if (yAxisStart < localPosition.dy && yAxis > localPosition.dy) {
        y = i;
        break;
      }
    }

    return y * numBoxPerRow + x;
  }

  void generateLineOnDrag(PointerMoveEvent event) {
    if (currentDragObj.value.currentDragLine.isEmpty) {
      currentDragObj.value.currentDragLine = [];
    }

    int indexBase = calculateIndexBasePosLocal(event.localPosition);

    if (indexBase >= 0) {
      if (currentDragObj.value.currentDragLine.length >= 2) {
        WSOrientation? wsOrientation;

        if (currentDragObj.value.currentDragLine[0] % numBoxPerRow ==
            currentDragObj.value.currentDragLine[1] % numBoxPerRow)
          wsOrientation = WSOrientation.vertical;
        else if (currentDragObj.value.currentDragLine[0] ~/ numBoxPerRow ==
            currentDragObj.value.currentDragLine[1] ~/ numBoxPerRow)
          wsOrientation = WSOrientation.horizontal;

        if (wsOrientation == WSOrientation.horizontal) {
          if (indexBase ~/ numBoxPerRow !=
              currentDragObj.value.currentDragLine[1] ~/ numBoxPerRow)
            onDragEnd(null);
        } else if (wsOrientation == WSOrientation.vertical) {
          if (indexBase % numBoxPerRow !=
              currentDragObj.value.currentDragLine[1] % numBoxPerRow)
            onDragEnd(null);
        } else
          onDragEnd(null);
      }

      if (!currentDragObj.value.currentDragLine.contains(indexBase))
        currentDragObj.value.currentDragLine.add(indexBase);
      else if (currentDragObj.value.currentDragLine.length >=
          2) if (currentDragObj.value.currentDragLine[
              currentDragObj.value.currentDragLine.length - 2] ==
          indexBase) onDragEnd(null);

      currentDragObj.notifyListeners();
    }
  }

  void onDragStart(int indexArray) {
    try {
      List<CrosswordAnswer> indexSelecteds = answerList.value
          .where((answer) => answer.indexArray == indexArray)
          .toList();

      if (indexSelecteds.isEmpty) return;

      print("PointerDownEvent");
      currentDragObj.value.indexArrayOnTouch = indexArray;
      currentDragObj.notifyListeners();
    } catch (e) {}
  }

  Widget drawCrosswordBox() {
    return Listener(
      onPointerUp: (event) => onDragEnd(event),
      onPointerMove: (event) => onDragUpdate(event),
      child: LayoutBuilder(
        builder: (context, constraints) {
          sizeBox = Size(constraints.maxWidth, constraints.maxWidth);
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: numBoxPerRow,
              crossAxisSpacing: padding,
              mainAxisSpacing: padding,
            ),
            itemCount: numBoxPerRow * numBoxPerRow,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              String char = listChars.value.expand((e) => e).toList()[index];
              return Listener(
                onPointerDown: (event) => onDragStart(index),
                child: ValueListenableBuilder(
                  valueListenable: currentDragObj,
                  builder: (context, CurrentDragObj value, child) {
                    Color color = Colors.yellow;
                    if (value.currentDragLine.contains(index)) {
                      color = Colors.blue;
                    } else if (charsDone.value.contains(index)) {
                      color = Colors.red;
                    }

                    return Container(
                      decoration: BoxDecoration(
                        color: color,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        char.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void generateRandomWord() {
    final List<String> wl = ['hello', 'world', 'bar', 'dart', 'drink', 'food'];

    final WSSettings ws = WSSettings(
      width: numBoxPerRow,
      height: numBoxPerRow,
      orientations: List.from([
        WSOrientation.horizontal,
        WSOrientation.horizontalBack,
        WSOrientation.vertical,
        WSOrientation.verticalUp,
      ]),
    );

    final WordSearchSafety wordSearch = WordSearchSafety();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    if (newPuzzle.errors!.isEmpty) {
      listChars.value = newPuzzle.puzzle!;
      final WSSolved solved = wordSearch.solvePuzzle(newPuzzle.puzzle!, wl);

      answerList.value = solved.found!
          .map((solve) => CrosswordAnswer(solve, numPerRow: numBoxPerRow))
          .toList();
    }
  }

  Widget drawAnswerList() {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: answerList,
        builder: (context, List<CrosswordAnswer> value, child) {
          int perColTotal = 3;

          List<Widget> list = List.generate(
              (value.length ~/ perColTotal) +
                  ((value.length % perColTotal) > 0 ? 1 : 0), (int index) {
            int maxColumn = (index + 1) * perColTotal;

            return Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    maxColumn > value.length
                        ? maxColumn - value.length
                        : perColTotal, ((indexChild) {
                  int indexArray = (index) * perColTotal + indexChild;

                  return Text(
                    "${value[indexArray].wsLocation.word}",
                    style: TextStyle(
                      fontSize: 18,
                      color:
                          value[indexArray].done ? Colors.green : Colors.black,
                      decoration: value[indexArray].done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  );
                })).toList(),
              ),
            );
          }).toList();
          return Container(
            child: Column(
              children: list,
            ),
          );
        },
      ),
    );
  }
}

class CurrentDragObj {
  Offset currentDragPos = Offset.zero;
  Offset currentTouch = Offset.zero;
  int indexArrayOnTouch;
  List<int> currentDragLine = [];

  CurrentDragObj({required this.indexArrayOnTouch, required this.currentTouch});
}

class CrosswordAnswer {
  bool done = false;
  late int indexArray;
  WSLocation wsLocation;
  late List<int> answerLines;

  CrosswordAnswer(this.wsLocation, {required int numPerRow}) {
    this.indexArray = this.wsLocation.y * numPerRow + this.wsLocation.x;
    generateAnswerline(numPerRow);
  }

  void generateAnswerline(int numPerRow) {
    this.answerLines = [];
    this.answerLines.addAll(List<int>.generate(this.wsLocation.overlap,
        (index) => generateIndexBaseonAxis(this.wsLocation, index, numPerRow)));
  }

  int generateIndexBaseonAxis(WSLocation wsLocation, int i, int numPerRow) {
    int x = wsLocation.x, y = wsLocation.y;

    if (wsLocation.orientation == WSOrientation.horizontal ||
        wsLocation.orientation == WSOrientation.horizontalBack)
      x = (wsLocation.orientation == WSOrientation.horizontal) ? x + i : x - i;
    else
      y = (wsLocation.orientation == WSOrientation.vertical) ? y + i : y - i;

    return x + y * numPerRow;
  }
}
