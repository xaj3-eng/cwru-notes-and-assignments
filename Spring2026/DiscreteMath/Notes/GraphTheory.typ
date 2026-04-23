#import "@local/xnotes:1.0.2": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#show: doc => xnote(doc)
#set page(height: auto)

#title[Graph Theory][Chapters 9 & 10]


= Section 9.?

$G$ is a graph: $G = (V, E)$
- $V$ is the set of all vertices
- $E$ is the set of all edges

#definition[*Parallel edges* are edges that connect the same two vertices]

#figure(
  fletcher.diagram(
    node((0, 0), $A$, shape: circle),
    node((2, 0), $B$, shape: circle),
    edge((0, 0), (2, 0), "-", bend: 30deg),
    edge((0, 0), (2, 0), "-", bend: -30deg),
  ),
  caption: [Two parallel edges both connecting vertices $A$ and $B$],
)

#definition[*Weighted Graphs* are graphs where all edges have an associated
  weight.]
#definition[A *directed graph* is a graph where all edges have associated
  directions.]

#aside[Weighted and directed graphs are not in the scope of this class.]

#definition[A *simple graph* is a graph with *NO LOOPS* and *NO PARALLEL
  EDGES*.]

#figure(
  fletcher.diagram(
    node((0, 0), $A$, shape: circle),
    node((2, 0), $B$, shape: circle),
    node((1, -1.5), $C$, shape: circle),
    edge((0, 0), (2, 0), "-"),
    edge((0, 0), (1, -1.5), "-"),
    edge((2, 0), (1, -1.5), "-"),
  ),
  caption: [A simple graph on 3 vertices: no loops, no parallel edges],
)

#figure(
  fletcher.diagram(
    node((0, 0), $A$, shape: circle),
    node((2, 0), $B$, shape: circle),
    node((2, -1.5), $C$, shape: circle),
    node((0, -1.5), $D$, shape: circle),
    edge((0, 0), (2, 0), "-"),
    edge((2, 0), (2, -1.5), "-"),
    edge((0, -1.5), (2, -1.5), "-"),
    edge((0, 0), (0, -1.5), "-"),
    edge((2, 0), (0, -1.5), "-"),
  ),
  caption: [A connected graph: every vertex is reachable from every other vertex via some path],
)

#definition[A simple graph with $n$ vertices is *complete* denoted by $k_n$ if there is exactly one edge between every pair of vertices]

#example[A complete graph has $n(n-1)/2$ edges because
  + Every node connects to $n-1$ nodes (divide by 2)
  + There are $C(n,2)$ edges
]

#figure(
  fletcher.diagram(
    node((0, 0), $1$, shape: circle),
    node((2, 0), $2$, shape: circle),
    node((2, -1.5), $3$, shape: circle),
    node((0, -1.5), $4$, shape: circle),
    edge((0, 0), (2, 0), "-"),
    edge((0, 0), (2, -1.5), "-"),
    edge((0, 0), (0, -1.5), "-"),
    edge((2, 0), (2, -1.5), "-"),
    edge((2, 0), (0, -1.5), "-"),
    edge((2, -1.5), (0, -1.5), "-"),
  ),
  caption: [$k_4$: complete graph on 4 vertices with $4(3)/2 = 6$ edges],
)

#definition[$G' = (V', E')$ is a *subgraph* of $G$ if $V' subset.eq V$ and
  $E' subset.eq E$ and $E'$ only connects vertices in $V'$.]

#figure(
  fletcher.diagram(
    node((0, 0), $A$, shape: circle, fill: blue.lighten(60%)),
    node((2, 0), $B$, shape: circle, fill: blue.lighten(60%)),
    node((1, -1.5), $C$, shape: circle, fill: blue.lighten(60%)),
    node((3, -0.75), $D$, shape: circle),
    edge((0, 0), (2, 0), "-", stroke: blue),
    edge((0, 0), (1, -1.5), "-", stroke: blue),
    edge((2, 0), (3, -0.75), "-"),
    edge((1, -1.5), (3, -0.75), "-"),
  ),
  caption: [The highlighted vertices and edges form a subgraph $G' = ({A,B,C}, {A B, A C})$ of $G$],
)

#definition[A *clique* is a #underline[complete] subgraph]

#figure(
  fletcher.diagram(
    node((0, 0), $A$, shape: circle, fill: green.lighten(60%)),
    node((2, 0), $B$, shape: circle, fill: green.lighten(60%)),
    node((1, -1.5), $C$, shape: circle, fill: green.lighten(60%)),
    node((3, -0.75), $D$, shape: circle),
    edge((0, 0), (2, 0), "-", stroke: green.darken(20%)),
    edge((0, 0), (1, -1.5), "-", stroke: green.darken(20%)),
    edge((2, 0), (1, -1.5), "-", stroke: green.darken(20%)),
    edge((2, 0), (3, -0.75), "-"),
    edge((1, -1.5), (3, -0.75), "-"),
  ),
  caption: [Vertices $A$, $B$, $C$ (green) form a clique $k_3$ — a complete subgraph — within the larger graph],
)

