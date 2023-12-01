import 'package:test_lift_app/global_import.dart';
import 'package:test_lift_app/features/global_widgets/index.dart';
import 'add_house_window.dart';

class AddHouseBar extends StatefulWidget {
  final void Function() onAddHouse;
  
  const AddHouseBar({
    super.key,
    required this.onAddHouse,
  });

  @override
  State<AddHouseBar> createState() => _AddHouseBarState();
}

class _AddHouseBarState extends State<AddHouseBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 65,
      pinned: true,
      floating: false,
      snap: false,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(
          65,
        ),
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddHouseWindow(
                  onAddHouse: widget.onAddHouse,
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            child: CustomButtonContainer(
              color: Colors.white,
              titleWidget: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Text(
                    'Add house',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 15,
                        ),
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
