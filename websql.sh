sudo docker run -it microsoft/azure-cli

docker run -it azuresdk/azure-cli-python

##fixed parameters##
rg='-RG'
webnsg='web-nsg'
datansg='data-nsg'
mgmtnsg='mgmt-nsg'
jumpnsg='jump-nsg'
vnet='vnet'
websubnet='web-subnet'
jumpsubnet='jump-subnet'
datasubnet='data-subnet'
vnetprefix='0.0/16'
jumpprefix='2.0/24'
dataprefix='1.0/24'
webprefix='0.0/24'
nsg='-nsg'
webvm01a='web-vm-01a'
webvm01b='web-vm-01b'
nic01a='-nic-01a'
nic01b='-nic-01b'
webvm01as='web-vm-as'
ip='-ip'
webvm01lb='web-vm-01-lb'
jumpvm01='jump-vm-01'
jumpnic01='jump-nic-01'
sqlvm01as='sql-vm-01-as'
sqlvm01='sql-vm-01'
sqlnic01='sql-nic-01'
sqlvm01a='sql-vm-01a'


#parameters for Resource Group
$ResourceGroupName=$envprefix$rg            


#Parameters for Vnet ans subnets
$VirtualNetworkName = $envPrefix$vnet
$VirtualNetworkJumpSubnetName = $envPrefix$jumpsubnet
$VirtualNetworkWebSubnetName = $envPrefix$websubnet
$VirtualNetworkDataSubnetName = $envPrefix$datasubnet
$virtualnetworkprefix = $ipAddressPrefix$vnetprefix
$VirtualNetworkJumpSubnetPrefix = $ipAddressPrefix$jumpprefix
$VirtualNetworkWebSubnetPrefix = $ipAddressPrefix$webprefix
$VirtualNetworkDataSubnetPrefix = $ipAddressPrefix$dataprefix


#Parameters for NSG
$WebNSGName = $envPrefix$websubnet 
$DataNSGName= $envPrefix$datasubnet 
$MgmtNSGName= $envPrefix$mgmtsubnet 
$JumpNSGName= $envPrefix$jumpsubnet  




#Parameters for WebVM
$WebVM01AName = $envPrefix$webvm01a
$WebVM01BName = $envPrefix$webvm01b
$WebVM01ANicName = $envPrefix$nic01a
$WebVM01BNicName = $envPrefix$nic01b
$WebVM01AvailabilitySetName =$envPrefix$webvm01as
$WebVM01AIPName = $WebVM01AName$ip
$WebVM01BIPName = $WebVM01BName$ip
#$WebVM01ACompName = ($WebVM01AName -replace "-","")
#$WebVM01BCompName = ($WebVM01BName -replace "-","")
$WebVMImagePublishername = "Canonical"     
$WebVMImageoffer = "UbuntuServer"                      
$WebVM01AOSDiskName = "VMWeb01AOSDisk"               
$WebVM01BOSDiskName = "VMWeb01BOSDisk"               
$WebVM01AOSDiskCaching = "ReadWrite"                    
$WebVM01BOSDiskCaching = "ReadWrite"                    
$WebVM01DscConfigPath = "DscScriptWeb.ps1"              
$WebVM01DiagConfigPath ="sample1.xml"

#Parameters for WebVM Load Balancer
$WebVMLBIPName = $uniqueDnsPrefix$envPrefix$webvm01lb$ip
$WebVM01LBFrondEndIPConfigName = "lbfrontend"
$WebVM01LBBackendAddrPoolName = "lbbackend"
$WebVM01ALBInboundNatName = "RDPWebVM01A"
$WebVM01BLBInboundNatName = "RDPWebVM01B"
$WebVM01ALBInboundNatFrontPort = "5001"
$WebVM01BLBInboundNatFrontPort = "5002"
$WebVM01LBHealthProbeName = "HealthProbe"
$WebVM01LBHealthProbeReqPath = "/"
$WebVM01LBHealthProbeProtocol = "Http"
$WebVM01LBHealthProbePort = "80"
$WebVM01LBHealthProbeInterval = "5"
$WebVM01LBHealthProbeCount = "2"
$WebVM01LBRule1Name = "HTTP-LB-Rule"
$WebVM01LBRule2Name = "HTTPS-LB-Rule"
$WebVM01LBRule1Port = "Tcp"
$WebVM01LBRule2Port = "Tcp"
$WebVM01LBRule1FrondEndPort = "80"
$WebVM01LBRule2FrondEndPort = "443"
$WebVM01LBRule1BackEndPort = "80"
$WebVM01LBRule2BackEndPort = "443"
$WebVM01LBRule1IdleTimeOut = "4"
$WebVM01LBRule2IdleTimeOut = "4"
$WebVM01LBRule1LoadDistribution = "Default"
$WebVM01LBRule2LoadDistribution = "Default"
$WebVM01LoadBalancerName = "loadbalancer03"

