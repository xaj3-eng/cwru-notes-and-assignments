public class Appointment {

    private int startTime;
    private int endTime;
    private String title;

    public Appointment(int startTime, int endTime, String title) {
        assert startTime <= endTime;

        this.startTime = startTime;
        this.endTime = endTime;
        this.title = title;
    }

    public String toString() {
        return startTime + " to " + endTime + ": " + title;
    }

    public int startTime() {
        return startTime;
    }

    public int endTime() {
        return endTime;
    }

    public String getTitle() {
        return title;
    }

    public boolean conflictsWith(Appointment event) {
        return !(
            (event.startTime() <= startTime && event.endTime() <= startTime) ||
            (event.endTime() >= endTime && event.startTime() >= endTime)
        );
    }
}
