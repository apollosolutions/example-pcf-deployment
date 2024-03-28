# Deploy Router to Cloud Foundry

This repo demonstrates a minimal Router configuration and Cloud Foundry manifest file to deploy the Router to Cloud Foundry.

# Important Notes and Caveats

- The code in this repo is for demonstration purposes only. Do not run in production without first hardening it.
- `create_local_schema.sh`, `supergraph.yaml`, and `schema.graphql` are for demonstration purposes. In a real environment, you'd pull the schema from GraphOS using your Apollo Key and Graph Ref.
- `start_router.sh` runs the Router in dev mode for testing purposes. Do not run with dev flag in production!

# Code Highlights

- In `router/manifest.yaml`, we use the `binary_buildpack` build pack. We configure it to use Router's health check endpoint instead of the default port health check.
- In `router/router-config.yaml`, we specify the `supergraph` and `health_check` `listen` properties with `0.0.0.0:${env.PORT}`. `0.0.0.0` is the IP that CF uses and `${env.PORT}` injects in the `PORT` environment variable provided by CF.

# Deploying Example to PCF

1. Deploy the subgraph by running `cf push` from the `subgraph` directory. Make note of the URL of the subgraph.
2. Update `router/supergraph.yaml` with the URL of your subgraph
3. Run `router/create_local_schema.sh` to generate the supergraph schema
4. Deploy the Router by running `cf push` from the `router` directory. You should be able to open the URL provided by CF in your browser and query the Router.

> Note: Steps 2 and 3 are for demo purposes only. In a real environment, the Router would pull the schema from GraphOS using your Apollo Key and Graph Ref. These would be injected secret environment variables in CF for your `APOLLO_KEY` and `APOLLO_GRAPH_REF`.
