#import "@preview/tiaoma:0.3.0" // For QR code

#let upn_qr(
  imePlacnika: "",
  naslovPlacnika: "",
  krajPlacnika: "",
  ibanPlacnika: "",
  referencaPlacnika1: "",
  referencaPlacnika2: "",
  namenPlacila: "",
  rokPlacila: "",
  kodaNamena: "",
  datumPlacila: "",
  nujno: false,
  polog: false,
  dvig: false,

  imePrejemnika: "",
  naslovPrejemnika: "",
  krajPrejemnika: "",
  ibanPrejemnika: "",
  referencaPrejemnika1: "",
  referencaPrejemnika2: "",

  znesek: "",
  qrContent: "",

  topOffset: 0mm,
  leftOffset: 0mm,

  debug: false,
  debugWithBackground: false,
) = {
  // Debug
  let debug = debug
  let strokeWidth = if (debug) { 0.5pt } else { 0pt };

  // Font
  set text(
    font: "Arial",
    size: 8pt,
    fill: black,
  )

  // Default rect
  set block(
    fill: none,
    stroke: 0pt,
    inset: 0pt,
  )
  set rect(
    fill: none,
    stroke: 0pt,
    inset: 0pt,
  )

  // Boolean box
  let booleanBox(value) = stack(
    dir: ttb,
    v(0.5mm),
    rect(
      width: 4mm, 
      height: 4mm, 
      stroke: strokeWidth,
      align(center + horizon, block(if (value == true) {"X"}))
    )
  )

  // Test data
  let data = (
    placnik: (
      ime: imePlacnika,
      naslov: naslovPlacnika,
      kraj: krajPlacnika,
      iban: ibanPlacnika,
      referenca1: referencaPlacnika1,
      referenca2: referencaPlacnika2,
      namen: namenPlacila,
      rokPlacila: rokPlacila,
      kodaNamena: kodaNamena,
      datumPlacila: datumPlacila,
      nujno: nujno,
      polog: polog,
      dvig: dvig,
    ),
    prejemnik: (
      ime: imePrejemnika,
      naslov: naslovPrejemnika,
      kraj: krajPrejemnika,
      iban: ibanPrejemnika,
      referenca1: referencaPrejemnika1,
      referenca2: referencaPrejemnika2,
    ),
    znesek: znesek,
    qrContent: qrContent,
  )

  /*
  let qrCode = ""
  qrCode += "UPNQR" + "\n" // 1. Vodilni slog
  qrCode += data.placnik.iban + "\n" // 2. IBAN plačnika
  qrCode += "" + "\n" // 3. Polog
  qrCode += "" + "\n" // 4. Dvig
  qrCode += data.placnik.referenca1 + " " + data.placnik.referenca2 + "\n" // 5. Referenca plačnika 
  qrCode += data.placnik.ime + "\n" // 6. Ime plačnika (Obvezno)
  qrCode += data.placnik.naslov + "\n" // 7. Ulica in št. plačnika (Obvezno)
  qrCode += data.placnik.kraj + "\n" // 8. Kraj plačnika (Obvezno)
  qrCode += data.znesek + "\n" // 9. Znesek (Obvezno)
  qrCode += "" + "\n" // 10. Datum plačika
  qrCode += "" + "\n" // 11. Nujno
  qrCode += data.placnik.kodaNamena + "\n" // 12. Koda namena (Obvezno)
  qrCode += data.placnik.namen + "\n" // 13. Namen plačila (Obvezno)
  qrCode += data.placnik.rokPlacila + "\n" // 14. Rok plačila
  qrCode += data.prejemnik.iban + "\n" // 15. IBAN prejemnika (Obvezno)
  qrCode += data.prejemnik.referenca1 + " " + data.prejemnik.referenca2 + "\n" // 16. Referenca prejemnika (Obvezno)
  qrCode += data.prejemnik.ime + "\n" // 17. Ime prejemnika (Obvezno)
  qrCode += data.prejemnik.naslov + "\n" // 18. Ulica in št. prejemnika (Obvezno)
  qrCode += data.prejemnik.kraj + "\n" // 19. Kraj prejemnika (Obvezno)
  qrCode += "" + "\n" // 19. Kontrolna vsota (Obvezno)
  */

  // Wrapper
  block(
    height: 99mm, // A bit smaller so 3 can fit on one page
    width: 210mm,
    stroke: strokeWidth,
    inset: 0pt,
    clip: true,
    fill: none,
    
    stack(
      dir: ltr,
      spacing: 0pt,

      if debugWithBackground {
        // Background
        place(
          dx: 0pt, 
          dy: 0pt, 
          image("assets/upn-qr.png", height: 99mm, width: 210mm),
        )
      },

      // ----------------------------------------------
      // -------------------- Left --------------------
      // ----------------------------------------------
      block(
        width: 60mm,
        height: 100%,
        stroke: strokeWidth,
        inset: (
          top: 6mm,
          right: 3.5mm,
          bottom: 3.5mm,
          left: 4mm,
        ),

        stack(
          dir: ttb,

          // Ime plačnika
          block(
            width: 52.5mm,
            height: 13.5mm,
            stroke: strokeWidth,
            inset: 4pt,
            data.placnik.ime + "\n" + data.placnik.naslov + "\n" + data.placnik.kraj
          ),

          v(3mm),

          // Namen / rok plačila
          block(
            width: 52.5mm,
            height: 9mm,
            stroke: strokeWidth,
            inset: 4pt,
            data.placnik.namen,
          ),

          v(3mm),

          // Znesek
          align(right, block(
            width: 40mm,
            height: 5mm,
            stroke: strokeWidth,
            inset: 4pt,
            data.znesek,
          )),

          v(3mm),

          // IBAN in referenca prejemnika
          block(
            width: 52.5mm,
            height: 13.5mm,
            stroke: strokeWidth,
            inset: 4pt,
            data.prejemnik.iban + "\n" + data.prejemnik.referenca1 + " " + data.prejemnik.referenca2,
          ),

          v(3mm),

          // Ime prejemnika
          block(
            width: 52.5mm,
            height: 13.5mm,
            stroke: strokeWidth,
            inset: 4pt,
            data.prejemnik.ime + "\n" + data.prejemnik.naslov + "\n" + data.prejemnik.kraj
          ),
        ),
      ),

      // ----------------------------------------------
      // -------------------- Right --------------------
      // ----------------------------------------------
      block(
        width: 150mm, 
        height: 100%, 
        stack(
          dir: ttb,

          // -------------------- Top (PLAČNIK) --------------------
          block(
            width: 100%,
            height: 55mm,
            stroke: strokeWidth,
            inset: (
              top: 6mm,
              left: 3.5mm,
              right: 4mm,
              bottom: 0mm,
            ),

            stack(
              dir: ttb,
              spacing: 3.5mm,

              // QR code, rows 1-4
              stack(
                dir: ltr,
                spacing: 3mm,

                // Left
                block(
                  width: 40mm,
                  height: 39.5mm,
                  inset: 3mm,
                  stroke: strokeWidth,
                  // Koda QR
                  { if (data.qrContent != "") { tiaoma.upnqr(data.qrContent) }}
                ),

                // Right
                stack(
                  dir: ttb,

                  // Row 1
                  stack(
                    dir: ltr,

                    // IBAN Plačnika
                    block(
                      width: 72mm,
                      height: 5mm,
                      stroke: strokeWidth,
                      inset: 4pt,
                      data.placnik.iban,
                    ),

                    // Spacer
                    h(7.5mm),

                    // Polog
                    booleanBox(data.placnik.polog),

                    // Spacer
                    h(7.5mm),

                    // Dvig
                    booleanBox(data.placnik.dvig),
                  ),

                  v(3mm),

                  // Row 2
                  stack(
                    dir: ltr,
                    spacing: 2mm,

                    // Referenca plačnika 1
                    block(
                      width: 15mm,
                      height: 5mm,
                      stroke: strokeWidth,
                      inset: 4pt,
                      data.placnik.referenca1,
                    ),

                    // Referenca plačnika 2
                    block(
                      width: 82.5mm,
                      height: 5mm,
                      stroke: strokeWidth,
                      inset: 4pt,
                      data.placnik.referenca2,
                    ),
                  ),

                  v(3mm),

                  // Row 3
                  // Ime, ulica in kraj plačnika
                  block(
                    width: 99.5mm,
                    height: 15mm,
                    stroke: strokeWidth,
                    inset: 4pt,
                    data.placnik.ime + "\n" + data.placnik.naslov + "\n" + data.placnik.kraj
                  ),

                  v(3.5mm),

                  // Row 4
                  stack(
                    dir: ltr,

                    // Spacer
                    h(7.75mm),

                    // Znesek
                    block(
                      width: 42mm,
                      height: 5mm,
                      stroke: strokeWidth,
                      inset: 4pt,
                      data.znesek,
                    ),
                  
                    // Spacer
                    h(6mm),

                    // Datum plačila
                    block(
                      width: 30mm,
                      height: 5mm,
                      stroke: strokeWidth,
                      inset: 4pt,
                      data.placnik.datumPlacila,
                    ),

                    // Spacer
                    h(6mm),

                    // Nujno
                    booleanBox(data.placnik.nujno),
                  ),
                ),
              ),

              // Row 5
              stack(
                dir: ltr,
                spacing: 2mm,

                // Koda namena
                block(
                  width: 15mm,
                  height: 5mm,
                  stroke: strokeWidth,
                  inset: 4pt,
                  data.placnik.kodaNamena,
                ),

                // Namen plačila
                block(
                  width: 94mm,
                  height: 5mm,
                  stroke: strokeWidth,
                  inset: 4pt,
                  data.placnik.namen,
                ),

                // Rok plačila
                block(
                  width: 29mm,
                  height: 5mm,
                  stroke: strokeWidth,
                  inset: 4pt,
                  data.placnik.rokPlacila,
                ),
              ),
            ),
          ),

          // -------------------- Bottom (PREJEMNIK) --------------------
          block(
            width: 100%,
            height: 44mm,
            stroke: strokeWidth,
            inset: (
              top: 3mm,
              left: 3.5mm,
              right: 4mm,
              bottom: 0mm,
            ),

            stack(
              dir: ttb,
              spacing: 3mm,

              // Row 1
              // IBAN prejemnika
              block(
                width: 127.5mm,
                height: 5mm,
                stroke: strokeWidth,
                inset: 4pt,
                data.prejemnik.iban,
              ),

              // Row 2
              stack(
                dir: ltr,
                spacing: 2mm,

                // Referenca prejemnika 1
                block(
                  width: 15mm,
                  height: 5mm,
                  stroke: strokeWidth,
                  inset: 4pt,
                  data.prejemnik.referenca1,
                ),

                // Referenca prejemnika 2
                block(
                  width: 82.5mm,
                  height: 5mm,
                  stroke: strokeWidth,
                  inset: 4pt,
                  data.prejemnik.referenca2,
                ),
              ),

              // Row 3
              // Ime, ulica in kraj prejemnika
              block(
                width: 99.5mm,
                height: 15mm,
                stroke: strokeWidth,
                inset: 4pt,
                data.prejemnik.ime + "\n" + data.prejemnik.naslov + "\n" + data.prejemnik.kraj
              ),
            ),
          ),
        ),
      ),
    ),
  )
}