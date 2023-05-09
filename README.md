Functional requirements:

- [X] Add users authetication with JWT

- [X] Add Admin

- [ ] * 1 Register Products

- [ ] * 2 Product Categories

- [ ] * 3 Purchases

- [ ] * 4 and users who purchase.

- [ ] * 5 There will be different types of products

- [ ] * 6 product may be associated with one or more categories. 

- [ ] * 7 Each product must have one or more images.

- [ ] * 8 Registered purchases must be associated with a particular Product and User.

- [ ] * 9 Different Administrators will manage each of the resources, * 7 it needs to be known which Administrator user created Products and Categories.

- [ ] * 10 It is desirable to know which users made any changes to these resources and what those changes were.

- [ ] * 11 An email must be sent to the Administrator users, addressed to the creator of the product and cc'ed to the other administrators, for the first purchase of a product.

- [ ] * 12 A daily process must be executed that generates a report with the Purchases made for each product from the previous day and is sent to the Administrators.

- [ ] * 13 The attributes of each model should be what the applicant deems necessary to meet the functional requirements.

- [ ] * 14 It is not necessary to implement an administration view, only that the models exist and that an acceptable number of resources can be created from seeds: Administrators, Products, Categories, etc.

- [ ] * 15 Four JSON APIs must be created, with Administrator user authentication using JWT:

- [ ] * 16 a. Obtain the most purchased Products for each category.

- [ ] * 17 b. Obtain the top 3 Products that have raised the most money ($) per category.

- [ ] * 18 c. Obtain a list of purchases according to parameters. The parameters must be:

- [ ] * 19 purchase date (from and to), category id, customer id, Administrator Id (purchases of products associated with a certain Administrator Id).

- [ ] * 20 d. Obtain the number of purchases according to granularity. The same parameters as the previous point must be considered + the granularity parameter, which can be: hour, day, week, year.

- [ ] * 21 It should be considered that this information will be used by a Frontend for a graph. Examples:

- [ ] * 22 i. If it's per hour, the expected API response is: {2023-05-01 00:00: 10, 2023-05-01 01:00: 40, ...}.
        If it's per day: {2023-05-01: 100, 2023-05-02: 250, ...}

- [ ] * 23 Only Administrators should be able to access these authenticated APIs,

- [ ] * 24 APIs must be tested using Rspec.

- [ ] * 25 The implementation of associations between models beyond the basic ones would be expected. For example, many-to-many, polymorphism, or inheritance, as deemed necessary by the applicants.

- [ ] * 26 Daily process implementation regarding daily purchase reporting must be implemented with Sidekiq.
The entire source code will be evaluated considering the following:

- [ ] * 27 a. High Performance: Optimized SQL queries, use of caches, implementation of background jobs, without n+1, or others.

- [ ] * 28 b. Focus on Security: Standard security usage recommended by Ruby on Rails, correct registration of private credentials if required, etc.

- [ ] * 29 c. Implementation of Good Practices: CI/CD, Linters, testing, framework recommendations, design patterns, or others.

- [ ] * 30 The sending of the first product purchase email will be tested under a race condition.

## Desirable but not required:

- [ ] * 31 a. That the API(s) have implemented some caching mechanism.

- [ ] * 32 b. Model logic implemented that allows for recording which Administrator user made some change.

- [ ] * 33 c. Entity-relationship diagram of the models.

### Deliverables:
* Ruby or Rails application, with the version that the applicant deems appropriate, with everything implemented and necessary according to the requirements.
* Share source code through a repository in the cparram Github account.

- [ ] * 34 Seeds to fill the postgresql database locally.

- [ ] * 35 Postman file with the API calls or, alternatively, curl script to execute from the console and test each API.