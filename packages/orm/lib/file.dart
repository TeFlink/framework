import 'dart:io';

Future createFile(String routeFile, {required String content}) async {
  var myFile = await File(routeFile).create(recursive: true);
  var sink = myFile
      .openWrite(); // for appending at the end of file, pass parameter (mode: FileMode.append) to openWrite()
  sink.write(content);
  await sink.flush();
  await sink.close();
}
