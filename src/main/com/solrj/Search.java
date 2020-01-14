package main.com.solrj;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;




/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
        HttpSession session=request.getSession();

		//Getting query from index.jsp
		String squery = request.getParameter("squery");
		try {
			SolrDocumentList docList = new SolrDocumentList();
			
			docList=Searching.searchItems(squery);
			
			if(docList.isEmpty()) {
				System.out.println("Empty########");
				List<String> list = new ArrayList<String>();
				list=  Searching.getSuggestion(squery);
				if(list.isEmpty()) System.out.println("Empty");
				else System.out.println("Full");
				//SolrDocumentList doc = null;
				
				session.setAttribute("suggession", list);

				for(String k : list) {
					System.out.println("*****"+k);
					docList = Searching.searchItems(k); 
				}
		}
			

		    
			session.setAttribute("query",squery);
			session.setAttribute("docList",docList);
			System.out.println("squuu"+squery);
			
			SolrDocumentList docList1=null;
			if((squery.toLowerCase().contains("srilanka")||squery.toLowerCase().contains("sri lanka"))||(squery.toLowerCase().contains("universit")||squery.toLowerCase().contains("private")||squery.toLowerCase().contains("government"))||squery.toLowerCase().contains("rank"))
			{
		
				System.out.println("bai");
				String url = "http://localhost:8983/solr/Webo";
				HttpSolrClient solr = new HttpSolrClient.Builder(url).build();
				solr.setParser(new XMLResponseParser());
				
				SolrQuery query = new SolrQuery();
				query.setRows(57);
				query.set("q", "*:*");
				
				
				QueryResponse response1 = solr.query(query);
				
				docList1 = response1.getResults();
				
				
			}
			session.setAttribute("docList1",docList1);
			
	
//////////////////////

			request.getRequestDispatcher("search.jsp").forward(request, response);
			request.getRequestDispatcher("search2.jsp").forward(request, response);
			request.getRequestDispatcher("search3.jsp").forward(request, response);
			request.getRequestDispatcher("search4.jsp").forward(request, response);
			request.getRequestDispatcher("search5.jsp").forward(request, response);
			request.getRequestDispatcher("search6.jsp").forward(request, response);
			request.getRequestDispatcher("campus.jsp").forward(request, response);
			request.getRequestDispatcher("index.jsp").forward(request, response);


/*			response.sendRedirect("campus.jsp");
 * 
 * 
 * 
*/	
			


		} catch (SolrServerException e) {
			e.printStackTrace();
		}
		
		
	}

}
