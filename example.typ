#import "zivi.typ": *

#show: zivi.with(
  author: "Zivi",
  title: "A Typst Template",
  github: "cloudsftp",
  website: "https://cloudsftp.de",
  birthday: "2000 BC",
  email: "fabian.weik@protonmail.com",
  last_updated: "August 2023",
)

= Education

#cventry(
  start: (month: "April", year: 2100),
  end: (month: "October", year: 2102),
  role: "M.Sc. Computer Science",
  institution: "University of Stuttgart",
  logo: "uni_stgt.svg",
  place: "Stuttgart, Germany",
)[
  #thesis(grade: "1.0", url: "https://google.com")[
    This is a Great Topic and I worked Hard on my Thesis. But it has a very long title. I hope it fits nicely into the box.
  ]
]

#cventry_long_role(
  start: (month: "September", year: 2097),
  end: (month: "October", year: 2100),
  role: "B.Sc. Computer Science with a title that is entirely too long",
  institution: "University of Stuttgart",
  logo: "uni_stgt.svg",
  place: "Stuttgart, Germany",
)[
  - #lorem(6)
  - Bachelor Thesis:
  #thesis(grade: 1.5)[This is a Great Topic and I worked Hard on my Thesis]
  - Final grade: *2.0*
]

= Work Experience

#cventry(
  start: (month: "December", year: 2101),
  end: (month: "", year: "Present"),
  role: [Junior Frobnication Engineer],
  place: "WeDontWork Inc.",
  lorem(40)
)


= Side Projects

#cventry(
  start: (month: "December", year: 2099),
  end: (month: "", year: "Present"),
  role: [Quux Master],
  place: "MasterQuuxers.mars",
  lorem(40)
)

#project(
  start: (month: "March", year: 2098),
  end: (month: "August", year: 2099),
  name: "Project Name",
  role: "Full-bar frobnicator",
  lorem(40)
)

= Languages

#cvlanguage(
  language: [Martian],
  description: [Mother tongue]
)

#cvlanguage(
  language: [Klingon],
  description: [C64 level],
  certificate: [Earth Klingon Certificate -- Certificate in Advanced Klingon (CAK64)]
)

#pagebreak()

= Technical Skills

#cvcol[
  ==== Programming Languages

  #grid(
    columns: (1fr, 1fr, 1fr),
    row-gutter: 0.5em,
    [- Java],
    [- C],
    [- C++],
    [- Python],
    [- Martian],
    [- English],
    [- ChatGPT],
    [- Ancient Greek],
    [- Legalese]
  )
]

#cvcol[
  ==== Environments

  - Earth (development and server management)
  - Wind (development)
  - Fire (development)
]

#cvcol[
  ==== Misc

  Various university-related and personal projects, some available on my GitHub profile.
]

= Other

#cvcol[
  - Best Pizza Cook Central Mars City 2091 Championship Winner
  - Coffee Conossieur
  - If You Are Reading This You Are Awesome
]
