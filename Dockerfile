FROM node AS build
WORKDIR /app
COPY package.json package.json
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=build /app/dist /opt/site
COPY nginx.conf /etc/nginx/nginx.conf
