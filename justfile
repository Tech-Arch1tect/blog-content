default:
  just --list

build:
  SITE_NAME="tech-architect.co.uk" SITE_DESCRIPTION="A blog about stuff, not necessarily tech, but probably tech." SITE_TAGLINE="Overthinking and Overengineering" GENERATE_SWAGGER=false mantle & \
  docker compose build

build-and-up:
  @just build
  docker compose up

deploy:
  @just build
  docker compose up -d