// Expose `Buffer` into the global.
window.Buffer = window['buffer'].Buffer;
const { DefaultRubyVM } = window["ruby-wasm-wasi"];
const globalData = {};
let myP5 = null;

const main = async () => {
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);

  // Fetch and instantiate WebAssembly binary
  const response = await fetch(
    //      Tips: Replace the binary with debug info if you want symbolicated stack trace.
    //      (only nightly release for now)
    //      "https://cdn.jsdelivr.net/npm/ruby-3_2-wasm-wasi@next/dist/ruby.debug+stdlib.wasm"
    "https://cdn.jsdelivr.net/npm/ruby-3_2-wasm-wasi@next/dist/ruby.wasm"
  );
  const buffer = await response.arrayBuffer();
  const module = await WebAssembly.compile(buffer);
  // const { vm } = await DefaultRubyVM(module);

  globalData.module = module;
  // globalData.vm = vm;

  // const p5rb = await fetch("p5.rb");
  // const t = await p5rb.text();

  // vm.eval(t);

  // vm.printVersion();

  document.getElementById("run").onclick = runScript;

  runScript();
};

main();

const runScript = async () => {
  const { vm } = await DefaultRubyVM(globalData.module);
  globalData.vm = vm;

  {
    const p5rb = await fetch("p5.rb");
    const t = await p5rb.text();
    vm.eval(t);
  }

  document.getElementById("error-console").value = "";

  try {
    const main = await fetch("main.rb");
    const t = await main.text();
    vm.eval(t);
  } catch (e) {
    document.getElementById("error-console").value += e.message + "\n"
    throw e
  }

  function registerRubyMethod(p5, name) {
    let isDefined = vm.eval(`defined?(${name}) == "method"`).toJS()
    if (!isDefined) {
      return
    }
    p5[name] = function () {
      try {
        vm.eval(name)
      } catch (e) {
        document.getElementById("error-console").value += e.message + "\n"
        throw e
      }
    };
  }

  // Initialize p5.js
  function sketch(p5) {
    vm.eval("P5").call("init", vm.wrap(p5))
    registerRubyMethod(p5, "preload");
    registerRubyMethod(p5, "setup");
    registerRubyMethod(p5, "draw");
    registerRubyMethod(p5, "mouseMoved");
    registerRubyMethod(p5, "mouseDragged");
    registerRubyMethod(p5, "mousePressed");
    registerRubyMethod(p5, "mouseReleased");
    registerRubyMethod(p5, "mouseClicked");
    registerRubyMethod(p5, "doubleClicked");
    registerRubyMethod(p5, "mouseWheel");
    registerRubyMethod(p5, "keyPressed");
    registerRubyMethod(p5, "keyReleased");
    registerRubyMethod(p5, "keyTyped");
  }

  myP5 && myP5.remove();
  myP5 = new p5(sketch, 'main');
}

