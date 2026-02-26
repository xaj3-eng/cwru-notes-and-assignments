# Design Patterns

## Object-Oriented Programming

- Inheritance
- Composition

### Polymorphism

#### Subtype Polymorphism (Runtime Polymorphism)

- The object and operation used to respond to a request may be found at runtime.
- This is called dynamic binding

#### Compile-Time Polymorphism

- Essentially just method overloading, like

```java
class Math {
  int add(int a, int b) {
    return a + b;
  }

  int add(int a, int b, int c) {
    return a + b + c;
  }
}
```

#### Parameterized Types

- Generic functions or data structures
