# UPN QR typst template

Univerzalni plačilni nalog UPN QR (Obrazec UPN QR)

## Example

```typ
#import "src/upn-qr.typ": upn_qr

// Page setup
#set page(
  paper: "a4",
  margin: 0pt,
)

// UPN QR
#show: upn_qr.with(
  imePlacnika: "Poljubno podjetje d.o.o.
Lepa cesta 10
2000 Maribor",
  ibanPlacnika: "SI56 0203 6025 3863 406",
  referencaPlacnika1: "SI00",
  referencaPlacnika2: "1234-12345-123",
  namenPlacila: "Plačilo računa",
  rokPlacila: "10.12.2025",
  kodaNamena: "CPYR",
  datumPlacila: none,
  nujno: true,
  imePrejemnika: "Olaii d.o.o.
Litostrojska cesta 44a
1000 Ljubljana",
  ibanPrejemnika: "SI56 1010 0005 2910 391",
  referencaPrejemnika1: "SI00",
  referencaPrejemnika2: "1234",
  znesek: "***100,00"
)
```

## How to run examples

```bash
typst watch examples/main.typ --root ../
typst watch examples/bottom.typ --root ../
typst watch examples/multiple.typ --root ../
```

## Changelog

### **v0.0.1** - 18.7.2025

Initial Release
