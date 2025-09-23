# in js shell:
js-runWeb:
        pnpm nx dev website1

js-addShadcnComp component_name:
        cd packages/ui; pnpm dlx shadcn@latest add {{component_name}};

# in python shell:
python-runGrpc:
        echo "Running Python GRPC server:";
        cd apps/python-grpc-server; uv run python server.py

# in proto shell:
proto-testGrpc:
        echo "Testing GRPC server:";
        buf curl --data '{"example_id": "test123"}' --schema packages/proto/proto/example/v1/example.proto --protocol grpc --http2-prior-knowledge http://localhost:50051/example.v1.ExampleService/Example

proto-gen:
        echo "Generating Types:";
        cd packages/proto && buf generate;