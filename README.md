# Minimal setup to test mdbook kroki-preprocessor

I'm experiencing a problem with the (mdbook kroki-preprocessor)[
https://github.com/JoelCourtney/mdbook-kroki-preprocessor]. This allows you to use Mermaid or PlantUML 'documentation as code' or 'diagrams as text' within mdbook, a static website generator.

I get a vague error:

```console
HTTP status client error (400 Bad Request) for url (https://kroki.io/)
```

on running `mdbook build`.

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

In order to stably reproduce I have a multi-stage Docker file which builds the book in a build container, and then hosts the content in an NGINX container.

Make sure you have DOcker installed it, for instance using [Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/) or macOS and then:

```console
docker build -t mdbook-kroki-test .
docker run --name mdbook-kroki-test -d -p 8082:80 mdbook-kroki-test

# We named the image and container `mdbook-kroki-test` above because this makes it easier to re-run the app after changing/fixing something
# To rerun requires you have to stop and remove the container first. And a name is shorter than looking up random names or hashes Docker creates. 
# docker stop mdbook-kroki-test
# docker rm mdbook-kroki-test
```