#parameters for internal load Balancer
$internalLBname="internal-lb"
$internalbackendpool="internal-backend-pool"
$internalrule01portfront="3306"
$internalrule01portback="3306"
$internalprobe01name="sql-backend-probe-01"
$internalprobe01protocol="Tcp"
$internalhealthprobeinterval="5"
$internalhealthprobcount="2"

#Parameters for JumpVM
$JumpVM01IPName = $envPrefix$jumpvm01$ip
$JumpVM01NicName = $envPrefix$jumpnic01
$JumpVM01Name = "Jump-vm-01"                                  
#$JumpVM01CompName = ($WebVM01AName -replace "-","")
$JumpVM01Size = "Standard_D1_v2"                              
$JumpVMImagePublishername = "Canonical"          
$JumpVMImageoffer = "UbuntuServer"                           
$JumpVM01OSDiskName = "VMJump01OSDisk"                     
$JumpVM01OSDiskCaching = "ReadWrite"                          
$JumpVM01OSDiskSize = "100"                                   

#Parameters for mySqlVM
$mySqlVM01AvailabilitySetName = $envPrefix$sqlvm01as
$mySqlVM01AIPName = $envPrefix$sqlvm01$ip
$mySqlVM01ANicName = $envPrefix$sqlnic01
$mySqlVM01AName = $envPrefix$sqlvm01a
#$SqlVM01ACompName = ($SqlVM01AName -replace "-","")
$mySqlVMImagePublishername = "Canonical"          
$mySqlVMImageoffer = "UbuntuServer"                 
#$mySqlVmImagefamily = "Enterprise"                         
$mySqlVM01AOSDiskName = "VMmySql01AOSDisk"                
$mySqlVM01AOSDiskCaching = "ReadWrite"                     
$mySqlVM01ADataDiskName = "mySQLVM01A-DataDisk"              
$mySqlVM01ALogDiskName = "mySQLVM01A-LogDisk"                
$mySqlVM01ASystemDBDiskName = "mySQLVM01A-SystemDBDisk" 
$mySqlVM01DscConfigPath = "DscScriptSql.ps1"                  


echo "Enter the environment prefix"
read envPrefix
echo "enter the sku for storage account"
read skustorage
echo "Enter the location at which the deployment should be done"
read location
echo "Enter the ip prefix"
read ipprefix
echo "enter the username to be used"
read username
echo "enter the password to be used"
read password

#login
az login

##create resource group
az resource group create -n $ResourceGroupName -l $location

##storage account
az storage account create -n webmysqlcliv2 -g $ResourceGroupName -l $location --sku $skustorage


##create nsg
az network nsg create -n $WebNSGName -l $location -g $ResourceGroupName
az network nsg create -n $DataNSGName -l $location -g $ResourceGroupName
az network nsg create -n $MgmtNSGName -l $location -g $ResourceGroupName
az network nsg create -n $JumpNSGName -l $location -g $ResourceGroupName

##Creating rules##
#HTTP-allow
az network nsg rule create -n HTTP-allow --nsg-name $WebNSGName -g $ResourceGroupName --protocol Tcp --source-address-prefix '*' --source-port-range '*' --access Allow --destination-address-prefix 10.100.0.0/24 --destination-port-range 80 --direction InBound --priority 110

#HTTPS-allow
az network nsg rule create -n HTTPS-allow --nsg-name $WebNSGName -g $ResourceGroupName --protocol Tcp --source-address-prefix '*' --source-port-range '*' --access Allow --destination-address-prefix 10.100.0.0/24 --destination-port-range 443 --direction InBound --priority 111
ssh-allow
az network nsg rule create -n ssh-allow --nsg-name $JumpNSGName -g $ResourceGroupName --protocol Tcp --source-address-prefix 'internet' --source-port-range '*' --access Allow --destination-address-prefix 10.100.3.4 --destination-port-range 22 --direction InBound --priority 120

