# FROM node:18-alpine

# WORKDIR /app

# COPY package.json package-lock.json ./

# RUN npm install

# COPY . .

# RUN npm run build

# EXPOSE 3000

# CMD ["npm", "run", "dev"]

FROM node:18-alpine as build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .

RUN npm run build

FROM node:18-alpine

WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

CMD ["npm", "run", "dev"]
