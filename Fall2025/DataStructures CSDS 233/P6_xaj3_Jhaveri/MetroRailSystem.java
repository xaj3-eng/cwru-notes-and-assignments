import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;

public class MetroRailSystem {

    private class Edge {

        String source;
        String destination;
        int distance;

        public Edge(String source, String destination, int distance) {
            this.source = source;
            this.destination = destination;
            this.distance = distance;
        }

        @Override
        public String toString() {
            return String.format("[%s, %s]", source, destination);
        }
    }

    private class Vertex {

        String id; // Station Name
        List<Edge> edges;

        private Vertex(String id) {
            this.id = id;
            edges = new LinkedList<>();
        }

        // Helper method that simply returns whether an edge exists to the given destination
        private boolean edgeExistsTo(String destination) {
            return edges
                .stream()
                .anyMatch(edge -> edge.destination.equals(destination));
        }

        // Helper method that returns an edge (if it exists) to the given destination
        private Edge edgeTo(String destination) {
            return edges
                .stream()
                .filter(edge -> edge.destination.equals(destination))
                .findFirst()
                .orElse(null);
        }

        // Helper method to return the cost to get directly from this vertex to the given vertex
        // (Returns max integer if no edge exists)
        private int directCost(String destination) {
            return edges
                .stream()
                .filter(edge -> edge.destination.equals(destination))
                .findFirst()
                .map(edge -> edge.distance)
                .orElse(Integer.MAX_VALUE);
        }

        @Override
        public String toString() {
            return id;
        }
    }

    List<Vertex> stations;

    public MetroRailSystem() {
        stations = new LinkedList<>();
    }

    // Helper function that gets the Vertex with the inputted id
    // -- This could be more efficient with the use of a hashing function
    // -- Time Complexity O(V)
    private Vertex getVertex(String id) {
        return stations
            .stream()
            .filter(v -> v.id.equals(id))
            .findFirst()
            .orElse(null);
    }

    // Adds a vertex/station to the graph with the given id
    public boolean addStation(String id) {
        if (stations.stream().noneMatch(station -> station.id.equals(id))) {
            stations.add(new Vertex(id));
            return true;
        }
        return false;
    }

    // Simply adds an edge from the vertex w/ id 'source' to the vertex w/ id 'destination' at the given cost/weight
    public boolean addEdge(String source, String destination, int weight) {
        if (source.equals(destination)) return false;

        Vertex sourceVertex = getVertex(source);
        Vertex destinationVertex = getVertex(destination);

        if (
            sourceVertex == null ||
            destinationVertex == null ||
            weight < 0 ||
            sourceVertex.edgeExistsTo(destination)
        ) {
            return false;
        }

        sourceVertex.edges.add(new Edge(source, destination, weight));
        destinationVertex.edges.add(new Edge(destination, source, weight));
        return true;
    }

    // Performs Dijsktra’s Algorithm to find the shortest distance from StationA to StationB
    // I used all of the same variable names as used in the notes just to help me/you follow along. Here are explanations of each:
    // -- N: the set of vertices which have known minimum costs
    // -- D: A map of vertex ids to their current estimated minimum cost
    // -- p: A map of vertex ids to previous vertex ids along the shortest path
    // -- u: Initial vertex
    // -- w: The current vertex with the smallest cost from the starting location. To be added to N

