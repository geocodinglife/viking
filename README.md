Functional requirements:

* 1 Register Products, Product Categories, Purchases, and users who purchase.

* 2 There will be different types of products
* 3 product may be associated with one or more categories. 
* 4 Each product must have one or more images.
* 5 Registered purchases must be associated with a particular Product and User.

* 6 Different Administrators will manage each of the resources, * 7 it needs to be known which Administrator user created Products and Categories. 
* 8 It is desirable to know which users made any changes to these resources and what those changes were.

* 9 An email must be sent to the Administrator users, addressed to the creator of the product and cc'ed to the other administrators, for the first purchase of a product.

* 10 A daily process must be executed that generates a report with the Purchases made for each product from the previous day and is sent to the Administrators.

* 11 The attributes of each model should be what the applicant deems necessary to meet the functional requirements.

* 12 It is not necessary to implement an administration view, only that the models exist and that an acceptable number of resources can be created from seeds: Administrators, Products, Categories, etc.

* 13 Four JSON APIs must be created, with Administrator user authentication using JWT:

* 14 a. Obtain the most purchased Products for each category.
* 15 b. Obtain the top 3 Products that have raised the most money ($) per category.
* 16 c. Obtain a list of purchases according to parameters. The parameters must be:
* 17 purchase date (from and to), category id, customer id, Administrator Id (purchases of products associated with a certain Administrator Id).

* 18 d. Obtain the number of purchases according to granularity. The same parameters as the previous point must be considered + the granularity parameter, which can be: hour, day, week, year. 
     It should be considered that this information will be used by a Frontend for a graph. Examples:

* 19 i. If it's per hour, the expected API response is: {2023-05-01 00:00: 10, 2023-05-01 01:00: 40, ...}.
        If it's per day: {2023-05-01: 100, 2023-05-02: 250, ...}

* 20 Only Administrators should be able to access these authenticated APIs, 
* 21 APIs must be tested using Rspec.

* 22 The implementation of associations between models beyond the basic ones would be expected. For example, many-to-many, polymorphism, or inheritance, as deemed necessary by the applicants.

* 23 Daily process implementation regarding daily purchase reporting must be implemented with Sidekiq.
The entire source code will be evaluated considering the following:

* 24 a. High Performance: Optimized SQL queries, use of caches, implementation of background jobs, without n+1, or others.

* 25 b. Focus on Security: Standard security usage recommended by Ruby on Rails, correct registration of private credentials if required, etc.
* 26 c. Implementation of Good Practices: CI/CD, Linters, testing, framework recommendations, design patterns, or others.


* 26 The sending of the first product purchase email will be tested under a race condition.

* 27 Desirable but not required:
a. That the API(s) have implemented some caching mechanism.

* 28 b. Model logic implemented that allows for recording which Administrator user made some change.

* 29 c. Entity-relationship diagram of the models.
Deliverables:
Ruby or Rails application, with the version that the applicant deems appropriate, with everything implemented and necessary according to the requirements.
Share source code through a repository in the cparram Github account.
* 30 Seeds to fill the postgresql database locally.

* 31 Postman file with the API calls or, alternatively, curl script to execute from the console and test each API.