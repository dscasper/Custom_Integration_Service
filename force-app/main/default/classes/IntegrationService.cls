public virtual class IntegrationService implements IIntegrationService {

    final static String RESOURCE_MISSING = 'The requested resource does not exist';

    public IntegrationService() {

    }
    public virtual Object processGet(String jsonBody) {
        return processGet('', jsonBody);
    }

    public virtual Object processGet(String URI, String jsonBody) {
        throw new IntegrationServiceException(404, RESOURCE_MISSING);
    }

    public virtual Object processPost(String jsonBody) {
        return processPost('', jsonBody);
    }

    public virtual Object processPost(String URI, String jsonBody) {
        throw new IntegrationServiceException(404, RESOURCE_MISSING);
    }

    public virtual Object processPut(String jsonBody) {
        return processPut('', jsonBody);
    }

    public virtual Object processPut(String URI, String jsonBody) {
        throw new IntegrationServiceException(404, RESOURCE_MISSING);
    }

    public virtual Object processPatch(String jsonBody) {
        return processPatch('', jsonBody);
    }

    public virtual Object processPatch(String URI, String jsonBody) {
        throw new IntegrationServiceException(404, RESOURCE_MISSING);
    }

    public virtual Object processDelete(String jsonBody) {
        return processDelete('', jsonBody);
    }

    public virtual Object processDelete(String URI, String jsonBody) {
        throw new IntegrationServiceException(404, RESOURCE_MISSING);
    }

    public class IntegrationServiceException extends Exception {
        public IntegrationServiceException(Integer code, String message){
            this.StatusCode = code;
            this.setMessage(message);
        }
        public Integer StatusCode;
    }
}
