import grpc
from concurrent import futures
import sys
import os

# Add the generated proto directory to the Python path
sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'packages', 'proto', 'generated', 'python'))

from example.v1 import example_pb2_grpc
from example.v1 import example_pb2


class ExampleServiceServicer(example_pb2_grpc.ExampleServiceServicer):
    
    def Example(self, request, context):
        print(f"Received request with example_id: {request.example_id}")
        
        response = example_pb2.ExampleResponse()
        response.resp = f"Hello from gRPC server! You sent: {request.example_id}"
        
        return response


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    
    example_pb2_grpc.add_ExampleServiceServicer_to_server(ExampleServiceServicer(), server)
    
    listen_addr = '[::]:50051'
    server.add_insecure_port(listen_addr)
    
    server.start()
    print(f"gRPC server started on {listen_addr}")
    
    try:
        server.wait_for_termination()
    except KeyboardInterrupt:
        print("Shutting down server...")
        server.stop(0)


if __name__ == '__main__':
    serve()