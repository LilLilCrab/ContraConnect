# ContraConnect
## [Heart Framework](https://docs.google.com/presentation/d/1h30onyUbGMUGm7jJqxZ7wAYJ0lNIhyDAHlJ7sbeP7Go/edit?usp=sharing)
## Lukaz Seng
### Metric #1 (Average Number of Contractors posts per week)
### How to collect: Log an event using Firebase Analytics when the contractor creates a new post using a variable "contractor_posted_work"
### Each event has a unique user_id and the time stamp
### Firebase Analytics will store and organize it by each week by user_id in order to count for the number of posts were made by the contractors
### Then compute the average of work posted by the contractor
