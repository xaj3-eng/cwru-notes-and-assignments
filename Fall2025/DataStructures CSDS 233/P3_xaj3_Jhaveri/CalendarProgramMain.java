public class CalendarProgramMain {

    // Testing Function
    public static void main(String[] args) {
        CalendarManager myCalendar = new CalendarManager();

        // Segment 1: Insertions and Displays
        myCalendar.addEvent(900, 930, "Calculus Class");
        myCalendar.addEvent(1000, 1100, "English Class");
        myCalendar.addEvent(800, 830, "Councilor Meeting");
        myCalendar.addEvent(1330, 1430, "Physics Class");
        myCalendar.addEvent(1130, 1230, "Data Structures Class");
        myCalendar.addEvent(1800, 1900, "Dinner with Family");
        myCalendar.addEvent(1300, 1315, "Meetup with Friend");
        myCalendar.addEvent(1500, 1550, "Finance Class");
        myCalendar.addEvent(2000, 2100, "Study for Math Test");

        System.out.println("\nIn Order Traversal: ");
        myCalendar.inorderTrav();
        System.out.println("\nPre-Order Traversal: ");
        myCalendar.preorderTrav();
        System.out.println("\nPost-Order Traversal: ");
        myCalendar.postorderTrav();

        // Segment 2: Deleting and Displaying
        myCalendar.deleteEvent(1000);
        System.out.println(
            "\nIn Order Traversal after Deleting 1000 English Class: "
        );
        myCalendar.inorderTrav();

        myCalendar.deleteEvent(1800);
        System.out.println("\nIn Order Traversal after Deleting 1800 Dinner: ");
        myCalendar.inorderTrav();

        // Segment 3: Total Meeting Time
        System.out.println(
            "\nTotal meeting time at this point (should be 305): " +
                myCalendar.totalMeetingTime() +
                " minutes"
        );

        // Segment 4: Event Lookup
        System.out.println(
            "\nEvent at 900 - " + myCalendar.eventTimeLookup(900)
        );

        System.out.println(
            "Event at 1000 - " + myCalendar.eventTimeLookup(1000)
        );

        // Segment 5: Check for Events at Start Time
        System.out.println(
            "\nThere is an event at 1500: " + myCalendar.eventExists(900)
        );

        System.out.println(
            "There is an event at 1800: " + myCalendar.eventExists(1000)
        );

        // Segment 6: Check for Event Conflicts
        Appointment newEvent1 = new Appointment(1000, 1100, "Tennis Practice");
        Appointment newEvent2 = new Appointment(1430, 1530, "Workout");

        System.out.println(
            "\nI can insert 1000 to 1100 tennis practice into my calendar: " +
                myCalendar.checkTimeSlotConflict(newEvent1)
        );
        System.out.println(
            "I can insert 1430 to 1530 tennis practice into my calendar: " +
                myCalendar.checkTimeSlotConflict(newEvent2)
        );
    }
}
