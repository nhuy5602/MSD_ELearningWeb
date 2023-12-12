FROM node:latest

WORKDIR /app

COPY package*.json ./

RUN npm install -g npm@10.2.5

RUN npm install -f

COPY . .

RUN npm install prisma@5.7.0 -D --legacy-peer-deps  # Force legacy peer dependencies resolution for Prisma

RUN npx prisma generate 

RUN npx prisma db push

EXPOSE 3000

CMD ["npm", "run", "dev"]
