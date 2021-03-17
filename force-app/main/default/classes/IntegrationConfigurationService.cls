public class IntegrationConfigurationService {

    private List<Integration_Configuration__mdt> integrationConfigurations;
    public Integration_Configuration__mdt getIntegrationConfigurationByName(String integrationConfigurationName){

        selectIntegrationConfiguration(integrationConfigurationName);
        if(integrationConfigurations.isEmpty()){
            throw new IntegrationConfigurationServiceException('There is no integration configured with that name');
        }
        return  integrationConfigurations[0];

    }

    @TestVisible
    private void setMock(Integration_Configuration__mdt mockIntegrationConfiguration){
        integrationConfigurations = new List<Integration_Configuration__mdt>();
        integrationConfigurations.add(mockIntegrationConfiguration);
    }

    private void selectIntegrationConfiguration(String integrationConfigurationName){

        if(integrationConfigurations ==null){
            integrationConfigurations = new List<Integration_Configuration__mdt>();
        }
        integrationConfigurations.addAll([SELECT
                Id,
                Label,
                DeveloperName,
                Integration_Service_Implementation__c
        FROM Integration_Configuration__mdt WHERE DeveloperName =: integrationConfigurationName]);

    }

    public class IntegrationConfigurationServiceException extends Exception{}

}