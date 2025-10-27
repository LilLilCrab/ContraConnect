# ContraConnect AB Test

## Lukaz Seng

## AB Test Name: Contractor Posting Gamification 
## HEART Metric: 
### Happiness: Post-creation satisfication rating (1-3) after publishing
### Engagement: The average posts per week by the contractor
### Adoption: The number of contractors that completed a a post per month
### Retention: Get the percent of contractors that will post within 14 days
### Task: The perecent of quality work being done on each post
## Hypothesis: 
### If contractors are shown gamified progress feedback (“You’ve published 3 posts this month, 2 more to be featured”), they will be motivated to publish more posts per week compared to contractors who do not see this feedback, without decreasing post quality.
## Experiment:
### User: A contractor role have 50% with feedback and 50% without the feedback
### Using Firebase Remote Config The tracking first when the contractor publishes work so we would need to keep track on how many posts the contractor posted within a week.
### When the Contractor Posted have the feedback prompt appear, have a variable contractor_posted to keep track it being posted
### Have a variable to keep track or post quality to prevent not good quality posts
## Variations: 
### Either a week or a month of posts (not sure)
### Show the feedback after they have posted with “You’ve published 3 posts this month, 2 more to be featured”
### Either have the same prompt on their dashboard or a shorten one like "3/5 post completed 2 more to go!"
### Earning badges to help motivate for postings

---

## Marlon Mussington
## Contractor Booking Conversion Optimization


## AB Test Name: Urgency & Social Proof on Final Booking

## HEART Metric:
### Happiness: Post-booking survey score rating the ease and confidence of the final checkout step (1-5 scale).
### Engagement: The average number of clicks on the final Call-to-Action (CTA) button per 100 screen views.
### Adoption: The increase in the overall successful contractor bookings completed per month across all users.
### Retention: The percentage of users who complete a second service booking within 90 days (indicating a positive first experience).
### Task: The **Booking Conversion Rate**—the percentage of users who land on the final booking confirmation page and successfully complete the payment/booking process.


## Hypothesis:
### If users are shown both **social proof** (like high ratings and job completion counts) and a **scarcity** element (a time-reserved slot countdown) on the final confirmation screen, they will be more likely to **complete the booking** immediately, resulting in a higher Task Completion Rate (Booking Conversion Rate) compared to those who see the standard screen.


## Experiment:
### User: Users who have already selected a contractor, service, and time, and have landed on the final, pre-payment confirmation screen.
### Using: **Firebase Remote Config** to manage the two experiences (Control vs. Treatment).
### Tracking:
1.  **Impression:** Track when the user lands on the final booking confirmation screen.
2.  **Conversion:** Track successful completion of the booking transaction.
3.  **Abandonment:** Track users who leave the screen without clicking the CTA or completing the transaction.
### Split: 50% of users see the Control (A), and 50% see the Treatment (B).


## Variations:
### **Version A (Control): Standard Final Booking Screen**
* **Button CTA:** "Confirm Booking"
* **Messaging:** Displays only the basic information (Contractor name, Service, Price, Date). No social proof or time limits.

### **Version B (Treatment): Urgency and Trust Screen**
* **Button CTA:** "Secure My Booking Now"
* **Social Proof Element:** A small, prominent line stating the contractor's high demand and quality. Example: **"Highly Rated: [Contractor Name] has completed 47 jobs in your area with a 4.8-star average."**
* **Scarcity Element:** An alert with a non-intrusive 15-minute countdown timer. Example: **"Limited Availability: Your chosen time slot is reserved for the next 15 minutes."**


This test is designed to see if a gentle push of urgency and a boost of confidence at the last minute can overcome user indecision. Let me know if you'd like to brainstorm ways to measure the "Happiness" metric in a simple post-booking flow!

---

## Kenneth Avendano

## A/B Test Name: Onboarding Order Flow (Role-First vs Details-First)

### User Story Number:
US3 – Onboarding and Profile Creation Flow


### Metrics:
- **Adoption:** Percentage of users who complete onboarding and reach the home screen (`onboarding_complete` event / total `sign_up` events).
- **Task Success:** Average onboarding completion time (from first onboarding screen to `onboarding_complete` event).
- **Retention:** Percentage of users returning to the app within 7 days after onboarding completion (`app_open` events tied to `user_id`).
- **CTR:** Button click-through rate for “Continue” and “Submit” events across onboarding screens (`onboarding_step_next`).


### Hypothesis:
Users who select their **role (Homeowner or Contractor)** first will experience a more personalized and intuitive onboarding process, leading to **higher completion rates and faster onboarding times**.  
We hypothesize that beginning with “Who you are” makes the next questions (like name, birthday, and business details) feel more relevant — improving overall **Adoption** and **Task Success**.


### Problem Statement:
The current onboarding process starts with **personal information first**, which may feel impersonal and confusing since users don’t yet know whether they’re signing up as a contractor or homeowner.  
In early user testing, **drop-offs occurred between the personal info and role selection screens**, suggesting a lack of clarity about why certain data was needed.  
Improving this flow could directly increase **adoption** (users completing onboarding) and **reduce time-to-home** — both key early conversion metrics for ContraConnect.


### Experiment Setup:
We will use **Firebase Remote Config** to split users randomly into two equal groups (50/50):  
- **Group A (Role-First Flow):** Users first select “Homeowner” or “Contractor,” then enter name, birthday, and (if contractor) business info.  
- **Group B (Details-First Flow - Control):** Users first enter personal info, then select their role.  

Firebase Analytics will track:  
- `sign_up` (automatic via Firebase Auth)  
- `onboarding_started`  
- `onboarding_step_view { onboarding_flow, step_name }`  
- `onboarding_complete { onboarding_flow, role, timestamp }`  
- `app_open` (for retention tracking)

We will monitor:
- Completion rate (`onboarding_complete / sign_up`)  
- Average time to completion (`onboarding_complete.timestamp - onboarding_started.timestamp`)  
- 7-day retention (users with ≥1 `app_open` within 7 days of onboarding_complete)

Only **new users** will be included in this test, and each group will have an equal distribution of devices, locations, and roles to ensure balance.


### Variations:

#### **Group A: Role-First Flow (Test Group)**
- **Screen 1:** “Select your role” (Homeowner / Contractor)
- **Screen 2:** Input First Name, Last Name, Birthday
- **Screen 3 (Contractors only):** Input Business Name + Contract Type
- **Screen 4:** Confirmation + Continue to Home

Firebase Config parameter:  
`"onboarding_flow": "role_first"`

#### **Group B: Details-First Flow (Control Group)**
- **Screen 1:** Input First Name, Last Name, Birthday
- **Screen 2:** “Select your role” (Homeowner / Contractor)
- **Screen 3 (Contractors only):** Input Business Name + Contract Type
- **Screen 4:** Confirmation + Continue to Home

Firebase Config parameter:  
`"onboarding_flow": "details_first"`

