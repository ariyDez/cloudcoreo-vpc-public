######################################################################
## variables
##   PUBLIC_ROUTE_NAME
##   PUBLIC_SUBNET_NAME
##   VPC_NAME
##   VPC_OCTETS
######################################################################

######################################################################
## Create a vpc, igw and attach the igw to the vpc
######################################################################
coreo_aws_vpc_vpc "${VPC_NAME}${SUFFIX}" do
  action :sustain
  cidr "${VPC_OCTETS}/16"
  internet_gateway true
  region "${REGION}"
  tags ${VPC_TAGS}
end
