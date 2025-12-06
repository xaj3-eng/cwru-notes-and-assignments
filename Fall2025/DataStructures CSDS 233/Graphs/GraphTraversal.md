# Graph Traversal

The goal: Process every node in the graph and by creating a spanning tree of the graph in the process

How would you start?
How would you progress?

## Where Do You Start?
- Very simple: **ANYWHERE**

## How do you progress?

**Depth First Traversal**
1. Recursive approach:
1. Start at a node, recursively process neighbor across the first edge in the linked list,
1. Then recursively process the neighbor of the second edge in the linked list, and so on until there are no more neighbors
1. Keep track of which nodes have been processed and don't process the same node twice, otherwise there would be infinite recursion

```java
// We create the vertex class such that it has an encountered boolean field and a parent field
// This will allow creating and storing the spanning tree without a separate tree
//
// This is an int that stores the index where the vertex is in the array
public static void depthFirstTrav(int vIndex) {
    innerDFT(v, null);
}

static void innerDFT(int vIndex, int parentID) {
    System.out.println(verices[vIndex].id);
    vertices[vIndex].encountered = true;
    vertices[vIndex].parent = parent;

    for (Edge curEdge : edges) {
        neighborIndex = curEdge.endNode;
        if (!vertices[neighborIndex].encountered) {
            innerDFT(neighborIndex, vIndex)
        } else {
            // There is a cycle in the graph
        }
    }
}
```

Application:
- If you visit a node that you have already encountered, then there is a cycle.

**Breadth First Traversal**
1. Start at a node
1. Check all of the direct neighbors
1. Check all of the unvisited "2nd degree" (distance 2) neighbords
1. Check all of the unvisited 3 neighbors
1. ..
1. Make sure to keep track of all processed nodes, don't process the same node twice

Similarly to level-order traversal of trees, we will use a queue to store the data in order

```java
import java.util.Queue;

public static void breadthFirstTraversal(int vertex) {
    Queue<Integer> vQueue = new Queue<Integer>;
    vQueue.add(vertex);

    while (!vQueue.isEmpty()) {
        Vertex v = vertices[vQueue.pop()];
        if (v.encountered) continue;

        // Process Node Here
        System.out.println("Encountered: " + v);

        for (Edge curEdge : v.egdes) {
            vQueue.add(curEdge.endNode);
        }
    }
}
```

Complexities for Graph with {V} vertices and {E} edges:
- Traversal Complexity: O(V + 2E)
  - This is because you process every node and every edge (twice because dups)
  - Worst Case: complete graph where E -> V^2, so O(V^2)


## Shortest-Path Unweighted

- The "shortest" path means the path with minimum cost
  - For an unweighted graph, it is the path with least number of visited nodes/crossed edges
- Given a source point, find the shortest path to another node or all other nodes

- If you tried to use dfs, you would end up creating a spanning tree (or until you find the right vertex) for every single possible path

- The shortest-path algorithm is **Breadth First Traversal**, and as soon as you encounter the node, it is *a* shortest path.
  - The shortest path is simply that with least edges, breadth first search slowly increases the number of edges
  
```java

```

## Shortest-Path Weighted

### Dijkstra's Algorithm: Finds the shortest paths from vertex v to all other vertices that can be reached from v.
- The single-source-all-destinations problem

Assumptions:
- Graph is connected
- Edgecost is non-negative
  - more edges = higher cost innately
  
We say that a vertex w is finalized if we are certain we have found the shortest path from v to w.

We repeatedly do the following:
- Calculate the cost from traveling directly from the source to neighbors. Keep track of the cost on each destination node
- Mark the shortest path (lowest cost) from the source as finalized
- Then travel directly from the newest finalized node to all of its direct neighbors, and if the sum of its cost and the cost to travel to the node is less than the cost tracked on the node, set that cost to the cost.
- Mark the lowest cost as finalized.
- Repeat until all nodes (or just the destination node) are finalized

### Notation:
- c(x,y): link cost from node x to y; infinity if they aren't neighbors
- D(v): current path cost estimate from source to destination. v
- p(v): predecessor node along path from source to v
- N: set of nodes whose least cost path is definitively known
- u: starting node

### Initialization:
```
1. N = {u}
2. for all nodes v
3.    if v adjacent to u then
4.      D(v) = c(u,v)
5.      p(v) = u
6.  else D(v) = inf.
```

### Loop:
```
1. Find the vertex w (not in N) with smallest D(w)
2. add w to N
3. Update D and P
```


### Example:
|Step|N|D(v),p(v)|D(w),p(w)|D(x),p(x)|D(y),p(y)|D(z),p(z)|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|0|u|2,u|5,u|1,u|inf.|inf.|
|1|u,x|2,u|4,x|*Final: 1*|2,x|inf.|
|2|u,x,v|*Final: 2*|4,x|*Final: 1*|2,x|inf.|
|3|u,x,v,y|*Final: 2*|3,y|*Final: 1*|*Final: 2*|4,y|
|4|u,x,v,y,w|*Final: 2*|*Final: 3*|*Final: 1*|*Final: 2*|4,y|
|5|u,x,v,y,w,z|*Final: 2*|*Final: 3*|*Final: 1*|*Final: 2*|*Final: 4*|

**You can also use a min heap to store the vertices and calculate the minimum path**

Complexity: O(V + E + V log V + E log V)
- V + E is initialization of heap
- V log V is removing all of the minimum paths and maintaining the heap
- E log V is E edges where you update the heap, and V vertices in the heap
- E ranges from V-1 to V^2, so E >> V, and E log V >> V log V

## Minimum Spanning Tree: (Only for weighted graphs)

The spanning tree with the lowest total cost. It may not be unique

Applications:
- Determine the shortest highway system to connect a set of cities
- Calculate the smallest length of cables required to connect several things
- Group communication with minimum bandwidth

The shortest path from one location to all other locations, looks like a MST, but its not

Key insight: if we divide the vertices into two disjoin subsets A and B, then the lowest-cost edge joining a vertex in A to a vertex in B - called (a,b) - must be part of the MST

### Prim's Algorithm:
1. Divides the graph into two subsets of vertices, A and B. A is initially empty, and B is full
1. Starts from a vertex, and adds it to set A (removing it from B)
1. Walks the edge with the least cost and adds it to set A (removes it from B)
1. Of all the edges in set A, finds that with the least cost and walks it, adding the corresponding vertex to A
1. Repeat

Notation:
```
c(x,y): link cost from node x to y; infinity if they aren't direct neighbors
C(v): current estimate of cost-to-connect v to set A
p(v): predecessor node along path from source to v
A: set of nodes added to MST
u: starting node
```

Creating a heap with all of the edges of A is the most efficient way

Overall complexity is O(V + E + VlogV + ElogV) = O(ElogV)
