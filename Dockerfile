FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y nginx zip curl

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /usr/share/nginx/html/master.zip -L https://codeload.github.com/jechiy/cc/zip/master
RUN cd /usr/share/nginx/html/ && unzip master.zip && mv cc-master/* . && rm -rf cc-master master.zip

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]