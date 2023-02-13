## OCI Service Mesh microservices rebuild and redeploy example with GitHub Actions

This repo is an extension to the <code><a href="https://github.com/mikarinneoracle/oci-service-mesh/blob/main/README.md">OCI Service Mesh demo / example</a></code> that shows how to rebuild and redeploy the meshed microservices (CI/CD) with GitHub actions.

<p>
To run this example, first setup the OCI Service Mesh according to the steps in the repo above in <code>OCI Cloud Shell</code>. Then, you can setup and run this action by forking it.

<p>
This example uses the <code><a href="https://github.com/marketplace/actions/configure-kubectl-for-oracle-container-engine-for-kubernetes-oke">Configure Kubectl for Oracle Container Engine for Kubernetes (OKE) Action</a></code> by Oracle
    
<p>
Multiple Action secrets are required to run this action. Basically the are the same vars (secrets) for the action
that we are using in OCI Cloud Shell plus the vars that are required for the Kubectl action:
    
<ul>
    <li>Kubectl Action required secrets (see for details in Kubectl Action docs):</li>
    <ul>
        <li><b>OCI_CLI_USER</b></li>
        <li><b>OCI_CLI_TENANCY</b></li>
        <li><b>OCI_CLI_FINGERPRINT</b></li>
        <li><b>OCI_CLI_KEY_CONTENT</b></li>
        <li><b>OCI_CLI_REGION</b></li>
    </ul>
    <br>
    <li>Vars required for the CI/CD part:</li>
    <ul>
        <li><b>MESH_NAME</b>: name of the OCI Service Mesh (instance) e.g. <i>pricing</i></li>
        <li><b>MESH_COMPARTMENT_OCID</b>: the compartment containing the Mesh instance (on OKE cluster) and API SDK (optional)</li>
        <li><b>DNS_DOMAIN</b>: dns name for the Mesh e.g. <i>mymesh.mysite.com</i></li>
        <li><b>OCIR</b>: ocir region/tenancy namespace e.g. <i>ams.ocir.io/frsxwtjslf75</i></li>
        <li><b>DOCKER_USERNAME</b>: ocir login username</li>
        <li><b>DOCKER_PASSWORD</b>: ocir login password (token)</li>
        <li><b>DBNAME</b>: ATP database instance name e.g. <i>pricingdb</i></li>
        <li><b>DBPASSWORD</b>: ATP database instance password</li>
        <li><b>PRICING_API_NAME</b>: Pricing API SDK name in OCI API Gateway (optional), if not given, a local copy in the repo is used e.e. <i>pricing</i></li>
    </ul>
</ul>