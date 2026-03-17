#let report(
  title: none,
  subtitle: none,
  authors: none,
  keywords: (),
  date: none,
  abstract-title: none,
  paper: "a4",
  margin: (top: 5cm, bottom: 2cm, left: 2cm, right: 2cm),
  abstract: none,
  thanks: none,
  cols: 1,
  lang: "de",
  region: "EU",
  font: ("Dubai"),
  fontsize: 11pt,
  content,
) = {
  set page(
    paper: paper,
    margin: margin,
    
    footer: {

    }
  )
  
  show heading: set text(navy)
  
  set text(
    lang: lang,
    region: region,
    font: font,
    size: fontsize,
  )

  
  text(
    upper(title),
    font:"Dubai",
    fill: rgb(241,135,0),
    size: 18pt,
    weight: "bold",
  )
  
  
  if subtitle != none {
    align(left)[#block()[
      #text(weight: "regular", size: 20pt)[#subtitle]
    ]]
  }
  
  content
}