{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "graphviz"
, dependencies =
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
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
