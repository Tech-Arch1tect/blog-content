---
title: "Mantle"
author: "Tech Arch1tect"
date: "2025-06-15"
tags: ["releases", "mantle", "go", "crust"]
category: "tech/mantle"
excerpt: "What is Mantle? What is Crust? Why do they exist?"
---

# Mantle

Mantle is a static API generator designed to turn markdown content into a static API. It does this by generating static json files and serving them using Nginx mapping's to provide the illusion of a dynamic API.

At the time of writing Mantle is the software which generates the static 'API' and `Crust` is the frontend web app which ingests the static 'API'.

## Features

- Parse Markdown with YAML frontmatter
- Generate JSON endpoints from content
- Simple

## Why?

Mantle is inspired by static site generators. Generally speaking a static site generator would be better for a blog use-case than an API + JS frontend. The main reason for this is SEO.

So why does Mantle exist if this is the case? Well, I've had many blogs before. some powered by Wordpress.org, some by static site generators like Hugo. But I wanted something my own. I've been broadening my frontend skill set over the last ~12 months, writing something like a static site generator using Go's `html/template` didn't seem interesting to me at the time of writing. I found my self wanting to try new (to me) frontend frameworks. To try these, I needed an 'api' to ingest.

And thus, Mantle was born.

## How are you tackling the SEO issue?

SSR. That pretty much sums it up. Currently the frontend ('Crust') is built with SvelteKit. SvelteKit makes it easy to implement SSR, but this is not unique to this framework.

Although it is not implemented currently, SSR will allow me to build frontends for the generated API which generate SEO friendly content like meta tags within the served content.

Does this defeat the objective of the static api? Sure. As the name implies, SSR (Server Side Rendering) requires software running on the server and thus cannot be used with static content hosting like Github Pages.

## Mantle/Crust vs Generic Static Site Generators

Cons:

- (Crust) Cannot be used on static hosting like Github Pages
- (Crust) Is **not** static content
- (Mantle) Cannot be served from static hosting like Github Pages as it requires custom web server configurations to provide the illusion of a dynamic 'API'
- Bad for SEO unless SSR or similar is used

Pros:

- It has been fun to write!
- No seriously that's about it :)
