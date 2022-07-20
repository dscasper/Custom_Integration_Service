
public interface IIntegrationService {

    Object processGet(String jsonBody);
    Object processPost(String jsonBody);
    Object processPut(String jsonBody);
    Object processPatch(String jsonBody);
    Object processDelete(String jsonBody);

    Object processGet(String URI, String jsonBody);
    Object processPost(String URI, String jsonBody);
    Object processPut(String URI, String jsonBody);
    Object processPatch(String URI, String jsonBody);
    Object processDelete(String URI, String jsonBody);


}