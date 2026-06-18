#import "@preview/touying:0.7.3": *

#import themes.stargazer: *
#import "@preview/cetz:0.5.0": canvas, draw

#import "@preview/numbly:0.1.0": numbly
#let my-logo = image("assets/python.png", width: 1.5cm, height: 1.5cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)

#let note(body) = block(
  fill: blue.lighten(85%),
  stroke: (paint: blue.lighten(50%), thickness: 1pt),
  radius: 8pt,
  inset: 16pt,
  width: 100%,
  body
)

#let output-box(body) = block(
  fill: luma(245),
  stroke: (paint: luma(180), thickness: 1pt),
  radius: 4pt,
  inset: 10pt,
  width: 100%,
  body
)

#let error-box(body) = block(
  fill: red.lighten(90%),
  stroke: (paint: red.lighten(50%), thickness: 1pt),
  radius: 4pt,
  inset: 10pt,
  width: 100%,
  body
)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Programming Fundamentals],
    subtitle: [Conditional Statements],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo
  ),
  // config-common(handout:true),  for handout version of the slides(no animations, etc.)
)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set page(
  background: place(left + top, dx: 8.5em, dy: 1em,)[
#opaque-logo]
   )


#title-slide()
#set page(background: none)
#outline-slide()



= Boolean Conditions




#slide[
  Recap 
- A Boolean condition is an expression that evaluates to either #text(fill:red)[True] or #text(fill:red)[False] e.g.
#align(center)[
   #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
```python
  x < 50
  number > 0
```
   ]]
#pause
- A conditional statement evaluates a Boolean condition and its result will determine which section of the code is executed.
]
== Relational Operators
  #slide[
    #table(
  columns: (auto, 1fr, 2fr),
  align: (center, center, center),
  stroke: gray,

  // Header row
  table.cell(fill: blue.lighten(80%))[*Operator*],
  table.cell(fill: blue.lighten(80%))[*Syntax*],
  table.cell(fill: blue.lighten(80%))[*Returns #text(fill: red)[true] if...*],

  // Rows
  text(size: 1.4em, weight: "bold")[>],
  `x > y`,
  [x is *greater* than y],

  text(size: 1.4em, weight: "bold")[>=],
  `x >= y`,
  [x is *greater than or equal* to y],

  text(size: 1.4em, weight: "bold")[<],
  `x < y`,
  [x is *less* than y],

  text(size: 1.4em, weight: "bold")[<=],
  `x <= y`,
  [x is *less than or equal* to y],

  text(size: 1.4em, fill: red, weight: "bold")[==],
  text(fill: red)[`x == y`],
  [x and y are *equal*],

  text(size: 1.4em, weight: "bold")[!=],
  `x != y`,
  [x and y are *not equal*],
)
#pause
 #text(size: 1.4em, fill:red, weight: "bold")[\= is an assignment operator and doesn't test for equality.
\== is used to test for equality.]

  ]



= Logical Operators

#slide[
- Logical operators operate on Boolean values and produce a new Boolean value as a result.
#pause
- The three logical operators in Python are:

#align(center)[
  #table(
    columns: (auto, 2fr, 2fr),
    inset: 10pt,
    align: (center, left, left),
    fill: (col, row) => if row == 0 { rgb("#c6f1c7") } else if calc.odd(row) { luma(240) } else { white },
    [*Operator*], [*Meaning*], [*Example*],
    [`and`], [True if *both* conditions are true], [`age >= 18 and score > 50`],
    [`or`],  [True if *at least one* condition is true], [`day == "Sat" or day == "Sun"`],
    [`not`], [Reverses the Boolean value], [`not is_raining`],
  )
]
]

== and operator

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    align: top,
    [
      #align(center)[`a  and  b`]
      #v(0.5em)
      #table(
        columns: (1fr, 1fr, 1fr),
        inset: 10pt,
        align: center,
        fill: (col, row) => if row == 0 { rgb("#c6f1c7") }
          else if col == 2 and row == 1 { rgb("#d4edda") }
          else if col == 2 { rgb("#f8d7da") }
          else { white },
        [*a*], [*b*], [*a and b*],
        [True],  [True],  [*True*],
        [False], [True],  [*False*],
        [True],  [False], [*False*],
        [False], [False], [*False*],
      )
    ],
    [
      #pause
      - Evaluates to *true* only if *both* a and b are true.
      - It is false in all other cases.
      #v(1em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
age = 25
income = 35000

if age >= 18 and income >= 30000:
    print("Eligible for loan")
else:
    print("Not eligible")
```]
      ]
    ]
  )
]

== or operator

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    align: top,
    [
      #align(center)[`a  or  b`]
      #v(0.5em)
      #table(
        columns: (1fr, 1fr, 1fr),
        inset: 10pt,
        align: center,
        fill: (col, row) => if row == 0 { rgb("#c6f1c7") }
          else if col == 2 and row == 1 { rgb("#f8d7da") }
          else if col == 2 { rgb("#d4edda") }
          else { white },
        [*a*], [*b*], [*a or b*],
        [False], [False], [*False*],
        [False], [True],  [*True*],
        [True],  [False], [*True*],
        [True],  [True],  [*True*],
      )
    ],
    [
      #pause
      - Evaluates to *true* if either a, b, or both are true.
      - It is false only when *both* are false.
      #v(1em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
day = "Saturday"

if day == "Saturday" or day == "Sunday":
    print("It is the weekend!")
else:
    print("It is a weekday.")
```]
      ]
    ]
  )
]

