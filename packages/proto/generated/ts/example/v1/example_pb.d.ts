import * as jspb from 'google-protobuf'



export class GetExampleRequest extends jspb.Message {
  getExampleId(): string;
  setExampleId(value: string): GetExampleRequest;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetExampleRequest.AsObject;
  static toObject(includeInstance: boolean, msg: GetExampleRequest): GetExampleRequest.AsObject;
  static serializeBinaryToWriter(message: GetExampleRequest, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetExampleRequest;
  static deserializeBinaryFromReader(message: GetExampleRequest, reader: jspb.BinaryReader): GetExampleRequest;
}

export namespace GetExampleRequest {
  export type AsObject = {
    exampleId: string;
  };
}

export class GetExampleResponse extends jspb.Message {
  getResp(): string;
  setResp(value: string): GetExampleResponse;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): GetExampleResponse.AsObject;
  static toObject(includeInstance: boolean, msg: GetExampleResponse): GetExampleResponse.AsObject;
  static serializeBinaryToWriter(message: GetExampleResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): GetExampleResponse;
  static deserializeBinaryFromReader(message: GetExampleResponse, reader: jspb.BinaryReader): GetExampleResponse;
}

export namespace GetExampleResponse {
  export type AsObject = {
    resp: string;
  };
}

