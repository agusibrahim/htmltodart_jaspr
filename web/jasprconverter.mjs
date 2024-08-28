let buildArgsList;

// `modulePromise` is a promise to the `WebAssembly.module` object to be
//   instantiated.
// `importObjectPromise` is a promise to an object that contains any additional
//   imports needed by the module that aren't provided by the standard runtime.
//   The fields on this object will be merged into the importObject with which
//   the module will be instantiated.
// This function returns a promise to the instantiated module.
export const instantiate = async (modulePromise, importObjectPromise) => {
    let dartInstance;

    function stringFromDartString(string) {
        const totalLength = dartInstance.exports.$stringLength(string);
        let result = '';
        let index = 0;
        while (index < totalLength) {
          let chunkLength = Math.min(totalLength - index, 0xFFFF);
          const array = new Array(chunkLength);
          for (let i = 0; i < chunkLength; i++) {
              array[i] = dartInstance.exports.$stringRead(string, index++);
          }
          result += String.fromCharCode(...array);
        }
        return result;
    }

    function stringToDartString(string) {
        const length = string.length;
        let range = 0;
        for (let i = 0; i < length; i++) {
            range |= string.codePointAt(i);
        }
        if (range < 256) {
            const dartString = dartInstance.exports.$stringAllocate1(length);
            for (let i = 0; i < length; i++) {
                dartInstance.exports.$stringWrite1(dartString, i, string.codePointAt(i));
            }
            return dartString;
        } else {
            const dartString = dartInstance.exports.$stringAllocate2(length);
            for (let i = 0; i < length; i++) {
                dartInstance.exports.$stringWrite2(dartString, i, string.charCodeAt(i));
            }
            return dartString;
        }
    }

    // Prints to the console
    function printToConsole(value) {
      if (typeof dartPrint == "function") {
        dartPrint(value);
        return;
      }
      if (typeof console == "object" && typeof console.log != "undefined") {
        console.log(value);
        return;
      }
      if (typeof print == "function") {
        print(value);
        return;
      }

      throw "Unable to print message: " + js;
    }

    // Converts a Dart List to a JS array. Any Dart objects will be converted, but
    // this will be cheap for JSValues.
    function arrayFromDartList(constructor, list) {
        const length = dartInstance.exports.$listLength(list);
        const array = new constructor(length);
        for (let i = 0; i < length; i++) {
            array[i] = dartInstance.exports.$listRead(list, i);
        }
        return array;
    }

    buildArgsList = function(list) {
        const dartList = dartInstance.exports.$makeStringList();
        for (let i = 0; i < list.length; i++) {
            dartInstance.exports.$listAdd(dartList, stringToDartString(list[i]));
        }
        return dartList;
    }

    // A special symbol attached to functions that wrap Dart functions.
    const jsWrappedDartFunctionSymbol = Symbol("JSWrappedDartFunction");

    function finalizeWrapper(dartFunction, wrapped) {
        wrapped.dartFunction = dartFunction;
        wrapped[jsWrappedDartFunctionSymbol] = true;
        return wrapped;
    }

    // Imports
    const dart2wasm = {

_20: (x0,x1,x2) => x0.call(x1,x2),
_75: x0 => globalThis.convertToJaspr = x0,
_76: f => finalizeWrapper(f,(x0,x1) => dartInstance.exports._76(f,x0,x1)),
_12912: v => stringToDartString(v.toString()),
_12926: s => {
      const jsSource = stringFromDartString(s);
      if (!/^\s*[+-]?(?:Infinity|NaN|(?:\.\d+|\d+(?:\.\d*)?)(?:[eE][+-]?\d+)?)\s*$/.test(jsSource)) {
        return NaN;
      }
      return parseFloat(jsSource);
    },
_12927: () => {
          let stackString = new Error().stack.toString();
          let frames = stackString.split('\n');
          let drop = 2;
          if (frames[0] === 'Error') {
              drop += 1;
          }
          return frames.slice(drop).join('\n');
        },
_12931: () => {
      // On browsers return `globalThis.location.href`
      if (globalThis.location != null) {
        return stringToDartString(globalThis.location.href);
      }
      return null;
    },
_12932: () => {
        return typeof process != undefined &&
               Object.prototype.toString.call(process) == "[object process]" &&
               process.platform == "win32"
      },
_12936: s => stringToDartString(JSON.stringify(stringFromDartString(s))),
_12937: s => printToConsole(stringFromDartString(s)),
_12955: (c) =>
              queueMicrotask(() => dartInstance.exports.$invokeCallback(c)),
_12957: (a, i) => a.push(i),
_12967: (a, b) => a == b ? 0 : (a > b ? 1 : -1),
_12968: a => a.length,
_12970: (a, i) => a[i],
_12971: (a, i, v) => a[i] = v,
_12973: a => a.join(''),
_12974: (o, a, b) => o.replace(a, b),
_12976: (s, t) => s.split(t),
_12977: s => s.toLowerCase(),
_12978: s => s.toUpperCase(),
_12979: s => s.trim(),
_12981: s => s.trimRight(),
_12983: (s, p, i) => s.indexOf(p, i),
_12984: (s, p, i) => s.lastIndexOf(p, i),
_12986: (o, start, length) => new Uint8Array(o.buffer, o.byteOffset + start, length),
_12987: (o, start, length) => new Int8Array(o.buffer, o.byteOffset + start, length),
_12988: (o, start, length) => new Uint8ClampedArray(o.buffer, o.byteOffset + start, length),
_12989: (o, start, length) => new Uint16Array(o.buffer, o.byteOffset + start, length),
_12990: (o, start, length) => new Int16Array(o.buffer, o.byteOffset + start, length),
_12991: (o, start, length) => new Uint32Array(o.buffer, o.byteOffset + start, length),
_12992: (o, start, length) => new Int32Array(o.buffer, o.byteOffset + start, length),
_12995: (o, start, length) => new Float32Array(o.buffer, o.byteOffset + start, length),
_12996: (o, start, length) => new Float64Array(o.buffer, o.byteOffset + start, length),
_12997: Object.is,
_13000: (o) => new DataView(o.buffer, o.byteOffset, o.byteLength),
_13004: Function.prototype.call.bind(Object.getOwnPropertyDescriptor(DataView.prototype, 'byteLength').get),
_13005: (b, o) => new DataView(b, o),
_13007: Function.prototype.call.bind(DataView.prototype.getUint8),
_13008: Function.prototype.call.bind(DataView.prototype.setUint8),
_13009: Function.prototype.call.bind(DataView.prototype.getInt8),
_13010: Function.prototype.call.bind(DataView.prototype.setInt8),
_13011: Function.prototype.call.bind(DataView.prototype.getUint16),
_13012: Function.prototype.call.bind(DataView.prototype.setUint16),
_13013: Function.prototype.call.bind(DataView.prototype.getInt16),
_13014: Function.prototype.call.bind(DataView.prototype.setInt16),
_13015: Function.prototype.call.bind(DataView.prototype.getUint32),
_13016: Function.prototype.call.bind(DataView.prototype.setUint32),
_13017: Function.prototype.call.bind(DataView.prototype.getInt32),
_13018: Function.prototype.call.bind(DataView.prototype.setInt32),
_13023: Function.prototype.call.bind(DataView.prototype.getFloat32),
_13024: Function.prototype.call.bind(DataView.prototype.setFloat32),
_13025: Function.prototype.call.bind(DataView.prototype.getFloat64),
_13026: Function.prototype.call.bind(DataView.prototype.setFloat64),
_13032: s => stringToDartString(stringFromDartString(s).toUpperCase()),
_13033: s => stringToDartString(stringFromDartString(s).toLowerCase()),
_13035: (s, m) => {
          try {
            return new RegExp(s, m);
          } catch (e) {
            return String(e);
          }
        },
_13036: (x0,x1) => x0.exec(x1),
_13037: (x0,x1) => x0.test(x1),
_13038: (x0,x1) => x0.exec(x1),
_13039: (x0,x1) => x0.exec(x1),
_13040: x0 => x0.pop(),
_13046: o => o === undefined,
_13047: o => typeof o === 'boolean',
_13048: o => typeof o === 'number',
_13050: o => typeof o === 'string',
_13053: o => o instanceof Int8Array,
_13054: o => o instanceof Uint8Array,
_13055: o => o instanceof Uint8ClampedArray,
_13056: o => o instanceof Int16Array,
_13057: o => o instanceof Uint16Array,
_13058: o => o instanceof Int32Array,
_13059: o => o instanceof Uint32Array,
_13060: o => o instanceof Float32Array,
_13061: o => o instanceof Float64Array,
_13062: o => o instanceof ArrayBuffer,
_13063: o => o instanceof DataView,
_13064: o => o instanceof Array,
_13065: o => typeof o === 'function' && o[jsWrappedDartFunctionSymbol] === true,
_13068: o => o instanceof RegExp,
_13069: (l, r) => l === r,
_13070: o => o,
_13071: o => o,
_13072: o => o,
_13073: b => !!b,
_13074: o => o.length,
_13077: (o, i) => o[i],
_13078: f => f.dartFunction,
_13079: l => arrayFromDartList(Int8Array, l),
_13080: l => arrayFromDartList(Uint8Array, l),
_13081: l => arrayFromDartList(Uint8ClampedArray, l),
_13082: l => arrayFromDartList(Int16Array, l),
_13083: l => arrayFromDartList(Uint16Array, l),
_13084: l => arrayFromDartList(Int32Array, l),
_13085: l => arrayFromDartList(Uint32Array, l),
_13086: l => arrayFromDartList(Float32Array, l),
_13087: l => arrayFromDartList(Float64Array, l),
_13088: (data, length) => {
          const view = new DataView(new ArrayBuffer(length));
          for (let i = 0; i < length; i++) {
              view.setUint8(i, dartInstance.exports.$byteDataGetUint8(data, i));
          }
          return view;
        },
_13089: l => arrayFromDartList(Array, l),
_13090: stringFromDartString,
_13091: stringToDartString,
_13094: l => new Array(l),
_13098: (o, p) => o[p],
_13102: o => String(o),
_13107: x0 => x0.index,
_13109: x0 => x0.length,
_13111: (x0,x1) => x0[x1],
_13113: (x0,x1) => x0.exec(x1),
_13115: x0 => x0.flags,
_13116: x0 => x0.multiline,
_13117: x0 => x0.ignoreCase,
_13118: x0 => x0.unicode,
_13119: x0 => x0.dotAll,
_13120: (x0,x1) => x0.lastIndex = x1
    };

    const baseImports = {
        dart2wasm: dart2wasm,


        Math: Math,
        Date: Date,
        Object: Object,
        Array: Array,
        Reflect: Reflect,
    };

    const jsStringPolyfill = {
        "charCodeAt": (s, i) => s.charCodeAt(i),
        "compare": (s1, s2) => {
            if (s1 < s2) return -1;
            if (s1 > s2) return 1;
            return 0;
        },
        "concat": (s1, s2) => s1 + s2,
        "equals": (s1, s2) => s1 === s2,
        "fromCharCode": (i) => String.fromCharCode(i),
        "length": (s) => s.length,
        "substring": (s, a, b) => s.substring(a, b),
    };

    dartInstance = await WebAssembly.instantiate(await modulePromise, {
        ...baseImports,
        ...(await importObjectPromise),
        "wasm:js-string": jsStringPolyfill,
    });

    return dartInstance;
}

// Call the main function for the instantiated module
// `moduleInstance` is the instantiated dart2wasm module
// `args` are any arguments that should be passed into the main function.
export const invoke = (moduleInstance, ...args) => {
    const dartMain = moduleInstance.exports.$getMain();
    const dartArgs = buildArgsList(args);
    moduleInstance.exports.$invokeMain(dartMain, dartArgs);
}

