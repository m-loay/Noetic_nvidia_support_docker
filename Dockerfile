FROM osrf/ros:noetic-desktop-full

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# Install ROS
ENV DEBIAN_FRONTEND=noninteractive
ARG DEBIAN_FRONTEND=noninteractive
RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

RUN sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN sudo apt update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN sudo apt-get install -y ros-noetic-desktop-full

RUN /bin/bash -c "echo 'source /opt/ros/noetic/setup.bash' >> /root/.bashrc"
RUN sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
RUN sudo apt install -y python3-rosdep
RUN sudo apt install -y git-all

### finning ROS setup
RUN sudo apt-get update && sudo apt-get -y upgrade