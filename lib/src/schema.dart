// ==========================================
// CLASS: ComponentStructure
// ==========================================

class ComponentStructure {
  final String name;
  final List<ComponentAttribute> attributes;
  final bool selfClosing;

  const ComponentStructure({
    required this.name,
    this.attributes = const [],
    this.selfClosing = false,
  });
}

// ==========================================
// CLASS: ComponentAttribute
// ==========================================

class ComponentAttribute {
  final String raw;
  final String name;
  final String type;

  const ComponentAttribute({
    required this.raw,
    required this.name,
    required this.type,
  });
}

/// Inherited properties for all shapes
const List<ComponentAttribute> shapes = [
  ComponentAttribute(
    raw: 'fill',
    name: 'fill',
    type: 'Color',
  ),
  ComponentAttribute(
    raw: 'stroke',
    name: 'stroke',
    type: 'Color',
  ),
  ComponentAttribute(
    raw: 'stroke-width',
    name: 'strokeWidth',
    type: 'string',
  ),
];