#jump-web-ssh
az network nsg rule create -n jump-web-ssh --nsg-name $WebNSGName -g $ResourceGroupName --protocol Tcp --source-address-prefix 10.100.3.4 --source-port-range '*' --access Allow --destination-address-prefix 10.100.0.0/24 --destination-port-range 22 --direction InBound --priority 125

#jump-mysql-ssh
az network nsg rule create -n jump-mysql-ssh --nsg-name $DataNSGName -g $ResourceGroupName --protocol Tcp --source-address-prefix 10.100.3.4 --source-port-range '*' --access Allow --destination-address-prefix 10.100.1.0/24 --destination-port-range 22 --direction InBound --priority 126

#web-mysql
az network nsg rule create -n web-mysql --nsg-name $DataNSGName -g $ResourceGroupName --protocol Tcp --source-address-prefix 10.100.0.0/24 --source-port-range '*' --access Allow --destination-address-prefix 10.100.1.0/24 --destination-port-range 3306 --direction InBound --priority 135



#jump-web-block
az network nsg rule create -n jump-web-block --nsg-name $NSGName -g $ResourceGroupName --protocol * --source-address-prefix 10.100.0.0/24 --source-port-range '*' --access Deny --destination-address-prefix 10.100.1.0/24 --destination-port-range '*' --direction Outbound --priority 250




##create vnet
az network vnet create -n $VirtualNetworkName -g $ResourceGroupName -l $location --address-prefix $ipprefix$vnetprefix --subnet-name $VirtualNetworkWebSubnetName --subnet-prefix $ipprefix$webprefix

##create subnets
az network vnet subnet create -n $VirtualNetworkDataSubnetName -g $ResourceGroupName --vnet-name $VirtualNetworkName --address-prefix $ipprefix$dataprefix --network-security-group $NSGName

az network vnet subnet create -n $VirtualNetworkJumpSubnetName -g $ResourceGroupName --vnet-name $VirtualNetworkName --address-prefix $ipprefix$jumpprefix --network-security-group $NSGName


##availability set -web
az vm availability-set create -n $WebVM01AvailabilitySetName -l $location -g $ResourceGroupName

##availability set -data
az vm availability-set create -n $mySqlVM01AvailabilitySetName -l $location -g $ResourceGroupName
##create jump ip
az network public-ip create -n $JumpVM01IPName -g $ResourceGroupName -l $location --allocation-method Static

##create lb-ip
az network public-ip create -n $WebVMLBIPName -g $ResourceGroupName -l $location --allocation-method Static

##Creating public load balancer
az network lb create -n $WebVM01LoadBalancerName -g $ResourceGroupName -l $location

###frontend config
az network lb frontend-ip create -n $WebVM01LBFrondEndIPConfigName --lb-name $WebVM01LoadBalancerName -g $ResourceGroupName --public-ip-address /subscriptions/7fe4cf35-d0ed-4c48-9189-dc6575e0b7b1/resourceGroups/$ResourceGroupName/providers/Microsoft.Network/publicIPAddresses/webmysqlcliv2-lb-ip
###backend pool
az network lb address-pool create -n $WebVM01LBBackendAddrPoolName --lb-name $WebVM01LoadBalancerName -g $ResourceGroupName

##creating probes
#httpProbe
az network lb probe create --lb-name $WebVM01LoadBalancerName -n $WebVM01LBHealthProbeName --port $WebVM01LBRule1FrondEndPort --protocol $WebVM01LBHealthProbeProtocol -g $ResourceGroupName --path $WebVM01LBHealthProbeReqPath --threshold $WebVM01LBHealthProbeCount


#httpsProbe
az network lb probe create --lb-name $WebVM01LoadBalancerName -n httpsProbe --port 443 --protocol Tcp -g $ResourceGroupName --threshold $WebVM01LBHealthProbeCount

##Creating LB rules
#http-lb-rule
az network lb rule create --backend-pool-name $WebVM01LBBackendAddrPoolName --backend-port $WebVM01LBRule1BackEndPort --frontend-ip-name $WebVM01LBFrondEndIPConfigName --frontend-port $WebVM01LBRule1FrondEndPort --lb-name $WebVM01LoadBalancerName -n $WebVM01LBRule1Name --protocol $WebVM01LBRule1Port -g $ResourceGroupName --probe-name $WebVM01LBHealthProbeName

#https-lb-rule
az network lb rule create --backend-pool-name $WebVM01LBBackendAddrPoolName --backend-port $WebVM01LBRule2BackEndPort --frontend-ip-name $WebVM01LBFrondEndIPConfigName --frontend-port $WebVM01LBRule2FrondEndPort --lb-name $WebVM01LoadBalancerName -n $WebVM01LBRule2Name --protocol $WebVM01LBRule2Port -g $ResourceGroupName --probe-name httpsProbe

