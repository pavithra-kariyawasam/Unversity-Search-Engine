package main.com.solrj;

import java.io.IOException;
import java.util.List;

import org.apache.solr.client.solrj.beans.*;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.beans.DocumentObjectBinder;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.response.Group;
import org.apache.solr.client.solrj.response.GroupCommand;
import org.apache.solr.client.solrj.response.GroupResponse;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.params.CommonParams;
import org.apache.solr.common.params.GroupParams;

public class faceting {
	//private static SolrClient client = null;

	/*public static void main(String[] args) throws SolrServerException, IOException {
		
		group1("UniversityName", "Horizon Campus");
	}*/
	
	public static SolrDocumentList group1(String field,String text) throws SolrServerException, IOException {
		String urlString = "http://localhost:8983/solr/SLUniversities";
		HttpSolrClient client = new HttpSolrClient.Builder(urlString).build();
		client.setParser(new XMLResponseParser());
		SolrDocumentList docs = null;
		System.out.println(client);
		String q= field+":"+text;
		
		SolrQuery query = new SolrQuery();
		query.set(CommonParams.Q, "*:*");

		query.set(GroupParams.GROUP, "true");
		query.set(GroupParams.GROUP_QUERY, q);
		
		query.set(GroupParams.GROUP_LIMIT, "100");

		System.out.println("Query " + query.toQueryString());

		QueryResponse response = client.query(query);
		GroupResponse groupResponse = response.getGroupResponse();
		for (GroupCommand gCommand : groupResponse.getValues()) {
			for (Group group : gCommand.getValues()) {
				System.out.println("Group " + group.getGroupValue());
				 docs = group.getResult();
				System.out.println(docs);
			}
		}
		return docs;
	}
	
	public static SolrDocumentList group2(String field1,String text1,String field2,String text2) throws SolrServerException, IOException {
		String urlString = "http://localhost:8983/solr/SLUniversities";
		HttpSolrClient client = new HttpSolrClient.Builder(urlString).build();
		client.setParser(new XMLResponseParser());
		SolrDocumentList docs = null;
		System.out.println(client);
		String q1= field1+":"+text1;
		String q2= field2+":"+text2;
		
		SolrQuery query = new SolrQuery();
		query.set(CommonParams.Q, "*:*");

		query.set(GroupParams.GROUP, "true");
		query.set(GroupParams.GROUP_QUERY, q1);
		query.set(GroupParams.GROUP_QUERY, q2);
		
		query.set(GroupParams.GROUP_LIMIT, "100");

		System.out.println("Query " + query.toQueryString());

		QueryResponse response = client.query(query);
		GroupResponse groupResponse = response.getGroupResponse();
		for (GroupCommand gCommand : groupResponse.getValues()) {
			for (Group group : gCommand.getValues()) {
				System.out.println("Group " + group.getGroupValue());
				 docs = group.getResult();
				System.out.println(docs);
			}
		}
		return docs;
	}
	
	public static SolrDocumentList group3(String field1,String text1,String field2,String text2,String field3,String text3) throws SolrServerException, IOException {
		String urlString = "http://localhost:8983/solr/SLUniversities";
		HttpSolrClient client = new HttpSolrClient.Builder(urlString).build();
		client.setParser(new XMLResponseParser());
		SolrDocumentList docs = null;
		System.out.println(client);
		String q1= field1+":"+text1;
		String q2= field2+":"+text2;
		String q3= field3+":"+text3;
		
		SolrQuery query = new SolrQuery();
		query.set(CommonParams.Q, "*:*");

		query.set(GroupParams.GROUP, "true");
		if(!(text1==null))
		query.set(GroupParams.GROUP_QUERY, q1);
		if(!(text2==null))
		query.set(GroupParams.GROUP_QUERY, q2);
		if(!(text3==null))
		query.set(GroupParams.GROUP_QUERY, q3);
		
		query.set(GroupParams.GROUP_LIMIT, "100");

		System.out.println("Query " + query.toQueryString());

		QueryResponse response = client.query(query);
		GroupResponse groupResponse = response.getGroupResponse();
		for (GroupCommand gCommand : groupResponse.getValues()) {
			for (Group group : gCommand.getValues()) {
				System.out.println("Group " + group.getGroupValue());
				 docs = group.getResult();
				System.out.println(docs);
			}
		}
		return docs;
	}

	public static SolrDocumentList group4(String field1,String text1,String field2,String text2,String field3,String text3,String field4,String text4) throws SolrServerException, IOException {
		String urlString = "http://localhost:8983/solr/SLUniversities";
		HttpSolrClient client = new HttpSolrClient.Builder(urlString).build();
		client.setParser(new XMLResponseParser());
		SolrDocumentList docs = null;
		System.out.println(client);
		String q1= field1+":"+text1;
		String q2= field2+":"+text2;
		String q3= field3+":"+text3;
		String q4= field4+":"+text4;
		
		SolrQuery query = new SolrQuery();
		query.set(CommonParams.Q, "*:*");

		query.set(GroupParams.GROUP, "true");
		if(!(text1==null))
		query.set(GroupParams.GROUP_QUERY, q1);
		if(!(text2==null))
		query.set(GroupParams.GROUP_QUERY, q2);
		if(!(text3==null))
		query.set(GroupParams.GROUP_QUERY, q3);
		if(!(text4==null))
		query.set(GroupParams.GROUP_QUERY, q4);
		
		query.set(GroupParams.GROUP_LIMIT, "100");

		System.out.println("Query " + query.toQueryString());

		QueryResponse response = client.query(query);
		GroupResponse groupResponse = response.getGroupResponse();
		for (GroupCommand gCommand : groupResponse.getValues()) {
			for (Group group : gCommand.getValues()) {
				System.out.println("Group " + group.getGroupValue());
				 docs = group.getResult();
				System.out.println(docs);
			}
		}
		return docs;
	}
	
}
