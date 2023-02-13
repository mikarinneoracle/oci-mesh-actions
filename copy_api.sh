if [ -z "$1" ]; then
  exit
fi
if [[ -z "${mesh_compartment}" ]]; then
  echo "Setting up compartment from current pipeline"
  export mesh_compartment=$(oci devops build-pipeline get --build-pipeline-id $OCI_PIPELINE_ID --query 'data."compartment-id"' --raw-output)
fi
rm -rf home/pricing_api
cd home
mkdir tmp
api_id=$(oci api-gateway api list --all --compartment-id ${mesh_compartment} | jq '.data.items[] | select(."lifecycle-state" == "ACTIVE" and ."display-name" == "'$1'") | ."id"' |  tr -d '"')
sdk_id=$(oci api-gateway sdk list --all --api-id ${api_id} | jq '.data.items[] | select(."lifecycle-state" == "ACTIVE") | ."id"' | tr -d '"')
url=$(oci api-gateway sdk get --sdk-id ${sdk_id}  | jq '.data."artifact-url"' | tr -d '"')
curl ${url} -o ./tmp/sdk.zip
cd tmp
unzip sdk.zip
for d in */ ; do
    echo "$d"
    mv "$d" ../pricing_api
done
cd ..
rm -rf tmp
ls
ls -la pricing_api
cd ..

