## OCI Service Mesh microservices rebuild and redeploy example with GitHub Actions

This repo is an extension to the <code><a href="https://github.com/mikarinneoracle/oci-service-mesh/blob/main/README.md">OCI Service Mesh demo / example</a></code> that shows how to rebuild and redeploy the meshed microservices (CI/CD) with GitHub actions. This is using the <b>same scripts</b> without any modifications/optimizations.

<p>
To run this example, first setup the OCI Service Mesh according to the steps in the repo above in <code>OCI Cloud Shell</code>. Then, you can setup and run this action by forking it.

<p>
This example uses the <code><a href="https://github.com/marketplace/actions/configure-kubectl-for-oracle-container-engine-for-kubernetes-oke">Configure Kubectl for Oracle Container Engine for Kubernetes (OKE) action</a></code> by Oracle.
It also uses <code><a href="https://github.com/marketplace/actions/docker-login">https://github.com/marketplace/actions/docker-login action</a></code> to login to OCIR.
    
<p>
Multiple <code>secrets</code> are required to run this action. Basically the are the same vars (secrets) for the action
that we are using in OCI Cloud Shell plus the vars that are required for the Kubectl action:
    
<ul>
    <li>Kubectl action required secrets (see for details in Kubectl action docs):</li>
    <ul>
        <li><b>OCI_CLI_USER</b></li>
        <li><b>OCI_CLI_TENANCY</b></li>
        <li><b>OCI_CLI_FINGERPRINT</b></li>
        <li><b>OCI_CLI_KEY_CONTENT</b></li>
        <li><b>OCI_CLI_REGION</b></li>
    </ul>
    <br>
    <li>Docker-login action required secrets (see for details in docker-login action docs for OCIR):</li>
    <ul>
        <li><b>DOCKER_SERVER</b>: ocir in the region e.g. <i>ams.ocir.io</i></li>
        <li><b>DOCKER_USERNAME</b>: ocir login username</li>
        <li><b>DOCKER_PASSWORD</b>: ocir login password (token)</li>
    </ul>
    <br>
    <li>Secrets required for the CI/CD part:</li>
    <ul>
        <li><b>MESH_NAME</b>: name of the OCI Service Mesh (instance) e.g. <i>pricing</i></li>
        <li><b>MESH_COMPARTMENT_OCID</b>: the compartment containing the Mesh instance (on OKE cluster)</li>
        <li><b>DNS_DOMAIN</b>: dns name for the Mesh e.g. <i>mymesh.mysite.com</i></li>
        <li><b>OCIR</b>: ocir in the region/tenancy namespace e.g. <i>ams.ocir.io/frsxwtjslf75</i></li>
        <li><b>DOCKER_USERNAME</b>: ocir login username <i>(same as in docker-login)</i></li>
        <li><b>DOCKER_PASSWORD</b>: ocir login password (token) <i>(same as in docker-login)</i></li>
        <li><b>DBNAME</b>: ATP database instance name e.g. <i>pricingdb</i></li>
        <li><b>DBPASSWORD</b>: ATP database instance password</li>
    </ul>
</ul>