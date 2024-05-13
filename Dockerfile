# Stage 1: Install dependencies
FROM node:14 AS builder

WORKDIR /app

COPY package*.json ./

COPY . .

RUN npm install

# Stage 2: Create a lightweight production image
FROM node:14-alpine

WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000

CMD ["npm", "start"]

