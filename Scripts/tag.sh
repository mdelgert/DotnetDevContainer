#!/bin/bash

cd ../
echo "Current version is $APP_VERSION"
git tag -d $APP_VERSION
git push origin --delete $APP_VERSION
git tag -a $APP_VERSION -m "build version $APP_VERSION"
git push origin $APP_VERSION