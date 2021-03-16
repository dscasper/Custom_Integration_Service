@RestResource(urlMapping='/integrations/*')
global class IntegrationResource {

    global class IntegrationResponse {

        global IntegrationResponse() {

        }

        global Integer StatusCode;
        global String Error;
    }

    @httpGet
    global static IntegrationResponse getResponse(){

        return new IntegrationResponse();
    }

    @httpPost
    global static IntegrationResponse postResponse(){

        return new IntegrationResponse();
    }

    @httpPatch
    global static IntegrationResponse patchResponse(){

        return new IntegrationResponse();
    }

    @HttpDelete
    global static IntegrationResponse deleteResponse(){

        return new IntegrationResponse();
    }

}
