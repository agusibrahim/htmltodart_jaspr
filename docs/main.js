(async function () {
  try {
    const dartModulePromise = WebAssembly.compileStreaming(fetch('jasprconverter.wasm'));
    let dart2wasm_runtime = await import('./jasprconverter.mjs');
    let moduleInstance = await dart2wasm_runtime.instantiate(dartModulePromise, {});
    moduleInstance.exports.init()
    
  } catch (exception) {
    console.error(`Failed to fetch and instantiate wasm module: ${exception}`);
  }
})();