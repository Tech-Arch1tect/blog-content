---
title: "The importance of API contracts"
author: "Tech Arch1tect"
date: "2026-02-16"
tags: ["development"]
category: "tech/development"
excerpt: "What is an API contract, and why should I have one?"
---

## What is an API contract?

To put it simply, an API contract is a way of formalising how an API is to be communicated with. There are many ways to do this, from something as simple as a markdown document to something as detailed as an OpenAPI specification.

An API contract may include data such as:

- API endpoints
- Parameters that the API consumes
- Response formats
- Response status codes and their meaning
- Available authentication methods and how they are used (cookies, API keys, etc)

## Uses

Traditionally, an API contract is used as reference for developers / teams when integrating an API with their software stack. However, mixed with modern tooling, some forms of API contracts (like OpenAPI specs) can be used to generate API clients. This use case has some pitfalls, like limitations of the generator, but can reduce boilerplate and most importantly, when used with typed languages, can enforce the API contract within your application.

## Pitfalls

### Spec support / client generators

The pitfalls that I have experienced when implementing API contracts are mainly around what the specification allows and the maturity of the ecosystem. 

For example, OpenAPI specs are designed for traditional REST APIs and have no support for real time communication protocols like websockets. Yet on the other side of the coin, AsyncAPI specs support these real time communication protocols but don't have the maturity of the OpenAPI spec ecosystem. There are very few AsyncAPI client generators available, whereas OpenAPI specs have many (for example, [Orval](https://orval.dev/) which I use in one of my projects, or [OpenAPI Generator](https://openapi-generator.tech/) which I have used in many projects).

This has resulted in some of my projects being rather awkward to work with. For example, one project has its entire REST API documented with OpenAPI, yet this application makes heavy use of websockets - so all websocket communication lacks the benefits from the API contract. I've worked around this partially by defining my types that are used in the websocket communication within the OpenAPI document; this results in auto-generated types but a manual API client.

### Spec support / spec generators

On a similar note, ecosystem maturity can also affect your choice of API contract in terms of contract generation. For example, there are many OpenAPI-compatible libraries which allow you to programmatically create your OpenAPI specification directly within your code base. This has a huge advantage of being able to reference your real server-side types directly in your document. This completely avoids API contract drift as your contract always has your real types. Yet if you compare AsyncAPI and its relative immaturity, there are much fewer libraries supporting this - and depending on the language you are writing in there may be none at all.

## If there are so many pitfalls, why bother at all?

In my experience using an API contract like OpenAPI along with server-side libraries to generate the document and client-side tooling to generate an API client has allowed me to think less about what the server expects and responds. The upfront effort for setting up the API contract has been worth it for any medium to large scale projects due to it freeing up space in my thoughts and thus reducing mental load during development, even if it's not a perfect solution.

Most of my projects are solo so I haven't experienced the team benefits first-hand, but an API contract can be incredibly valuable when working with teams where each team has a different domain - reducing complexity of understanding how to use an API that another team has built.
