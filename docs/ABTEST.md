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
