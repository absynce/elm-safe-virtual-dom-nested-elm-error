# SSCCE of Elm custom element error in elm-safe-virtual-dom

There's an error when there's an Elm custom element inside of a `Browser.{document|application}`...depending on spacing in HTML body.

✅ `index-defer-head-scripts-work.html` - works
✅ `index-no-space-body-works.html` - works
❌ `index.html` - error rendering, stops execution,

Stack trace
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

I believe this is line 1211 of `src/Elm/Kernel/VirtualDom.js`: https://github.com/lydell/virtual-dom/blob/4163ad89613a6da9f29d7a9240f08fcc471d6cf5/src/Elm/Kernel/VirtualDom.js#L1211.
