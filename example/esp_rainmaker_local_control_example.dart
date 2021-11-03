import 'package:esp_rainmaker_local_control/src/esp_local_control_base.dart';

Future<void> main() async {
  final control = LocalControl(IPAndPort(ip: '192.168.1.60', port: 8080));
  Map<String, dynamic> nodeValues;
  try {
    nodeValues = await control.getParamsValues();

    await control.updateParamValue({
      'Altitude': {
        'Target': 300,
      }
    });

    nodeValues = await control.getParamsValues();
  } catch (e) {
    print(e);

    //Handle local control failure
    //Use Rainmaker API as a backup
  }

  print(nodeValues);
  control.dispose();
}
