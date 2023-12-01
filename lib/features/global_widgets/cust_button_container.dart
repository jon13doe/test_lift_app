import 'package:test_lift_app/global_import.dart';

class CustomButtonContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget titleWidget;
  final Color? color;

  const CustomButtonContainer({
    super.key,
    this.height = 40,
    this.width = 228,
    this.color,
    required this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: titleWidget,
      ),
    );
  }
}
