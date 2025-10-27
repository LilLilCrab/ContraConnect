# ContraConnect
## [Heart Framework](https://docs.google.com/presentation/d/1h30onyUbGMUGm7jJqxZ7wAYJ0lNIhyDAHlJ7sbeP7Go/edit?usp=sharing)

## Lukaz Seng
## NPS (Net Promoter Score)
### How to collect: Log an event using Firebase Analytics to have a prompt, ask users feedback after three logins using a variable "nps_submitted"
### Each event should include: user_id, role (homeowner or contractor), nps_score (0 to 10) and timestamp of submission time
### The percentage of Promoters (9–10)
### The percentage of Passives (7–8)
### The percentage of Detractors (0–6)
### Calculate the NPS score:  NPS = (% Promoters - % Detractors)


##  Other Metric(Average Number of Contractors posts per week)
### How to collect: Log an event using Firebase Analytics when the contractor creates a new post using a variable "contractor_posted_work"
### Each event has a unique user_id and the time stamp
### Firebase Analytics will store and organize it by each week by user_id in order to count for the number of posts were made by the contractors
### Then compute the average of work posted by the contractor

---

## Kenneth Avendano

## Adoption Metric

### Description
**Metric Name:** Adoption  
**HEART Category:** Adoption (New User Growth)  
**Goal:** Measure how many new users start using the app within a given time frame.  
**Signal:** Number of successful account creations and first actions after sign-up.  
**Metric:** Count of unique users who create an account (`sign_up` event in Firebase Authentication) and complete their first in-app action (e.g., browsing contractors or posting a job request) within 24 hours of sign-up.


### How We Collect This Data

- **Collection Method:** Automatically logged via **Firebase Authentication** and **Firebase Analytics**.  
- **Firebase Event:**  
  - `sign_up` — automatically tracked by Firebase when a new user account is created.  
  - `first_action` (custom event) — triggered when a user performs their first key action after onboarding (e.g., `contractor_list_view` or `request_submit`).  
- **Data Source:** Firebase Analytics → User Properties and Event Logs.  
- **Calculation Formula:**  
