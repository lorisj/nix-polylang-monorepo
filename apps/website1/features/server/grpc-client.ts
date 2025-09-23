import { createClient } from "@connectrpc/connect";
import { createGrpcTransport } from "@connectrpc/connect-node";
import { ExampleService } from "@repo/proto/generated/ts/example/v1/example_pb";

const transport = createGrpcTransport({
  baseUrl: "http://localhost:50051",
});

export const client: ReturnType<typeof createClient<typeof ExampleService>> = createClient(ExampleService, transport);