    // Returns the total distance from stationA to stationB
    // Returns -1 if either station doesn't exist or there is no path from A to B
    public int shortestDistance(String stationA, String stationB) {
        final Vertex u = getVertex(stationA);
        if (u == null || getVertex(stationB) == null) return -1;

        HashSet<String> N = new HashSet<>();
        HashMap<String, Integer> D = new HashMap<>();
        HashMap<String, String> p = new HashMap<>();

        N.add(stationA);

        // Initialization:
        // -- Initializes all vertices' estimated cost by looping through all vertices
        // -- Also sets all of the starting vertices's neighbors such that their 'previous vertices' is the starting vertices
        for (Vertex v : stations) {
            int costFromU = u.directCost(v.id);
            D.put(v.id, costFromU);

            if (costFromU < Integer.MAX_VALUE) p.put(v.id, stationA);
        }

        // The main loop of Dijsktra's Algorithm (the actually condition is unnecessary)
        while (N.size() < stations.size()) {
            // Finding vertex with minimum cost from station A
            // -- Loops through the HashMap D of ids and costs
            // -- Keeps track of the lowest cost and the id that has the lowest cost
            String minimumCostId = "";
            int minimumCost = Integer.MAX_VALUE;
            for (Map.Entry<String, Integer> pair : D.entrySet()) {
                if (N.contains(pair.getKey())) continue;

                if (pair.getValue() < minimumCost) {
                    minimumCostId = pair.getKey();
                    minimumCost = pair.getValue();
                }
            }

            if (minimumCost == Integer.MAX_VALUE) return -1;

            // Add w to N
            N.add(minimumCostId);
            Vertex w = getVertex(minimumCostId);

            // If the ending station is in the set of vertices with known shortest paths, then we know the shortest path from A to B
            if (N.contains(stationB)) break;

            // Looks through all of w's outgoing edges, and updates their corresponding estimated costs and previous vertices
            for (Edge edge : w.edges) {
                if (N.contains(edge.destination)) continue;

                final int totalDistanceThroughW =
                    D.get(minimumCostId) + edge.distance;

                if (totalDistanceThroughW < D.get(edge.destination)) {
                    D.put(edge.destination, totalDistanceThroughW);
                    p.put(edge.destination, minimumCostId);
                }
            }
        }

        // Return the 'estimated shortest distance' from A to B, but it is now confirmed
        return D.get(stationB);
    }

    // Performs Prim's Algorithm to create a minimum spanning tree of the metro rail network
    // I used all of the same variable names as used in the notes just to help me/you follow along. Here are explanations of each:
    // -- A: the set of vertices which have known minimum costs
    // -- C: A map of vertex ids to their current estimated minimum cost
    // -- p: A map of vertex ids to previous vertex ids along the shortest path
    // -- u: Initial vertex
    // -- w: The current vertex with the smallest cost from the starting location. To be added to N

    // Returns a list of edges that make up the minimum spanning tree
    // Returns null if the graph is unconnected
    List<Edge> minimumSpanningTree() {
        HashSet<String> A = new HashSet<>();
        HashMap<String, Integer> C = new HashMap<>();
        HashMap<String, String> p = new HashMap<>();

        LinkedList<Edge> finalList = new LinkedList<>();

        // Initializes the first station with a rather arbitrary station (the first station added to the network)
        final Vertex u = stations.getFirst();
        A.add(u.id);

        // Initialization:
        // -- Initializes all vertices' estimated cost by looping through all vertices
        // -- Also sets all of the starting vertices's neighbors such that their 'previous vertices' is the starting vertices
        for (Vertex v : stations) {
            if (A.contains(v.id)) continue;

            int costFromU = u.directCost(v.id);
            C.put(v.id, costFromU);

            if (costFromU < Integer.MAX_VALUE) p.put(v.id, u.id);
        }

        // The main loop of Prim's Algorithm (the actually condition is unnecessary)
        while (A.size() < stations.size()) {
            // Finding vertex with minimum cost to connect to tree
            // -- Loops through the HashMap C of ids and costs
            // -- Keeps track of the lowest cost and the id that has the lowest cost
            String minimumCostId = "";
            int minimumCost = Integer.MAX_VALUE;

            for (Map.Entry<String, Integer> pair : C.entrySet()) {
                if (A.contains(pair.getKey())) continue;

                if (pair.getValue() < minimumCost) {
                    minimumCostId = pair.getKey();
                    minimumCost = pair.getValue();
                }
            }

            // Return null if not all vertices are connected
            if (minimumCost == Integer.MAX_VALUE) return null;

            // Add w to A
            A.add(minimumCostId);
            Vertex w = getVertex(minimumCostId);
            // Adds the edge from the w's 'previous node' to w to the final list
            finalList.add(getVertex(p.get(w.id)).edgeTo(w.id));

            // If all nodes are in A, stop looping cause the final spanning tree is finished
            if (A.size() == stations.size()) break;

            // Looks through all of w's outgoing edges, and updates their corresponding estimated costs and previous vertices
            for (Edge edge : w.edges) {
                if (A.contains(edge.destination)) continue;

                if (edge.distance < C.get(edge.destination)) {
                    C.put(edge.destination, edge.distance);
                    p.put(edge.destination, minimumCostId);
                }
            }
        }

        return finalList;
    }

