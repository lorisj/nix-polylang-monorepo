

import { client } from "../../features/server/grpc-client";

export default async function Page() {
    try {
        const request = {
            exampleId: "test-123"
        };
        const result = await client.example(request);
        return (
            <div>
                {JSON.stringify(result)}
            </div>
        )
    } catch (error) {
        console.error(`error: ${error}`)
        return <div>
            `a ${JSON.stringify(error)}`
        </div>
    }

}