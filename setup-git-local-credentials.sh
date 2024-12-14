#!/bin/bash

echo "username: "
read username

echo "email: "
read email

git config user.name "$username"
git config user.email "$email"

echo "Done"

