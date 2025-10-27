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