    // Performs breadth-first search from the inputted initial station
    // Returns an ordered list of id's based on which vertices are visited
    // -- Note: Will not check all vertices if the graph is unconnected
    public List<String> breadthFirstSearch(String start) {
        Vertex initialStation = getVertex(start);
        if (initialStation == null) new LinkedList<>();

        HashSet<String> visitedVertices = new HashSet<>();
        visitedVertices.add(start);

        LinkedList<String> finalList = new LinkedList<>();
        Queue<String> vertexQueue = new LinkedList<>();
        vertexQueue.offer(start);

        while (!vertexQueue.isEmpty()) {
            final String currentId = vertexQueue.poll();
            final Vertex currentVertex = getVertex(currentId);

            finalList.add(currentId);

            for (Edge e : currentVertex.edges) {
                if (visitedVertices.contains(e.destination)) continue;

                visitedVertices.add(e.destination);
                vertexQueue.offer(e.destination);
            }
        }

        return finalList;
    }

    // Performs the same Dijsktra's Algorithm as in 'shortestPath'
    // However, it will break out of the main loop once the cost estimates exceed 'maxDistance'
    // Uses the same variable names as 'shortest path'

    // Returns a List of station id's that are within 'maxDistance' from 'start'
    public List<String> reachableWithin(String start, int maxDistance) {
        final Vertex u = getVertex(start);
        if (u == null) return new LinkedList<>();

        HashSet<String> N = new HashSet<>();
        HashMap<String, Integer> D = new HashMap<>();
        HashMap<String, String> p = new HashMap<>();

        N.add(start);

        // Initialization:
        // -- Initializes all vertices' estimated cost by looping through all vertices
        // -- Also sets all of the starting vertices's neighbors such that their 'previous vertices' is the starting vertices
        for (Vertex v : stations) {
            int costFromU = u.directCost(v.id);
            D.put(v.id, costFromU);

            if (costFromU < Integer.MAX_VALUE) p.put(v.id, start);
        }

        // The main loop of Dijsktra's Algorithm (the actually condition is unnecessary)
        while (N.size() < stations.size()) {
            // Finding vertex with minimum cost from station A
            // -- Loops through the HashMap D of ids and costs
            // -- Keeps track of the lowest cost and the id that has the lowest cost
            String minimumCostId = "";
            int minimumCost = Integer.MAX_VALUE;
            for (Map.Entry<String, Integer> pair : D.entrySet()) {
                if (N.contains(pair.getKey())) continue;

                if (pair.getValue() < minimumCost) {
                    minimumCostId = pair.getKey();
                    minimumCost = pair.getValue();
                }
            }

            // Condition that checks if the shortest distance to w is greater than the max distance.
            // If it is, then all of the vertices within the distance are in N
            // (This inherently checks if not all vertices are connected and functions as intended)
            if (minimumCost > maxDistance) break;

            // Add w to N
            N.add(minimumCostId);
            Vertex w = getVertex(minimumCostId);

            // If the ending station is in the set of vertices with known shortest paths, then we know the shortest path from A to B
            if (N.size() == stations.size()) break;

            // Looks through all of w's outgoing edges, and updates their corresponding estimated costs and previous vertices
            for (Edge edge : w.edges) {
                if (N.contains(edge.destination)) continue;

                final int totalDistanceThroughW =
                    D.get(minimumCostId) + edge.distance;

                if (totalDistanceThroughW < D.get(edge.destination)) {
                    D.put(edge.destination, totalDistanceThroughW);
                    p.put(edge.destination, minimumCostId);
                }
            }
        }

        // Returns N as a LinkedList
        return new LinkedList<>(N);
    }

