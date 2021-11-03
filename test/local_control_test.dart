import 'dart:io';
import 'package:multicast_dns/multicast_dns.dart';

Future<void> main() async {
  /*
  const name = '_esp_local_ctrl._tcp.local';
  final client = MDnsClient();
  // Start the client with default options.
  await client.start(
      mDnsAddress: InternetAddress('224.0.0.251'), mDnsPort: 8080);

  // Get the PTR record for the service.
  await for (final PtrResourceRecord ptr in client
      .lookup<PtrResourceRecord>(ResourceRecordQuery.serverPointer(name))) {
    // Use the domainName from the PTR record to get the SRV record,
    // which will have the port and local hostname.
    // Note that duplicate messages may come through, especially if any
    // other mDNS queries are running elsewhere on the machine.
    await for (final SrvResourceRecord srv in client.lookup<SrvResourceRecord>(
        ResourceRecordQuery.service(ptr.domainName))) {
      // Domain name will be something like "io.flutter.example@some-iphone.local._dartobservatory._tcp.local"
      final bundleId =
          ptr.domainName; //.substring(0, ptr.domainName.indexOf('@'));
      print('Dart observatory instance found at '
          '${srv.target}:${srv.port} for "$bundleId".');
    }
  }
  client.stop();

  print('Done.');

   */

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
