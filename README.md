# claude-programming-python

A Tutors-compatible Python programming course, derived from `programming-26`.

## Toolchain

- **Language**: Python 3
- **IDE**: Visual Studio Code
- **Slides**: Typst + Touying (`stargazer` theme) — compile `.typ` files manually with `typst compile <file>.typ`
- **Course viewer**: [Tutors](https://tutors.dev)

## Structure

```
claude-programming-python/
├── course.md                   # Course title & keywords
├── properties.yaml             # Course metadata
├── topic-01-first-contact/     # Intro to Python & VS Code
│   ├── unit-01a-intro/         # Module overview talk
│   ├── unit-01b-intro-to-python-vsCode/   # Python intro + setup talks (3 talks)
│   └── unit-01c-data-types/    # Data types talk + lab book
└── topic-02-control-flow/      # Conditional statements
    ├── unit-02a-lectures/      # If/elif/else talk (Typst slides)
    └── unit-02b-labs/          # Step-by-step Python lab (replaces Processing labs)
```

## Compiling Slides

Each `talk-*/` folder contains a `.typ` source file. To compile:

```bash
cd topic-01-first-contact/unit-01b-intro-to-python-vsCode/talk-1-python
typst compile a-intro-to-python.typ
```

The `.pdf` files already present were compiled from `programming-26` and remain valid.

## Cleanup — files to delete manually

These carry-overs from `programming-26` can be deleted:

| File | Location |
|------|----------|
| `if-statements.pptx` | `topic-02/unit-02a-lectures/talk-1/` |
| `updated-a-control-statements.typ` | `topic-02/unit-02a-lectures/talk-1/` |
| `00.Lab-02 2.md` | `topic-02/unit-02b-labs/book-1-to-do/` |
| `01.OpeningVSCode.md` | `topic-02/unit-02b-labs/book-1-to-do/` (duplicate — `01.PDE.md` has been rewritten) |

## Notes

The `topic-02` lab book (`unit-02b-labs/book-1-to-do/`) has been fully rewritten for Python/VS Code — all Processing/PDE references replaced. The `.typ` slide files were already Python-focused in `programming-26` and are used as-is.