Cliques are very useful in social networking websites like facebook. I
vertices are users and edges are relationships, then you can identify
groups of people who all know each other.

#definition[The *degree of a vertex*, $deg(v)$, is the number of edges with
  endpoints at $v$.]

#aside[Note: if the only edge is from a vertex to itself, the degree of the
  vertex is 2.]

#example[
  In the graph below:
  - $deg(A) = 3$ (connected to $B$, $C$, $D$)
  - $deg(B) = 2$ (connected to $A$, $C$)
  - $deg(C) = 2$ (connected to $A$, $B$)
  - $deg(D) = 1$ (connected only to $A$)
]

#figure(
  fletcher.diagram(
    node((0, 0), $A$, shape: circle),
    node((2, 0), $B$, shape: circle),
    node((1, -1.5), $C$, shape: circle),
    node((-1, -0.75), $D$, shape: circle),
    edge((0, 0), (2, 0), "-"),
    edge((0, 0), (1, -1.5), "-"),
    edge((0, 0), (-1, -0.75), "-"),
    edge((2, 0), (1, -1.5), "-"),
  ),
  caption: [Degrees: $deg(A)=3$, $deg(B)=2$, $deg(C)=2$, $deg(D)=1$],
)

#definition[The *degree of a graph* is the sum of all vertex degrees:
  $
    deg(G) = sum_(v_i in V) deg(v_i)
  $]

#pagebreak()

= Section 10.1

#example[ The following graph is used as an example for all of the
  following defintions
  #figure(
    fletcher.diagram(
      node((0, 0), $1$, shape: circle),
      node((2, 0), $2$, shape: circle),
      node((2, -2), $4$, shape: circle),
      node((0, -2), $5$, shape: circle),
      node((1, -1), $3$, shape: circle),
      edge((0, 0), (2, 0), "-"),
      edge((0, 0), (0, -2), "-"),
      edge((0, -2), (0, -2), "-"),
      edge((0, -2), (2, -2), "-"),
      edge((1, -1), (2, -2), "-"),
      edge((1, -1), (2, 0), "-"),
      edge((2, 0), (2, -2), "-", bend: 20deg),
      edge((2, 0), (2, -2), "-", bend: -20deg),
    ),
    caption: [A graph with a _(imaginary)_ self-loop at $5$ and parallel edges between $2$ and $4$],
  )
]

#definition[A *walk* from $V$ to $W$ is a finite sequence of adjacent
  vertices and edges. (You can visit node an infinite amount of times)]

#example[Walks from 1 to 3
  + $1 -> 2 -> 3$
  + $1 -> 5 -> 4 -> 3$
  + $1 -> 5 -> 5 -> 1 -> 2 -> 3$
  + $1 -> 2 -> 4 -> 2 -> 3$
  + ...
]

There are infinitely many walks.

#definition[A *trail* from $V$ to $W$ is a walk with distinct edges (i.e.
  no repeated edges)]

#example[Trails from 1 to 3
  - #sym.checkmark $1 -> 2 -> 3$
  - #sym.checkmark $1 -> 5 -> 4 -> 3$
  - #sym.checkmark $1 -> 2 -> 4 -> 2 -> 3$
  - #sym.crossmark $1 -> 5 -> 5 -> 1 -> 2 -> 3$
]

#definition[A *path* from $V$ to $W$ is a trail with distinct vertices (i.e.
  no repeated vertices)]

#example[Trails from 1 to 3
  - #sym.checkmark $1 -> 2 -> 3$
  - #sym.checkmark $1 -> 5 -> 4 -> 3$
  - #sym.crossmark $1 -> 2 -> 4 -> 2 -> 3$
  - #sym.crossmark $1 -> 5 -> 5 -> 1 -> 2 -> 3$
]

#definition[A graph is *connected* if $forall v,w in V, space exists$ a
  walk from $v$ to $w$. (i.e. all vertices are connected)]

#definition[A *circuit* is a trail from $v$ to $v$ for $v in V$. (A trail
  from a node back to itself)]

#aside[A *cycle* (not in scope of class) is a #underline[simple] circuit.]

#definition[An *Euler Circuit* a circuit that contains every vertex at
  least once and every edge exactly once.]

#example[Euler circuit for node 1
  - $1 -> 2 -> 3 -> 4 -> 2 -> 4 -> 5 -> 5 -> 1$
  - If you were to remove the edge from 2 to 3 (or any edge besides 5 to 5),
    there would be no Euler circuits.
  - If you were to add an edge between two distinct vertices, there would
    be no Euler circuits.
]

#theorem[The degree of every vertex must be even for there to exist an
  Euler Circuit.]

#aside[This works because when vertices are connected to themselves, it
  adds 2 to the degree.]
