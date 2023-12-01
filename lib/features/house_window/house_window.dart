import 'package:test_lift_app/global_import.dart';
import 'package:test_lift_app/features/global_widgets/index.dart';
import 'package:test_lift_app/features/house_window/features/index.dart';
import 'dart:async';

class HouseWindow extends StatefulWidget {
  const HouseWindow({super.key});

  @override
  HouseWindowState createState() => HouseWindowState();
}

class HouseWindowState extends State<HouseWindow> {
  late MethodChannel channel;
  late int currentFloor;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    channel = const MethodChannel('floorCurrentPosition');
    currentFloor = 1;
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      sendCurrentFloorPosition();
    });
  }

  void sendCurrentFloorPosition() {
    channel.invokeMethod(
        'showCurrentFloorPosition', {'floorPosition': '$currentFloor'});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int floorCount =
        ModalRoute.of(context)?.settings.arguments as int? ?? 0;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 45,
            child: CustomScrollView(
              slivers: [
                const HouseBar(),
                FloorsList(
                  floors: floorCount,
                  onFloorChanges: (int newValue) {
                    setState(() {
                      currentFloor = newValue + 1;
                    });
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: DesignedBy(),
          ),
        ],
      ),
    );
  }
}
