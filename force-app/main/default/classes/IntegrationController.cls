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
    global static void getResponse(){

        processRequest(RequestType.GET);
        setRestResponse(returnResponse);
    }

    @HttpPost
    global static void postResponse(){

        processRequest(RequestType.POST);
        setRestResponse(returnResponse);
    }

    @HttpPut
    global static void putResponse(){

        processRequest(RequestType.PUT);
        setRestResponse(returnResponse);
    }

    @HttpPatch
    global static void patchResponse(){

        processRequest(RequestType.PATCH);
        setRestResponse(returnResponse);
    }

    @HttpDelete
    global static void deleteResponse(){

        processRequest(RequestType.DEL);
        setRestResponse(returnResponse);
    }

    private static void getRequest(){

        RestRequest request = RestContext.request;
        integrationConfigName = getIntegrationConfigName(request.requestURI);
        System.debug(integrationConfigName);
        requestBody = request.requestBody.toString();
        integrationService = IntegrationServiceFactory.newInstance(integrationConfigName);

    }

    private static String getIntegrationConfigName(String requestURI){
        System.debug(requestURI);
        List<String> requestURIPath = requestURI.split('/');
        if (requestURIPath.size() <= 2) {
            throw new IntegrationControllerException('The requested resource does not exist');
        }

        return requestURIPath[2];
    }


    private static void setRestResponse(IntegrationResponse response){
        RestResponse restResponse = RestContext.response;
        restResponse.statusCode = response.StatusCode;
        restResponse.responseBody = Blob.valueOf(JSON.serialize(response));
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
        }
        catch(IntegrationControllerException controllerException){
            returnResponse.StatusCode = 400;
            returnResponse.Error = controllerException.getMessage();
        }
        catch(IntegrationService.IntegrationServiceException serviceException){
            returnResponse.StatusCode = serviceException.StatusCode;
            returnResponse.Error = serviceException.getMessage();
        }
        catch (IntegrationConfigurationService.IntegrationConfigurationServiceException configEx){
            returnResponse.StatusCode = 404;
            returnResponse.Error = configEx.getMessage();
        }
        catch (Exception ex) {

            System.debug(ex.getMessage());
            System.debug(ex.getStackTraceString());
            System.debug(ex.getLineNumber());

            returnResponse.StatusCode = 500;
            returnResponse.Error = ex.getMessage();
        } finally {
            //TODO: implement Logging
        }

    }


    public class IntegrationControllerException extends Exception{}
}
