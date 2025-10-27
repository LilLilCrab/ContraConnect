# ContraConnect
## [Heart Framework](https://docs.google.com/presentation/d/1MZ0A1XwPSUa_DnDkMZtGFHL18yOAnsjGveQf7S7PKJA/edit?usp=sharing)

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

# Prepared by: Benjii Costa  

## HEART Framework: Retention  

### Definition  
**Retention** measures how effectively our app keeps users engaged and returning over time. It reflects whether users find lasting value and continue to use the app after initial onboarding.  

---

### Goals  
- Encourage contractors and homeowners to return to the app regularly for ongoing work management and communication.  
- Build long-term trust and habitual use through reliable scheduling, easy communication, and transparent billing.  
- Reduce churn after initial onboarding by creating meaningful engagement moments (e.g., repeat bookings, quick re-logins).  

---

### Signals  
- Users repeatedly access the app within 7 and 30 days of initial sign-up.  
- Contractors continue to update availability and respond to work requests.  
- Homeowners request additional work or rehire the same contractor.  
- Decline in “inactive” accounts after initial engagement period.  

---

### Metrics  
- **7-Day Retention Rate:** Percentage of users active within 7 days of sign-up.  
- **30-Day Retention Rate:** Percentage of users active within 30 days.  
- **Active User Ratio (DAU/MAU):** Measures ongoing engagement frequency.  
- **Repeat Booking Rate:** How often a user (homeowner or business) hires the same contractor again.  
- **Contractor Response Rate:** How often contractors reply to new job requests within 24 hours.  
- **Churn Rate:** Percentage of users inactive for over 30 days.  

---

### Data Sources  
- **Firebase Analytics:** Track event timestamps and user activity frequency.  
- **Firestore:** Use user documents with `lastActiveDate` and `totalSessions` fields for calculating churn and engagement ratios.  
- **FlutterFlow Events:** Trigger custom analytics when a user schedules a job, sends a message, or updates their calendar.

---

### Success Criteria  
- Increase **30-day retention rate** by at least 15% over baseline after implementing engagement features.  
- Maintain a **DAU/MAU ratio ≥ 0.25**, indicating healthy recurring use.  
- Reduce inactive contractor accounts by 20% within one quarter.  

---

### Notes  
Retention is a leading indicator of sustainable growth for ContraConnect. Improving it means users aren’t just trying the platform—they’re integrating it into their work and home management routines.

---
