# Software Engineering Day 2

## Software Process Models

Goals of Software Engineering: To produce software quickly and inexpensively
with the following properties

- Easy to use
- Satisfies users' needs
- Reliable
- Efficient
- Straightforward to maintain, adapt, and enhance
- Secure

Technical aspects of software engineering:

- Specification
- Design
- Programming
- Inspection and testing
- Static & dynamic analysis, "Software analytics"
  - Static: Analyze the code without executing; source code analysis
  - Dynamic: The behaviour of the software is also analyzed
- Debugging
- Maintenance and evolution
- Version control, integration, configuration management, and deployment

Non-technical aspects:

- Project management
  - Software is developed by teams
- Psychology
  - cognitive, behavioural, organizational
  - example: Behavior-Driven Software Design
- Law and ethics:
  - contracts, liability, intellectual property
- Complexity of the software system
  - Lines of code is a measurement, # dependencies is another
  - Consequences of Software Complexity:
    - Difficult and time-consuming to maintain
    - Hard to be fully understood by one person
    - They can't change easily with the users needs and desires

Software Engineering Methodology

- Broad collection of techniques and tools addressing each phase of SDLC
- Methodology continually evolves
- It can be different for different subfields
  - Web apps vs. systems vs. Health informatics
- Some influential methods:
  - Object-oriented
  - "Agile" methods
  - Design pattern
  - Test-driven Design
  - A/B testing

The goal of the course is to understand the challenges, key ideas, and
methods of large-scale software development

## How to Develop Software

1. Discuss what needs to be created
2. Write code
3. Test the code
4. Debug
5. Fix problems
6. Repeat

### The Software Process

"The set of activities and associated results that produce a software product"

Four fundamental activities are common to all software processes

- Specification
- Development
- Validation
- Evolution

Process descriptions may also include...

- Products: outcomes of the process
- Roles: responsibilities of the people involved in the process
- Pre- and post-conditions: statements that are true before and after
process activity

### Software Process Model

> Sometimes called a Software Development Life Cycle or **SDLC** model

- Graphical models of the software development process
- Characterize workflow between phases

Don't follow a "Build & Fix" model

Waterfall Model:

1. Requirements definition
2. System and software design
3. Implementation and unit testing
4. Integration and system testing
5. Operation and maintenance

The waterfall model is also naive because it is necessary to revisit
earlier phases when problems are found

Identifying all requirements before building is very difficult,
thinking that you are able to is very naive

### Prototypes & Incentive Mismatch

Sometimes developers aren't as worried about cost or change.
They are only concerned with meeting requirements

Prototyping helps stop design mismatch; you can show the client
different scopes so you can see what is necessary

Prototype Fidelity Types (How significant):

- Paper
- Mockup

Types of Prototyping:

- Throwaway
- Evolutionary where you refine the prototype into the final product
- Operational: a combination of throwaway and evolutionary
  - Depends on how the prototype performs

Risks of prototyping:

