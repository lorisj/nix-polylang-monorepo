import grpc
from concurrent import futures
import sys
import os
import logging
from example.v1 import example_pb2_grpc, example_pb2


logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')


class ExampleServiceServicer(example_pb2_grpc.ExampleServiceServicer):
    def Example(self, request, context):
        logger.info(f"Received request with example_id: {request.example_id}")
        
        response = example_pb2.ExampleResponse()
        response.resp = f"Hello from gRPC server! You sent: '{request.example_id}'"
        
        return response


def serve():
    listen_addr = 'localhost:50051'


    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    
    example_pb2_grpc.add_ExampleServiceServicer_to_server(ExampleServiceServicer(), server)
    
    server.add_insecure_port(listen_addr)
    
    server.start()

    logger.info(f"Started gRPC server on {listen_addr}")
    
    try:
        server.wait_for_termination()
    except KeyboardInterrupt:
        print("Shutting down server...")
        server.stop(0)


if __name__ == '__main__':
    serve()