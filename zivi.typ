/*
 * Customizations on this template:
 *
 * - headings (h1..h4)
 *
 * - `datebox` function: provides content with stacked year above (big) and month below (tinier)
 *
 * - `daterange` function: two `datebox`es separated by an em dash
 *
 * - `cvgrid`: basic layout function that wraps a grid. Controlled by two parameters `left_column_size` (default: 25%) and `grid_column_gutter` (default: 8pt) which control the left column size and the column gutter respectively.
 *
 * - `cvcol`: used to write in the rightmost column only. Builds on `cvgrid`
 *
 * - `cventry`: used to write a CV entry. Builds on `cvgrid`
 *
 * - `cvlangauge`: used to write a language entry. Builds on `cvgrid`
 *
 */

#let left_column_size = 20%
#let grid_column_gutter = 8pt

#let main_color = rgb(0, 90, 120) // Verkehrsblau
#let heading_color = main_color
#let job_color = rgb(147, 14, 14)

#let small_logo_box(logo) = [
  #box(height: 1em, baseline: 20%)[#pad(right: 0.4em)[#logo]]
]

#let small_logo(file) = [
  #small_logo_box(image(file))
]

#let small_colored_logo(file) = {
  let original = read(file)
  let colored = original.replace(
    "#000000",
    main_color.hex(),
  )
  small_logo_box(image.decode(colored))
}

#let project(
  title: "",
  author: [],
  phone: "",
  email: "",
  github: "",
  website: "",
  last_updated: none,
  left_column_size: left_column_size,
  grid_column_gutter: grid_column_gutter,
  main_color: main_color,
  heading_color: heading_color,
  job_color: job_color,
  body
) = {
  set document(author: author, title: title)
  set page(numbering: none)
  set text(font: ("Latin Modern Sans", "Inria Sans"), lang: "en", fallback: true)
  show math.equation: set text(weight: 400)

  /*
   * How headings are used:
   * - h1: section (colored, prominent, with colored rectangle, spans two columns)
   * - h2: role (bold)
   * - h3: place (normal)
   * - h4: generic heading (normal, colored)
   */
  show heading.where(level: 1): element => [
    #v(0em)
    #box(
      inset: (right: grid_column_gutter, bottom: 0.1em),
      rect(fill: main_color, width: left_column_size, height: 0.25em)
    )
    #text(element.body, fill: heading_color, weight: 400)
  ]

  show heading.where(level: 2): element => [
    #text(element.body, size: 0.8em)
  ]

  show heading.where(level: 3): element => [
    #text(element.body, size: 1em, weight: 400)
  ]

  show heading.where(level: 4): element => block[#text(element.body, size: 1em, weight: 400, fill: heading_color)]

  set list(marker: "-")
  //set list(marker: box(circle(radius: 0.2em, stroke: heading_color), inset: (top: 0.15em)))

  set enum(numbering: (n) => text(fill: heading_color, [#n.]))

  grid(
    columns: (1fr, 1fr),
    box[
      // Author information.
      #text([#author], weight: 400, 2.5em)
    
      #v(-1.2em)
    
      // Title row.
      #block(text(weight: 400, 1.5em, title, style: "italic", fill: job_color))
    ],
    align(right + top)[
      // Contact information
      #set block(below: 0.5em)

      #let define_row(url, text, icon) = {
        align(top)[
          #link(url)[
            #text #h(.5em)
            #small_colored_logo("icons/" + icon) // TODO: why not colored?
          ]
        ]
      }

      #if github != "" {
        define_row("https://github.com/" + github, github, "github.svg")
      }
      #if website != "" {
        define_row(website, website, "website.svg")
      }
      #if phone != "" {
        define_row("tel:" + phone, phone, "phone-solid.svg")
      }
      #if email != "" {
        define_row("mailto:" + email, email, "envelope-regular.svg")
      }
    ]
  )

  // Main body.
  set par(justify: true, leading: 0.5em)

  body


  if last_updated != none {
    v(1fr)
    align(center)[_(Last updated: #last_updated)_]
  }
}

#let datebox(range: ()) = {
  let year = range.at("year", default: "")
  let month = range.at("month", default: "")

  box(
    align(center,
      stack(
        dir: ttb,
        spacing: 0.4em,
        text(size: 1em, [#year]),
        text(size: 0.75em, [#month]),
      )
    )
  )
}

#let daterange(start: (), end: ()) = box(
  stack(dir: ltr,
    spacing: 0.75em,
    datebox(range: start),
    [--],
    datebox(range: end)
  )
)

#let cvgrid(..cells) = pad(bottom: 0.8em)[#grid(
  columns: (left_column_size, auto),
  row-gutter: 0em,
  column-gutter: grid_column_gutter,
  ..cells
)]

#let cvcol(content) = cvgrid([], content)

#let cventry(
  start: (),
  end: (),
  role: "",
  logo: "",
  institution: "",
  place: "",
  description,
) = cvgrid(
  align(center, daterange(start: start, end: end)),
  [
    == #role
    #h(1fr)
    #if logo != "" {
      small_logo("usericons/" + logo)
    }
    === #institution
  ],
  [],
  [
    #h(1fr)
    #small_colored_logo("icons/location.svg")
    === #place
  ],
  [],
  [
    #v(1em)
    #description
  ],
)

#let cvlanguage(
  language: [],
  description: [],
  certificate: [],
) = cvgrid(
  align(right, language),
  [#description #h(3em) #text(style: "italic", certificate)],
)

#let thesis(title, grade: none, url: none) = {
  align(center)[
    #box(
      width: 80%,
      height: 4em,
    )[
      #align(center + horizon)[
        #if url != none {
          link(url)[
            #text(style: "italic", title)
          ]
        } else {
          text(style: "italic", title)
        }
      ]
      #if grade != none {
        align(right + bottom)[(grade: #text(weight: "semibold")[#grade])]
      }
    ]
  ]
}
