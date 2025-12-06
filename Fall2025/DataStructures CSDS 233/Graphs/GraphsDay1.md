## Graphs

A Graph consists of:
- A set of vertices (AKA 'nodes')
- A set of edges (AKA 'arcs'), each connecting a pair of vertices

Let's consider FaceBook users: users A and B.
If A and B are friends, then you can connect them with an edge
This is one way to structure data with an undirected graph

Let's consider Instagram users: users A and B.
If A follows B and B doesn't follow A, you can create a directed edge from A to B, and nothing from B to A

An edge can store any kind of data that is relevant the relationship between two vertices

Let's consider a map of cities and highways:
You could outline this map by creating a graph where nodes are cities and the edges are the distance between the two cities in miles

**If there is data stored in the edges, the graph is called a "WEIGHTED GRAPH", otherwise it's unweighted**

### Terminology

- Two vertices are **"adjacent"** if they are connected by an edge
- The collection of vectices that are adjecent to vertex A are called A's **"neighbors"**
- A **"path"** is a sequnce of edges that connects two vertices
- A graph is **"connected"** if there is a path between every pair of two vertices
- A graph is **"complete"** if there is an edge between every pair of two vertices.
  - i.e. you cannot add another edge to the graph because all possible edges are present
- A **"directed graph"** has a direction associated with each edge (depticted using an arrow)
  - if an edge directs A to B, there is a path from A to B but not from B to A
- **Degree** of a Vertex: Number of edges connected to a vertex
  - There is "in-degree" and "out-degree" for directed graphs
- We say a graph is "sparce" (not vocab) if there is a lot of node with not a lot of edges

Every tree is a graph, not every graph is a tree
- Trees are *acyclic*

A **spanning tree** is a subset of a connected graph that contains:
- all of the N vertices
- a subset of the edges that form a tree (the subset contains N-1 edges)
- i.e. every graph contains at least 1 corresponding spanning tree, which is a tree that you can create by simply removing edges

### Representing Graphs

**Matrix Representation**
You can represent graphs as a matrix (2D array), let's look at a graph with vertices that are cities and edges that are distances:

| |Buffalo|Cleveland|Pittsburgh|Columbus|
|:--:|:--:|:--:|:--:|:--:|
|Buffalo| X | 25 | 234| -|
|Cleveland| 25| X | ...
|Pittsburgh|
|Columbus|

**Hash Table-like Array Representation**
You can also represent the matrix as a hash table with keys that uniquely identify the node. The values would be linked lists that contain neighboring nodes identifier and the weights (data) of the edges.

This representation is good if a graph is sparse, but ineffcient if the graph is dense




Let's say you have a connected & undirected graph with V vertices:

Min. edges: V - 1 (because its connected)
Max. edges: (V - 1) + (V - 2) + ... ~ V^2

### Implementation of Array Graph

Edges are stored as a linked list (you could make the edges themselves nodes in a linked list, or you can use the built-in api)
You add the vertices into the array at their specified id (or pass the id through hash function)
Add edges to the corresponding linked list of both edges (if the graph is undirected, just 1 if the graph is directed)

```java
public class Graph {
    public Graph() {

    }

    class Verex {
        String id;
        LinkedList<Edge> edges;
        // boolean encountered;
        // ... More fields that are relevant to algorithms
    }

    class Edge {
        int endNode; // Represents a vertex as an index in the hashtable
        doulbe cost;
    }

    private Vertex[] vertices;
    private int numVertices;
    private int maxNum;
}
```
