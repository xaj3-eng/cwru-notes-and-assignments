# Software Engineering - Lecture Notes

> **CSDS 393/493: Software Engineering** | Spring 2026
> Case Western Reserve University
> Instructor: sumon@case.edu | Office: Olin Hall 608 | Office Hours: Monday 2:00-3:00 PM

---

## Table of Contents

1. [Software Process Models](#1-software-process-models)
2. [Software Process Models (cont.)](#2-software-process-models-cont)
3. [Agile Methods](#3-agile-methods)
4. [Agile Practices](#4-agile-practices)
5. [Requirements Engineering](#5-requirements-engineering)
6. [Requirements Engineering (cont.)](#6-requirements-engineering-cont)
7. [Software Inspections and Measurements](#7-software-inspections-and-measurements)
8. [Dimensions of Software Design](#8-dimensions-of-software-design)
9. [Software Design and Architecture](#9-software-design-and-architecture)
10. [Architecture and Microservices](#10-architecture-and-microservices)
11. [Design Patterns and Object-Oriented Design](#11-design-patterns-and-object-oriented-design)
12. [Object-Oriented Design (cont.)](#12-object-oriented-design-cont)
13. [Design Patterns (cont.)](#13-design-patterns-cont)
14. [Design Patterns: Lexi Case Study (cont.)](#14-design-patterns-lexi-case-study-cont)
15. [Software Quality](#15-software-quality)

---

## 1. Software Process Models

### Goals of Software Engineering

To produce, as quickly and inexpensively as possible, software that is:
- Easy to use and satisfies users' needs
- Reliable
- Efficient
- Straightforward to maintain, adapt, and enhance
- Secure

### Aspects of Software Engineering

**Technical aspects:**
- Specification
- Design
- Programming
- Inspection and testing
- Static & dynamic analysis, "Software analytics"
- Debugging
- Maintenance and evolution
- Version control, integration, configuration management, and deployment

**Non-technical aspects:**
- **Project management** -- software is developed by teams
- **Psychology** -- cognitive, behavioral, organizational (e.g., Behavior-Driven Software Design)
- **Law and ethics** -- contracts, liability, intellectual property

### Software Complexity

Examples:
- Mac OS X 10.4: ~84 million SLOC
- Linux kernel: ~10 million SLOC
- Google Suite (Gmail, Drive, Search, etc.): ~2 billion SLOC
- Twitter/X: 10 million SLOC
- Zoom: 60,000 SLOC

A primary issue confronting software engineers is complexity:
- Problem complexity
- Design/implementation complexity
- Platform and environment complexity
- Complexity due to change

> Large software systems are among the most complex artifacts ever produced by humans.

### Consequences of Software Complexity

- Complex systems are difficult and time-consuming to produce and maintain
- They cannot be fully understood by any one person
- They seldom satisfy all user needs and desires, which are highly changeable
- They invariably contain residual defects
- Many projects are completed late and exceed budget
- Some are never completed

### Software Engineering Methodology

- Broad collection of techniques and tools addressing each phase of SDLC
- Continually evolving
- Specialized for particular subfields (e.g., web/mobile, real-time systems, health informatics)
- Some influential methods:
  - Object-oriented programming
  - "Agile" methods
  - Design patterns
  - Test-driven design
  - A/B testing

### Team Expectations

- Team size: 4 members
- Meet initially and then regularly
- Review team policy
- Divide work and integrate
- Establish a process
- Set and document clear responsibilities and expectations

### Project Requirements

Each project should have:
- **Front-end** (e.g., web interface, mobile app)
- **Back-end** (e.g., web server, microservices)
- **Database** (e.g., relational)
- **Features for multiple user groups** (e.g., admins, clients)

---

### The Software Process

> "The set of activities and associated results that produce a software product"

Four fundamental activities common to all software processes:
1. Software specification
2. Software development
3. Software validation
4. Software evolution

**Process descriptions may also include:**
- **Products:** outcomes of a process activity
- **Roles:** responsibilities of the people involved
- **Pre- and post-conditions:** statements true before and after a process activity

### Software Process Model (SDLC)

- Graphical models of the software development process
- Characterize workflow between phases
- Have descriptive and prescriptive uses

### Anti-Model: Build & Fix

The build-and-fix model (from Schach) is considered an anti-model -- how would you improve upon it?

### Waterfall Model

- **Basic Waterfall** is often considered naive/anti-model
- It's often necessary to revisit earlier phases when problems are found
- Must be augmented to reflect iteration and feedback

**Advantages:**
- Disciplined approach to development
- Careful analysis and documentation before coding can prevent costly problems
- Documentation facilitates maintenance and training

**Drawbacks:**
- Difficult to convey dynamic appearance/behavior in a document
- Customers often know what they want only when they see it
- Requirements often change
- Developers understand issues of one phase better during later phases
- Difficult to assess progress until some things are implemented

### Incentive Mismatch

- Requirements can create perverse incentives for clients to avoid rigorous thinking about cost, change, priorities, and risk
- It is inexpensive for clients to generate many requirements
- Developers are rewarded for building to requirements, not refining/removing them
- Schrage argues for quick prototypes based on a few (20-25) requirements

> [1] Schrage, Michael. "Never go to a client meeting without a prototype" IEEE Software 21.2 (2004): 42-45.

### Prototyping

A prototype is an incomplete model of the eventual system:
- Developed rapidly based on initial requirements
- Provided to users for evaluation
- User feedback aids refinement and validation of requirements
- Especially helpful with look-and-feel and user interactions
- Can also validate internal design (e.g., performance, capacity)

**To produce a prototype rapidly:**
- Functionality can be omitted
- Non-functional constraints can be ignored
- Existing components can be reused
- "Rapid development" tools and languages can be exploited

**Prototype fidelity:**
- Classical prototypes have high fidelity (executable, interactive mockups)
- Lower fidelity: paper prototypes, storyboards

**Types of prototyping:**
- **Throwaway:** prototype is not built upon
- **Evolutionary:** prototype is iteratively refined and extended to final system (refactoring necessary)
- **Operational:** combines throwaway and evolutionary for rapid results with stability

**Risks of prototyping:**
- Possible neglect of up-front analysis
- Users may misunderstand purpose of prototype
- Accommodating users may lead to "feature creep"
- Excessive effort may be required
- Possible contractual difficulties

---

## 2. Software Process Models (cont.)

### A/B Testing -- Online Controlled Experiments

- An experimental comparison of versions of a webpage or app to determine which is better
- Objective Overall Evaluation Criterion (OEC) must be specified (e.g., conversion rate, units purchased, revenue)
- Versions assigned at random to different users, persistently
- Users' interactions are monitored and key metrics computed
- Uses techniques for design and analysis of experiments to detect "significant" differences

> "Controlled experiments embody the best scientific design for establishing a causal relationship between changes and their influence on user-observable behavior."

> Kohavi, Ron, and Roger Longbotham. "Online controlled experiments and A/B tests." Encyclopedia of machine learning and data mining (2015).

### Opportunistic Programming

- Programmers "prototype, ideate, and discover"
- Emphasizes speed and ease of development over maintainability and robustness
- Often used when individuals construct a program for their own use
- Involves web foraging and just-in-time learning

**Characteristics:**
- Build from scratch using high-level tools
- Add new functionality via copy-and-paste
- Iterate rapidly
- Consider code impermanent
- Unique debugging challenges

**Issues:**
- Rights to intellectual property
- Plagiarism (not permitted for CSDS 393/493 projects!)
- Reliability, security, maintainability are hard to ensure

### Incremental Delivery

- Developed and delivered in series of increments
- Each increment provides a subset of system functionality
- Services allocated based on customer's priorities and risks
- A conventional process is applied to each increment

**Advantages:**
- Client can exploit product functionality sooner
- Client can adapt to product gradually
- Developer gets earlier feedback than with waterfall
- Requires planning for future enhancements
- Highest priority services get most testing

**Risks:**
- May be difficult to integrate later builds with early ones
- Can degrade into build-and-fix

### Spiral Model (Boehm 1986)

- Assumes risk management is a paramount issue in software development
- Development process represented by a spiral
- Each cycle represents a phase with four parts:
  1. Setting objectives
  2. Risk analysis and mitigation
  3. Development and validation
  4. Planning for next phase

**Best suited to projects with:**
- Large scale
- High risk
- Ample resources and time
- Client and developers within same organization

> Boehm later described it as a risk-based "process model generator" -- other models are special cases.

### Process Improvement

- Understanding existing processes
- Changing these processes to:
  - Increase product quality
  - Reduce costs and development time

**Process metrics:**
- Time taken for process activities (e.g., calendar time, effort)
- Resources required (e.g., total effort in person-days)
- Number of occurrences of particular events (e.g., defects discovered)

---

## 3. Agile Methods

### Agile Software Development

Both:
- A set of software engineering best practices (allowing for rapid delivery of high quality software)
- A business approach (aligning development with customer needs and goals)

**Two major influences in 1990s:**
- Object-oriented programming replaced procedural programming
- Rise of the Internet emphasized speed-to-market and company growth

### Agile in a Nutshell

- A project management approach that seeks to respond to change and unpredictability
- Primarily using incremental, iterative work sequences (often called "sprints")
- A collection of practices to facilitate that approach
- Principles outlined in "The Manifesto for Agile Software Development" (Beck et al., 2001)

> "Listening, Testing, Coding, Designing. That's all there is to software. Anyone who tells you different is selling something." -- Kent Beck

### Extreme Programming (XP)

A very influential agile method (late 1990s) that introduced a range of agile development techniques:
- Takes an "extreme" approach to iterative development
- New versions may be built several times per day
- All tests must run for every build; build only accepted if tests pass

**XP Principles:**
- Rapid feedback
- Assume simplicity
- Incremental change
- Embracing change
- Quality work

**XP Practices:**

| Practice | Description |
|---|---|
| **Metaphor** | A story everyone can tell about how the system works (e.g., Desktop, Shopping Cart, Auction) |
| **Planning Game** | Customers, managers, and developers meet to flesh out, estimate, and prioritize requirements ("user stories" on "story cards") |
| **Simple Design** | Design as simply as possible; remove extra complexity as soon as discovered |
| **Test-Driven Development** | Write unit tests before code; customers write functional tests; all code must pass all tests |
| **Open Workspace** | Collaborative physical workspace |
| **Small Releases** | Initial version into production early; subsequent working versions frequently |
| **Continuous Integration** | Integrate new code frequently; all automated tests must pass or new code is removed |
| **Refactoring** | Restructure to simplify, remove duplication, improve understandability, add flexibility |
| **Coding Standards** | All code written per rules emphasizing communication through code |
| **Pair Programming** | Two programmers work together at one workstation |
| **Collective Ownership** | Code owned by all; anyone may change anything anytime |
| **40-Hour Week** | No consecutive overtime weeks |
| **On-Site Customer** | Customer works with team to answer questions, perform acceptance tests |

### User Stories

Examples:
- Students can purchase monthly parking passes online
- Parking passes can be paid via credit cards / PayPal
- Professors can input student marks
- Students can obtain their current seminar schedule
- Students can order official transcripts
- Students can only enroll in seminars for which they have prerequisites

**Story structure:** Themes > Epics > Stories

### Problems with Test-First Development

- Programmers prefer programming to testing
- Some tests can be very difficult to write incrementally
- Difficult to judge completeness of a set of tests

### Objections Raised to XP

- You need to do all of XP or none at all
- XP is aimed at customers that don't know what they want
- Constant refactoring entails high overhead and tends to introduce bugs
- XP is over-reliant on testing
- Many programmers dislike pair programming
- The on-site customer representative is likely to be inexperienced
- XP makes it hard to develop good early estimates of work effort

---

## 4. Agile Practices

### Scrum

- Based on iterative and incremental development
- Somewhat more conventional than XP
- Projects split into sprints (typically 1-4 weeks)

**Scrum Roles:**

| Role | Responsibilities |
|---|---|
| **Product Owner** | Maximizes product value, manages product backlog, decides when to ship |
| **Development Team** | Creates and delivers product increment; self-organizing and cross-functional |
| **Scrum Master** | Ensures Scrum process is followed, coaches team, removes impediments |

**Scrum Release Planning:**
- Comprehensive product backlog
- Definition of delivery date and functionality
- Mapping of backlog items to product packets
- Appropriate risk controls
- Estimation of release cost
- Verification of management approval and funding

### The Sprint

- Limited to one month
- Consists of: Sprint Planning, Daily Scrums, Development, Sprint Review, Sprint Retrospective
- Has definition of what is to be built, a design, and a flexible implementation plan

**Sprint Planning:**
- Done by entire Scrum team
- At most 8 hours for one sprint
- Input: Product Backlog
- Answers: What can be delivered? How will the work be achieved?
- Produces: Sprint Goal and Sprint Backlog

**Daily Scrum:**
- 15-minute event for Dev Team
- Synchronize activities, create plan for next 24 hours
- Each member explains: what I did yesterday, what I will do today, impediments encountered

**Sprint Review:**
- 4-hour meeting at end of sprint
- Reviews latest increment and adapts Product Backlog
- Attended by Scrum Team and key stakeholders
- Review of timeline, budget, marketplace for next release

**Sprint Retrospective:**
- Inspect the team itself and plan process improvements
- Occurs after Sprint Review and prior to next Sprint Planning
- Key discussion points:
  - What went well
  - What problems were encountered
  - What could be improved
  - What the team will commit to improve

### Scrum Closure Phase

- Occurs when management feels time, competition, requirements, cost, and quality call for a new release
- Tasks include: integration, system test, user documentation, preparation of training and marketing material

### Scaling Agile

**Factors in large systems:**
- Role replication
- Product architects
- Release alignment
- Scrum of Scrums

> Reading: Abrahamsson et al., "New directions on agile methods" (2003); Ambler, "Scaling Agile: An Executive Guide" (2010)

---

## 5. Requirements Engineering

### Environment and the Machine

> Zave & Jackson. "Four dark corners of requirements engineering." ACM TOSEM 6.1 (1997): 1-30.

### Software Requirements

- Properties a software product must exhibit to meet user needs
- Described in a Software Requirements Specification (SRS) document
- Derived and specified collaboratively by "customer" and developers

**Types of requirements:**
- **User requirements:** services the system provides and operational constraints (written for customers)
- **System requirements:** system's functions, services and operational constraints (contract between client and contractor)

### Functional vs. Non-Functional Requirements

**Functional requirements:**
- Services the system should provide
- How the system should react to particular inputs
- How the system should behave
- May state what the system should *not* do

*Example (Word Processor):*
- User can select a region of text and cut (delete) it, copying to clipboard
- User can place insertion point and paste clipboard contents
- Clipboard contents retained until next cut or copy

**Non-functional requirements:**
- Constraints on services or functions (timing, development process, standards)
- Types: usability, reliability, availability, efficiency/performance, security, platform constraints, portability, compliance, certification

**Metrics for specifying non-functional requirements:**

| Property | Measure |
|---|---|
| Speed | Transactions/sec, response time, refresh time |
| Size | Mbytes, number of ROM chips |
| Ease of Use | Training time, number of help frames |
| Reliability | Mean time to failure, probability of unavailability, failure rate |
| Robustness | Time to restart, % events causing failure, probability of data corruption |
| Portability | % target-dependent statements, number of target systems |

### Requirements vs. Design

- Good practice to exclude design/implementation details from SRS
- "Requirements should state *what*, not *how*"
- However, too-abstract requirements may be difficult to understand
- Kovitz: requirements should be based on an architectural design pattern

### Levels of Detail

- **Business requirements:** high-level, directly related to business objectives
- **User requirements:** describe/constrain tasks users need to accomplish
- **Functional/non-functional requirements:** detailed system specifications
- **Software features:** groups of logically related functional requirements

### Requirements Engineering Activities

**Requirements gathering techniques:**
- Interviews (closed and open)
- Ethnography
- Facilitated requirements workshops
- Reverse engineering
- Document analysis
- Customer site visits
- Business process analysis
- Surveys
- Competitive product analysis

### Properties of Good Requirements

- Complete
- Correct
- Feasible
- Understandable
- Unambiguous
- Consistent
- Validateable/testable
- Modifiable
- Traceable

### Requirements Specification Notations

| Notation | Description |
|---|---|
| Natural language | Numbered sentences in natural language |
| Structured natural language | Standard form or template |
| Design description languages | Programming-like language with abstract features |
| Graphical notations | UML use case and sequence diagrams with text annotations |
| Mathematical specifications | Based on finite-state machines, sets, etc. |

### Use Cases

- Set of related usage scenarios for a software system
- Sequence of interactions between system and actor(s)
- Actor may be person, another system, or device
- Represented graphically with use-case diagrams
- Don't contain all necessary information about requirements

---

## 6. Requirements Engineering (cont.)

### Actors and Personas

- **Actor:** an entity that interacts with the system for completing an event (not as broad as stakeholders)
- **Persona:** fictional character representing a user type; useful for thinking of diverse use cases

### Resolving Conflicts

- **Terminology clash:** same concept named differently
- **Designation clash:** same name for different concepts
- **Structure clash:** same concept structured differently
- **Strong conflict:** statements not satisfiable together
- **Weak conflict (divergence):** statements not satisfiable under some boundary condition

**Handling:** Build glossary/domain model for terminology issues; negotiation for conflicts

### Implementation Bias

- Requirements say *what*, not *how*
- Describe what is observable at the environment-machine interface
- Indicative mood describes the environment (as-is)
- Optative mood describes the environment with the machine (to-be)

### Prototypes, Mockups, Stories

- Humans are better at recognizing whether a solution is correct than solving from a blank page
- Mockups/prototypes help explore uncertainty, validate requirements, assert feasibility, get feedback

**User Stories format:**
- Who the players are
- What happens to them
- How it happens through specific episodes
- Why this happens
- What if such and such an event occurs
- What could go wrong

### Use Cases vs. User Stories

- **Scenarios/storyboards:** illustrate typical interaction sequences; cover who, what, how
- **Use cases:** full model (whole-system) or "agile" use case (small, concrete pieces)
- Used at multiple stages: elicitation, documentation, concrete design (UML)

### Requirements Management

- Maintain integrity, accuracy, and currency of requirements throughout project
- SRS should be updated whenever requirements change
- Facilitated by traceability between SRS, design, code

**Activities:**
- Define change-control process
- Establish change control board
- Perform change impact analysis
- Establish baseline and control versions
- Maintain history of changes
- Track status of each requirement
- Measure volatility
- Create traceability matrix

### Requirements Validation

Checking: validity, consistency, completeness, realism, verifiability

**Techniques:** requirements reviews, prototyping, test-case generation

### Graphical Models for Requirements

- Data flow diagrams
- Process flow diagrams
- Object diagrams
- State transition diagrams
- Decision tables and trees
- Feature trees
- Use-case diagrams
- Activity diagrams
- Entity-relationship diagrams

### Risks

- A risk is an uncertain factor that may result in a loss of satisfaction of a corresponding objective
- **Risk = Likelihood x Impact**
- CVSS V2.10: 6 base metrics, 3 temporal metrics, 5 environmental metrics
- Swiss Cheese Model (Reason, 1999)

### Requirements "Bill of Rights" for Customers

1. Expect analysts to speak your language
2. Expect analysts to learn about your business and objectives
3. Expect analysts to structure information into a written SRS
4. Have analysts explain all work products
5. Expect collaborative and professional attitude
6. Have analysts provide ideas and alternatives
7. Describe characteristics for ease and enjoyment of use
8. Be given opportunities to adjust requirements for reuse
9. Receive good faith estimates of costs, impacts, and trade-offs
10. Receive a system that meets functional and quality needs

### Customer "Bill of Responsibilities"

1. Educate analysts about your business and jargon
2. Spend time to provide, clarify, and flesh out requirements
3. Be specific and precise
4. Make timely decisions when requested
5. Respect developer's assessment of cost and feasibility
6. Collaborate on setting priorities
7. Carefully review documents and evaluate prototypes
8. Communicate changes as soon as known
9. Follow the change request process
10. Respect the requirements engineering process

---

## 7. Software Inspections and Measurements

### Software Inspections

- Developers carefully review documents or code to identify errors, ambiguity, violations of standards
- Typically involve a team of developers
- Studies show inspections are very effective; complement testing

**Traditional Inspection Roles:**

| Role | Responsibility |
|---|---|
| Author | Developer responsible for work product |
| Inspectors | Inspect work product |
| Scribe/Recorder | Records issues |
| Moderator | Directs preparation and meeting; reports results |
| Manager | Schedules inspection, assigns team, manages follow-up |

**Inspection meeting rules:**
- Manager is not present
- Inspectors take turns presenting issues
- Inspectors are tactful
- Producer does not defend work
- Problems are not solved at the meeting

**Outline of inspection meeting:**
1. Planning (team assembled, materials distributed)
2. Overview (optional -- author provides background)
3. Preparation (individual review, note potential defects)
4. Inspection Meeting (reader walks through, inspectors raise issues, recorder logs defects)
5. Rework (author addresses issues)
6. Follow-up (moderator verifies changes, determines re-inspection)

### Modern Code Review

- Tool-based, small incremental changes, asynchronous
- Automated checks (static analysis, linters, tests) before human review
- Selective reviewing, metrics tracking, checklist-driven
- Emphasis on knowledge sharing, constructive feedback, continuous process

**Code Review at Google:**
- Original impetus: force developers to write understandable code
- Additional benefits: style/design consistency, adequate tests, security oversight
- Key themes: education, maintaining norms, gatekeeping, accident prevention, tracking history
- Codebase arranged in tree structure with explicit ownership
- Flow: Creating > Previewing > Commenting > Addressing feedback > Approving

### Metrics and Measurements

> "Measurement is the empirical, objective assignment of numbers, according to a rule derived from a model or theory, to attributes of objects or events." -- Craner, Bond

> "A quantitatively expressed reduction of uncertainty based on one or more observations." -- Hubbard

**IEEE 1061:** "A software quality metric is a function whose inputs are software data and whose output is a single numerical value that can be interpreted as the degree to which software possesses a given attribute that affects its quality."

### What Do We Care About?

**Software qualities:** functionality, performance, scalability, installability, security, availability, extensibility, consistency, bugginess, portability, documentation, regulatory compliance

**Process qualities:** development efficiency, meeting efficiency, conformance to processes, reliability of predictions, fairness, regulatory compliance, on-time release

**People qualities:** maintainability, performance, satisfaction, communication, efficiency and flow, ease of use, feature usage

### McNamara Fallacy

1. Measure whatever can be easily measured
2. Disregard that which cannot be measured easily
3. Presume that which cannot be measured easily does not exist or is not important

### Code Complexity Metrics

**Lines of Code (LOC):** easy to measure

**Halstead Volume (1977):** approximates size of elements and vocabulary

**Cyclomatic Complexity (McCabe 1976):**
- Based on control flow graph
- Measures linearly independent paths: `M = E - N + 2P`
  - E = edges, N = nodes, P = connected components

**Object-Oriented Metrics:**
- Number of Methods per Class
- Depth of Inheritance Tree
- Number of Child Classes
- Coupling between Object Classes
- Calls to Methods in Unrelated Classes

### GQM Framework

> "Every measurement action must be motivated by a particular goal or need that is clearly defined and easily understandable."

**Defining goals (PIOV):**
- **P**urpose: improve, evaluate, monitor, ...
- **I**ssue: reliability, usability, effectiveness, ...
- **O**bject: final product, component, process, activity
- **V**iewpoint: any stakeholder

### Case Study: Autonomous Vehicle Software Metrics

1. **Code Coverage:** amount of code executed during testing (statement, line, branch coverage)
2. **Model Accuracy:** train ML models on labeled data, compute accuracy on separate test set
3. **Failure Rate:** frequency of crashes/fatalities per 1,000 rides, per million miles, etc.
4. **Mileage:** total miles driven

### Pitfalls in Measurement

**The Streetlight Effect:** people tend to look only where it's easiest to do so

**Making inferences -- to infer causation:**
- Provide a theory (independent of data)
- Show correlation
- Demonstrate ability to predict new cases

**Confounding variables:** correlation does not imply causation (e.g., coffee/cancer/smoking)

**Goodhart's Law:** "When a measure becomes a target, it ceases to be a good measure."

**Productivity metrics (problematic):**
- Lines of code per day (industry average 10-50)
- Function/object/application points per month
- Bugs fixed, milestones reached

---

## 8. Dimensions of Software Design

### What is Design?

- **(Verb)** A process for planning how a product will work before implementation
- **(Noun)** The result of a design activity (documents, sketches, diagrams)

### Software Design

- Activities between requirements specification and coding
- Deciding on high-level structure and dynamics of solution
- Documenting in a design document
- Distinction from implementation is not always clear-cut

### Design as Problem Solving

- Often very complex (hundreds or thousands of design decisions)
- Creative process depending on knowledge, experience, imagination
- A strategy is needed for coping with complexity

### Divide-and-Conquer

- Most important problem-solving strategy
- Design problem is decomposed into simpler subproblems
- Subproblems can be worked on independently
- Specification/design of components can be deferred
- Applied recursively for complex subproblems
- Other names: functional decomposition, top-down design, stepwise refinement

**Prioritizing subproblems:** first attack those with greatest perceived risks

### Generate-Communicate-Evaluate (GCE) Paradigm

Designers:
1. **Generate** -- brainstorm and explore a space of candidate design solutions
2. **Communicate** -- share designs through sketches, documentation, prototyping
3. **Evaluate** -- assess quality attributes, identify possible flaws

> Design is never "finished"; it's a continuous, iterative process!

### Dimensions of Design

- Problem solving
- Modeling
- Specification
- Organizing the solution
- Communicating the solution
- Economics and reuse
- Maintenance and evolution

### Procedural Design

- Popular before GUIs and OOP
- Design as set of procedures composed sequentially, conditionally, iteratively, hierarchically
- Many design problems are amenable to procedural solutions

### Event-Driven Design

- Flow of execution determined by events (user actions, sensor outputs, messages)
- System waits for events and reacts via event-handling procedures
- Three key components: event producers, event router, event consumers

### Object-Oriented Design (OOD)

- Organizing a design around objects in a system
- An object has **state** (attribute values) and **behavior** (methods)
- **Class:** declaration that permits creation of objects with same attributes and operations
- **OOA (Object-Oriented Analysis):** initial phase identifying classes of real-world objects

### Discovering Issues Early in Design

> Finding defects early is cheaper -- US National Institute of Standards and Technology (NIST)

### Considering Alternative Designs

- Usually more than one way to solve a design problem
- Sometimes a "standard" architecture is available
- Otherwise, explore alternatives and identify best
- Discuss through use cases, identify advantages/disadvantages
- If no clearly superior choice emerges, prototype leading candidates

### Communicating the Design

- Communication between designers is critical
- Designers use: sketches, documentation, abstractions, presentations
- Major design decisions explained and justified
- Design document should be concise yet understandable, specific enough for implementation

---

## 9. Software Design and Architecture

### Design Quality

- Choose quality factors to compare alternative designs
- Quality metrics measure quality factors
- Identified during requirements analysis and specification

**10 Qualities of UI Design (Nielsen):**
1. Visibility of system status
2. Match between system and real world
3. User control and freedom
4. Consistency and standards
5. Error prevention
6. Recognition rather than recall
7. Flexibility and efficiency of use
8. Aesthetic and minimalist design
9. Help users recognize, diagnose, and recover from errors
10. Help and documentation

### Modularization

- Module = co-located components (subprograms or classes)
- Has interface (API) and implementation
- Can be compiled separately
- Well-conceived modules can often be reused

### Coupling and Cohesion

- **Coupling:** tendency for changes to one module to entail changes to another (want *low*)
- **Cohesion:** degree of functional relatedness of module's elements (want *high*)

### Encapsulation and Information Hiding

- A well-designed module encapsulates one or more design decisions
- Data items bundled with operations that access them
- Client code uses module only via its interface
- Avoids unnecessary coupling

### Design Documents

- Provide essential guidance to implementers, testers, maintainers
- Concise yet understandable
- Prose augmented with diagrams
- Specific enough for programmers to implement intent

**Design Documents at Google:**
- Code review before there is code (collaborative via Google Docs)
- Cover: goals and use cases, implementation ideas (not too specific), key design decisions with trade-offs

### Common Views in Documenting Abstractions

- **Static View:** modules, subsystems, structures and their relations
- **Dynamic View:** components (processes) and connectors (messages, data flow)
- **Physical View (Deployment):** hardware structures and connections

### Case Study: Apollo Autonomous Vehicle

- Software architecture, hardware architecture, ML models
- Source: https://github.com/ApolloAuto/apollo

### Notations for Design Abstractions

1. **Component diagrams:** major components and communication
2. **Data models:** types of data and relationships
3. **Sequence diagrams:** how actors collaborate for functionality
4. **State machines:** states and events causing changes

### Data Models

**Building blocks:**
- Data type: collection of data elements/objects
- Relation: directed relation between data types (property, containment, association, naming)
- Multiplicity constraints: how many instances can be related (1..1, 1..*, etc.)

### Software Architecture

> "The structure or structures of the system, which comprise software elements, the externally visible properties of those elements, and the relationships among them." -- Bass et al. 2003

> Every software system has an architecture -- whether you know it or not, like it or not, or have documented it or not.

### Software Design vs. Architecture

| Design Questions | Architectural Questions |
|---|---|
| How do I add a menu item? | How to support custom themes? |
| How can I make it easy to create posts? | How to extend with a plugin? |
| What lock protects this data? | What threads exist and how do they coordinate? |
| How does Google rank pages? | How does Google scale to billions of hits/day? |
| What encoder for secure communication? | Where should I put firewalls? |
| Interface between objects? | Interface between subsystems? |

### Architectural Styles

- Pipe and filter
- Call-return
- Publish-subscribe
- Layered
- Services

### Case Study: Google File System

Qualities: Scalability, Reliability, Performance, Cost

> Ghemawat, Gobioff, and Leung. "The Google file system." SIGOPS OSR 37.5 (2003): 29-43.

---

## 10. Architecture and Microservices

### Common Software Architectures

- **Pipes and Filters** (e.g., compilers)
- **Event-Driven Architecture**
- **Blackboard Architecture** (e.g., tldraw)
- **Layered Systems** (e.g., Internet Protocol Suite)

### Monolithic vs. Modular Architecture

**Monoliths are the "default":** Git CLI, calculator app, PDF reader, mobile weather app, stock exchange

**Modularity comes in many ways:**
- **Plug-in architectures:** distinct code repositories, linked-in to monolithic runtime (e.g., Linux kernel modules, WordPress themes, IDE language packs)
- **Service-oriented architectures:** distinct processes communicating via messages (e.g., web browsers)
- **Distributed microservices:** independent autonomous services via web APIs

### Case Study: Web Browsers

- Multi-threaded browser in single process
- Multi-process browser with IPC
- Service-based browser architecture
- Site isolation

### Microservices

> "Small autonomous services that work well together" -- Sam Newman

- Building applications as a suite of small, easy-to-replace services
- Fine grained (one functionality per service, sometimes 3-5 classes)
- Composable, easy to develop/test/understand
- Fast restart, fault isolation
- Modeled around business domain
- No commitment to single technology stack
- Easily deployable and replicable

**Example -- Netflix microservices:** user subscriptions, banner ad, popular shows, trending now, continue watching, my list, notifications, show info, trailers metadata, episodes metadata, video content

**Technical considerations:**
- HTTP/REST/JSON communication
- Independent development and deployment
- Self-contained services (each with own database)
- Multiple instances behind load-balancer

### Scalability

Microservices allow independent scaling of individual services.

### Conway's Law

> "Any organization that designs a system will produce a design whose structure is a copy of the organization's communication structure."

### Advantages of Microservices

- Better alignment with the organization
- Ship features faster and safer
- Scalability
- Target security concerns
- Interplay of different systems and languages
- Easily deployable and replicable
- Embrace uncertainty, automation, and faults

### Drawbacks of Microservices

- Complexities of distributed systems (network latency, faults, inconsistencies, testing challenges)
- Resource overhead, RPCs
- Shifting complexities to the network
- Operational complexity
- HTTP/REST/JSON communication overhead

**Microservice prerequisites:** rapid provisioning, basic monitoring, rapid application deployment

> "If you can't build a well-structured monolith, what makes you think microservices is the answer?" -- Simon Brown

---

## 11. Design Patterns and Object-Oriented Design

### Introduction to Design Patterns

- Expert OO designers reuse solutions that have worked in the past
- A design pattern systematically names, explains, and evaluates an important recurring design
- Facilitates documentation and maintenance

**Origin:** Christopher Alexander's *A Pattern Language: Towns, Buildings, Construction*

> "Each pattern describes a problem which occurs over and over again in our environment, and then describes the core of the solution to that problem, in such a way that you can use this solution a million times over, without ever doing it the same way twice."

### Four Essential Elements of a Design Pattern

1. **Pattern name** -- allows reasoning and communication at higher abstraction
2. **Problem** -- describes when to apply the pattern
3. **Solution** -- elements, relationships, responsibilities, collaborations
4. **Consequences** -- results and trade-offs of applying the pattern

### Design Pattern Categories

| Category | Focus |
|---|---|
| **Creational** | Class instantiation |
| **Structural** | Class and object composition |
| **Behavioral** | Object communication |

### Example: Model/View/Controller (MVC)

- **Model:** main application object; manages data
- **View:** screen presentation of Model; receives user input
- **Controller:** intermediary between Views and Model
  - Communicates changes in Model data to Views
  - Communicates user input to Model

**Benefits:**
- Views may be decoupled from Model via subscribe/notify protocol
- New views can be created without altering the Model
- Can change how a view responds to input without changing visual presentation
- Controller can be replaced even at runtime

### Characteristics of OOD/OOP

Three main characteristics:
1. **Encapsulation** -- design for change; encapsulate what varies; interfaces shield clients
2. **Inheritance** -- class B inherits interface/implementation from class A
3. **Polymorphism** -- same code works with objects implementing interface differently

### Inheritance

- Subclass (derived) inherits from superclass (base)
- Transitive: if C extends B extends A, then C is a subclass of A
- Subclass can augment or override parent's methods
- Corresponds to the "is-a" relationship

**Uses:** class extension, classification, reuse (of implementation and interfaces), enabling polymorphism

**Misuse:** when inheritance provides partial implementation; derived class inherits spurious attributes/operations. Avoided by checking if "is-a" holds.

**Multiple inheritance:** can cause name conflicts and ambiguity due to multiple paths. Languages like Java and C# use interface types instead.

### Interfaces and Types

- Interface = set of operation signatures
- Type = named interface
- One object may have multiple types
- Subtype T contains the operations of supertype T'

### Abstract Base Classes

- Defer some or all implementation to subclasses
- Declare abstract operations (no implementation)
- A *pure* abstract base class has only abstract operations

### Module Complexity (Ousterhout)

**Three manifestations:**
1. **Change amplification:** simple change requires modifications in many places
2. **Cognitive load:** developer needs to know a lot to complete a task
3. **Unknown unknowns:** unclear what to do or whether a solution will work

**Two causes:** dependencies between components, and obscurity

### Deep vs. Shallow Classes

- **Deep modules:** powerful functionality, simple interfaces ("pull complexity downwards")
- **Shallow modules:** complex interface, not much functionality
- Avoid "pass-through" variables and methods

---

## 12. Object-Oriented Design (cont.)

### Interface Inheritance vs. Implementation Inheritance

- **Implementation inheritance:** subclass reuses parent's code and representation (breaks encapsulation)
- **Interface inheritance (subtyping):** one type can be used in place of another; class implementation is not inherited

### Fragile Base Class Problem

- Seemingly safe change to a base class can cause derived class to fail
- Not possible to determine if base class is safe by examining methods alone

### Object Composition

- Alternative to implementation inheritance
- Implement functionality by assembling/composing other objects
- "Has-a" relationship
- **Black-box reuse:** does not break encapsulation, less coupling than inheritance

### Programming to an Interface

> "Program to an interface, not an implementation." -- Gamma et al.

- Variables should not be declared of particular concrete classes
- Objects manipulated solely via supported interfaces
- Clients remain unaware of specific types and implementing classes

### Delegation Design Pattern

- Object delegates a request to its delegate (held by reference)
- Analogous to subclass deferring to parent
- Easy to compose/change behaviors at runtime

### Polymorphism

**Types:**
- **Subtype (Runtime):** object and operation found at runtime via dynamic binding
- **Compile-Time:** method overloading, templates/generics
- **Parametric (Generics):** types whose definitions take other types as parameters

**Advantages:**
- Simplifies client definitions
- Reduces coupling
- Allows runtime variation of relationships
- Permits existing code to work with new classes

### The Refinement Phase of OOD

Activities:
- Analyzing and improving inheritance hierarchies
- Analyzing patterns of collaboration to identify subsystems
- Designing methods

**Guidelines for inheritance hierarchies:**
- Create "is-a" hierarchies
- Factor common responsibilities as high as possible
- Eliminate classes that don't add functionality
- Verify derived classes support at least parent responsibilities

### Identifying Subsystems

- A subsystem is a group of classes collaborating to support a set of interfaces
- Often corresponds to strongly coupled classes in a collaboration graph
- Like a class, fulfills a set of responsibilities partitioned into interfaces/contracts

**Simplifying interactions:**
- Minimize collaborations between classes/subsystems
- Centralize communications via a **Facade class**

### Design Patterns: Facade, Strategy, Observer

**Facade:** centralizes communication into a subsystem through one principal intermediary

**Strategy:** encapsulates an algorithm as an object (e.g., View-Controller relationship)

**Observer:** decouples objects so changes to one affect others without requiring knowledge of details (MVC is an example)

---

## 13. Design Patterns (cont.)

### Cross-Cutting Concerns

- Separation of concerns: each module should address a different concern
- Cross-cutting concerns affect multiple modules, causing scattering (duplication) and tangling (high coupling)

### Aspect-Oriented Programming (AOP)

- Supports separation of cross-cutting concerns
- Adds behavior (**advice**) to existing code without changing it
- **Join points:** places where advice is applied
- **Pointcut specification:** indicates join points
- Types of advice: Before, After, Around

### Memento Pattern (Behavioral)

- Encapsulate and save internal state of an object so it can be restored
- **Originator:** object with internal state
- **Caretaker:** knows when to save/restore
- **Memento:** the lock box written/read by Originator, shepherded by Caretaker

### Case Study: Lexi Document Editor

A WYSIWYG document editor incorporating eight design patterns:

**Design Issues:**
- Document representation
- Formatting
- Embellishing the UI
- Supporting multiple look-and-feel standards
- Supporting multiple window systems
- Invoking user operations, undo-redo
- Spelling checking and hyphenation

**Document Structure:**
- Recursive composition: building complex elements out of simpler ones
- **Glyph:** abstract class for all document elements (primitive and structural)
- Responsibilities: draw itself, know its space, know its children/parent

**Patterns Used:**

| # | Pattern | Purpose |
|---|---|---|
| 1 | **Composite** | Represent the document's structure |
| 2 | **Strategy** | Support different formatting algorithms |
| 3 | **Decorator** | UI embellishment (borders, scroll bars) |
| 4 | **Abstract Factory** | Support different look-and-feel standards |
| 5 | **Bridge** | Support multiple windowing systems |
| 6 | **Command** | Support undo/redo of user operations |
| 7 | **Iterator** | Traverse object structures |
| 8 | **Visitor** | Support multiple analyses |

### Decorator Pattern (Structural)

- Adds responsibilities to an object dynamically
- MonoGlyph: abstract class for embellishments
- Stores reference to component, forwards requests, subclasses augment behavior

### Abstract Factory Pattern

- Abstracts the process of object creation
- `guiFactory->CreateScrollBar()` instead of `new MacScrollBar()`
- Concrete factory for each look-and-feel standard

---

## 14. Design Patterns: Lexi Case Study (cont.)

### Bridge Pattern

- Separates abstract class hierarchy from implementation
- Two can vary independently
- Example: Window and WindowImp classes

### Command Pattern (Behavioral)

- Encapsulates a request as an object
- Parameterize menu items by the request they indicate
- Supports undo/redo via `Execute()` and `Unexecute()` operations
- Command history enables arbitrary undo/redo depth

### Iterator Pattern

- Provides general interface for access and traversal
- Iterator created by collection: `g->CreateIterator()`
- Supports preorder, inorder, postorder traversals
- Separates traversal mechanism from data structure

### Visitor Pattern

- Allows adding operations without changing the class hierarchy
- Concrete visitors perform specific analyses (spelling, hyphenation)
- `Accept(Visitor*)` replaces type-specific operations
- Best when class structure is stable

### Adapter Pattern

- Convert interface of a class into another interface clients expect
- Wrap an existing class with a new interface
- Impedance match old component to new system

### Proxy Pattern

- Provide a surrogate or placeholder for another object to control access
- Modify behavior for some clients without changing interface
- **Remote proxy:** local representative for object in different address space

---

## 15. Software Quality

### Quality Motivation

- **External (Customer-Facing):** programs should "do the right thing" so customers buy them
- **Internal (Developer-Facing):** programs should be readable, maintainable

**Ensuring internal quality (maintainability):**
- Human code review
- Static analysis tools and linters
- Using programming idioms and design patterns
- Following local coding standards

**External quality:**
- Behave according to specification
- Don't do bad things (security, crashing)
- Robustness against maintenance mistakes

### The Halting Problem and Correctness

- We can't write a program X that always tells us if software Y is correct
- But we can approximate: type systems, linters, static analyzers

### Software Errors

Functional errors, load errors, performance errors, design defects, deadlock, race conditions, boundary errors, buffer overflow, hardware errors, state management errors, integration errors, versioning/configuration errors, metadata errors, usability errors, error-handling errors, robustness errors, UI errors, API usage errors...

### Software Analysis

> The systematic examination of a software artifact to determine its properties.

- **Functional:** code correctness
- **Non-functional:** safety, maintainability, security, reliability
- **Artifacts:** code, system, module, execution trace, test case, design/requirements document
- **Automated:** regression testing, static analysis, dynamic analysis
- **Manual:** manual testing, inspection, modeling

---

*Further Readings:*
- Sommerville, *Software Engineering* (latest edition)
- Gamma et al., *Design Patterns*
- Ousterhout, *A Philosophy of Software Design*
- Bass, Clements, and Kazman, *Software Architecture in Practice*
- Fairbanks, *Just Enough Software Architecture*
- Kohavi and Longbotham, "Online controlled experiments and A/B tests"
- Sadowski et al., "Modern code review: a case study at Google"
