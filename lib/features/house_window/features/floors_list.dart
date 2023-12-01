import 'dart:async';
import 'package:test_lift_app/global_import.dart';
import 'package:test_lift_app/features/global_widgets/index.dart';

class FloorsList extends StatefulWidget {
  final int floors;
  final Function(int) onFloorChanges;

  const FloorsList({
    super.key,
    required this.floors,
    required this.onFloorChanges,
  });

  @override
  FloorsListState createState() => FloorsListState();
}

class FloorsListState extends State<FloorsList> {
  late int currentFloor;
  late List<int> floorValues;
  Timer? _timer;
  final Color green = const Color(0xFF3B8642);
  final Color yellow = const Color(0xFFCAC316);

  @override
  void initState() {
    super.initState();
    floorValues = List<int>.generate(
      widget.floors,
      (index) => index == 0 ? 1 : 0,
    );
  }

  void _changeFloorTo(int goToFloor) {
    if (_timer != null) {
      _timer!.cancel();
      floorValues[currentFloor] = 1;
    }

    if (floorValues[goToFloor] == 0) {
      setState(() {
        currentFloor = floorValues.indexOf(1);
      });
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        setState(() {
          floorValues[currentFloor] = 0;
          if (currentFloor < goToFloor) {
            currentFloor++;
          } else if (currentFloor > goToFloor) {
            currentFloor--;
          }
          widget.onFloorChanges(currentFloor);
          floorValues[currentFloor] = 2;
        });
        if (currentFloor == goToFloor) {
          timer.cancel();
          _timer = null;
          setState(() {
            floorValues[goToFloor] = 1;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final int displayedIndex = index + 1;
          return GestureDetector(
            onTap: () {
              _changeFloorTo(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 80,
              ),
              child: CustomButtonContainer(
                color: floorValues[index] == 1
                    ? green
                    : floorValues[index] == 2
                        ? yellow
                        : Theme.of(context).primaryColor,
                titleWidget: Center(
                  child: Text(
                    '$displayedIndex',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
          );
        },
        childCount: widget.floors,
      ),
    );
  }
}
