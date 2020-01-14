package main.com.solrj;

import java.io.IOException;
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
import org.apache.solr.common.SolrDocumentList;

/**
 * Servlet implementation class Compare
 */
@WebServlet("/Compare")
public class Compare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compare() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//get values of check box from index page
		String moratuwa1=(String)request.getParameter("moratuwa");
		String cirp=(String)request.getParameter("CIRP");
		String horizon=(String)request.getParameter("Horizon");
		String nibm=(String)request.getParameter("NIBM");
		String colombo=(String)request.getParameter("colombo");
		String sliit=(String)request.getParameter("SLIIT");
		String jepura=(String)request.getParameter("jepura");


		if(moratuwa1==null)
		{
			moratuwa1=" ";
		}
		if(cirp==null)
		{
			cirp=" ";
		}
		if(horizon==null)
		{
			horizon=" ";
		}
		if(nibm==null)
		{
			nibm=" ";
		}
		if(sliit==null)
		{
			sliit=" ";
		}
		if(jepura==null)
		{
			jepura=" ";
		}
		if(colombo==null)
		{
			colombo=" ";
		}

		System.out.println("\n Connecting to solr");
		String urlString = "http://localhost:8983/solr/AllUniversityPrograms";
		HttpSolrClient solr = new HttpSolrClient.Builder(urlString).build();
		solr.setParser(new XMLResponseParser());
		System.out.println("Done connecting");
		
		System.out.println("\n Executing solr query..");
		SolrQuery query = new SolrQuery();
		query.setRows(1000);
		query.set("q", moratuwa1+" "+cirp+" "+horizon+" "+nibm+" "+colombo+" "+sliit+" "+jepura);
		
		System.out.println("Getting results from solr");
		QueryResponse res;
		try {
			res = solr.query(query);
			SolrDocumentList docListAll = res.getResults();

            HttpSession session=request.getSession();
            session.setAttribute("docListAll",docListAll);
            request.setAttribute("moratuwaCampus", moratuwa1);
            request.setAttribute("cirpCampus", cirp);
            request.setAttribute("horizonCampus", horizon);
            request.setAttribute("nibmCampus", nibm);
            request.setAttribute("colomboCampus", colombo);
            request.setAttribute("sliitCampus", sliit);
            request.setAttribute("jepuraCampus", jepura);

			request.getRequestDispatcher("Compare.jsp").forward(request, response);
			

		}
		
		catch (SolrServerException e) {
		e.printStackTrace();
	}

		
		
		
	}

}
