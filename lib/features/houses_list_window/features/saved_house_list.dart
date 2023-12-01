import 'package:test_lift_app/global_import.dart';
import 'package:test_lift_app/features/global_widgets/index.dart';

class SavedHouseList extends StatelessWidget {
  final List<Map<String, dynamic>> houseData;

  const SavedHouseList({super.key, required this.houseData});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final house = houseData[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/houseWindow',
                arguments: house['floors'],
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 80,
              ),
              child: CustomButtonContainer(
                titleWidget: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          'House',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        house['houseName'],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: houseData.length,
      ),
    );
  }
}
