#import "@preview/catppuccin:1.0.0": flavors
#import "@preview/whalogen:0.3.0": ce
#import "@preview/cetz:0.3.1"
#import "@preview/suiji:0.3.0": *
#import "@preview/great-theorems:0.1.1": *
#import "@preview/headcount:0.1.0": *
#import "@preview/physica:0.9.3": *
#import "@preview/unify:0.7.1": *

#let document_title = [Quantum Control using Nuclear Magnetic Resonace]
#let short_document_title = "Quantum Control"
#let student = "Arvin Kushwaha, Kishore Palaniswami"
#let professor = "Prof. Dr. Philipp Rosenzweig"

#let flavor = flavors.latte
#let palette = flavor.colors

#set document(title: [#document_title (#student)], author: (student))
#set page(
  "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  header: [
    #set text(10pt)
    #smallcaps[#short_document_title]
    #h(1fr)
    _#(student)_
  ],
)
#set text(font: "New Computer Modern", size: 11pt)
#set heading(numbering: "1.")
#let vc = math.arrow

#show raw: set text(
  font: "Fira Code",
  ligatures: true,
  historical-ligatures: true,
  discretionary-ligatures: true,
)
#set par(justify: true, spacing: 1em, first-line-indent: 1em)
#show heading: set block(above: 1.4em, below: 1em)

#align(center)[
  #v(10em)
  #title([#text(size: 14pt, weight: "regular")[#document_title]]) \
  #v(-1.75em)
  #text(size: 12pt)[#student] \
  #v(0.15em)
  #text(size: 12pt)[#professor] \
  #v(10em)
]

#show: great-theorems-init
#let thmcount = counter("theorems")
#let theorem = mathblock(
  blocktitle: "Theorem",
  counter: thmcount,
  numbering: dependent-numbering("1.1", levels: 1),
)

#show: body => {
  for elem in body.children {
    if elem.func() == math.equation and elem.block {
      let numbering = if "label" in elem.fields().keys() { "(1)" } else { none }
      set math.equation(numbering: numbering)
      elem
    } else {
      elem
    }
  }
}

#outline()

#pagebreak()

= Introduction

= Methods

= Results

= Discussion

= Acknowledegments