module Graphics.Graphviz (renderToJson, renderToSvg, renderReprSvg, Engine(..)) where

import Data.DotLang (class GraphRepr, toGraph)
import Data.DotLang.Class (class DotLang, toText)
import Data.Function (($))
import Data.Function.Uncurried (Fn4, runFn4)
import Data.Show (class Show, show)

foreign import viz_internal :: Fn4 String String String Int String

data Engine
  = Circo
  | Dot
  | Neato
  | Osage
  | Twopi

instance showEngine :: Show Engine where
  show Circo = "circo"
  show Dot = "dot"
  show Neato = "neato"
  show Osage = "osage"
  show Twopi = "twopi"


renderReprSvg :: ∀a. GraphRepr a => Engine -> a -> String
renderReprSvg e a = renderToSvg e $ toGraph a

renderToJson :: ∀a. DotLang a => Engine -> a -> String
renderToJson e a = runFn4 viz_internal (toText a) "json" (show e) 1

renderToSvg :: ∀a. DotLang a => Engine -> a -> String
renderToSvg e a = runFn4 viz_internal (toText a) "svg" (show e) 1

renderToXDot :: ∀a. DotLang a => Engine → a → String
renderToXDot e a = runFn4 viz_internal (toText a) "xdot" (show e) 1