#sql-rule
az network lb rule create --backend-pool-name $WebVM01LBBackendAddrPoolName --backend-port 8080 --frontend-ip-name $WebVM01LBFrondEndIPConfigName --frontend-port 8080 --lb-name $WebVM01LoadBalancerName -n mysql-lb-rule --protocol Tcp -g $ResourceGroupName --probe-name httpProbe



##Creating internal load balancer

az network lb create -n $internalLBname -g $ResourceGroupName -l $location --private-ip-address 10.100.1.9 --public-ip-address '' --subnet $VirtualNetworkDataSubnetName --vnet-name $VirtualNetworkName

#creating probe
az network lb probe create --lb-name webmysqlcliv2-public-lb -n sqlprobe --port $internalrule01portfront --protocol Tcp -g webmysqlcliv2-rg  --threshold 2

#rule
az network lb rule create --backend-pool-name $internalbackendpool --backend-port $internalrule01portback --frontend-ip-name webmysqlcliv2-frontend --frontend-port $internalrule01portfront --lb-name webmysqlcliv2-public-lb -n https-lb-rule --protocol Tcp -g webmysqlcliv2-rg --probe-name httpsProbe


##creating nic
#Web-vm-01a
azure network nic create -n $WebVM01ANicName -g $ResourceGroupName –subnet $VirtualNetworkWebSubnetName --vnet-name $VirtualNetworkName --lb-name $WebVM01LoadBalancerName -l $location --network-security-group $WebNSGName 

#Web-vm-01b
azure network nic create -n $WebVM01BNicName -g webmysqlcliv2-rg –subnet $VirtualNetworkWebSubnetName --vnet-name $VirtualNetworkName --lb-name $WebVM01LoadBalancerName -l $location --network-security-group $WebNSGName 

#Data-vm-01b
azure network nic create -n $mySqlVM01ANicName -g webmysqlcliv2-rg –subnet $VirtualNetworkDataSubnetName --vnet-name $VirtualNetworkName --lb-name $WebVM01LoadBalancerName -l $location --network-security-group $DataNSGName 


##creating webservers (Ubunut 14.04)
az vm create --image Canonical:UbuntuServer:14.04.4-LTS:latest -n webmysqlcliv2-web-vm-01a -g $ResourceGroupName --nics $WebVM01ANicName--admin-password $password --admin-username $username --authentication-type password --availability-set $WebVM01AvailabilitySetName  --vnet $VirtualNetworkName --vnet-ip-address-prefix 10.100.0.0/16 --subnet-name $VirtualNetworkWebSubnetName --subnet-ip-address-prefix 10.100.0.0/24 –nsg ‘ ‘


az vm create --image Canonical:UbuntuServer:14.04.4-LTS:latest -n webmysqlcliv2-web-vm-01b -g $ResourceGroupName --nics $WebVM01BNicName --admin-password $password --admin-username $username --authentication-type password --availability-set $WebVM01AvailabilitySetName  --vnet $VirtualNetworkName --vnet-ip-address-prefix 10.100.0.0/16 --subnet-name $VirtualNetworkWebSubnetName --subnet-ip-address-prefix 10.100.0.0/24 –nsg ‘ ‘



##creating mysqlserver
az vm create --image Canonical:UbuntuServer:14.04.4-LTS:latest -n webmysqlcliv2-data-vm-01a -g $ResourceGroupName --nics $mySqlVM01ANicName --admin-password $password --admin-username $username --authentication-type password --availability-set $mySqlVM01AvailabilitySetName  --vnet $VirtualNetworkName --vnet-ip-address-prefix 10.100.0.0/16 --subnet-name $VirtualNetworkDataSubnetName --subnet-ip-address-prefix 10.100.1.0/24 –nsg ‘ ‘


##creating the jump server
az vm create --image Canonical:UbuntuServer:14.04.4-LTS:latest -n $JumpVM01Name -g $ResourceGroupName --admin-password $password --admin-username $username --authentication-type password   --vnet $VirtualNetworkName --vnet-ip-address-prefix 10.100.0.0/16 --subnet-name $VirtualNetworkJumpSubnetName --subnet-ip-address-prefix 10.100.3.0/24 --public-ip-address $JumpVM01IPName –nsg ‘ ‘

