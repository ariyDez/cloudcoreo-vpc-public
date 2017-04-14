cloudcoreo-vpc-public
=====================


## Description
This [CloudCoreo](http://www.cloudcoreo.com) repository will create a VPC with public subnets.


## Hierarchy
![composite inheritance hierarchy](https://raw.githubusercontent.com/CloudCoreo/cloudcoreo-vpc-public/master/images/hierarchy.png "composite inheritance hierarchy")



## Required variables with no default

**None**


## Required variables with default

### `VPC_NAME`:
  * description: the name of the VPC
  * default: test-vpc


### `VPC_OCTETS`:
  * description: the /16 net of the VPC to look for - i.e 10.11.0.0
  * default: 10.11.0.0


### `REGION`:
  * description: use default except for multiple region use cases
  * default: PLAN::region

### `PUBLIC_ROUTE_NAME`:
  * description: the name to give to the public route
  * default: test-public-route


### `PUBLIC_SUBNET_NAME`:
  * description: the cloudcoreo name of the public vpc subnets
  * default: test-public-subnet


### `PUBLIC_SUBNET_NUM_ZONES`:
  * description: How many public subnets to create
  * default: 3


## Optional variables with default

**None**


## Optional variables with no default

### `SUFFIX`:
  * description: when used will use the value to suffix the names of all converged objects

### `VPC_TAGS`:
  * description: tags to apply to the vpc

## Tags
1. Network
1. VPC
1. Public Subnet

## Categories
1. Network



## Diagram
![alt text](https://raw.githubusercontent.com/CloudCoreo/cloudcoreo-vpc-public/master/images/diagram.png "Public VPC across 3 subnets")


## Icon
![icon](https://raw.githubusercontent.com/CloudCoreo/cloudcoreo-vpc-public/master/images/icon.png "icon")


