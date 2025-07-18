#import "../src/upn-qr.typ": upn_qr

#let debug = false

// Page setup
#set page(
  paper: "a4",
  margin: 0pt,
)

// 3 on one page
#set par(spacing: 0pt)

#block(
  height: 197mm,
  inset: 2cm,
  lorem(200)
)

#show: upn_qr.with(
  imePlacnika: "Poljubno podjetje d.o.o.
Lepa cesta 10
2000 Maribor",
  ibanPlacnika: "SI56 0203 6025 3863 406",
  referencaPlacnika1: "SI00",
  referencaPlacnika2: "225268-32526-222",
  namenPlacila: "Plačilo računa 18/2016",
  rokPlacila: "10.06.2016",
  kodaNamena: "CPYR",
  datumPlacila: "11.05.2016",
  nujno: true,
  imePrejemnika: "Združenje bank Slovenije - GIZ
Šubičeva 2
1000 Ljubljana",
  ibanPrejemnika: "SI56 0203 6025 3863 406",
  referencaPrejemnika1: "SI08",
  referencaPrejemnika2: "1236-17-345679",
  znesek: "***268,74",
  qrContent: "This is a test",
  debug: debug
)