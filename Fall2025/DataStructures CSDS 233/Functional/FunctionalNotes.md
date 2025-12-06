# Functional Classes in Java
## Functional Interfaces
When you add @FunctionalInterface before an interface that means you can define an anonymous class from a lambda

(The interface can only contain one abstract method which makes sense)
(They can also contain default methods that call the abstract method which is cool)

So if I say:

```Java
@FunctionalInterface
public interface 2IntToString {
  String apply(int int1, int int2);
}
```

That means I can write a function that takes a 2IntToString implementing class, and then pass in a lambda:

```java
String function(2IntToString f) {
  return f.apply(1,2);
}

void main(...) {
  System.out.println(
    function(
      (int x, int y) -> "(" + x + "," + y + ")";
    )
  )
}
```

## Function<T, R>

This is a functional interface with a method 'apply' that:
- Takes a single input parameter of type T
- Returns a result value of type R

## Consumer<T>

Functional interface with a method 'accept' that:
- Takes a single input of type T
- Returns nothing (void)

## Supplier<R>

Functional interface with a method 'get' that:
- Returns a value of type R
- Takes no inputs

## Predicate<T>

Functional interface with method 'test':
- Takes a single input of type T
- Returns a boolean

## Runnable

Functional interface with method 'run'

- Takes no arguments and returns void
