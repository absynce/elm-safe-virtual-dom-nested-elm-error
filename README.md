# SSCCE of Elm custom element error in elm-safe-virtual-dom

There's an error when there's an Elm custom element inside of a `Browser.{document|application}`...depending on spacing in HTML body. Does not happen with `Browser.element` or if the Elm custom element is not rendered.

```bash
npm i
npm start
```

Go to any of the following. Some require the debugger to be opened for an error to show up.

- ❌ `doc.html` - error on load, stops execution
- ❌ `doc-no-space-body.html` - error when debugger is opened
- ❌ `doc-defer-head-scripts.html` - error when debugger is opened
- ❌ `app.html` - error on load, stops execution
- ❌ `app-no-space-body-error.html` - error when debugger is opened
- ❌ `app-defer-head-scripts-error-debugger.html` - error when debugger is opened


## Stack trace

Sometimes it's in `_VirtualDom_consumeDomNode` [line 1302](https://github.com/lydell/virtual-dom/blob/4163ad89613a6da9f29d7a9240f08fcc471d6cf5/src/Elm/Kernel/VirtualDom.js#L1302) of `src/Elm/Kernel/VirtualDom.js`:
```
Uncaught TypeError: x_ is undefined
    _VirtualDom_consumeDomNode http://localhost:56498/build/main.js:7351
    _VirtualDom_diffHelp http://localhost:56498/build/main.js:7106
    _VirtualDom_diffKids http://localhost:56498/build/main.js:7475
    _VirtualDom_diffNodes http://localhost:56498/build/main.js:7381
    _VirtualDom_diffHelp http://localhost:56498/build/main.js:7171
    _VirtualDom_applyPatches http://localhost:56498/build/main.js:7803
    _Debugger_document http://localhost:56498/build/main.js:8315
    drawHelp http://localhost:56498/build/main.js:8922
    _Browser_makeAnimator http://localhost:56498/build/main.js:8940
    _Debugger_document http://localhost:56498/build/main.js:8303
    _Platform_initialize http://localhost:56498/build/main.js:5396
    _Debugger_document http://localhost:56498/build/main.js:8279
    F4 http://localhost:56498/build/main.js:3517
    init http://localhost:56498/build/main.js:1342
    <anonymous> http://localhost:56498/:28
main.js:7351:6
```

Other times it's in `_VirtualDom_removeVisit` [line 1211](https://github.com/lydell/virtual-dom/blob/4163ad89613a6da9f29d7a9240f08fcc471d6cf5/src/Elm/Kernel/VirtualDom.js#L1211) of `src/Elm/Kernel/VirtualDom.js`.

```
Uncaught TypeError: x_ is undefined
    _VirtualDom_removeVisit http://localhost:56498/build/main.js:7260
    _VirtualDom_diffKids http://localhost:56498/build/main.js:7504
    _VirtualDom_diffNodes http://localhost:56498/build/main.js:7381
    _VirtualDom_diffHelp http://localhost:56498/build/main.js:7171
    _VirtualDom_applyPatches http://localhost:56498/build/main.js:7803
    _Browser_document http://localhost:56498/build/main.js:8230
    drawHelp http://localhost:56498/build/main.js:8323
    _Browser_makeAnimator http://localhost:56498/build/main.js:8341
    _Browser_document http://localhost:56498/build/main.js:8223
    _Platform_initialize http://localhost:56498/build/main.js:5396
    _Browser_document http://localhost:56498/build/main.js:8205
    F4 http://localhost:56498/build/main.js:3517
    init http://localhost:56498/build/main.js:1342
    <anonymous> http://localhost:56498/:28
main.js:7260:6
```

This happens in Zen `1.13.2b (Firefox 139.0.4)`, Firefox Developer Edition `140.0b9 (aarch64)`, and Brave `Brave 1.80.120 (Official Build) (arm64) Chromium: 138.0.7204.101`.

The machine is an M3 Macbook Pro.
