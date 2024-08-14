FROM openjdk:8-jdk
LABEL author="huangxinping<o0402@outlook.com>"

# RUN rm /etc/apt/sources.list \
#     && echo 'deb http://mirrors.163.com/debian/ jessie main non-free contrib\ndeb http://mirrors.163.com/debian/ jessie-updates main non-free contrib\ndeb http://mirrors.163.com/debian/ jessie-backports main non-free contrib\ndeb-src http://mirrors.163.com/debian/ jessie main non-free contrib\ndeb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib\ndeb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib\ndeb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib\ndeb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib' >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y lsof \
    && curl -L -o kooteam.tar.gz 'https://pangu.yimiyisu.com/home/download.do?app=kooteam&type=install' \
    && tar -xvf kooteam.tar.gz 

WORKDIR /
EXPOSE 7053

CMD ["java", "-jar", "./kooteam.jar", "7053"]


