import 'package:collection/collection.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

import 'components.dart';

// ==========================================
// CLASS: JasprConverter
// ==========================================

class JasprConverter {
  const JasprConverter({
    this.classesAsList = false,
  });

  /// Convert classes to list of strings with a join statement
  ///
  /// Useful for easily adding/removing classes in component code
  final bool classesAsList;

  // ------------------------------------------
  // METHOD: convert
  // ------------------------------------------

  /// Converts an HTML string input into Jaspr components
  String convert(String source) {
    String output = '';

    final doc = parse(source);

    // Process each top-level child of the root element
    for (final element in doc.children.first.children) {
      output += _convertElement(element, source);
    }

    output = '[${output.replaceAll('\n\n', '\n').trim()}]';
    return output;
  }

  // ------------------------------------------
  // METHOD: _convertElement
  // ------------------------------------------

  String _convertElement(Element e, String source) {
    final eName = e.localName;
    final c = components.firstWhereOrNull((c) => c.name == eName);
    final unSupportedComponent = c == null;
    final selfClosing = c?.selfClosing ?? false;
    final sourceContainsParent = source.contains('<$eName');

    // Skip elements added by the parser that are not present in the source
    if (!sourceContainsParent && e.children.isEmpty) {
      return '';
    }

    String out = '';

    // Handle the opening of the element
    if (sourceContainsParent) {
      if (selfClosing) {
        out = '\n$eName(\n';
      } else {
        if (unSupportedComponent) {
          out = "DomComponent(tag: '$eName', children: [";
        } else {
          out = '\n$eName([';
        }
      }
    }

    // Recursively convert nested DOM elements before handling text nodes
    for (final child in e.children) {
      out += _convertElement(child, source);
    }

    // Look for any inner text
    if (e.hasChildNodes()) {
      for (final node in e.nodes) {
        if (node.nodeType == Node.TEXT_NODE && (node.text?.trim().isNotEmpty ?? false)) {
          String value = node.text!.replaceAll('\n', '');
          // Escape any invalid characters to avoid breaking the string
          value = value.replaceAll(r'\', r'\\');
          value = value.replaceAll(r"$", r"\$");
          value = value.replaceAll(r"'", r"\'");
          out += "text('$value'),";
        }
      }
    }

    // Handle closing of the element
    if (!selfClosing) {
      out += '],';
    }

    // Add classes
    if (e.className.isNotEmpty) {
      if (classesAsList) {
        final classList = e.className.split(' ').map((e) => e.replaceAll(RegExp(r'\s+'), ' ').trim()).join("', '");
        out += "classes: ['$classList',].join(' '),";
      } else {
        out += "classes: '${e.className}',";
      }
    }

    // Add styles as a raw map
    if (e.attributes.containsKey('style')) {
      final rawStyle = e.attributes['style'].toString();
      final rawStyles = rawStyle.split(';');
      if (rawStyles.isNotEmpty) {
        out += 'styles: Styles.raw({';
        for (final s in rawStyles) {
          final style = s.split(':');
          if (style.length == 2) {
            out += "'${style[0].trim()}': '${style[1].trim()}',";
          }
        }
        out += '}),';
      }
    }

    // Handle supported and unsupported attributes
    if (c != null) {
      final Map<String, String> unsupportedAttrMap = {};

      // Add attributes
      for (final attr in e.attributes.entries) {
        String attrKey = attr.key.toString();

        if (attrKey == 'class' || attrKey == 'style') {
          continue;
        }

        // Check if attribute is supported by component
        final attrSchema = c.attributes.firstWhereOrNull((a) => a.raw == attrKey);

        // Special case for id attribute
        if (attrKey == 'id') {
          out += "id: '${attr.value}',";
          continue;
        }

        // Not supported, add to unsupported map
        if (attrSchema == null) {
          unsupportedAttrMap[attrKey] = attr.value;
          continue;
        }

        // Handle different attribute types
        if (attrSchema.type == 'Unit') {
          final px = attr.value.toString().replaceAll('px', '');
          out += "${attrSchema.name}: Unit.pixels($px),";
        } else if (attrSchema.type == 'Color') {
          if (attr.value.startsWith('#')) {
            out += "${attrSchema.name}: Color.hex('${attr.value}'),";
          } else {
            out += "${attrSchema.name}: Color.named('${attr.value}'),";
          }
        } else if (attrSchema.type == 'ButtonType') {
          out += "${attrSchema.name}: ButtonType.${attr.value},";
        } else if (attrSchema.type == 'InputType') {
          if (attr.value == 'datetime') {
            out += "${attrSchema.name}: InputType.date,";
          } else if (attr.value == 'datetime-local') {
            out += "${attrSchema.name}: InputType.dateTimeLocal,";
          } else {
            out += "${attrSchema.name}: InputType.${attr.value},";
          }
        } else if (attrSchema.type == 'NumberingType') {
          final typeMap = {
            'a': 'lowercaseLetters',
            'A': 'uppercaseLetters',
            'i': 'lowercaseRomanNumerals',
            'I': 'uppercaseRomanNumerals',
            '1': 'numbers',
          };
          if (typeMap.containsKey(attr.value)) {
            out += "${attrSchema.name}: NumberingType.${typeMap[attr.value]},";
          }
        } else if (attrSchema.type == 'boolean') {
          out += "${attrSchema.name}: true,";
        } else if (attrSchema.type == 'int' || attrSchema.type == 'double') {
          out += "${attrSchema.name}: ${attr.value},";
        } else {
          out += "${attrSchema.name}: '${attr.value}',";
        }
      }

      // Add unsupported attributes to attributes map
      if (unsupportedAttrMap.isNotEmpty) {
        out += 'attributes: {';
        for (final attr in unsupportedAttrMap.entries) {
          out += "'${attr.key}': '${attr.value}',";
        }
        out += '},';
      }
    }

    out += '),\n';

    return out;
  }
}
