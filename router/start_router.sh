# Running in dev for testing purposes. Do not run with dev flag in production!
# Using a local schema.graphql for demo purposes. In a real environment, you'd pull the schema from GraphOS using your Apollo Key and Graph Ref
./router \
  --dev \
  --config router-config.yaml \
  --supergraph schema.graphql