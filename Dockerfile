FROM node:22-alpine AS builder

RUN apk add --no-cache git
RUN npm install -g pnpm

ARG BRANCH=main 

WORKDIR /app

RUN git clone https://github.com/Tech-Arch1tect/crust.git . && git checkout $BRANCH

ENV VITE_API_BASE_PATH=${VITE_API_BASE_PATH}

RUN pnpm install --frozen-lockfile
RUN pnpm run build

FROM node:22-alpine AS runner

RUN npm install -g pnpm

WORKDIR /app

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/pnpm-lock.yaml ./

RUN pnpm install --prod --frozen-lockfile && pnpm store prune

COPY --from=builder /app/build ./build
COPY --from=builder /app/package.json ./package.json

RUN addgroup -g 1001 -S nodejs
RUN adduser -S crust -u 1001
USER crust

EXPOSE 3000

ENV NODE_ENV=production
ENV PORT=3000

CMD ["node", "./build/index.js"]