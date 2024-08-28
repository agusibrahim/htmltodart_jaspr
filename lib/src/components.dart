import 'schema.dart';

const List<ComponentStructure> components = [
  ComponentStructure(
    name: 'article',
  ),
  ComponentStructure(
    name: 'aside',
  ),
  ComponentStructure(
    name: 'body',
  ),
  ComponentStructure(
    name: 'footer',
  ),
  ComponentStructure(
    name: 'head',
  ),
  ComponentStructure(
    name: 'header',
  ),
  ComponentStructure(
    name: 'html',
  ),
  ComponentStructure(
    name: 'h1',
  ),
  ComponentStructure(
    name: 'h2',
  ),
  ComponentStructure(
    name: 'h3',
  ),
  ComponentStructure(
    name: 'h4',
  ),
  ComponentStructure(
    name: 'h5',
  ),
  ComponentStructure(
    name: 'h6',
  ),
  ComponentStructure(
    name: 'nav',
  ),
  ComponentStructure(
    name: 'section',
  ),
  ComponentStructure(
    name: 'blockquote',
    attributes: [
      ComponentAttribute(
        raw: 'cite',
        name: 'cite',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'div',
  ),
  ComponentStructure(
    name: 'ul',
  ),
  ComponentStructure(
    name: 'ol',
    attributes: [
      ComponentAttribute(
        raw: 'reversed',
        name: 'reversed',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'start',
        name: 'start',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'type',
        name: 'type',
        type: 'NumberingType',
      ),
    ],
  ),
  ComponentStructure(
    name: 'li',
    attributes: [
      ComponentAttribute(
        raw: 'value',
        name: 'value',
        type: 'int',
      ),
    ],
  ),
  ComponentStructure(
    name: 'hr',
    selfClosing: true,
  ),
  ComponentStructure(
    name: 'p',
  ),
  ComponentStructure(
    name: 'pre',
  ),
  ComponentStructure(
    name: 'a',
    attributes: [
      ComponentAttribute(
        raw: 'download',
        name: 'download',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'href',
        name: 'href',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'target',
        name: 'target',
        type: 'Target',
      ),
      ComponentAttribute(
        raw: 'type',
        name: 'type',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'referrerpolicy',
        name: 'referrerPolicy',
        type: 'ReferrerPolicy',
      ),
    ],
  ),
  ComponentStructure(
    name: 'b',
  ),
  ComponentStructure(
    name: 'br',
    selfClosing: true,
  ),
  ComponentStructure(
    name: 'code',
  ),
  ComponentStructure(
    name: 'em',
  ),
  ComponentStructure(
    name: 'i',
  ),
  ComponentStructure(
    name: 's',
  ),
  ComponentStructure(
    name: 'small',
  ),
  ComponentStructure(
    name: 'span',
  ),
  ComponentStructure(
    name: 'strong',
  ),
  ComponentStructure(
    name: 'u',
  ),
  ComponentStructure(
    name: 'audio',
    attributes: [
      ComponentAttribute(
        raw: 'autoplay',
        name: 'autoplay',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'controls',
        name: 'controls',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'crossorigin',
        name: 'crossOrigin',
        type: 'CrossOrigin',
      ),
      ComponentAttribute(
        raw: 'loop',
        name: 'loop',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'muted',
        name: 'muted',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'preload',
        name: 'preload',
        type: 'Preload',
      ),
      ComponentAttribute(
        raw: 'src',
        name: 'src',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'img',
    selfClosing: true,
    attributes: [
      ComponentAttribute(
        raw: 'alt',
        name: 'alt',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'crossorigin',
        name: 'crossOrigin',
        type: 'CrossOrigin',
      ),
      ComponentAttribute(
        raw: 'width',
        name: 'width',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'height',
        name: 'height',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'loading',
        name: 'loading',
        type: 'MediaLoading',
      ),
      ComponentAttribute(
        raw: 'src',
        name: 'src',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'referrerpolicy',
        name: 'referrerPolicy',
        type: 'ReferrerPolicy',
      ),
    ],
  ),
  ComponentStructure(
    name: 'video',
    attributes: [
      ComponentAttribute(
        raw: 'autoplay',
        name: 'autoplay',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'controls',
        name: 'controls',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'crossorigin',
        name: 'crossOrigin',
        type: 'CrossOrigin',
      ),
      ComponentAttribute(
        raw: 'loop',
        name: 'loop',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'muted',
        name: 'muted',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'poster',
        name: 'poster',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'preload',
        name: 'preload',
        type: 'Preload',
      ),
      ComponentAttribute(
        raw: 'src',
        name: 'src',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'width',
        name: 'width',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'height',
        name: 'height',
        type: 'int',
      ),
    ],
  ),
  ComponentStructure(
    name: 'embed',
    selfClosing: true,
    attributes: [
      ComponentAttribute(
        raw: 'src',
        name: 'src',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'type',
        name: 'type',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'width',
        name: 'width',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'height',
        name: 'height',
        type: 'int',
      ),
    ],
  ),
  ComponentStructure(
    name: 'iframe',
    attributes: [
      ComponentAttribute(
        raw: 'src',
        name: 'src',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'allow',
        name: 'allow',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'csp',
        name: 'csp',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'loading',
        name: 'loading',
        type: 'MediaLoading',
      ),
      ComponentAttribute(
        raw: 'name',
        name: 'name',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'sandbox',
        name: 'sandbox',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'referrerpolicy',
        name: 'referrerPolicy',
        type: 'ReferrerPolicy',
      ),
      ComponentAttribute(
        raw: 'width',
        name: 'width',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'height',
        name: 'height',
        type: 'int',
      ),
    ],
  ),
  ComponentStructure(
    name: 'object',
    attributes: [
      ComponentAttribute(
        raw: 'data',
        name: 'data',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'name',
        name: 'name',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'type',
        name: 'type',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'width',
        name: 'width',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'height',
        name: 'height',
        type: 'int',
      ),
    ],
  ),
  ComponentStructure(
    name: 'source',
    selfClosing: true,
    attributes: [
      ComponentAttribute(
        raw: 'type',
        name: 'type',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'src',
        name: 'src',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'button',
    attributes: [
      ComponentAttribute(
        raw: 'autofocus',
        name: 'autofocus',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'disabled',
        name: 'disabled',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'type',
        name: 'type',
        type: 'ButtonType',
      ),
      ComponentAttribute(
        raw: 'onClick',
        name: 'onClick',
        type: 'VoidCallback',
      ),
    ],
  ),
  ComponentStructure(
    name: 'form',
    attributes: [
      ComponentAttribute(
        raw: 'action',
        name: 'action',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'method',
        name: 'method',
        type: 'FormMethod',
      ),
      ComponentAttribute(
        raw: 'enctype',
        name: 'encType',
        type: 'FormEncType',
      ),
      ComponentAttribute(
        raw: 'autocomplete',
        name: 'autoComplete',
        type: 'AutoComplete',
      ),
      ComponentAttribute(
        raw: 'name',
        name: 'name',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'novalidate',
        name: 'noValidate',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'target',
        name: 'target',
        type: 'Target',
      ),
    ],
  ),
  ComponentStructure(
    name: 'input',
    attributes: [
      ComponentAttribute(
        raw: 'type',
        name: 'type',
        type: 'InputType',
      ),
      ComponentAttribute(
        raw: 'name',
        name: 'name',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'value',
        name: 'value',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'disabled',
        name: 'disabled',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'onInput',
        name: 'onInput',
        type: 'ValueChanged<dynamic>',
      ),
      ComponentAttribute(
        raw: 'onChange',
        name: 'onChange',
        type: 'ValueChanged<dynamic>',
      ),
    ],
  ),
  ComponentStructure(
    name: 'label',
    attributes: [
      ComponentAttribute(
        raw: 'for',
        name: 'htmlFor',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'datalist',
  ),
  ComponentStructure(
    name: 'legend',
  ),
  ComponentStructure(
    name: 'meter',
    attributes: [
      ComponentAttribute(
        raw: 'value',
        name: 'value',
        type: 'double',
      ),
      ComponentAttribute(
        raw: 'min',
        name: 'min',
        type: 'double',
      ),
      ComponentAttribute(
        raw: 'max',
        name: 'max',
        type: 'double',
      ),
      ComponentAttribute(
        raw: 'low',
        name: 'low',
        type: 'double',
      ),
      ComponentAttribute(
        raw: 'high',
        name: 'high',
        type: 'double',
      ),
      ComponentAttribute(
        raw: 'optimum',
        name: 'optimum',
        type: 'double',
      ),
    ],
  ),
  ComponentStructure(
    name: 'progress',
    attributes: [
      ComponentAttribute(
        raw: 'value',
        name: 'value',
        type: 'double',
      ),
      ComponentAttribute(
        raw: 'max',
        name: 'max',
        type: 'double',
      ),
    ],
  ),
  ComponentStructure(
    name: 'optgroup',
    attributes: [
      ComponentAttribute(
        raw: 'label',
        name: 'label',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'disabled',
        name: 'disabled',
        type: 'boolean',
      ),
    ],
  ),
  ComponentStructure(
    name: 'option',
    attributes: [
      ComponentAttribute(
        raw: 'label',
        name: 'label',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'value',
        name: 'value',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'selected',
        name: 'selected',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'disabled',
        name: 'disabled',
        type: 'boolean',
      ),
    ],
  ),
  ComponentStructure(
    name: 'select',
    attributes: [
      ComponentAttribute(
        raw: 'name',
        name: 'name',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'multiple',
        name: 'multiple',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'required',
        name: 'required',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'disabled',
        name: 'disabled',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'autofocus',
        name: 'autofocus',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'autocomplete',
        name: 'autocomplete',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'size',
        name: 'size',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'onInput',
        name: 'onInput',
        type: 'ValueChanged<List<String>>',
      ),
      ComponentAttribute(
        raw: 'onChange',
        name: 'onChange',
        type: 'ValueChanged<List<String>>',
      ),
    ],
  ),
  ComponentStructure(
    name: 'fieldset',
    attributes: [
      ComponentAttribute(
        raw: 'name',
        name: 'name',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'disabled',
        name: 'disabled',
        type: 'boolean',
      ),
    ],
  ),
  ComponentStructure(
    name: 'textarea',
    attributes: [
      ComponentAttribute(
        raw: 'autocomplete',
        name: 'autoComplete',
        type: 'AutoComplete',
      ),
      ComponentAttribute(
        raw: 'autofocus',
        name: 'autofocus',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'cols',
        name: 'cols',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'disabled',
        name: 'disabled',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'minlength',
        name: 'minLength',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'name',
        name: 'name',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'placeholder',
        name: 'placeholder',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'readonly',
        name: 'readonly',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'required',
        name: 'required',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'rows',
        name: 'rows',
        type: 'int',
      ),
      ComponentAttribute(
        raw: 'spellcheck',
        name: 'spellCheck',
        type: 'SpellCheck',
      ),
      ComponentAttribute(
        raw: 'wrap',
        name: 'wrap',
        type: 'TextWrap',
      ),
      ComponentAttribute(
        raw: 'onInput',
        name: 'onInput',
        type: 'ValueChanged<String>',
      ),
      ComponentAttribute(
        raw: 'onChange',
        name: 'onChange',
        type: 'ValueChanged<String>',
      ),
    ],
  ),
  ComponentStructure(
    name: 'details',
    attributes: [
      ComponentAttribute(
        raw: 'open',
        name: 'open',
        type: 'boolean',
      ),
    ],
  ),
  ComponentStructure(
    name: 'dialog',
    attributes: [
      ComponentAttribute(
        raw: 'open',
        name: 'open',
        type: 'boolean',
      ),
    ],
  ),
  ComponentStructure(
    name: 'summary',
  ),
  ComponentStructure(
    name: 'link',
    selfClosing: true,
    attributes: [
      ComponentAttribute(
        raw: 'href',
        name: 'href',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'rel',
        name: 'rel',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'type',
        name: 'type',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'as',
        name: 'as',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'script',
    attributes: [
      ComponentAttribute(
        raw: 'async',
        name: 'async',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'defer',
        name: 'defer',
        type: 'boolean',
      ),
      ComponentAttribute(
        raw: 'src',
        name: 'src',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'svg',
    attributes: [
      ComponentAttribute(
        raw: 'viewBox',
        name: 'viewBox',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'width',
        name: 'width',
        type: 'Unit',
      ),
      ComponentAttribute(
        raw: 'height',
        name: 'height',
        type: 'Unit',
      ),
    ],
  ),
  ComponentStructure(
    name: 'rect',
    attributes: [
      ...shapes,
      ComponentAttribute(
        raw: 'x',
        name: 'x',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'y',
        name: 'y',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'width',
        name: 'width',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'height',
        name: 'height',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'circle',
    attributes: [
      ...shapes,
      ComponentAttribute(
        raw: 'cx',
        name: 'cx',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'cy',
        name: 'cy',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'r',
        name: 'r',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'ellipse',
    attributes: [
      ...shapes,
      ComponentAttribute(
        raw: 'cx',
        name: 'cx',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'cy',
        name: 'cy',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'rx',
        name: 'rx',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'ry',
        name: 'ry',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'line',
    attributes: [
      ...shapes,
      ComponentAttribute(
        raw: 'x1',
        name: 'x1',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'y1',
        name: 'y1',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'x2',
        name: 'x2',
        type: 'string',
      ),
      ComponentAttribute(
        raw: 'y2',
        name: 'y2',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'path',
    attributes: [
      ...shapes,
      ComponentAttribute(
        raw: 'd',
        name: 'd',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'polygon',
    attributes: [
      ...shapes,
      ComponentAttribute(
        raw: 'points',
        name: 'points',
        type: 'string',
      ),
    ],
  ),
  ComponentStructure(
    name: 'polyline',
    attributes: [
      ...shapes,
      ComponentAttribute(
        raw: 'points',
        name: 'points',
        type: 'string',
      ),
    ],
  ),
];
