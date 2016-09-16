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
coreo_aws_vpc_vpc "${VPC_NAME}" do
  action :sustain
  cidr "${VPC_OCTETS}/16"
  internet_gateway true
  region "${REGION_1}"
end


######################################################################
## create a routetable for the public subnet, route everything
## to the internet gateway
######################################################################
coreo_aws_vpc_routetable "${PUBLIC_ROUTE_NAME}" do
  action :sustain
  vpc "${VPC_NAME}"
  routes [
             { :from => "0.0.0.0/0", :to => "${VPC_NAME}", :type => :igw }
        ]
  number_of_tables 1
  region "${REGION_1}"
end


######################################################################
## number_of_zones
##   cidr will be split up among all zones specified in "number_of_zones"
## percent_of_vpc_allocated
##   split, but use only this percentage of the entire vpc range
######################################################################
coreo_aws_vpc_subnet "${PUBLIC_SUBNET_NAME}" do
  action :sustain
  number_of_zones 3
  percent_of_vpc_allocated 25
  route_table "${PUBLIC_ROUTE_NAME}"
  vpc "${VPC_NAME}"
  map_public_ip_on_launch true
  region "${REGION_1}"
end

coreo_uni_util_notify "send-instance-vars" do
  action :notify
  type 'email'
  allow_empty ${AUDIT_AWS_ALLOW_EMPTY}
  send_on "${AUDIT_AWS_SEND_ON}"
  payload 'stack_name: INSTANCE::stack_name, name: INSTANCE::name, run_id: INSTANCE::run_id, revision: INSTANCE::revision, id: INSTANCE::id, region: INSTANCE::region'
  payload_type "text"
  endpoint ({ 
              :to => '${SEND_TO}'
            })
end