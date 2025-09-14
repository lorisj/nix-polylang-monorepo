
jsRunWebapp:
        pnpm nx dev website1

pythonRunGRPCServer:
        echo "Running Python GRPC server:";
        cd apps/python-grpc-server; uv run python server.py

protoTestGRPCPythonServer:
        echo "Testing GRPC server:";
        buf curl --data '{"example_id": "test123"}' --schema packages/proto/proto/example/v1/example.proto --protocol grpc --http2-prior-knowledge http://localhost:50051/example.v1.ExampleService/Example
