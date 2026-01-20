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
