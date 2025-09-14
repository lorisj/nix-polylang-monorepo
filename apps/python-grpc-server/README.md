# Python gRPC Server

A simple Python gRPC server using betterproto that implements the ExampleService.

## Features

- Implements the `GetExample` RPC method
- Returns the input `example_id` capitalized
- Uses betterproto for clean, modern Python gRPC

## Setup

1. Install dependencies with uv:
```bash
uv sync
```

2. Run the server:
```bash
uv run python server.py
```

Or alternatively:
```bash
uv run server.py
```

The server will start on `127.0.0.1:50051`.

## API

- **GetExample**: Takes an `example_id` string and returns it capitalized
  - Input: `GetExampleRequest{example_id: "test-123"}`
  - Output: `GetExampleResponse{resp: "Hello! Your ID is: TEST-123"}`
