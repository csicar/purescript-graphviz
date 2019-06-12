module Test.Main where

import Prelude

import Color.Scheme.MaterialDesign (red)
import Data.DotLang (Definition(..), Graph(..), node, (==>), (=*>))
import Data.DotLang.Attr (FillStyle(..))
import Data.DotLang.Attr.Edge as Edge
import Data.DotLang.Attr.Node (Attr(..), ShapeType(..))
import Data.DotLang.Attr.Node as Node
import Graphics.Graphviz (Engine(..), renderToSvg)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (writeTextFile)
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)
import Effect (Effect)

main ∷ Effect Unit
main = runTest do
  suite "Graphviz" do
    test "simple" do
      let g = DiGraph [
            node "a" [ Shape Diamond, Style Filled, Node.FillColor red ],
            node "b" [],
            "a" ==> "b",
            "a" =*> "d" $ [ Edge.Color red, Edge.PenWidth 3.0 ],
            Subgraph [
              node "d" []
            ]
        ]
      let rendered = renderToSvg Dot g
      writeTextFile UTF8 "./example.svg" rendered
      equal "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\"\n \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\">\n<!-- Generated by graphviz version 2.40.1 (20161225.0304)\n -->\n<!-- Title: %0 Pages: 1 -->\n<svg width=\"134pt\" height=\"116pt\"\n viewBox=\"0.00 0.00 134.00 116.00\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n<g id=\"graph0\" class=\"graph\" transform=\"scale(1 1) rotate(0) translate(4 112)\">\n<title>%0</title>\n<polygon fill=\"#ffffff\" stroke=\"transparent\" points=\"-4,4 -4,-112 130,-112 130,4 -4,4\"/>\n<!-- a -->\n<g id=\"node1\" class=\"node\">\n<title>a</title>\n<polygon fill=\"#f44336\" stroke=\"#000000\" points=\"63,-108 36,-90 63,-72 90,-90 63,-108\"/>\n<text text-anchor=\"middle\" x=\"63\" y=\"-85.8\" font-family=\"Times,serif\" font-size=\"14.00\" fill=\"#000000\">a</text>\n</g>\n<!-- b -->\n<g id=\"node2\" class=\"node\">\n<title>b</title>\n<ellipse fill=\"none\" stroke=\"#000000\" cx=\"27\" cy=\"-18\" rx=\"27\" ry=\"18\"/>\n<text text-anchor=\"middle\" x=\"27\" y=\"-13.8\" font-family=\"Times,serif\" font-size=\"14.00\" fill=\"#000000\">b</text>\n</g>\n<!-- a&#45;&gt;b -->\n<g id=\"edge1\" class=\"edge\">\n<title>a&#45;&gt;b</title>\n<path fill=\"none\" stroke=\"#000000\" d=\"M56.2287,-76.4574C51.7233,-67.4465 45.6551,-55.3103 40.2156,-44.4311\"/>\n<polygon fill=\"#000000\" stroke=\"#000000\" points=\"43.2549,-42.6835 35.6522,-35.3045 36.9939,-45.814 43.2549,-42.6835\"/>\n</g>\n<!-- d -->\n<g id=\"node3\" class=\"node\">\n<title>d</title>\n<ellipse fill=\"none\" stroke=\"#000000\" cx=\"99\" cy=\"-18\" rx=\"27\" ry=\"18\"/>\n<text text-anchor=\"middle\" x=\"99\" y=\"-13.8\" font-family=\"Times,serif\" font-size=\"14.00\" fill=\"#000000\">d</text>\n</g>\n<!-- a&#45;&gt;d -->\n<g id=\"edge2\" class=\"edge\">\n<title>a&#45;&gt;d</title>\n<path fill=\"none\" stroke=\"#f44336\" stroke-width=\"3\" d=\"M69.7713,-76.4574C74.2767,-67.4465 80.3449,-55.3103 85.7844,-44.4311\"/>\n<polygon fill=\"#f44336\" stroke=\"#f44336\" stroke-width=\"3\" points=\"89.0061,-45.814 90.3478,-35.3045 82.7451,-42.6835 89.0061,-45.814\"/>\n</g>\n</g>\n</svg>\n" rendered
