import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

void main() {
  settingEnvironment('xdg-open https://dart.dev');
}

/*
#include <stdlib.h>
int putenv( char *env_name );
https://man.openbsd.org/system.3
*/

// C header typedef:
typedef SystemC = ffi.Int32 Function(ffi.Pointer<Utf8> command);

// Dart header typedef
typedef SystemDart = int Function(ffi.Pointer<Utf8> command);

int settingEnvironment(String command) {
  // Load `stdlib`. On MacOS this is in libSystem.dylib.
  final dylib = ffi.DynamicLibrary.open('libc.so.6');

  final systemX = dylib.lookupFunction<SystemC, SystemDart>('putenv');

  // Allocate a pointer to a Utf8 array containing our command.
  final cmdP = command.toNativeUtf8(); //Utf8.toUtf8(command);

  // Invoke the command, and free the pointer.
  final result = systemX(cmdP);
  calloc.free(cmdP);

  return result;
}
