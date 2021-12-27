FROM node:10-slim

WORKDIR /root
COPY package.json ./
COPY package-lock.json ./
RUN npx browserslist@latest --update-db
RUN npm install --no-optional && npm cache clean --force
ENV PATH /root/node_modules/.bin/:$PATH

COPY . .
RUN npm run build

CMD ["node", "/root/build"]
