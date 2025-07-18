#import "@preview/tiaoma:0.3.0" // For QR code

#let upn_qr(
  imePlacnika: "",
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
  ibanPrejemnika: "",
  referencaPrejemnika1: "",
  referencaPrejemnika2: "",

  znesek: "",
  qrContent: "",

  debug: false,

  doc,
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
      iban: ibanPrejemnika,
      referenca1: referencaPrejemnika1,
      referenca2: referencaPrejemnika2,
    ),
    znesek: znesek,
    qr: qrContent,
  )

  // Wrapper
  stack(
  block(
    height: 99mm, // A bit smaller so 3 can fit on one page
    width: 210mm,
    stroke: 0pt,
    inset: 0pt,
    clip: true,
    fill: none,
    
    stack(
      dir: ltr,
      spacing: 0pt,

      if debug {
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
        inset: (
          top: 6mm,
          right: 3.5mm,
          bottom: 3.5mm,
          left: 3.5mm,
        ),

        stack(
          dir: ttb,
          spacing: 3mm,

          // Ime plačnika
          block(
            width: 52.5mm,
            height: 13.5mm,
            stroke: strokeWidth,
            inset: 4pt,
            data.placnik.ime,
          ),

          // Namen / rok plačila
          block(
            width: 52.5mm,
            height: 9mm,
            stroke: strokeWidth,
            inset: 4pt,
            data.placnik.namen,
          ),

          // Znesek
          align(right, block(
            width: 40mm,
            height: 5mm,
            stroke: strokeWidth,
            inset: 4pt,
            data.znesek,
          )),


          // IBAN in referenca prejemnika
          block(
            width: 52.5mm,
            height: 13.5mm,
            stroke: strokeWidth,
            inset: 4pt,
            data.prejemnik.iban + "\n" + data.prejemnik.referenca1 + " " + data.prejemnik.referenca2,
          ),

          // Ime prejemnika
          block(
            width: 52.5mm,
            height: 13.5mm,
            stroke: strokeWidth,
            inset: 4pt,
            data.prejemnik.ime,
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
            height: 56mm,
            inset: (
              top: 6mm,
              left: 3.5mm,
              right: 4mm,
              bottom: 0mm,
            ),

            stack(
              dir: ttb,
              spacing: 3mm,

              // QR code, rows 1-4
              stack(
                dir: ltr,
                spacing: 3mm,

                // Left
                block(
                  width: 40mm,
                  height: 40mm,
                  inset: 3mm,
                  // Koda QR
                  { if (data.qr != "") { tiaoma.upnqr(data.qr) }}
                ),

                // Right
                stack(
                  dir: ttb,

                  // Row 1
                  stack(
                    dir: ltr,

                    // IBAN Plačnika
                    block(
                      width: 71mm,
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
                      width: 83mm,
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
                    width: 100mm,
                    height: 15mm,
                    stroke: strokeWidth,
                    inset: 4pt,
                    data.placnik.ime,
                  ),

                  v(3.5mm),

                  // Row 4
                  stack(
                    dir: ltr,

                    // Spacer
                    h(7.5mm),

                    // Znesek
                    block(
                      width: 41mm,
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
                    h(5.5mm),

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

                // Namen
                block(
                  width: 94mm,
                  height: 5mm,
                  stroke: strokeWidth,
                  inset: 4pt,
                  data.placnik.namen,
                ),

                // Rok plačila
                block(
                  width: 30mm,
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
            height: 43mm,
            inset: (
              top: 2mm,
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
                width: 127mm,
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
                  width: 83mm,
                  height: 5mm,
                  stroke: strokeWidth,
                  inset: 4pt,
                  data.prejemnik.referenca2,
                ),
              ),

              // Row 3
              // Ime, ulica in kraj prejemnika
              block(
                width: 100mm,
                height: 15mm,
                stroke: strokeWidth,
                inset: 4pt,
                data.prejemnik.ime,
              ),
            ),
          ),
        ),
      ),
    ),
  )
  ,
  doc)
}