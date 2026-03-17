#show: body => report(
  $if(title)$
    title: "$title$",
  $endif$
  $if(date)$
    date: "$date$",
  $endif$
  $if(subtitle)$
    subtitle: "$subtitle$",
  $endif$
  body,
)