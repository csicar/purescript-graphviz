Purescript-Graphviz
===================

renders Graphs defined in `Data.DotLang` to SVG, JSON and XDOT.

```purescript
let g = DiGraph [
    node "a" [ Shape Diamond, Style Filled,  FillColor red ],
    node "b" [],
    "a" ==> "b",
    "a" ==> "d",
    Subgraph [
        node "d" []
    ]
]
let rendered = renderToSvg Dot g
```
`rendered` will be:

![example image](example.svg)

Installation
------------

### Spago
```dhall
additions =
   { graphviz =
      { dependencies =
         [ "aff"
         , "console"
         , "dotlang"
         , "effect"
         , "functions"
         , "node-fs"
         , "node-fs-aff"
         , "prelude"
         , "psci-support"
         , "test-unit"
         ]
      , repo = "https://github.com/csicar/purescript-graphviz"
      , version = "v1.1.0" 
      }
   }
```

```bash
spago install graphviz
```

Development
-----------

### Running Tests

```bash
$ spago install
$ npm install # for running tests in node
$ spago test
```