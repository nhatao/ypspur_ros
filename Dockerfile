FROM ros:kinetic

RUN apt-get -qq update && \
	apt-get install -y --no-install-recommends sudo wget curl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

ARG TRAVIS_PULL_REQUEST=false
ARG TRAVIS_REPO_SLUG=""
ARG TRAVIS_BOT_GITHUB_TOKEN=""
ARG PACKAGE_NAME=""

ENV TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST
ENV TRAVIS_REPO_SLUG=$TRAVIS_REPO_SLUG
ENV TRAVIS_BOT_GITHUB_TOKEN=$TRAVIS_BOT_GITHUB_TOKEN
ENV PACKAGE_NAME=$PACKAGE_NAME

COPY ./ /catkin_ws/src/${PACKAGE_NAME}
RUN /catkin_ws/src/${PACKAGE_NAME}/.travis.scripts/test.sh