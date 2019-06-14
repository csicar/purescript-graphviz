module Graphics.Graphviz (renderToText, renderDotLang, Engine(..), Format(..)) where

import Data.DotLang.Class (class DotLang, toText)
import Data.Function ((<<<), (>>>))
import Data.Show (class Show, show)
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)


-- | engine → format → dotText → Aff String
foreign import _viz_internal ∷ String → String → String → EffectFnAff String

-- foreign import _viz_render ∷ ∀a. String → String → (String → a) 

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

data Format
  = Svg
  | SimpleDot
  | XDot
  | Plain
  | PlainExt
  | Ps
  | Ps2
  | Json
  | Json0

instance showFormat ∷ Show Format where
  show Svg = "svg"
  show SimpleDot = "dot"
  show XDot = "xdot"
  show Plain = "plain"
  show PlainExt = "plain-ext"
  show Ps = "ps"
  show Ps2 = "ps2"
  show Json = "json"
  show Json0 = "Json0"

renderToText ∷ Engine → Format → String → Aff String
renderToText engine format = fromEffectFnAff <<< (_viz_internal (show engine) (show format))

-- renderToJson ∷ Engine → Boolean → String → Aff Foreign
-- renderToJson engine useJson0 = fromEffectFnAff <<< (_viz_internal "renderJSONObject" (show engine) format)
--   where format = if useJson0 then "json0" else "json"

renderDotLang ∷ ∀a. DotLang a => Engine → Format → a → Aff String
renderDotLang engine format a = renderToText engine format (toText a)

-- renderReprSvg :: ∀a. GraphRepr a => Engine -> a -> String
-- renderReprSvg e a = renderToSvg e $ toGraph a

-- renderToJson :: ∀a. DotLang a => Engine -> a -> String
-- renderToJson e a = runFn4 viz_internal (toText a) "json" (show e) 1

-- renderToSvg :: ∀a. DotLang a => Engine -> a -> String
-- renderToSvg e a = runFn4 viz_internal (toText a) "svg" (show e) 1

-- renderToXDot :: ∀a. DotLang a => Engine → a → String
-- renderToXDot e a = runFn4 viz_internal (toText a) "xdot" (show e) 1
