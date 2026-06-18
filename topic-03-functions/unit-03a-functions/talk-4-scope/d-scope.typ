#import "@preview/touying:0.7.3": *
#import themes.stargazer: *
#import "@preview/numbly:0.1.0": numbly

#let my-logo = image("assets/python.png", width: 1.5cm, height: 1.5cm)
#let opaque-logo = image("assets/UShape-SETU.png", width: 60%)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    color: rgb("#c6f1c7"),
    title: [Python Programming Fundamentals],
    subtitle: [Scope and Pure Functions],
    author: [Programming Fundamentals Team],
    date: datetime.today(),
    institution: [SETU],
    logo-position: bottom + right,
    logo: my-logo,
  ),
)
#set heading(numbering: numbly("{1}.", default: "1.1"))
#set page(background: place(left + top, dx: 8.5em, dy: 1em)[#opaque-logo])
#title-slide()
#set page(background: none)
#outline-slide()

= Local vs Global Scope

Variables live in a *scope* — the region of code where they are accessible.

```python
message = "I am global"    # global scope

def show_message():
    local_msg = "I am local"   # local scope
    print(message)              # can read global
    print(local_msg)            # can read local

show_message()
print(message)     # OK
# print(local_msg) # NameError — doesn't exist here
```

#pause

Each function call creates its own *local namespace*. When the function returns, its locals are discarded.

= The LEGB Rule

Python searches for names in this order:

#table(
  columns: (auto, 1fr, 1fr),
  inset: 10pt,
  fill: (col, row) => if col == 0 { rgb("#bfdbfe") } else { white },
  [*Letter*], [*Scope*], [*Example*],
  [L], [Local — inside current function], [`x` defined in `my_func`],
  [E], [Enclosing — outer function (closures)], [Nested functions],
  [G], [Global — module level], [`PI = 3.14159`],
  [B], [Built-in — Python's built-ins], [`len`, `print`, `range`],
)

#pause

```python
x = "global"

def outer():
    x = "enclosing"
    def inner():
        # x = "local"     # uncomment to use local
        print(x)          # finds "enclosing" (E before G)
    inner()

outer()   # enclosing
```

= Avoiding Global Variables

*Reading* a global is fine. *Modifying* a global from inside a function is a code smell.

```python
# Bad pattern — hidden global state
total = 0

def add_to_total(value):
    global total
    total += value      # modifies global — hard to test

add_to_total(10)
add_to_total(25)
print(total)    # 35
```

#pause

*Better pattern — pass data in, return data out:*

```python
def add_values(current_total, value):
    return current_total + value

total = 0
total = add_values(total, 10)
total = add_values(total, 25)
print(total)    # 35
```

Now the function is *testable* and has *no side effects*.

= Pure Functions

A *pure function*:
1. Always produces the same output for the same input
2. Has *no side effects* (doesn't modify external state, no I/O)

```python
# Pure — same input always gives same output, no side effects
def multiply(a, b):
    return a * b

def clamp(value, minimum, maximum):
    """Constrain value to [minimum, maximum] range."""
    return max(minimum, min(maximum, value))

print(clamp(150, 0, 100))   # 100
print(clamp(-5, 0, 100))    # 0
print(clamp(50, 0, 100))    # 50
```

#pause

*Impure* — has a side effect (printing, reading input, modifying external state):

```python
def get_score():       # impure — depends on user input
    return float(input("Score: "))

def log_result(msg):   # impure — side effect (printing)
    print(msg)
```

= Constants and Module-Level Names

*Constants* are module-level names that never change. By convention, use ALL_CAPS.

```python
PI = 3.14159265
GRAVITY = 9.81          # m/s²
TAX_RATE = 0.23
MAX_RETRIES = 3

def circle_area(radius):
    return PI * radius ** 2

def circle_circumference(radius):
    return 2 * PI * radius

print(f"Area of r=5 circle: {circle_area(5):.2f}")
print(f"Circumference: {circle_circumference(5):.2f}")
```

Constants are fine at module level — they are *not expected to change* and are clearly marked.

= Scope in Practice

```python
def calculate_statistics(numbers):
    """Return mean, min, max for a list of numbers."""
    if not numbers:
        return None, None, None

    count = len(numbers)        # local
    total = sum(numbers)        # local
    mean = total / count        # local
    minimum = min(numbers)      # local
    maximum = max(numbers)      # local

    return mean, minimum, maximum

data = [23, 45, 12, 67, 34, 89, 56]
avg, lo, hi = calculate_statistics(data)
print(f"Mean: {avg:.1f}")
print(f"Range: {lo} to {hi}")

# count, total, mean, minimum, maximum don't exist here
```

All intermediate variables are local to the function — clean and encapsulated.


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
