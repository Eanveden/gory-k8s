# gory-k8s
 
¯\_(ツ)_/¯  Gory, first attempt at creating a k8s cluster using terraform and azure    
 
Deploy a k8s cluster on azure using terraform

# TF VARS TEMPLATE
```
subscription_id    = "00000000-0000-0000-0000-000000000000"
tenant_id          = "00000000-0000-0000-0000-000000000000"
k8s_service_cidr   = ""
docker_bridge_cidr = ""
k8s_dns_service_ip = ""
vnet_address_space          = [""]
k8s_subnet_address_prefixes = [""]
creator                     = ""
location                    = ""
cluster_name                = ""
dns_prefix                  = ""
```
# VARIABLES W/ DEFAULTS
| Variable  | Format | Default |
| ------------- | ------------- | ------------- |
| subscription_id | 00000000-0000-0000-0000-000000000000  | None  |
| tenant_id  | 00000000-0000-0000-0000-000000000000  | None  |
| resource_group_name  | String | None  |
| k8s_service_cidr  | "X.X.X.X/X"  | 10.0.1.0/24  |
| docker_bridge_cidr  | "X.X.X.X/X"  | 10.0.2.0/16  |
| k8s_dns_service_ip  | "X.X.X.X"  | 10.0.1.10  |
| vnet_address_space  | ["X.X.X.X/X"]  | ["10.0.0.0/16"] |
| k8s_subnet_address_prefixes  | ["X.X.X.X/X"]  | ["10.0.0.0/24"]  |
| cluster_name  | String  | k8s  |
| location  | String  | East US  |
| dns_prefix  | String  | k8s  |
| creator  | String  | erik  |

# Steps (Only Linux)

## 1. This project use symlinks in the storage folder (If they do not work for some reason you can create them in the storage folder):
```
cd storage
ln -s ../provider.tf provider.tf
ln -s ../variables.tf variables.tf
```

## 2. Create storage account w/ container
```
cd storage
tf plan -var-file tf.vars
tf apply -var-file tf.vars
```

## 3. Create cluster
```
cd ..
tf plan -var-file tf.vars
tf apply -var-file tf.vars
```

## 4. Enjoy!


