An externally usable API for a basic to do list application.

# Installation

`git clone https://github.com/dvcv/API.git`

# Starting a local server

Once installed cd in the folder and run `rails s` to start the server.

# Console Commands

## Retrieve all users
curl -u David:password http://localhost:3000/api/users/

## Create new users (This feature will be removed in the future)
curl -u David:password -d "user[name]=Sterling" -d "user[password]=Archer" http://localhost:3000/api/users/

## Create new list 
curl -u David:password -d "list[title]=Things to do today" -d "list[private]=true" http://localhost:3000/api/users/1/lists

## Create new item 
curl -u David:password -d "item[description]=Dance if you want to" http://localhost:3000/api/lists/1/items

## Delete User
curl -u David:password -X DELETE http://localhost:3000/api/users/1/

## Delete List
curl -u David:password -X DELETE http://localhost:3000/api/users/1/lists/1
