
runWebsite1:
        pnpm nx dev website1

generateProto:
        protoc  --plugin=grpc_node_plugin \
                --proto_path=something \
                --js_out=import_style=common.js:./pathToOutputDir \
                --grpc-web_out=import_style=typescript, mode=grpcwebtext:./pathToOutputDir
