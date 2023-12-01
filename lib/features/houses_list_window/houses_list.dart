import 'package:test_lift_app/global_import.dart';
import 'features/index.dart';
import 'package:test_lift_app/features/sql_light/index.dart';

class HouseListWindow extends StatefulWidget {
  const HouseListWindow({super.key});

  @override
  State<HouseListWindow> createState() => _HouseListWindowState();
}

class _HouseListWindowState extends State<HouseListWindow> {
  List<Map<String, dynamic>> houseData = [];

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    await HouseDatabaseHelper.initDatabase();
    final data = await HouseDatabaseHelper.getAllHouses();
    setState(() {
      houseData = data;
    });
    _updateHouseList();
  }

   void _updateHouseList() async {
    final data = await HouseDatabaseHelper.getAllHouses();
    setState(() {
      houseData = data;
    });
  }

  void _clearDatabase() async {
    await HouseDatabaseHelper.clearAllHouses();
    _updateHouseList();
  }

  void _printDataToConsole() {
    for (var house in houseData) {
      print('House Name: ${house['houseName']}');
      print('Floors: ${house['floors']}');
      print('-------------------------');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 65,
        child: CustomScrollView(
          slivers: [
            //widget AddHouseBar
            AddHouseBar(onAddHouse: _updateHouseList),
            // SliverToBoxAdapter(
            //   child: ElevatedButton(
            //     onPressed: _printDataToConsole,
            //     child: Text(
            //       'Print Data to Console',
            //       style: Theme.of(context).textTheme.headlineLarge,
            //     ),
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: ElevatedButton(
            //     onPressed: _clearDatabase,
            //     child: Text('Clear Database', style: Theme.of(context).textTheme.headlineLarge,),
            //   ),
            // ),
            //widget SavedHouseList
            SavedHouseList(houseData: houseData),
          ],
        ),
      ),
    );
  }
}