@IsTest
private class IntegrationResourceTest {

    private static String requestName = 'TestRequest';
    private static String requestBody = '';

    @TestSetup
    static void setupTestData(){

    }

    @IsTest
    private static void getResponse(){

        Account responseAccount = new Account(Name = 'Test Account');
        setupMocks(responseAccount);
        RestContext.request = buildRequest();

        IntegrationResource.IntegrationResponse response;
        Test.startTest();
        {
            response = IntegrationResource.getResponse();
        }
        Test.stopTest();
        System.assertNotEquals(null, response);
        System.assertEquals(200, response.StatusCode);
        System.assertEquals(responseAccount, (Account) JSON.deserialize(response.Value, Account.class));
        System.assertEquals(null, response.Error);
    }

    @IsTest
    private static void postResponse(){

        Account responseAccount = new Account(Name = 'Test Account');
        setupMocks(responseAccount);
        RestContext.request = buildRequest();

        IntegrationResource.IntegrationResponse response;
        Test.startTest();
        {

            response = IntegrationResource.postResponse();
        }
        Test.stopTest();

        System.assertNotEquals(null, response);
        System.assertEquals(200, response.StatusCode);
        System.assertEquals(responseAccount, (Account) JSON.deserialize(response.Value, Account.class));
        System.assertEquals(null, response.Error);
    }

    @IsTest
    private static void putResponse(){

        Account responseAccount = new Account(Name = 'Test Account');
        setupMocks(responseAccount);
        RestContext.request = buildRequest();

        IntegrationResource.IntegrationResponse response;
        Test.startTest();
        {
            response = IntegrationResource.putResponse();
        }
        Test.stopTest();

        System.assertNotEquals(null, response);
        System.assertEquals(200, response.StatusCode);
        System.assertEquals(responseAccount, (Account) JSON.deserialize(response.Value, Account.class));
        System.assertEquals(null, response.Error);
    }

    @IsTest
    private static void patchResponse(){

        Account responseAccount = new Account(Name = 'Test Account');
        setupMocks(responseAccount);
        RestContext.request = buildRequest();

        IntegrationResource.IntegrationResponse response;
        Test.startTest();
        {

            response = IntegrationResource.patchResponse();
        }
        Test.stopTest();

        System.assertNotEquals(null, response);
        System.assertEquals(200, response.StatusCode);
        System.assertEquals(responseAccount, (Account) JSON.deserialize(response.Value, Account.class));
        System.assertEquals(null, response.Error);

    }

    @IsTest
    private static void deleteResponse(){

        Account responseAccount = new Account(Name = 'Test Account');
        setupMocks(responseAccount);
        RestContext.request = buildRequest();

        IntegrationResource.IntegrationResponse response;
        Test.startTest();
        {

            response = IntegrationResource.deleteResponse();
        }
        Test.stopTest();

        System.assertNotEquals(null, response);
        System.assertEquals(200, response.StatusCode);
        System.assertEquals(responseAccount, (Account) JSON.deserialize(response.Value, Account.class));
        System.assertEquals(null, response.Error);
    }


    @IsTest
    private static void ExceptionTest(){

        String exceptionMessage = 'There is no configuration with that name';
        RestContext.request = buildRequest();
        Stub stub = new Stub(IntegrationService.class);
        stub.setException('processGet', new IntegrationConfigurationService.IntegrationConfigurationServiceException(exceptionMessage));
        IntegrationServiceFactory.setMock((IIntegrationService) stub.instance,null);

        IntegrationResource.IntegrationResponse response;
        Test.startTest();
        {
            response = IntegrationResource.getResponse();
        }
        Test.stopTest();
        System.assertNotEquals(null, response);
        System.assertEquals(500, response.StatusCode);
        System.assertEquals(null, response.Value);
    }

    private static RestRequest buildRequest() {
        RestRequest req = new RestRequest();
        req.httpMethod = 'POST';
        req.requestURI = Url.getOrgDomainUrl() + '/services/apexrest/integrations/'+ requestName;
        req.requestBody = Blob.valueOf(requestBody);

        return req;
    }

    private static void setupMocks(Object returnObject){

        Stub stub = new Stub(IntegrationService.class);
        stub.setReturnValue('processGet', returnObject);
        stub.setReturnValue('processPost', returnObject);
        stub.setReturnValue('processPut', returnObject);
        stub.setReturnValue('processPatch', returnObject);
        stub.setReturnValue('processDelete', returnObject);

        IntegrationServiceFactory.setMock((IIntegrationService) stub.instance,null);
    }

}
