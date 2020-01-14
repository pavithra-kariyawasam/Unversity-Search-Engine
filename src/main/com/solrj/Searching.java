package main.com.solrj;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.beans.DocumentObjectBinder;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.params.CommonParams;
import org.apache.solr.common.util.SimpleOrderedMap;



public class Searching {

public enum SortType {
		
	}

	public static SolrDocumentList searchItems(String text) throws SolrServerException, IOException {
		return searchItems(null, text);
	}

	public static SolrDocumentList searchItems(String category, String text) throws SolrServerException, IOException {
		return searchItems(null, text, null);
	}

	public static SolrDocumentList searchItems(String category, String text, SortType sortType) throws SolrServerException, IOException {
		return searchItems(null, text, sortType, null);
	}

	public static SolrDocumentList searchItems(String category, String text, SortType sortType, String... fields) throws SolrServerException, IOException {
		//List<SolrDocumentList> responseProducts = new LinkedList<SolrDocumentList>();

		SolrQuery query = new SolrQuery();
		SolrQuery query1 = new SolrQuery();
		query1.add("?q=University%20Of%20Moratuwa%20Bandaranayake%20Mawatha%20Moratuwa%2010490");
		System.out.println("ffffff"+query1.toQueryString());
		StringBuffer sb = new StringBuffer();
		if (category != null) {
			//sb.append("ProgramType:" + category);
			//sb.append(" OR ");
		}

		
		query.setRows(60);
		//query.set("q","sliit");
		query.set("q", text);
		 
		String[] words=text.split("\\s");
		for(int i=0;i<words.length;i++) {
			
			query.add("fq",words[i]);

		}
		
		
		//query.setParam(CommonParams.Q);
		//sb.append("title:" + text + " OR description:" + text);
		/*if (sortType != null && sortType == SortType.publisheddate) {
			query.addSort("publishdate", ORDER.desc);
		}*/

		if (fields != null && fields.length > 0) {
			for (String field : fields) {
				query.addField(field);
			}
		}

		//query.set(CommonParams.Q, sb.toString());

		System.out.println("Query formed as " + query.toQueryString());
		//SolrClient solr = SearchEngineCore.getInstance().getProgramClient();
		
		String urlString = "http://localhost:8983/solr/SLUniversities";
		HttpSolrClient solr = new HttpSolrClient.Builder(urlString).build();
		solr.setParser(new XMLResponseParser());
		
		QueryResponse response = solr.query(query);
		System.out.println(solr);
		
		
		
		SolrDocumentList docList = response.getResults();

		//printAsDocuments(docList);
		
		/*for (SolrDocument doc : docList) {
			DocumentObjectBinder bind = new DocumentObjectBinder();
			ProductBean bean = (ProductBean) bind.getBean(ProductBean.class, doc);
			responseProducts.add(bean);
		}*/
		
		QueryResponse response1 = solr.query(query1);
		SolrDocumentList docList1 = response1.getResults();
		System.out.println("@#$$$$$Q$"+docList1);
		return docList;
	}
private static void printAsDocuments(SolrDocumentList documentList) {
		
		for(SolrDocument document : documentList) {
			Object object = document.get(SolrConstant.id);
			
		}
		
	}
	
	public static List<String> getSuggestion(String text) throws SolrServerException, IOException {
		SolrClient solr = SearchEngineCore.getInstance().getProgramClient();
		
		SolrQuery query = new SolrQuery();
		query.setParam(CommonParams.QT, "/suggest");
		query.set("suggest.q", text);
		query.set("suggest.count", 10);
		query.set("suggest.build", "true");
		query.set("suggest.dictionary", "mySuggester");
		//query.setParam(CommonParams.QT, "/suggest");
		
		List<String> list = new ArrayList<String>();
		
		System.out.println("Query " + query.toQueryString());
		

		String urlString1 = "http://localhost:8983/solr/SLUniversities";
		HttpSolrClient solr1 = new HttpSolrClient.Builder(urlString1).build();
		solr1.setParser(new XMLResponseParser());
		
		QueryResponse response = solr.query(query);
		
		LinkedHashMap<String, SimpleOrderedMap<?>> l = (LinkedHashMap<String, SimpleOrderedMap<?>>) response.getResponse().get("suggest");
		if (l != null && !l.isEmpty()) {
			SimpleOrderedMap<?> object2 = (SimpleOrderedMap<?>) l.get("mySuggester");
			if (object2 != null && object2.size() > 0) {
				SimpleOrderedMap<?> object5 = (SimpleOrderedMap<?>) object2.get(text);
				if (object5 != null && object5.size() > 0) {

					ArrayList<SimpleOrderedMap> ss = (ArrayList<SimpleOrderedMap>) object5.get("suggestions");
					for (org.apache.solr.common.util.SimpleOrderedMap k : ss) {
						String item = (String) k.get("term");
						list.add(item);
					}
				}
			}
		}
	
      /* SolrDocumentList docList = response.getResults();
       if(docList.isEmpty()) {System.out.println("Empty");}
       else
       { System.out.println("False");}
      // printAsDocuments(docList);
		
		for (SolrDocument doc : docList) {
		
			DocumentObjectBinder bind = new DocumentObjectBinder();
			ProductBean bean = (ProductBean) bind.getBean(ProductBean.class, doc);
			list.add(bean);
		}*/
		return list;
		
	
		
	}
	
}
	
	