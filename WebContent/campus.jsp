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
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Campus Details</title>

<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
    <link href="css/blog-home.css" rel="stylesheet">

</head>
<body onload="initialize()">
 <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">Campus Search</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
      
      <div class="row">

		
       </div>
       
       <div class="row">
		
        <!-- Blog Entries Column -->
        <div class="col-md-5">

          
		  <%
		  
		  SolrDocument document=null;
		  SolrDocumentList docList = (SolrDocumentList) session.getAttribute("docList");
		  try{
		  
		  for (int i = 0; i < 60; i=i+1) {
		  SolrDocument doc = docList.get(i);
		  
			  if (doc.getFieldValue("id").equals(request.getParameter("value")))
			  {
				  document=doc;
			  }
		  }
		  }
		  catch (Exception e)
		  {
			  for (int i = 0; i <docList.size() ; i=i+1) {
				  SolrDocument doc = docList.get(i);
				  
				  
					  if (doc.getFieldValue("id").equals(request.getParameter("value")))
					  {
						  document=doc;
					  }
				  }
		  }

		
		%>
          <!-- Blog Post -->
          <br>
          <div class="card mb-4">
            <div class="card-body">
              <h2 class="card-title"><%=document.getFieldValue("UniversityName")%></h2>
              <p class="card-text"><%=document.getFieldValue("UniversityDescription") %></p>
              <br>
             
             <div style=" list-style: none;">
                <li><%=(String) document.getFieldValue("UniversityType") %></li>
                <li><a href=<%=(String) document.getFieldValue("UniversityWebLink") %>><%=(String) document.getFieldValue("UniversityWebLink") %></a></li>
                <li style="margin-bottom:2px"><%="Location:"+(String) document.getFieldValue("UniversityLocation")%></li>
              	<li><%="Local Rank: "+ (String) document.getFieldValue("UniversityRankSriLanka")%></li>
              	<li><%="World Rank: "+document.getFieldValue("UniversityWorldRank") %></li>
              	<li><%="Brances: "+(String) document.getFieldValue("Branch")%></li>
              </div>	
             
              <br>
              <div style=" list-style: none;">
	              <h5><b>Contact Deatils</b></h5>
	              <li><%="Email: "+(String) document.getFieldValue("Email") %></li>
	              <li><%="Tel: "+(String) document.getFieldValue("Tel")%></li>
              
              </div>
              
            </div>
            
          </div>

          
          
        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-7">
	
          
          <!-- Categories Widget -->
          <div class="card my-4">
            <h5 class="card-header">Google Map</h5>
            <div class="card-body">
              <div class="row">
                <div class="col-lg-6">
                   
				    <div class="input-group mb-3">
					  
					  <input id="address" type="text" class="form-control"  value="<%=(String)document.getFieldValue("UniversityLocation")%>" style="width:492px;">
					</div>
					<div id="googleMap" style="width:215%;height:400px;"></div>
					
				
					
					
					<script>
					 var geocoder;
					  var map;
					  function initialize() {
					    geocoder = new google.maps.Geocoder();
					    var latlng = new google.maps.LatLng(-34.397, 150.644);
					    var mapOptions = {
					      zoom: 8,
					      center: latlng,

					    }
					    
					    var address = document.getElementById('address').value;
					    geocoder.geocode( { 'address': address}, function(results, status) {
					      if (status == 'OK') {
					        map.setCenter(results[0].geometry.location);
					        var marker = new google.maps.Marker({
					            map: map,
					            position: results[0].geometry.location
					        });
					      } else {
					        alert('Geocode was not successful for the following reason: ' + status);
					      }
					    });
					    map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);
					  }

					</script>
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEi7FXvDzHECHLiJnA04ln95RVSntXdZ8&callback=myMap"></script>
					<!--
					To use this code on your website, get a free API key from Google.
					Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
					-->
                </div>
                
              </div>
            </div>
          </div>

         

        </div>

      </div>
      <!-- /.row -->

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