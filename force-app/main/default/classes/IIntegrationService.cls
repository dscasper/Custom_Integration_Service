
public interface IIntegrationService {

    Object processGet(String jsonBody);
    Object processPost(String jsonBody);
    Object processPut(String jsonBody);
    Object processPatch(String jsonBody);
    Object processDelete(String jsonBody);

}