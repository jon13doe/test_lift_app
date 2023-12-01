import 'package:test_lift_app/features/global_widgets/index.dart';
import 'package:test_lift_app/features/sql_light/index.dart';
import 'package:test_lift_app/global_import.dart';

class AddHouseWindow extends StatefulWidget {
  final Function onAddHouse;

  const AddHouseWindow({
    super.key,
    required this.onAddHouse,
  });

  @override
  State<AddHouseWindow> createState() => _AddHouseWindowState();
}

class _AddHouseWindowState extends State<AddHouseWindow> {
  late String _name = '';
  late int _floorsCount = 0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _floorsCountController = TextEditingController();

  void _addHouseToDatabase() {
    _name = _nameController.text;
    _floorsCount = int.tryParse(_floorsCountController.text) ?? 0;
    HouseDatabaseHelper.insertHouse(_name, _floorsCount).then((_) {
      widget.onAddHouse();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: SizedBox(
        width: 320,
        height: 185,
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                const Text(
                  'Add house',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  CustTextFieldRow(
                    title: 'Name',
                    stringType: true,
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustTextFieldRow(
                    title: 'Floors count',
                    stringType: false,
                    controller: _floorsCountController,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: _addHouseToDatabase,
                  child: CustomButtonContainer(
                    height: 24,
                    width: 92,
                    titleWidget: Text(
                      'Add',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
