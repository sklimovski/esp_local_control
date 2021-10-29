import '../lib/esp_rainmaker_local_control.dart';

Future<void> main() async {
  final control = LocalControl('pVU8r4XApBjsWZGLtEbbLY');
  Map<String, dynamic> nodeValues;
  try {
    nodeValues = await control.getParamsValues();
    print(nodeValues);
    /*
    await control.updateParamValue({
      'device': {
        'deivce state': true,
      }
    });

     */
    print(nodeValues);
  } catch (e) {
    print(e);

    //Handle local control failure
    //Use Rainmaker API as a backup
  }
  control.dispose();
}
