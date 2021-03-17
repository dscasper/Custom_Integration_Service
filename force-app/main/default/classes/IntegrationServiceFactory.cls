public class IntegrationServiceFactory {

    private static IIntegrationService integrationService;
    private static IntegrationConfigurationService integrationConfigurationService;
    private static Integration_Configuration__mdt integrationConfiguration;

    public static IIntegrationService newInstance(String integrationConfigurationName){

        if(integrationService == null) {
            getIntegrationConfiguration(integrationConfigurationName);
            integrationService = (IIntegrationService) Type.forName(integrationConfiguration.Integration_Service_Implementation__c).newInstance();
        }
        System.debug(integrationService);
        return integrationService;
    }

    private static void getIntegrationConfiguration(String integrationConfigurationName){
        if(integrationConfigurationService == null){
            integrationConfigurationService = new IntegrationConfigurationService();
        }
        integrationConfiguration =  integrationConfigurationService.getIntegrationConfigurationByName(integrationConfigurationName);
    }

    @TestVisible
    private static void setMock(IIntegrationService mockIntegrationService, IntegrationConfigurationService mockIntegrationConfigurationService){
        integrationService = mockIntegrationService;
        integrationConfigurationService = mockIntegrationConfigurationService;
    }


}