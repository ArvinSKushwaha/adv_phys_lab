#import "@preview/catppuccin:1.0.0": flavors
#import "@preview/whalogen:0.3.0": ce
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
#import "@preview/suiji:0.3.0": *
#import "@preview/great-theorems:0.1.1": *
#import "@preview/headcount:0.1.0": *
#import "@preview/physica:0.9.3": *
#import "@preview/unify:0.7.1": *

#let document_title = [Measuring Spin Echo Responses in Nuclear Magnetic Resonance]
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

#let raw_spin_echo_data = read("./data/SpinEchoResponse.02.dat").split("\n").slice(2, none).join("\n")
#let spin_echo_data = csv(bytes(raw_spin_echo_data), delimiter: "\t")

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

#outline()

#pagebreak()

#set page(columns: 2)

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

= Introduction

Nuclear Magnetic Resonance (NMR) is a broadly utilized tool for determining the
structure, density, and chemical environment of atomic nuclei, amongst other
quantities and characteristics.

For NMR to work, the atomic nuclei must carry a non-zero magnetic dipole moment
so it may couple to the external magnetic field. For #ce("@H,1,@"), we have a
spin of $1/2$. With our gyromagnetic ratio $gamma$, we have our magnetic dipole
moment:

$
  vc(mu) = gamma vc(S)
. $ <eq:dipole_moment_spin>

The state of our spin $1/2$ nucleus is represented by a spinor $(alpha, beta)$,
where $alpha, beta in CC$ and $norm(alpha)^2 + norm(beta)^2 = 1$. Our spin
vector $vc(S)$ is a vector of 3 operators: $S_(x), S_(y), S_(z)$, where $S_(i)
= hbar/2 sigma_(i)$ and $sigma_(i)$ are the Pauli matrices. Because of the
quantization of our spin, our magnetic dipole moments are also quantized. Since
our spin can be measured to be either $(hbar)/(2)$ or $-(hbar)/(2)$, our
magnetic dipole moment is either $(gamma hbar)/(2)$ or $-(gamma hbar)/(2)$
(along our axis of measurement).

= Methods

= Results



= Discussion

= Acknowledgements
