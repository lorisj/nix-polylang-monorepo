"use client";

import { MyComp } from "@repo/ui/src/features/base-components/test";
import { client } from "../features/grpc-client";
import { ExampleRequestSchema } from "@repo/proto/generated/ts/example/v1/example_pb";
import { useState } from "react";

export default function Page() {
        const [response, setResponse] = useState<string>("");
        const [loading, setLoading] = useState(false);

        const handleClick = async () => {
                setLoading(true);
                try {
                        const request = {
                                exampleId: "test-123"
                        };
                        const result = await client.example(request);
                        setResponse(result.resp);
                } catch (error) {
                        setResponse(`Error: ${error}`);
                } finally {
                        setLoading(false);
                }
        };

        return (
                <div className="p-4 space-y-4">
                        <div className="bg-lime-500 p-2 rounded">This uses local tailwind className in next app</div>
                        <MyComp />
                        <div className="space-y-2">
                                <button 
                                        onClick={handleClick}
                                        disabled={loading}
                                        className="bg-blue-500 hover:bg-blue-700 disabled:bg-gray-400 text-white font-bold py-2 px-4 rounded"
                                >
                                        {loading ? "Loading..." : "Call gRPC Service"}
                                </button>
                                {response && (
                                        <div className="bg-gray-100 p-3 rounded">
                                                <strong>Response:</strong> {response}
                                        </div>
                                )}
                        </div>
                </div>
        );
}
