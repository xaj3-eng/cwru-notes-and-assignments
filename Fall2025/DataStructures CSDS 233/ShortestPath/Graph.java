import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.PriorityQueue;

public class Graph {

    private class Vertex {

        private String id;
        private LinkedList<Edge> edgeList;
        private boolean encountered;
        private Vertex predecessor;
        private int netCost;

        public Vertex(String id) {
            this.id = id;
            edgeList = new LinkedList<>();
            encountered = false;
            predecessor = null;
            netCost = 0;
        }
    }

    private class Edge {

        private String endVertexID;
        private int cost;

        public Edge(String endVertexID, int cost) {
            this.endVertexID = endVertexID;
            this.cost = cost;
        }
    }

    private HashMap<String, Vertex> vertices;

    public Graph() {
        vertices = new HashMap<>();
    }

    public void addVertex(String id) {
        vertices.putIfAbsent(id, new Vertex(id));
    }

    public void addUndirectedEdge(String idFrom, String idTo, int cost) {
        addEdgeToVertex(idFrom, new Edge(idTo, cost));
        addEdgeToVertex(idTo, new Edge(idFrom, cost));
    }

    private void addEdgeToVertex(String vertexID, Edge edge) {
        if (vertices.containsKey(vertexID)) {
            vertices.get(vertexID).edgeList.add(edge);
        }
    }

    private class HeapItem {

        String itemID;
        int itemNetCost;

        HeapItem(String itemID, int itemDist) {
            this.itemID = itemID;
            this.itemNetCost = itemNetCost;
        }
    }

    public List<String> shortestPath(String id1, String id2) {
        if (
            !vertices.containsKey(id1) || !vertices.containsKey(id2)
        ) return null;

        for (Vertex v : vertices.values()) {
            v.netCost = Integer.MAX_VALUE;
            v.predecessor = null;
            v.encountered = false;
        }

        PriorityQueue<Vertex> heap = new PriorityQueue<>(
            Comparator.comparingInt(item -> item.netCost)
        );

        final Vertex initialVertex = vertices.get(id1);
        initialVertex.netCost = 0;
        heap.add(initialVertex);

        while (!heap.isEmpty()) {
            Vertex currentVertex = heap.poll();
            if (currentVertex.encountered) continue;

            currentVertex.encountered = true;

            System.out.println(currentVertex.id);
            System.out.println("- Current Net Cost: " + currentVertex.netCost);

            if (currentVertex.id.equals(id2)) break;

            for (Edge edge : currentVertex.edgeList) {
                Vertex neighbor = vertices.get(edge.endVertexID);
                if (neighbor.encountered) continue;

                int newCost = currentVertex.netCost + edge.cost;
                if (newCost > neighbor.netCost) continue;

                neighbor.netCost = newCost;

                System.out.println(
                    "- Edge: " + edge.cost + " to " + edge.endVertexID
                );

                neighbor.predecessor = currentVertex;
                heap.add(neighbor);
            }

            System.out.println();
        }

        Vertex currentVertex = vertices.get(id2);
        LinkedList<String> finalList = new LinkedList<>();

        while (currentVertex != null) {
            finalList.add(currentVertex.id);
            currentVertex = currentVertex.predecessor;
        }

        return finalList.reversed();
    }

    public static void main(String[] args) {
        Graph g = new Graph();

        g.addVertex("Vertex A");
        g.addVertex("Vertex B");
        g.addVertex("Vertex C");
        g.addVertex("Vertex D");
        g.addVertex("Vertex E");
        g.addVertex("Vertex F");
        g.addVertex("Vertex G");
        g.addVertex("Vertex H");
        g.addVertex("Vertex I");
        g.addVertex("Vertex J");
        g.addVertex("Vertex K");
        g.addVertex("Vertex L");
        g.addVertex("Vertex M");
        g.addVertex("Vertex N");
        g.addVertex("Vertex O");

        g.addUndirectedEdge("Vertex A", "Vertex B", 4);
        g.addUndirectedEdge("Vertex A", "Vertex C", 2);
        g.addUndirectedEdge("Vertex B", "Vertex C", 1);
        g.addUndirectedEdge("Vertex B", "Vertex D", 5);
        g.addUndirectedEdge("Vertex C", "Vertex D", 8);
        g.addUndirectedEdge("Vertex C", "Vertex E", 10);
        g.addUndirectedEdge("Vertex D", "Vertex E", 2);
        g.addUndirectedEdge("Vertex D", "Vertex F", 6);
        g.addUndirectedEdge("Vertex E", "Vertex G", 3);
        g.addUndirectedEdge("Vertex F", "Vertex G", 1);
        g.addUndirectedEdge("Vertex F", "Vertex H", 7);
        g.addUndirectedEdge("Vertex G", "Vertex I", 4);
        g.addUndirectedEdge("Vertex H", "Vertex I", 2);
        g.addUndirectedEdge("Vertex I", "Vertex J", 6);
        g.addUndirectedEdge("Vertex J", "Vertex K", 3);
        g.addUndirectedEdge("Vertex K", "Vertex L", 2);
        g.addUndirectedEdge("Vertex L", "Vertex M", 5);
        g.addUndirectedEdge("Vertex M", "Vertex N", 3);
        g.addUndirectedEdge("Vertex N", "Vertex O", 4);
        g.addUndirectedEdge("Vertex K", "Vertex N", 10);
        g.addUndirectedEdge("Vertex E", "Vertex L", 12);
        g.addUndirectedEdge("Vertex B", "Vertex F", 14);
        g.addUndirectedEdge("Vertex C", "Vertex H", 9);
        g.addUndirectedEdge("Vertex G", "Vertex M", 8);
        g.addUndirectedEdge("Vertex D", "Vertex K", 11);
        g.addUndirectedEdge("Vertex H", "Vertex O", 15);

        List<String> path = g.shortestPath("Vertex B", "Vertex N");

        System.out.println("\nShortest Path:");
        for (String id : path) {
            System.out.println(id);
        }
    }
}
