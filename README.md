# Minimal setup to test mdbook kroki-preprocessor

I'm experiencing a problem with the (mdbook kroki-preprocessor)[
https://github.com/JoelCourtney/mdbook-kroki-preprocessor]. This allows you to use Mermaid or PlantUML 'documentation as code' or 'diagrams as text' within mdbook, a static website generator.

I get a vague error on running mdbook-build.

```markdown
# Les 2 - ORM (EF core)

<kroki type="erd">
  [Student]
  *Naam
  +Student nummer

</kroki>
```

The error goes away, and the book compiles correct when I remove a space in the `student number` field and change it to: `student_number` for instance.

```markdown
# Les 2 - ORM (EF core)

<kroki type="erd">
  [Student]
  *Naam
  +Student_nummer

</kroki>
```

## Full Stack trace

```console
mdbook-kroki-test % mdbook build
2024-09-22 07:23:45 [INFO] (mdbook::book): Book building has started
HTTP status client error (400 Bad Request) for url (https://kroki.io/)

2024-09-22 07:23:45 [ERROR] (mdbook::utils): Error: The "kroki-preprocessor" preprocessor exited unsuccessfully with exit status: 1 status
mdbook-kroki-test % 
```