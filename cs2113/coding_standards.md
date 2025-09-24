# Java Coding Standard Summary for Your SE Projects

## 1. Naming Conventions

Packages: all lowercase, use your project/group name as root (e.g. todobuddy.ui)

Classes & Enums: PascalCase, nouns (e.g. AudioSystem)

Variables: camelCase, descriptive (e.g. audioSystem)

Constants: SCREAMING_SNAKE_CASE (e.g. MAX_ITERATIONS)

Methods: camelCase, verbs (e.g. getName(), computeTotalWidth())

Boolean variables/methods: use prefixes like is, has, can (e.g. isOpen, hasData)

Collections: plural names (e.g. points, values)

Iterators: i, j, k only for loops, especially nested

## 2. Layout and Formatting

Indentation: 4 spaces (no tabs)

Line length: Soft limit 110 chars, hard limit 120 chars; wrap long lines with additional 8 spaces indentation

Braces: K&R / Egyptian style (brace on same line)

Method declaration:

public void someMethod() throws Exception {
    ...
}

Control structures: braces required even for single statements (e.g., if, for, while)

Switch: no indentation for case labels, include explicit // Fallthrough comment when needed

## 3. Statements and Imports

Every class must be in a package

Explicit imports only (no wildcard imports like import java.util.*;)

Array declaration: attach [] to the type, not the variable (e.g., int[] a, not int a[])

Always wrap loop and conditional bodies in braces, even if single statement

## 4. Comments

Write all comments in English, consistent spelling (American or British)

Use Javadoc format for methods and classes:

/**
 * Returns the lateral location of the specified position.
 *
 * @param x X coordinate
 * @param y Y coordinate
 * @return Lateral location
 * @throws IllegalArgumentException if zone <= 0
 */

Comments should be indented to match code block level

Trailing comments allowed (e.g., process('ABC'); // process dummy string)

Use @inheritDoc when overriding methods if applicable

## 5. Best Practices

Avoid magic literals (use named constants instead)

Follow the KISS principle — prefer simpler solutions over clever ones

Use guard clauses to highlight the "happy path" in methods

Follow SLAP — Single Level of Abstraction Principle

Avoid empty catch blocks (always handle exceptions properly)

Include a default case in switch statements

Use whitespace to clarify logical structure (space around operators, blank lines between blocks)

Prioritize readability over premature optimization, but keep efficiency in mind

Use meaningful, consistent variable names — even loop variables like i should be limited to loops

## 6. General Reminders

Consistency matters — the whole codebase should look like it’s written by one person (coding standard enforced team-wide)

Use tools like linters and IDE formatters to automatically enforce rules where possible
