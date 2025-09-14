#!/usr/bin/env python3
"""
Simple gRPC server using betterproto
"""
import asyncio
import sys
from pathlib import Path

# Add the generated proto files to the path (TODO: find better way to do this)
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "packages" / "proto" / "generated" / "python-grpc"))

from example.v1 import GetExampleRequest, GetExampleResponse
import grpclib.server
from grpclib.server import Server


class ExampleService:
    """Implementation of the ExampleService"""
    
    async def GetExample(self, stream) -> None:
        """Get example method - returns the example_id capitalized"""
        request = await stream.recv_message()
        
        # Capitalize the example_id
        capitalized_id = request.example_id.upper()
        
        # Create and send the response
        response = GetExampleResponse(resp=f"Hello! Your ID is: {capitalized_id}")
        await stream.send_message(response)


async def main():
    """Main function to start the gRPC server"""
    # Create the server
    server = Server([ExampleService()])
    
    # Start the server on localhost:50051
    await server.start("127.0.0.1", 50051)
    print("gRPC server started on 127.0.0.1:50051")
    print("Press Ctrl+C to stop the server")
    
    try:
        # Keep the server running
        await server.wait_closed()
    except KeyboardInterrupt:
        print("\nShutting down server...")
        server.close()
        await server.wait_closed()


if __name__ == "__main__":
    asyncio.run(main())