== not operator

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 2em,
    align: top,
    [
      #align(center)[`not a`]
      #v(0.5em)
      #table(
        columns: (1fr, 1fr),
        inset: 10pt,
        align: center,
        fill: (col, row) => if row == 0 { rgb("#c6f1c7") }
          else if col == 1 and row == 1 { rgb("#d4edda") }
          else if col == 1 { rgb("#f8d7da") }
          else { white },
        [*a*], [*not a*],
        [False], [*True*],
        [True],  [*False*],
      )
    ],
    [
      #pause
      - Reverses (negates) the Boolean value.
      - True becomes False, and False becomes True.
      #v(1em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
is_raining = False

if not is_raining:
    print("Leave your umbrella at home.")
else:
    print("Don't forget your umbrella!")
```]
      ]
    ]
  )
]

== Logical Operators — Quiz

#slide[
  Given these variables:

  #align(center)[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 8pt)[
      #text(font: "Courier New", size: 1em)[
        a = 5 #h(2em) b = 10 #h(2em) c = 7
      ]
    ]
  ]

  #v(1em)
  What is the result of each Boolean expression?

  #table(
    columns: (auto, 2fr),
    inset: 10pt,
    align: (center, left),
    fill: (col, row) => if row == 0 { rgb("#c6f1c7") } else if calc.odd(row) { luma(245) } else { white },
    [*Q*], [*Expression*],
    [Q1], [`(a > b) and (a < c)`],
    [Q2], [`(a < b) or (c < a)`],
    [Q3], [`not(b < a) and (c > b)`],
  )
]

#slide[
  Answers:

  #align(center)[
    #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 8pt)[
      #text(font: "Courier New", size: 1em)[
        a = 5 #h(2em) b = 10 #h(2em) c = 7
      ]
    ]
  ]

  #v(0.5em)
  #table(
    columns: (auto, 2fr, auto),
    inset: 8pt,
    align: (center, left, center),
    fill: (col, row) => if row == 0 { rgb("#c6f1c7") } else if calc.odd(row) { luma(245) } else { white },
    [*Q*], [*Evaluation*], [*Result*],
    [Q1],
    [`(5 > 10)` is *False*. `(5 < 7)` is *True*. So `False and True` evaluates to *False*.],
    [#text(fill: red, weight: "bold")[False]],

    [Q2],
    [`(5 < 10)` is *True*. With `or`, one true operand is enough — overall answer is *True*.],
    [#text(fill: green, weight: "bold")[True]],

    [Q3],
    [`not(10 < 5)` = `not(False)` = *True*. `(7 > 10)` is *False*. So `True and False` evaluates to *False*.],
    [#text(fill: red, weight: "bold")[False]],
  )
]

= Common Syntax Errors

== Splitting a long Boolean condition incorrectly

#slide[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    align: top,
    [
      *Problem* — splitting a long condition across lines:
      #v(0.5em)
      #error-box[
        #text(size: 0.75em)[```python
age = 25
income = 35000

if age >= 18 and
   income >= 30000:
    print("Eligible")
```]
      ]
      #v(0.5em)
      #text(fill: red, size: 0.8em)[`SyntaxError: invalid syntax`]
    ],
    uncover("2-")[
      *Fix* — wrap the full condition in parentheses:
      #v(0.5em)
      #rect(fill: luma(230), stroke: 2pt + black, radius: 4pt, inset: 10pt)[
        #text(size: 0.75em)[```python
age = 25
income = 35000

if (age >= 18 and
    income >= 30000):
    print("Eligible")
```]
      ]
      #v(0.5em)
      #text(fill: green, size: 0.8em)[Parentheses allow the condition to span multiple lines. ✓]
    ]
  )
]


#slide(
    title: none,
    header: none,
    footer: none,
    align: center + horizon)[
    #text(size: 2em, weight: "bold")[

    Thanks for Watching - Any questions?

    #v(2em)

    #image("assets/thanks.png", width: 5cm)
  ]]
