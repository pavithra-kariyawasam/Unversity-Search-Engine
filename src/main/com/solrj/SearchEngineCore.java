package main.com.solrj;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrClient;

public class SearchEngineCore{
	
	//Create a singelton instance of solr client
	private static SearchEngineCore instance = new SearchEngineCore();
	
	private SolrClient programscore;
	
	private SearchEngineCore() {
		programscore = new HttpSolrClient.Builder("http://localhost:8983/solr/AllUniversityPrograms").build();
		System.out.println("Solr client created "+ ((HttpSolrClient) programscore).getBaseURL());
		
	}
	
	public static SearchEngineCore getInstance() {
		return instance;
	}
	
	public SolrClient getProgramClient() {
		
		return programscore;
	}

}
