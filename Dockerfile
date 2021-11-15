FROM registry.access.redhat.com/ubi8/ubi
RUN yum update -y
#RUN yum localinstall http://mirror.centos.org/centos/8/PowerTools/x86_64/os/Packages/xorg-x11-apps-7.7-21.el8.x86_64.rpm -y
RUN yum install -y java-11-openjdk.x86_64
RUN yum install -y openssh-server 
RUN yum install -y openssh-clients
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -A
ADD ./sshd_config /etc/ssh/sshd_config
RUN echo "root:centos" | chpasswd
CMD /usr/sbin/sshd -D


