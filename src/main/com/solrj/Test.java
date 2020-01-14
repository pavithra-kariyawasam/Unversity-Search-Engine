package main.com.solrj;



import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.beans.DocumentObjectBinder;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;

import main.com.solrj.ProductBean;



public class Test {

	public static void main(String[] args) throws SolrServerException, IOException {

		// List<Product> searchItems = SearchWrapper.searchItems("sports",
		// "Shoes",SortType.publisheddate);

		// List<Product> searchItems = SearchWrapper.searchItems("sports",
		// "Shoes");

		/*List<ProductBean> searchItems = Searching.searchItems("Undergraduate");
		for (ProductBean p : searchItems) {
			System.out.println("id="+p.getId());
			System.out.println(p.getProgramType());
			//System.out.println(p.getPublishedDate());
			 * 
			 * 
		}*/
		
		
		
		
		
		SolrDocumentList docList=  Searching.searchItems("sliit");
		QueryResponse response = null; 
		docList = response.getResults();
		
		List<ProductBean> responseProducts = new LinkedList<ProductBean>();
		for (SolrDocument doc : docList) {
			DocumentObjectBinder bind = new DocumentObjectBinder();
			ProductBean bean = (ProductBean) bind.getBean(ProductBean.class, doc);
			responseProducts.add(bean);
		}
		
		 //SearchWrapper.addToReview("INT015", 5);

		/*List<ProductBean> suggestion = SearchWrapper.getSuggestion("Un");
		for (ProductBean p1 : suggestion) {
			System.out.println(p1.ProgramType);
		}*/
		
		
		/*List<String> suggestion = Searching.getSuggestion("Post");
		for (String type : suggestion) {
			System.out.println(type);
		}*/

	}
}
