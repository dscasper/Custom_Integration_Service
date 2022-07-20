@RestResource(UrlMapping='/integrations/*')
global class IntegrationController {

    global class IntegrationResponse {

        global IntegrationResponse() {

        }

        global Integer StatusCode;
        global String Error;
        global String Value;
    }

    private static String integrationConfigName;
    private static String requestBody;

    @TestVisible
    private static IIntegrationService integrationService;
    private static IntegrationResponse returnResponse;

    private enum RequestType { GET, POST, PUT, PATCH, DEL}

    @HttpGet
    global static IntegrationResponse getResponse(){

        processRequest(RequestType.GET);
        return returnResponse;
    }

    @HttpPost
    global static IntegrationResponse postResponse(){

        processRequest(RequestType.POST);
        return returnResponse;
    }

    @HttpPut
    global static IntegrationResponse putResponse(){

        processRequest(RequestType.PUT);
        return returnResponse;
    }

    @HttpPatch
    global static IntegrationResponse patchResponse(){

        processRequest(RequestType.PATCH);
        return returnResponse;
    }

    @HttpDelete
    global static IntegrationResponse deleteResponse(){

        processRequest(RequestType.DEL);
        return returnResponse;
    }

    private static void getRequest(){

        RestRequest request = RestContext.request;
        integrationConfigName = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        System.debug(integrationConfigName);
        requestBody = request.requestBody.toString();
        integrationService = IntegrationServiceFactory.newInstance(integrationConfigName);

    }

    private static void processRequest(RequestType requestType){

        returnResponse = new IntegrationResponse();
        try {
            returnResponse.StatusCode = 200;
            getRequest();
            Object returnObject;

            switch on requestType {
                when GET {
                    returnObject = integrationService.processGet(requestBody);
                }
                when POST{
                    returnObject = integrationService.processPost(requestBody);
                }
                when PUT{
                    returnObject = integrationService.processPut(requestBody);
                }
                when PATCH{
                    returnObject = integrationService.processPatch(requestBody);
                }
                when DEL{
                    returnObject = integrationService.processDelete(requestBody);
                }
            }

            returnResponse.Value = JSON.serialize(returnObject);
        } catch (Exception ex) {

            System.debug(ex.getMessage());
            System.debug(ex.getStackTraceString());
            System.debug(ex.getLineNumber());

            returnResponse.StatusCode = 500;
            returnResponse.Error = ex.getMessage();
        } finally {
            //TODO: implement Logging
        }

    }
}
