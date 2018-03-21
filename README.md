# Project Information - ZenFit

Please write a web application that tracks zen times for users. We will call it ZenFit.

- Users must be able to create an account and log in
- When logged in, a user can view, edit and delete the zen times he entered
- Implement at least three roles with different permission levels
  - a regular user would only be able to CRUD on their owned records
  - a user manager would be able to CRUD users, and
  - an admin would be able to CRUD all records and users
- Each zen time entry entered has a date and time recorded (in minutes)
- Filter by dates from-to.
- Report on average zen hours spent per week, user can select From and To dates to see the chart of this report. Default is the last 4 weeks.
- REST API. Make it possible to perform all user actions via the API, including authentication.
- In any case, you should be able to explain how a REST API works and demonstrate that by creating functional tests that use the REST Layer directly. Please be prepared to use REST clients like Postman, cURL, etc. for this purpose.
- All actions need to be done client side using AJAX; refreshing the page is not acceptable.
- Minimal UI/UX design is needed. You will not be assessed on graphic design. However, do try to keep it as tidy as possible.
- Use Git to control source code. Please submit the Github link of the repository to us as soon as you started.
- Backend skills required: Rails. Front-end skills required: React
- Bonus: unit and e2e tests.

