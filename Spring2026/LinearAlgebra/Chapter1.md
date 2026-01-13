# Chapter 1

## 1.1

> Linear Algebra is the study of linear transformations (input to output)

- Ex. 2D system of linear equations
  - $$ax + by = e
  - $$cx + dy = f
- Represent the system in matrix vector form $Ax-> = b->$
  - A: 2x2
  - x: 1x2 vector matrix
  - b: 1x2 vector matrix

A 2D system of equations can have 0, 1, or infinite solutions

- We want to generalize to n-dimensional space
- We will cover vectors and maps before returning to this

### Sets

> A set is a collection of elements

Sets are used to group objects together

The following operations work as expected:

- Intersection
- Union
- Subset/Contain ("A < B" where '<' is a sideways U
means A is a subset of B)

Common Sets:

- $Z$: the set of all integers
- $R$: The set of all real numbers
- $Q$: The set of all rational numbers
- $C$: The set of all complex numbers

### Functions

Let A and B be nonempty sets. A function f that maps A to B (A -> B)

> $x1 = x2$ means that $f(x1) = f(x2)$

> A function with two inputs can be defined as f: (A,A) -> A, or f: A x A -> A

- The input set A is the "domain"
- The output set B is the "codomain"
  - the codomain is part of the definition of the function, the range is not
  - When you define a function, you must also specify f: {A} -> {B}
  - The range is not known, if it is known and therefore the same as the codomain,
  then the function is surjective

A function f: A -> B is **injective** if distinct elements
of A are assigned to distinct elements of B,

> Injective: If $x1 != x2$ then $f(x1) != f(x2)$

A function f: A -> B is **surjective (a surjection) if for each element y in B,
there is one element x in A such that f(x) = y

A function f is **bijective** (a bijection) if it is both an injection and a surjection.

- Ex. 1:
  - Consider the function f: {a,b,c,d} -> {1,2,3}
    - f(a) = 3
    - f(b) = 2
    - f(c) = 1
    - f(d) = 3
  - f is not injective because two inputs map to 3
  - f is subjective because all the possible outputs are covered

If f: A -> B and g: B -> C, the **composition** of f and g is the
function g o f: A -> C

The composition function $\circ$ returns the right side as an input to the
function on the left side

g o f(x) = g(f(x))

if $g o f = id_A$ and $f o g = id_B$, then g is the inverse of f denoted $f^-1$

> $id_A$: A -> A, $id_A(a) = a$

### Monoids, Groups, and Rings

A set A is a **monoid** if

1. Closure: for each pair a,b $\in$ A, a $\circ$ b $\in$ A
2. Associativity: For all a,b,c $\in$ A, $a $\circ$ (b * c) = (a * b) * c$
3. Identity: There exists an element e (- A such that for
every a in A, $a $\circ$e = e $\circ$ a = a$

> where $\circ$ is a given binary operation, $\circ$: A x A -> A

A set A given a binary operation $\Diamond$: A x A -> A
is a **group** if it is a monoid that satisfies the additional
inverse property

- For every a $\in$ A, there is an element b $\in$ A, called the inverse of a,
such that $a \Diamond b = b \Diamond a = e$

Furthermore, the set A is an **Abelian group** or **communatitive group** if
it is a group and it satisfies the following axium:

- For all a,b $\in$ A, it holds that a $\Diamond$ b = b $\Diamond$ a

A set R given two operations o and * is a ring if the following conditions are satisfied:

1. R is a Abelian group with respect to o
2. R is a monoid with respect to *
3. The operation \*is distributive over o as follows: For all a,b,c $\in$ R,
it holds that a \* (b o c) = (a \*b) o (a\* c)

A set F given two operations o and * is a **field** if it satisfies the following conditions:

1. F is an Abelian group with respect to o
2. F is a commutative monoid with respect to *
3. Every element of F different from the Identity
of o has an inverse with respect to *
4. The operation * is distributive over o (like the ring)

### Ordering is a way of sorting numbers

The field F is an ordered field if there is am ordering
'<' on it that satisfies the following axioms.

1. I missed them, but he said unimportant
2. ?
3. ?
