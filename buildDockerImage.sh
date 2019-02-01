#!/usr/bin/env bash

echo "Cleanup"
rm -f sns-0.4.1.jar

echo "Sbt assembly"
sbt assembly

echo "Copy jar"
cp target/scala-2.12/sns-0.4.1.jar .

echo "Docker build"
docker build --build-arg JAR=sns-0.4.1.jar -t ivory/sns:1.0 .

echo "Finished"