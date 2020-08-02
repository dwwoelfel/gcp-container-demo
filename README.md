## Deploy a container to a GCP VM

This is a demo project showing how to deploy a container to GCP.

To deploy your own project:

1. Change `GCP_PROJECT_NAME` to your project name in `cloudbuild.yaml` and `package.json`
2. Run `yarn install`
3. Run `yarn create-container`
4. Create an instance template on GCP
  a. Check "Deploy a container image to this VM instance"
  b. Set the container image name to "gcr.io/GCP_PROJECT_NAME/container-demo"
5. Create an instance group that uses the new instance template on GCP
6. Change `INSTANCE_GROUP_NAME` to your instance group name in `package.json`
6. Make changes and run `yarn deploy` to deploy a new version.
