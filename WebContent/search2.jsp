<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException"%>
<%@ page import="org.apache.solr.client.solrj.SolrQuery"%>
<%@ page import="org.apache.solr.client.solrj.SolrServerException"%>
<%@ page import="org.apache.solr.client.solrj.impl.HttpSolrClient"%>
<%@ page import="org.apache.solr.client.solrj.impl.XMLResponseParser"%>
<%@ page import="org.apache.solr.client.solrj.response.QueryResponse"%>
<%@ page import="org.apache.solr.common.SolrDocument"%>
<%@ page import="org.apache.solr.common.SolrDocumentList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Campus Search</title>

<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/1-col-portfolio.css" rel="stylesheet">


<style type="text/css">
.active{
	    background-color:#cccccc;

}

hr { 
    display: block;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    margin-left: auto;
    margin-right: auto;
    border-style: inset;
    border-width: 1px;
    border-color:#084ed8;
}
</style>

</head>


<body>


    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">Campus Search</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
      
      <br />
    <div class="card text-center  ">
  			
  			<div class="card-body">
		  
		    	
		    	<form action="Search" method=post>
              <div class="input-group">
                <input type="text"  aria-label="Large" aria-describedby="inputGroup-sizing-sm" name="squery" class="form-control" value = "<%=request.getSession().getAttribute("query").toString() %>" >
                <span class="input-group-btn">
                </span>
                 &nbsp;<button class="btn btn-primary btn-lg" type="submit">Search Universities!</button>
              </div>
      			</form>

		  </div>
		  
		</div>
    <br /><br />
      
      
      
	 
<%
SolrDocumentList docList = (SolrDocumentList) session.getAttribute("docList");
try{
	for (int i = 10; i < 20; i=i+1) {
	SolrDocument doc = docList.get(i);
	
	String image=null;
	String id=(String) doc.getFieldValue("id");
	String Branch=(String) doc.getFieldValue("Branch");
	String DegreeDescription=(String) doc.getFieldValue("DegreeDescription");
	String DegreeLink=(String) doc.getFieldValue("DegreeLink");
	String DegreeName=(String) doc.getFieldValue("DegreeName");
	String Email=(String) doc.getFieldValue("Email");
	String EntryQualification=(String) doc.getFieldValue("EntryQualification");
	String FacultyLink=(String) doc.getFieldValue("FacultyLink");
	String FacultyName=(String) doc.getFieldValue("FacultyName");
	String ProgramCatagory=(String) doc.getFieldValue("ProgramCatagory");
	String ProgramType=(String) doc.getFieldValue("ProgramType");
	String ProgramTypeLink=(String) doc.getFieldValue("ProgramTypeLink");
	String Tel=(String) doc.getFieldValue("Tel");
	String UGCQualification=(String) doc.getFieldValue("UGCQualification");
	String UniversityDescription=(String) doc.getFieldValue("UniversityDescription");
	String UniversityLocation=(String) doc.getFieldValue("UniversityLocation");
	String UniversityName=(String) doc.getFieldValue("UniversityName");
	String UniversityRankSriLanka=(String) doc.getFieldValue("UniversityRankSriLanka");
	String UniversityType=(String) doc.getFieldValue("UniversityType");
	String UniversityWebLink=(String) doc.getFieldValue("UniversityWebLink");
	String UniversityWorldRank=(String) doc.getFieldValue("UniversityWorldRank");
	
	if (DegreeDescription!=null)
	{
		if(DegreeDescription.length()>480)
		{
		 DegreeDescription=DegreeDescription.substring(0,480)+"(...)";
		}
	}
	if (UniversityName.equals( "University of Moratuwa"))
	{
		System.out.println("hai");
	
		 image="images/moratuwa.png";
	}
	else if (UniversityName.equals("Colombo Institute Of Research & Psychology(CIRP)"))
	{
		 image="images/CIRP.png";
	
	}
	else if (UniversityName.equals("Horizon Campus"))
	{
		 image="images/horizon.png";
	
	}
	else if (UniversityName.equals("National Institute of Business Management(NIBM)"))
	{
		 image="images/NIBM.png";
	
	}
	else if (UniversityName.equals("SriLanka Institute of Information Technology(SLIIT)"))
	{
		 image="images/sliit.png";
	
	}
	else if (UniversityName.equals("University of Colombo"))
	{
		 image="images/colombo.png";
	
	}
	else if (UniversityName.equals("University of Sri Jayewardenepura"))
	{
		 image="images/jepura.png";
	
	}
	
	if (DegreeDescription==null)
	{
		DegreeDescription=" ";
		DegreeLink=ProgramTypeLink;
	
	} 


%>		
				<!-- Project One -->
      <div class="row">
        <div class="col-md-6">
         <div class="card my-4" >
            <h5 class="card-header" ><%=UniversityName %></h5>
            <div class="card-body">
	            <a href="campus.jsp?value=<%=id %>" >
	             <img class="img-fluid rounded mb-3 mb-md-0" src=<%= image%> alt=""  >
	            </a>
	        </div>
	     </div>
        </div>
        <div class="col-md-5" >
          <h3 style="margin-top:15px;"><%=DegreeName%></h3>
          <p ><%=DegreeDescription%>
          <br>
           <a href=  <%=DegreeLink%>><%=DegreeLink%> </a>
          </p>
          
          
          <a  class="btn btn-primary" href="Degree.jsp?value=<%=id %>" style={top:-100px}>Read More</a>
        </div>
      </div>
      <!-- /.row -->

      <hr>
				
<%	}
}
catch (Exception e)
{
	System.out.println("End of the results");
  }




%>
      

      

      <!-- Pagination -->
      <form action="Search" method=post>
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="search.jsp" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="search.jsp" >1</a>
        </li>
        <li class="page-item" >
          <a class="page-link active" href="search2.jsp" >2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="search3.jsp">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="search4.jsp">4</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="search5.jsp">5</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="search6.jsp">6</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="search3.jsp" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>
    </form>
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Campus Search 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>