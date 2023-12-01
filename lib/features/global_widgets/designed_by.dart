// widget to use for 'design by name'
import 'package:test_lift_app/global_import.dart';

class DesignedBy extends StatelessWidget {
  // positioning of text
  final bool leftPosition;

  const DesignedBy({
    super.key,
    // positioning of text by left side by default
    this.leftPosition = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      //logic for different position
      mainAxisAlignment:
          leftPosition ? MainAxisAlignment.start : MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'design by $name',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
