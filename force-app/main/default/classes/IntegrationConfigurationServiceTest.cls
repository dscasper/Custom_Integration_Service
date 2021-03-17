@IsTest
private class IntegrationConfigurationServiceTest {

    private static Integration_Configuration__mdt mockIntegrationConfiguration;

    @IsTest
    static void getIntegrationConfigurationByNameSuccess() {

        setMockIntegrationConfiguration();
        IntegrationConfigurationService integrationConfigurationService = new IntegrationConfigurationService();
        integrationConfigurationService.setMock(mockIntegrationConfiguration);
        Integration_Configuration__mdt returnIntegrationConfiguration;
        Test.startTest();
        {
            returnIntegrationConfiguration = integrationConfigurationService.getIntegrationConfigurationByName(mockIntegrationConfiguration.DeveloperName);
        }
        Test.stopTest();

        System.assertNotEquals(null, returnIntegrationConfiguration);
        System.assertEquals(mockIntegrationConfiguration.Label, returnIntegrationConfiguration.Label);

    }


    @IsTest
    static void getIntegrationConfigurationByNameException() {

        IntegrationConfigurationService integrationConfigurationService = new IntegrationConfigurationService();
        Integration_Configuration__mdt returnIntegrationConfiguration;
        Test.startTest();
        {
            try {
                returnIntegrationConfiguration = integrationConfigurationService.getIntegrationConfigurationByName('NoConfigName');
                System.assert(false, 'Exception Expected');
            } catch (IntegrationConfigurationService.IntegrationConfigurationServiceException serviceException) {
                System.assert(true, 'Received the correct exception');
            } catch (Exception ex) {
                System.assert(false, 'Wrong Exception Received: ' + ex.getMessage());
            }

        }
        Test.stopTest();

        System.assertEquals(null, returnIntegrationConfiguration);

    }

    private static void setMockIntegrationConfiguration(){

        mockIntegrationConfiguration  = new Integration_Configuration__mdt();
        mockIntegrationConfiguration.Label = 'This is a Test Configuration';
        mockIntegrationConfiguration.DeveloperName = 'TestConfig';
        mockIntegrationConfiguration.Integration_Service_Implementation__c = 'TestIntegrationService';

    }
}