    // Prints a formatted version of the metro rail system, showing all stations and their connections
    public void printGraph() {
        System.out.println(
            "\n         Stations         |        Connections        "
        );
        System.out.println(
            "------------------------- | ------------------------"
        );

        for (Vertex station : stations) {
            System.out.print(String.format("%-25s | ", station));
            for (Edge e : station.edges) System.out.print(" " + e);
            System.out.println();
        }
    }

    public static void main(String[] args) {
        // Unit Tests are in the main method
        MetroRailSystem smallMetro = createSmallTestSystem();
        MetroRailSystem connectedMetro = createConnectedTestSystem();
        MetroRailSystem unconnectedMetro = createUnconnectedTestSystem();

        // Small System Tests
        System.out.println("Small Metro Tests:");
        System.out.println(
            "Shortest Distance from C to D (should be 11): " +
                smallMetro.shortestDistance("C", "D")
        );
        System.out.println(
            "Minimum Spanning Tree: " + smallMetro.minimumSpanningTree()
        );

        // Connected System Tests
        System.out.println("\nConnected Metro Tests:");
        System.out.println(
            "Shortest Distance from A to H (should be 13): " +
                connectedMetro.shortestDistance("A", "H")
        );
        System.out.println(
            "Shortest Distance from C to F (should be 4): " +
                connectedMetro.shortestDistance("C", "F")
        );
        System.out.println(
            "Minimum Spanning Tree: " + connectedMetro.minimumSpanningTree()
        );

        // Unconnected System Tests
        System.out.println("\nUnconnected Metro Tests:");
        System.out.println(
            "Shortest Distance from A to H (should be 13): " +
                unconnectedMetro.shortestDistance("A", "H")
        );
        System.out.println(
            "Shortest Distance from A to I (no path exists): " +
                unconnectedMetro.shortestDistance("A", "I")
        );
        System.out.println(
            "Minimum Spanning Tree: " + unconnectedMetro.minimumSpanningTree()
        );
    }

    private static MetroRailSystem createSmallTestSystem() {
        MetroRailSystem metro = new MetroRailSystem();

        metro.addStation("A");
        metro.addStation("B");
        metro.addStation("C");
        metro.addStation("D");

        metro.addEdge("A", "B", 5);
        metro.addEdge("B", "C", 2);
        metro.addEdge("A", "D", 4);

        return metro;
    }

    private static MetroRailSystem createConnectedTestSystem() {
        MetroRailSystem metro = new MetroRailSystem();

        metro.addStation("A");
        metro.addStation("B");
        metro.addStation("C");
        metro.addStation("D");
        metro.addStation("E");
        metro.addStation("F");
        metro.addStation("G");
        metro.addStation("H");

        metro.addEdge("A", "B", 4);
        metro.addEdge("A", "C", 2);
        metro.addEdge("B", "D", 7);
        metro.addEdge("C", "B", 1);
        metro.addEdge("C", "E", 5);
        metro.addEdge("D", "F", 2);
        metro.addEdge("E", "D", 3);
        metro.addEdge("E", "G", 10);
        metro.addEdge("F", "G", 1);
        metro.addEdge("G", "H", 6);
        metro.addEdge("B", "E", 8);
        metro.addEdge("F", "C", 4);

        return metro;
    }

    private static MetroRailSystem createUnconnectedTestSystem() {
        MetroRailSystem metro = createConnectedTestSystem();

        metro.addStation("I");
        metro.addStation("J");
        metro.addEdge("I", "J", 5);

        return metro;
    }
}
