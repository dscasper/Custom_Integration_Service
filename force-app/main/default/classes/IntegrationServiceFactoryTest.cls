@IsTest
private class IntegrationServiceFactoryTest {

    private static Integration_Configuration__mdt mockIntegrationConfiguration;
    private static final String configName = 'TestConfig';

    @IsTest
    static void newInstanceSuccess() {
        createMockConfigService();

        Stub stub = new Stub(IntegrationConfigurationService.class);
        stub.setReturnValue('getIntegrationConfigurationByName', mockIntegrationConfiguration);


        IntegrationServiceFactory.setMock(null, (IntegrationConfigurationService) stub.instance);
        Object returnService;
        Test.startTest();
        {
            returnService = IntegrationServiceFactory.newInstance(configName);
        }
        Test.stopTest();
        System.assertNotEquals(null,returnService);
        System.assert(returnService instanceof  IIntegrationService);

    }

    private static void createMockConfigService(){

        mockIntegrationConfiguration  = new Integration_Configuration__mdt();
        mockIntegrationConfiguration.Label = 'This is a Test Configuration';
        mockIntegrationConfiguration.DeveloperName = configName;
        mockIntegrationConfiguration.Integration_Service_Implementation__c = 'IntegrationService';

    }



}