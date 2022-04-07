
SUBSCRIPTION=(`az account show --query "id" -o tsv`)
echo -e "exported-subscription: '$SUBSCRIPTION'"

LOCATION="southafricanorth"
NAME="aksbicep01"

az group create -n $NAME --location $LOCATION

az ad sp create-for-rbac --name $NAME --role contributor --scopes /subscriptions/$SUBSCRIPTION/resourceGroups/$NAME --sdk-auth > sp.txt
