import 'package:test_lift_app/global_import.dart';
import 'package:test_lift_app/features/global_widgets/index.dart';
import 'package:test_lift_app/features/houses_list_window/index.dart';

class HomeWindow extends StatelessWidget {
  const HomeWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              //use Expanded/flex:1 to positioning text/picture/button in the center of screen 
              const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
              //'main body'
              Column(
                children: [
                  Text(
                    'Test Task',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  //use to create spacw beetwen parts of 'main body'
                  Padding(
                    // need only vertical space
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                    ),
                    //img container
                    child: Container(
                      height: 200,
                      width: 200,
                      //container borders
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.error,
                          width: 1,
                        ),
                        //custom color for img container
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      //place for pictuer
                      child: Center(
                        child: Text(
                          'any image here',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        //
                      ),
                    ),
                  ),
                  //switch to house list button
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HouseListWindow(),
                        ),
                      );
                    },
                    child: CustomButtonContainer(
                      height: 57,
                      titleWidget: Text(
                        'Enter',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(
                flex: 1,
                child: Column(
                  //bottom of the screen
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //design by row
                    DesignedBy(
                      // right positioning
                      leftPosition: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
