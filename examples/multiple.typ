#import "../src/upn-qr.typ": upn_qr

#let debug = true

// Page setup
#set page(
  paper: "a4",
  margin: 0pt
)

// 3 on one page
#set par(spacing: 0pt)

#upn_qr(
  imePlacnika: "Poljubno podjetje d.o.o.",
  naslovPlacnika: "Lepa cesta 10",
  krajPlacnika: "2000 Maribor",
  ibanPlacnika: "SI56 0203 6025 3863 406",
  referencaPlacnika1: "SI00",
  referencaPlacnika2: "1234-12345-123",
  namenPlacila: "Plačilo računa",
  rokPlacila: "10.12.2025",
  kodaNamena: "CPYR",
  datumPlacila: none,
  nujno: true,
  imePrejemnika: "Olaii d.o.o.",
  naslovPrejemnika: "Litostrojska cesta 44a",
  krajPrejemnika: "1000 Ljubljana",
  ibanPrejemnika: "SI56 1010 0005 2910 391",
  referencaPrejemnika1: "SI00",
  referencaPrejemnika2: "1234",
  znesek: "***100,00",
  qrContent: "This is a test",
  topOffset: -3mm,
  debug: debug
)

#upn_qr(
  imePlacnika: "Poljubno podjetje d.o.o.",
  naslovPlacnika: "Lepa cesta 10",
  krajPlacnika: "2000 Maribor",
  ibanPlacnika: "SI56 0203 6025 3863 406",
  referencaPlacnika1: "SI00",
  referencaPlacnika2: "1234-12345-123",
  namenPlacila: "Plačilo računa",
  rokPlacila: "10.12.2025",
  kodaNamena: "CPYR",
  datumPlacila: none,
  nujno: true,
  imePrejemnika: "Olaii d.o.o.",
  naslovPrejemnika: "Litostrojska cesta 44a",
  krajPrejemnika: "1000 Ljubljana",
  ibanPrejemnika: "SI56 1010 0005 2910 391",
  referencaPrejemnika1: "SI00",
  referencaPrejemnika2: "1234",
  znesek: "***100,00",
  qrContent: "This is a test",
  topOffset: -1.5mm,
  debug: debug
)

#upn_qr(
  imePlacnika: "Poljubno podjetje d.o.o.",
  naslovPlacnika: "Lepa cesta 10",
  krajPlacnika: "2000 Maribor",
  ibanPlacnika: "SI56 0203 6025 3863 406",
  referencaPlacnika1: "SI00",
  referencaPlacnika2: "1234-12345-123",
  namenPlacila: "Plačilo računa",
  rokPlacila: "10.12.2025",
  kodaNamena: "CPYR",
  datumPlacila: none,
  nujno: true,
  imePrejemnika: "Olaii d.o.o.",
  naslovPrejemnika: "Litostrojska cesta 44a",
  krajPrejemnika: "1000 Ljubljana",
  ibanPrejemnika: "SI56 1010 0005 2910 391",
  referencaPrejemnika1: "SI00",
  referencaPrejemnika2: "1234",
  znesek: "***100,00",
  qrContent: "This is a test",
  debug: debug
)