- Neglecting up-front analysis
- Misunderstanding purpose of prototype
- Accommodating users can lead to "feature creep"
- Extra effort and time is required
- Contractual difficulty (using others' work to demonstrate)

### A/B Testing - Online Controlled Experiments

- An experimental comparison of versions of webpage or app to determine
which is better
  - Objective overall evaluation criterion must be specified
    - e.g. conversion rate, units purchased, revenue, profit, expected lifetime
    value, or a weighted combination of these
- For example, test two different button designs
  - You could evaluate click rate and other statistics

Procedure of A/B Testing:

- Split the users such that they use different possibilities,
e.g. random 50% chance when website is opened
- Collect Data
- Analyze statistics to see which option you prefer

The goal of A/B testing?

- Establish a relationship between updates to your software and user behavior
- Reduce the cost of testing

## More Software Process Models that aren't in use anymore

### Opportunistic Programming

- Programmers "prototype, ideate, and discover"
- Emphasizes speed and ease of development over maintainability and robustness
- Often uses just-in-time learning and solutions
- Choose to adopt existing solutions and adopt them ASAP
- Good for smaller teams and smaller projects

Problems with opportunistic programming

- Hard to maintain
- Reliability & security cannot be ensured
- Rights to intellectual property
- Plagiarism
- Design isn't modular, and everything is often coupled

### Incremental Delivery

- Develop and deliver software in series of increments
- Each increment provides a subset of the overall functionality
- Services are allocated to the increments based on user's priorities/risks
- A conventional process is applied to each increment

Problems with Incremental Delivery

- Falls into the same trap as "Build and Fix"
  - Results in wasted effort
- You might finish something and deliver it,
only to realize you need to change it

Advantages of Incremental Delivery

- You can communicate quickly and effectively with users
- You can focus on changes that are necessary

### Spiral Model

- Starts with planning, requirements, and plans. Then you develop
a plan of operation
- The you prototype and analyze risk
- Plan the development, validate the requirements
- The you prototype and analyze risk
- Integrate and plan testing.
- The you prototype and analyze risk

Pretty much you just prototype and analyze the risk after every
small phase of development

- Best for large projects/teams with lots of risk
- Can be very slow

#### Incremental Commitment of Spiral Model

In this model, you do 1 of 4 things after analyzing risk

- If risk is negligible: move on to next phase
- If risk is acceptable: explore solutions and how to move forward safely
- If risk is high but addressable: regress slightly and address risk before continuing
- If risk is too high and unfixable: regress to previous phase

### Process Improvement

You should strive to continually improve your process throughout development
to be more efficient and make a better product

Metrics to measure Process Quality:

- Efficiency of Development
- Quality of Product
- Etc.

Process Model Capability Maturity Levels (CML)

- 1: Initial
- 2: Managed
- 3: Defined
- 4: Quantitatively Managed
- 5: Optimizing

Starting from level 1, you want to advance at least to level 3
to be a better development team

## Agile Methods (Software Process Models in use today)

Agile Software Development Is...

- A set of software engineering best practices (allowing for rapid
delivery of high quality software)

There is a long history of "Agile" with people continually searching
for efficiency in team development (not just software)

- Scrum Methodology
- Extreme Programming, "XP", embraced change
- Agile manifesto written
- More on that slide with the timeline

In 1990s:

- Object-Oriented Programming replaced procedural programming
- Rise of the Internet emphasized speed-to-market and company growth

### Agile in a nutshell

- A project management approach that seeks to respond to change and unpredictability,

### The Manifesto for Agile Software Development

|value|-|-|
|:-:|:-:|:-:|
|Individuals and interactions|over|processes and tools|
|Working software|over|comprehensive documentation|
|Customer collaboration|over|contract negotiation|
|Responding to change|over|following the plan exactly|

### Programming is 4 activities

- Listening
- Testing
- Coding
- Designing

> "That's all there is to software. Anyone who tells you
different is selling something" - Kent Beck

### Agile Development Loop

1. Adapt/Engineer Requirements
2. Design and Implement
3. Repeat

### Extreme Programming (XP)

- A very influential agile method
  - Developed in the late 1990s
  - Introduced many agile techniques
- XP takes an 'extreme' approach to iterative development
  - New versions may be built several times per day
  - All tests must be run and passed for every build
- Usually used within small teams

XP Principles:

- Rapid feedback
- Assume simplicity
- Incremental change
- Embracing change
- Quality work

The XP Release Cycle

1. Select user stories for this release
1. Break down stories and tasks
1. Plan Release
1. Develop/Integrate/Test software
1. Release
1. Evaluate system
1. Repeat

### XP Practices

- Metaphor: "The system metaphor is a story that everyone can
tell about how the system works"
  - Desktop Metaphor
  - Spreadsheet Metaphor
  - Shopping Cart Metaphor
  - Auction Metaphor
T  - Blackboard Metaphor
  - Just means that everyone understands the purpose through "user stories"

- You use this metaphor to explain to your team what the user wants
- You do this in simple terms so they understand quickly

Example of User Stories:

- Students can purchase monthly parking passes online.
- Parking passes can be paid via credit cards.
- Parking passes can be paid via PayPal
- More features of parking pass purchases

Detailing a User Story:

- An epic is a large story that can be divided into substories
- The stories can be divided into tasks

### Test-Driven Development

- Developers write unit tests before they write the code itself.
  - Tests are run whenever the code is written or changed.
- Customers write functional tests for each iteration
  - at the end of each iteration
- All code must pass all tests before release

Problems with Test-Driven Development

- Difficult to write tests before you program
- Difficult to write tests incrementally
- Difficult to judge what is a pass

### Continuous Integration (CI)

Developers integrate new code frequently

### Refactoring

The design of the system is evolved through transformations of the existing design
that keep all tests passing

Restructuring your programming system to

- Simplify
- Add flexibility
- Remove duplication
- Improve readability

## Coding Standards

Programmers write all code in accordance with rules
emphasizing communication through code

- e.g. GNU Coding Standards

## Pair Programming

- Helpful for solving complex problems
- Very helpful for solving problems in a team-oriented way
- Bugs and errors often get caught immediately

## Collective Ownership of Code

There are risks associated with giving everyone access to the codebase, but
it improves the speed of development

## 40-Hour Week

No one can work a second consecutive week of overtime.
Even isolated overtime used too frequently is a sign
of deeper problems that must be addressed

## On-Site Customers

A customer works with the development team to

- answer questions
- etc.


