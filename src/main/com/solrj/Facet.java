package main.com.solrj;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.common.SolrDocumentList;

/**
 * Servlet implementation class Facet
 */
@WebServlet("/Facet")
public class Facet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Facet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String moratuwacheck=(String)request.getParameter("moratuwacheck");
		String cirpcheck=(String)request.getParameter("CIRPcheck");
		String horizoncheck=(String)request.getParameter("Horizoncheck");
		String nibmcheck=(String)request.getParameter("NIBMcheck");
		String colombocheck=(String)request.getParameter("colombocheck");
		String sliitcheck=(String)request.getParameter("SLIITcheck");
		String jepuracheck=(String)request.getParameter("jepuracheck");
		
		String Government=(String)request.getParameter("Government");
		String Private=(String)request.getParameter("Private");

		
		String undergraduate=(String)request.getParameter("undergraduate");
		String postgraduate=(String)request.getParameter("postgraduate");
		String certificate=(String)request.getParameter("certificate");
		String diploma=(String)request.getParameter("diploma");

		System.out.println(moratuwacheck);
		
		String UGCQualificationapproved=(String)request.getParameter("UGCQualificationapproved");
		String UGCQualificationunapproved=(String)request.getParameter("UGCQualificationunapproved");
		
		//UniversityName
		
		String UniversityName = null,UniversityType = null,ProgramType = null,UGCQualification = null;
		if(!(moratuwacheck==null))
		{
			UniversityName="University of Moratuwa";
			
		}
		if(!(cirpcheck==null))
		{
			UniversityName="Colombo Institute Of Research & Psychology(CIRP)";
		}
		if(!(horizoncheck==null))
		{
			UniversityName="Horizon Campus";
		}
		if(!(nibmcheck==null))
		{
			UniversityName="National Institute of Business Management(NIBM)";
		}
		if(!(sliitcheck==null))
		{
			UniversityName="SriLanka Institute of Information Technology(SLIIT)";
		}
		if(!(jepuracheck==null))
		{
			UniversityName="University of Sri Jayewardenepura";
		}
		if(!(colombocheck==null))
		{
			UniversityName="University of Colombo";
		}
		
		//UniversityName type
		if(!(Government==null))
		{
			UniversityType="Government";
		}
		if(!(Private==null))
		{
			UniversityType="Private";
		}
		
		//program type
		if(!(undergraduate==null))
		{
			ProgramType="undegraduate";
		}
		if(!(postgraduate==null))
		{
			ProgramType="Post Graduate";
		}
		if(!(certificate==null))
		{
			ProgramType="Certificate";
		}
		if(!(diploma==null))
		{
			ProgramType="Diploma";
		}
		
		
		//UGCQualification
		if(!(UGCQualificationapproved==null))
		{
			UGCQualification="UGCQualification approved";
		}if(!(UGCQualificationunapproved==null))
		{
			UGCQualification="UGCQualification unapproved";
		}
		
		
		SolrDocumentList l;
		
		//
			try {
				
			//	if((!(UniversityName==null))&&(!(UGCQualification==null))&&(!(ProgramType==null))&&(!(UniversityType==null))) {
				
				l=faceting.group4("UniversityName", UniversityName, "UGCQualification", UGCQualification, "ProgramType", ProgramType, "UniversityType", UniversityType);
			//	}
		        HttpSession session=request.getSession();

				session.setAttribute("docList",l);
				session.setAttribute("query","");

				System.out.println(l);
				System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaa");
			//	}
				
				request.getRequestDispatcher("search.jsp").forward(request, response);
				request.getRequestDispatcher("search2.jsp").forward(request, response);
				request.getRequestDispatcher("search3.jsp").forward(request, response);
				request.getRequestDispatcher("search4.jsp").forward(request, response);
				request.getRequestDispatcher("search5.jsp").forward(request, response);
				request.getRequestDispatcher("search6.jsp").forward(request, response);
				//request.getRequestDispatcher("campus.jsp").forward(request, response);

			
			} catch (SolrServerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

}
