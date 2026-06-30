FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY index.html app.html /usr/share/nginx/html/

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
