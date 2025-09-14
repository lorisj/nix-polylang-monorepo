import { createClient } from "@connectrpc/connect";
import { createConnectTransport } from "@connectrpc/connect-web";
import { ExampleService } from "@repo/proto/generated/ts/example/v1/example_pb";

const transport = createConnectTransport({
        baseUrl : "http://demo.connectrpc.com",
        
      });

export const client: ReturnType<typeof createClient<typeof ExampleService>> = createClient(ExampleService, transport);
