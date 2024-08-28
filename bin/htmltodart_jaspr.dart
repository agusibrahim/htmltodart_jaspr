import 'dart:convert';
import 'dart:js_interop';
import 'dart:typed_data';

//import 'package:js/js.dart' as js;
import 'package:dart_style/dart_style.dart';
import 'package:htmltodart_jaspr/jaspr_html_convert.dart';
import 'package:web/web.dart' as web;
import 'package:web/web.dart';

@JS()
external set convertToJaspr(JSFunction fn);

void main(List<String> arguments) async {}

void _createJasprElement(JSString data, JSFunction fn) {
  final converter = JasprConverter(classesAsList: false);
  var result = converter.convert(data.toString()).replaceAll(",}", "}").replaceAll(",]", "]").replaceAll(",)", ")");
  var jsprel = DartFormatter(indent: 2).format('final x = $result;').replaceAll("final x = ", "").replaceAll("  [", "[").replaceAll("  ];", "]").replaceAll("    ", "  ").replaceAll(" target: '_blank'", " target: Target.blank");
  fn.callAsFunction(null, jsprel.toJS);
}

@pragma("wasm:export")
void init() {
  convertToJaspr = _createJasprElement.toJS;
}
