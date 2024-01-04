# Build Phase notice as builder on the nxt line
# creating a multi phase containter
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# 2nd Run Phase feeding output of build phase 
# to Run Phase
From nginx

copy --from=builder /app/build /usr/share/nginx/html

