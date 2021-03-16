@IsTest
private class IntegrationResourceTest {

    private static string requestName = 'TestRequest';
    private static string requestBody = '';

    @TestSetup
    static void setupTestData(){

    }

    @IsTest
    private static void getResponse(){
        
        RestContext.request = buildRequest();

        integrationResource.integrationResponse response;
        Test.startTest();
        {

            response = integrationResource.getResponse();
        }
        Test.stopTest();

        System.assertNotEquals(null, response);
    }

    @IsTest
    private static void postResponse(){

        RestContext.request = buildRequest();
        integrationResource.integrationResponse response;
        Test.startTest();
        {

            response = integrationResource.postResponse();
        }
        Test.stopTest();

        System.assertNotEquals(null, response);
    }
    
    @IsTest
    private static void patchResponse(){

        RestContext.request = buildRequest();
        integrationResource.integrationResponse response;
        Test.startTest();
        {

            response = integrationResource.patchResponse();
        }
        Test.stopTest();

        System.assertNotEquals(null, response);
    }

    @IsTest
    private static void deleteResponse(){

        RestContext.request = buildRequest();
        integrationResource.integrationResponse response;
        Test.startTest();
        {

            response = integrationResource.deleteResponse();
        }
        Test.stopTest();

        System.assertNotEquals(null, response);
    }


    private static RestRequest buildRequest() {
        RestRequest req = new RestRequest();
        req.httpMethod = 'POST';
        req.requestURI = URL.getOrgDomainUrl() + '/services/apexrest/integrations/'+ requestName;
        req.requestBody = Blob.valueOf(requestBody);

        return req;
    }


}
