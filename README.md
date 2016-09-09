##Event Reporter
###Project requirements at https://github.com/turingschool/curriculum/blob/master/source/projects/event_reporter.markdown
This project loads a CSV file containing data from a group of event attendees. Based on this data file,
it implements a REPL to output cleaned data according to the user's specifications.

The program can:
* Load the event_attendees CSV, or another CSV with the same headers
* Find attendees given an attribute and criteria and add them to a queue
* Order the queue based on user-provided criteria
* Print the queue to the terminal with headers
* Save the queue as a CSV file
* Export the queue to an html file
* Access the Sunlight API to add Congressional district information to each attendee in the queue based on zip code
* Answer help queries
