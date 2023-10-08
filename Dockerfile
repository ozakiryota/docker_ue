########## Pull ##########
FROM nvidia/vulkan:1.1.121-cuda-10.1--ubuntu18.04
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC
########## User ##########
ARG home_dir="/home/user"
COPY copy/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apt-get update && \
	apt-get install -y \
		gosu \
		sudo && \
	chmod +x /usr/local/bin/entrypoint.sh && \
	mkdir -p $home_dir
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
########## Non-interactive ##########
ENV DEBIAN_FRONTEND=noninteractive
########## Unreal Engine ##########
COPY ./copy/UnrealEngine-4.26.zip /tmp/UnrealEngine-4.26.zip
## build
RUN apt-get update && \
	apt-get install -y \
		unzip \
		wget \
		build-essential \
		xdg-user-dirs && \
	unzip /tmp/UnrealEngine-4.26.zip -d /opt && \
	cd /opt/UnrealEngine-4.26 && \
	./Setup.sh && \
	./GenerateProjectFiles.sh && \
	make
## authorize
RUN chmod -R a+rwX /opt/UnrealEngine-4.26/Engine/Intermediate && \
	mkdir -p /opt/UnrealEngine-4.26/Engine/DerivedDataCache && \
	chmod -R a+rwX /opt/UnrealEngine-4.26/Engine/DerivedDataCache && \
	chmod -R a+rwX /opt/UnrealEngine-4.26/Engine/Plugins && \
	chmod -R a+rwX /opt/UnrealEngine-4.26/Engine/Saved
## requirements
RUN apt-get update && \
	apt-get install -y \
		xorg-dev \
		libgl1-mesa-dev
########## Initial Position ##########
WORKDIR $home_dir
CMD ["bash"]