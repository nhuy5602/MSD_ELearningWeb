
### Install packages

```shell
npm i
```

### Setup .env file


```js
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_ZW5nYWdpbmctZ3JhY2tsZS0zOS5jbGVyay5hY2NvdW50cy5kZXYk
CLERK_SECRET_KEY=sk_test_HhhEbdqlI20HMeYaYrnImxySAi7pFSnoP4BlRMOCHJ
NEXT_PUBLIC_CLERK_SIGN_IN_URL=/sign-in
NEXT_PUBLIC_CLERK_SIGN_UP_URL=/sign-up
NEXT_PUBLIC_CLERK_AFTER_SIGN_IN_URL=/
NEXT_PUBLIC_CLERK_AFTER_SIGN_UP_URL=/

DATABASE_URL='mysql://1quyt4mm7au0sax7ol67:pscale_pw_qZ9X7Q9lm4ssENtAxHg5xHfUWHB2uNYCoeA3qtZmU15@aws.connect.psdb.cloud/msd_db?sslaccept=strict'
#DATABASE_URL=mysql://root:huyhuy02@localhost:3306/ms_project


UPLOADTHING_SECRET=sk_live_fde1381aad9315c3e1d7631e44a1243050f14a872587534a62bfdba7df52cddd
UPLOADTHING_APP_ID=xmqdgfzr5g

MUX_TOKEN_ID=89f225cd-aab5-43a9-affc-9227e34cde31
MUX_TOKEN_SECRET=ES76RweWAyVKqZKSRQPimt7Zzzmsb5BFFFYXnSpSzYLyfLmwtsc6tWyUndHcFHyfBBqX5YerpGK

STRIPE_API_KEY=
NEXT_PUBLIC_APP_URL=http://localhost:3000
STRIPE_WEBHOOK_SECRET=

NEXT_PUBLIC_TEACHER_ID=
```

### Setup Prisma

Add MySQL Database (I used PlanetScale)

```shell
npx prisma generate
npx prisma db push

```

### Start the app

```shell
npm run dev
```

## Available commands

Running commands with npm `npm run [command]`

| command         | description                              |
| :-------------- | :--------------------------------------- |
| `dev`           | Starts a development instance of the app |
