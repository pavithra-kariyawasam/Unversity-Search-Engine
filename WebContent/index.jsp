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
</head>
<body >


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
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container" style="margin-left:50px;margin-right:-10px">
    <div class="row">
      <div class="col-md-3" color:rgb(175, 199, 247)">
	      <div class="list-group" style="; style="margin-left:-10px;margin-top:20px;font-size:12px;margin-right:100px;">
	      	 <form name="facet" method=post action="Facet">
			  <button type="submit" class="btn btn-success" style="width:150px;height:50px; font-size:15px;margin-left:50px;margin-top:20px;">Quick search!</button> 
			  <br>
			  <br>
			  <h6><b>University Name</b></h6>
		      <ul class="list-group list-group-flush" style="list-style:none;margin-left:-20px;">
			   	<li class="list-group-item list-group-item-info">  <input onClick="return facetcount1()" type="checkbox" name="moratuwacheck" value="University of Moratuwa" id="cmora"> University of Moratuwa</li>
				<li class="list-group-item list-group-item-info"> <input onClick="return facetcount2()" type="checkbox" name="CIRPcheck" value="Colombo Institute Of Research & Psychology(CIRP)" id="ccirp"> Colombo Institute Of Research & Psychology(CIRP)</li>
				<li class="list-group-item list-group-item-info"> <input onClick="return facetcount3()" type="checkbox" name="Horizoncheck" value="Horizon Campus" > Horizon Campus</li>
				<li class="list-group-item list-group-item-info"> <input onClick="return facetcount4()" type="checkbox" name="NIBMcheck" value="National Institute of Business Management(NIBM)" > National Institute of Business Management(NIBM)</li>
			    <li class="list-group-item list-group-item-info"><input onClick="return facetcount5()" type="checkbox" name="SLIITcheck" value="SriLanka Institute of Information Technology(SLIIT)"> SriLanka Institute of Information Technology(SLIIT)</li>
				<li class="list-group-item list-group-item-info"> <input onClick="return facetcount6()" type="checkbox" name="colombocheck" value="University of Colombo" > University of Colombo</li>
				<li class="list-group-item list-group-item-info"> <input onClick="return facetcount7()" type="checkbox" name="jepuracheck" value="University of Sri Jayewardenepura"> University of Sri Jayewardenepura</li>
				 
			  </ul >
			  <hr>
			  <h6><b>University Type</b></h6>
		      <ul class="list-group list-group-flush"  style="list-style:none;margin-left:-20px;">
			      <li class="list-group-item list-group-item-info"><input  onClick="return facetcount()"  type="checkbox" name="Government" value="Government"> Government</li>
			      <li class="list-group-item list-group-item-info"><input  onClick="return facetcount()"  type="checkbox" name="Private" value="Private"> Private</li>
			  </ul >
			  <hr>
		      <h6><b>Program Type</b></h6>
		      <ul class="list-group list-group-flush"  style="list-style:none;margin-left:-20px;">
			      <li class="list-group-item list-group-item-info"><input  onClick="return facetcount()" type="checkbox" name="undergraduate" value="Undergraduate"> Undergraduate</li>
			      <li class="list-group-item list-group-item-info"><input  onClick="return facetcount()" type="checkbox" name="postgraduate" value="Postgraduate"> Postgraduate</li>
			      <li class="list-group-item list-group-item-info"><input  onClick="return facetcount()" type="checkbox" name="certificate" value="Certificate"> Certificate</li>
			      <li class="list-group-item list-group-item-info"><input  onClick="return facetcount()" type="checkbox" name="diploma" value="diploma"> Diploma</li>
			      
			      
			  </ul >
			  <hr>
			  <h6><b>UGC Qualification</b></h6>
			  <ul class="list-group list-group-flush"  style="list-style:none;margin-left:-20px;">
			      <li class="list-group-item list-group-item-info"><input  onClick="return facetcount()" type="checkbox" name="UGCapproved" value="University of Moratuwa"> UGC Approved</li>
			      <li class="list-group-item list-group-item-info"><input  onClick="return facetcount()" type="checkbox" name="UGCunapproved" value="University of Moratuwa"> UGC Unapproved</li>
			  </ul>
			  </form>
	      </div>
		  
		  <script>
	      function facetcount1() {

          	var NewCount = 0
          	//universities
          	if (document.facet.moratuwacheck.checked)
          	{
	          	NewCount = NewCount + 1;
	          	//disable other university options
	          	document.facet.CIRPcheck.disabled=true;
	          	document.facet.Horizoncheck.disabled=true;
	          	document.facet.NIBMcheck.disabled=true;
	          	document.facet.SLIITcheck.disabled=true;
	          	document.facet.colombocheck.disabled=true;
	          	document.facet.jepuracheck.disabled=true;

	          	
	          	document.facet.Private.disabled=true;
	          	document.facet.UGCunapproved.disabled=true;
	          	
          	}
          	else{
          		document.facet.CIRPcheck.disabled=false;
	          	document.facet.Horizoncheck.disabled=false;
	          	document.facet.NIBMcheck.disabled=false;
	          	document.facet.SLIITcheck.disabled=false;
	          	document.facet.colombocheck.disabled=false;
	          	document.facet.jepuracheck.disabled=false;

          		
	          	document.facet.Private.disabled=false;
	          	document.facet.UGCunapproved.disabled=false;

	          	}
          	
          	
          	
          	
          	
          	//university type
          	if (document.facet.Government.checked)
          	{NewCount = NewCount + 1}
         	if (document.facet.Private.checked)
          	{NewCount = NewCount + 1}
         	
          	//program type
          	 if (document.facet.undergraduate.checked)
          	{NewCount = NewCount + 1} 	
          	
          	if (document.facet.postgraduate.checked)
          	{NewCount = NewCount + 1} 	
          	
          	if (document.facet.certificate.checked)
          	{NewCount = NewCount + 1} 	
          	
          	if (document.facet.diploma.checked)
          	{NewCount = NewCount + 1} 	
          	
          
          	//ugc qualification
          	if (document.facet.UGCapproved.checked)
          	{NewCount = NewCount + 1}
          	 	
          	if (document.facet.UGCunapproved.checked)
              	{NewCount = NewCount + 1}
          	


          	if (NewCount >0)
          	{
          	document.getElementById("search").disabled = true;
          	document.getElementById("go").disabled = true;

          	}
          	if (NewCount ==0)
          	{
          	document.getElementById("search").disabled = false;
          	document.getElementById("go").disabled = false;

          	}
          	} 
	      </script>
	      
	      <script>
	      function facetcount2() {

	          	var NewCount = 0
	          	//universities
	          	
	          	
	          	
	          	 if (document.facet.CIRPcheck.checked)
	          	{
	          		NewCount = NewCount + 1;
	          		//disable other university options
		          	document.facet.moratuwacheck.disabled=true;
		          	document.facet.Horizoncheck.disabled=true;
		          	document.facet.NIBMcheck.disabled=true;
		          	document.facet.SLIITcheck.disabled=true;
		          	document.facet.colombocheck.disabled=true;
		          	document.facet.jepuracheck.disabled=true;

		          	
		          	document.facet.Government.disabled=true;
		          	document.facet.UGCapproved.disabled=true;
		          	
	          	}
	          	else{
	          		document.facet.moratuwacheck.disabled=false;
		          	document.facet.Horizoncheck.disabled=false;
		          	document.facet.NIBMcheck.disabled=false;
		          	document.facet.SLIITcheck.disabled=false;
		          	document.facet.colombocheck.disabled=false;
		          	document.facet.jepuracheck.disabled=false;

	          		
		          	document.facet.Government.disabled=false;
		          	document.facet.UGCapproved.disabled=false;

		          	}
	          	
	          
	          	//university type
	          	if (document.facet.Government.checked)
	          	{NewCount = NewCount + 1}
	         	if (document.facet.Private.checked)
	          	{NewCount = NewCount + 1}
	         	
	          	//program type
	          	 if (document.facet.undergraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.postgraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.certificate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.diploma.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	
	          	//ugc qualification
	          	if (document.facet.UGCapproved.checked)
	          	{NewCount = NewCount + 1}
	          	 	
	          	if (document.facet.UGCunapproved.checked)
	              	{NewCount = NewCount + 1}
	          	


	          	if (NewCount >0)
	          	{
	          	document.getElementById("search").disabled = true;
	          	document.getElementById("go").disabled = true;

	          	}
	          	if (NewCount ==0)
	          	{
	          	document.getElementById("search").disabled = false;
	          	document.getElementById("go").disabled = false;

	          	}
	          	} 
	      
	      </script>
	      
	      <script type="text/javascript">
	      function facetcount3() {

	          	var NewCount = 0
	          	//universities
	          	
	          	if (document.facet.Horizoncheck.checked)
	          	{
	          		NewCount = NewCount + 1;
	          	//disable other university options
		          	document.facet.moratuwacheck.disabled=true;
		          	document.facet.CIRPcheck.disabled=true;
		          	document.facet.NIBMcheck.disabled=true;
		          	document.facet.SLIITcheck.disabled=true;
		          	document.facet.colombocheck.disabled=true;
		          	document.facet.jepuracheck.disabled=true;

		          	
		          	document.facet.Government.disabled=true;
		          	
	          	}
	          	else{
	          		document.facet.moratuwacheck.disabled=false;
		          	document.facet.CIRPcheck.disabled=false;
		          	document.facet.NIBMcheck.disabled=false;
		          	document.facet.SLIITcheck.disabled=false;
		          	document.facet.colombocheck.disabled=false;
		          	document.facet.jepuracheck.disabled=false;

	          		
		          	document.facet.Government.disabled=false;

		          	}
	          
	          	//university type
	          	if (document.facet.Government.checked)
	          	{NewCount = NewCount + 1}
	         	if (document.facet.Private.checked)
	          	{NewCount = NewCount + 1}
	         	
	          	//program type
	          	 if (document.facet.undergraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.postgraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.certificate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.diploma.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	
	          	//ugc qualification
	          	if (document.facet.UGCapproved.checked)
	          	{NewCount = NewCount + 1}
	          	 	
	          	if (document.facet.UGCunapproved.checked)
	              	{NewCount = NewCount + 1}
	          	


	          	if (NewCount >0)
	          	{
	          	document.getElementById("search").disabled = true;
	          	document.getElementById("go").disabled = true;

	          	}
	          	if (NewCount ==0)
	          	{
	          	document.getElementById("search").disabled = false;
	          	document.getElementById("go").disabled = false;

	          	}
	          	} 
	      
	      </script>
	      
	      <script>
	      function facetcount4() {

	          	var NewCount = 0
	          	//universities
	          	
	          	
	          	if (document.facet.NIBMcheck.checked)
	          	{
	          		NewCount = NewCount + 1;
	          	//disable other university options
		          	document.facet.moratuwacheck.disabled=true;
		          	document.facet.CIRPcheck.disabled=true;
		          	document.facet.Horizoncheck.disabled=true;
		          	document.facet.SLIITcheck.disabled=true;
		          	document.facet.colombocheck.disabled=true;
		          	document.facet.jepuracheck.disabled=true;

		          	
		          	document.facet.Government.disabled=true;
		          	
	          	}
	          	else{
	          		document.facet.moratuwacheck.disabled=false;
		          	document.facet.Horizoncheck.disabled=false;
		          	document.facet.Horizoncheck.disabled=false;
		          	document.facet.SLIITcheck.disabled=false;
		          	document.facet.colombocheck.disabled=false;
		          	document.facet.jepuracheck.disabled=false;

	          		
		          	document.facet.Government.disabled=false;

		          	}
	          	
	          	
	          	//university type
	          	if (document.facet.Government.checked)
	          	{NewCount = NewCount + 1}
	         	if (document.facet.Private.checked)
	          	{NewCount = NewCount + 1}
	         	
	          	//program type
	          	 if (document.facet.undergraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.postgraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.certificate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.diploma.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	
	          	//ugc qualification
	          	if (document.facet.UGCapproved.checked)
	          	{NewCount = NewCount + 1}
	          	 	
	          	if (document.facet.UGCunapproved.checked)
	              	{NewCount = NewCount + 1}
	          	


	          	if (NewCount >0)
	          	{
	          	document.getElementById("search").disabled = true;
	          	document.getElementById("go").disabled = true;

	          	}
	          	if (NewCount ==0)
	          	{
	          	document.getElementById("search").disabled = false;
	          	document.getElementById("go").disabled = false;

	          	}
	          	} 
	      
	      </script>
	      
	      <script type="text/javascript">
	      function facetcount5() {

	          	var NewCount = 0
	          	//universities

	          	
	          	if (document.facet.SLIITcheck.checked)
	          	{  
	          		NewCount = NewCount + 1;
	              	//disable other university options
	    	          	document.facet.moratuwacheck.disabled=true;
	    	          	document.facet.CIRPcheck.disabled=true;
	    	          	document.facet.Horizoncheck.disabled=true;
	    	          	document.facet.NIBMcheck.disabled=true;
	    	          	document.facet.colombocheck.disabled=true;
	    	          	document.facet.jepuracheck.disabled=true;

	    	          	
	    	          	document.facet.Government.disabled=true;
	    	          	
	              	}
	              	else{
	              		document.facet.moratuwacheck.disabled=false;
	    	          	document.facet.Horizoncheck.disabled=false;
	    	          	document.facet.NIBMcheck.disabled=false;
	    	          	document.facet.NIBMcheck.disabled=false;
	    	          	document.facet.colombocheck.disabled=false;
	    	          	document.facet.jepuracheck.disabled=false;

	              		
	    	          	document.facet.Government.disabled=false;

	    	          	}
	          	
	          	
	          	//university type
	          	if (document.facet.Government.checked)
	          	{NewCount = NewCount + 1}
	         	if (document.facet.Private.checked)
	          	{NewCount = NewCount + 1}
	         	
	          	//program type
	          	 if (document.facet.undergraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.postgraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.certificate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.diploma.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	
	          	//ugc qualification
	          	if (document.facet.UGCapproved.checked)
	          	{NewCount = NewCount + 1}
	          	 	
	          	if (document.facet.UGCunapproved.checked)
	              	{NewCount = NewCount + 1}
	          	


	          	if (NewCount >0)
	          	{
	          	document.getElementById("search").disabled = true;
	          	document.getElementById("go").disabled = true;

	          	}
	          	if (NewCount ==0)
	          	{
	          	document.getElementById("search").disabled = false;
	          	document.getElementById("go").disabled = false;

	          	}
	          	} 
	      </script>
	      
	      <script type="text/javascript">
	      function facetcount6() {

	          	var NewCount = 0
	          	//universities
	          	
	          	if (document.facet.colombocheck.checked)
	          	{
	          		NewCount = NewCount + 1;

	          	//disable other university options
		          	document.facet.CIRPcheck.disabled=true;
		          	document.facet.Horizoncheck.disabled=true;
		          	document.facet.NIBMcheck.disabled=true;
		          	document.facet.SLIITcheck.disabled=true;
		          	document.facet.moratuwacheck.disabled=true;
		          	document.facet.jepuracheck.disabled=true;

		          	
		          	document.facet.Private.disabled=true;
		          	document.facet.UGCunapproved.disabled=true;
		          	
	          	}
	          	else{
	          		document.facet.CIRPcheck.disabled=false;
		          	document.facet.Horizoncheck.disabled=false;
		          	document.facet.NIBMcheck.disabled=false;
		          	document.facet.SLIITcheck.disabled=false;
		          	document.facet.moratuwacheck.disabled=false;
		          	document.facet.jepuracheck.disabled=false;

	          		
		          	document.facet.Private.disabled=false;
		          	document.facet.UGCunapproved.disabled=false;

	          		
	          	}

	          
	          	
	          	//university type
	          	if (document.facet.Government.checked)
	          	{NewCount = NewCount + 1}
	         	if (document.facet.Private.checked)
	          	{NewCount = NewCount + 1}
	         	
	          	//program type
	          	 if (document.facet.undergraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.postgraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.certificate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.diploma.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	
	          	//ugc qualification
	          	if (document.facet.UGCapproved.checked)
	          	{NewCount = NewCount + 1}
	          	 	
	          	if (document.facet.UGCunapproved.checked)
	              	{NewCount = NewCount + 1}
	          	


	          	if (NewCount >0)
	          	{
	          	document.getElementById("search").disabled = true;
	          	document.getElementById("go").disabled = true;

	          	}
	          	if (NewCount ==0)
	          	{
	          	document.getElementById("search").disabled = false;
	          	document.getElementById("go").disabled = false;

	          	}
	          	} 
	      
	      </script>
	      
	      <script>
	      function facetcount7() {

	          	var NewCount = 0
	          	//universities
	     
	          	if (document.facet.jepuracheck.checked)
	          	{
	          		NewCount = NewCount + 1;
	          	//disable other university options
		          	document.facet.CIRPcheck.disabled=true;
		          	document.facet.Horizoncheck.disabled=true;
		          	document.facet.NIBMcheck.disabled=true;
		          	document.facet.SLIITcheck.disabled=true;
		          	document.facet.moratuwacheck.disabled=true;
		          	document.facet.colombocheck.disabled=true;

		          	
		          	document.facet.Private.disabled=true;
		          	document.facet.UGCunapproved.disabled=true;
		          	
	          	}
	          	else{
	          		document.facet.CIRPcheck.disabled=false;
		          	document.facet.Horizoncheck.disabled=false;
		          	document.facet.NIBMcheck.disabled=false;
		          	document.facet.SLIITcheck.disabled=false;
		          	document.facet.moratuwacheck.disabled=false;
		          	document.facet.colombocheck.disabled=false;

	          		
		          	document.facet.Private.disabled=false;
		          	document.facet.UGCunapproved.disabled=false;

	          		
	          		
	          	}
	          	
	          	//university type
	          	if (document.facet.Government.checked)
	          	{NewCount = NewCount + 1}
	         	if (document.facet.Private.checked)
	          	{NewCount = NewCount + 1}
	         	
	          	//program type
	          	 if (document.facet.undergraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.postgraduate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.certificate.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	if (document.facet.diploma.checked)
	          	{NewCount = NewCount + 1} 	
	          	
	          	
	          	//ugc qualification
	          	if (document.facet.UGCapproved.checked)
	          	{NewCount = NewCount + 1}
	          	 	
	          	if (document.facet.UGCunapproved.checked)
	              	{NewCount = NewCount + 1}
	          	


	          	if (NewCount >0)
	          	{
	          	document.getElementById("search").disabled = true;
	          	document.getElementById("go").disabled = true;

	          	}
	          	if (NewCount ==0)
	          	{
	          	document.getElementById("search").disabled = false;
	          	document.getElementById("go").disabled = false;

	          	}
	          	} 
	      
	      </script>
      </div>
      <div class="col-md-9" style="background:white;margin-right:0px;">
      
			      <br />
			    <div class="card text-center  ">
			  			
			  			<div class="card-body">
					  
					    	
					    	<form action="Search" method=post>
			              <div class="input-group">
			                <input type="text"  aria-label="Large" aria-describedby="inputGroup-sizing-sm" name="squery" id="search" class="form-control" placeholder="Search for..." >
			                <span class="input-group-btn">
			                </span>
			                 &nbsp;<button class="btn btn-primary btn-lg" id="go" type="submit">Search Universities!</button>
			              </div>
			      			</form>
			
					  </div>
					  <div class="card-footer text-muted">
					   	<marquee><h3><center>Select up to two universities to compare</center></h3></marquee>
					  </div>
					</div>
			    <br /><br />
	
     <div class="row" style="margin-left:10px;margin-right:10px;">
        <form action="Compare" method="post" name="compare">
  			<div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100" style="background:#4574d1;">
                <a href="campus.jsp?value1=University of Moratuwa"><img class="card-img-top" src="images/moratuwa.png" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title" style="color:white;">
                    University of Moratuwa
                   <%--  <a href="campus.jsp?value=<%=id %>">University of Moratuwa</a> --%>
                  </h5>
			  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="moratuwa" value="University of Moratuwa"> Compare<br>
                </div>
                
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100"  style="background:#4574d1;">
                <a href ="campus.jsp?value1=Psychology"><img class="card-img-top" src="images/CIRP.png" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title" style="color:white;">
                    Colombo Institute Of Research & Psychology(CIRP)
                  </h5>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="CIRP" value="Colombo Institute Of Research & Psychology(CIRP)"> Compare<br>
                </div>
                
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100" style="background:#4574d1;">
               <a href ="campus.jsp?value1=Horizon"><img class="card-img-top" src="images/horizon.png" alt=""></a>
                <div class="card-body" >
                  <h5 class="card-title" style="color:white;">
                   Horizon Campus
                  </h5>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="Horizon" value="Horizon Campus" > Compare<br>
                </div>
                
              </div>
            </div>
		</div>
		<div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100" style="background:#4574d1;">
                 <a href ="campus.jsp?value1=National"><img class="card-img-top" src="images/NIBM.png" alt=""></a>
                <div class="card-body" >
                  <h5 class="card-title" style="color:white;">
                    National Institute of Business Management(NIBM)
                  </h5>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="NIBM" value="National Institute of Business Management(NIBM)" > Compare<br>
                </div>
                
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100" style="background:#4574d1;">
                <a href ="campus.jsp?value1=SLIIT"> <img class="card-img-top" src="images/sliit.png" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title" style="color:white;">
                    SriLanka Institute of Information Technology(SLIIT)
                  </h5>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="SLIIT" value="SriLanka Institute of Information Technology(SLIIT)"> Compare<br>
                </div>
                
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100" style="background:#4574d1;">
                 <a href ="campus.jsp?value1=University of Colombo"><img class="card-img-top" src="images/colombo.png" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title" style="color:white;">
                    University of Colombo
                  </h5>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="colombo" value="University of Colombo" > Compare<br>
                </div>
                
              </div>
            </div>
            </div>
            
            <div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100" style="background:#4574d1;">
                < <a href ="campus.jsp?value1=Jayewardenepura"><img class="card-img-top" src="images/jepura.png" alt=""></a>
                <div class="card-body">
                  <h5 class="card-title" style="color:white;">
                    University of Sri Jayewardenepura
                  </h5>
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="jepura" value="University of Sri Jayewardenepura"> Compare<br>
                </div>
                
              </div>
            </div>
            </div>
            
            <script type="text/javascript">
            function KeepCount() {

            	var NewCount = 0

            	if (document.compare.moratuwa.checked)
            	{NewCount = NewCount + 1}
            	
            	if (document.compare.CIRP.checked)
            	{NewCount = NewCount + 1}
            	
            	if (document.compare.Horizon.checked)
            	{NewCount = NewCount + 1}
            	
            	if (document.compare.NIBM.checked)
            	{NewCount = NewCount + 1}
            	
            	if (document.compare.SLIIT.checked)
            	{NewCount = NewCount + 1}

            	if (document.compare.colombo.checked)
            	{NewCount = NewCount + 1}

            	if (document.compare.jepura.checked)
            	{NewCount = NewCount + 1}

            	if (NewCount == 3)
            	{
            	alert('Pick Just Two Please')
            	document.compare; return false;
            	}
            	} 
            </script>
            </div>
    <!-- /.row -->
            
            <hr>
            <center><button type="submit" class="btn btn-primary btn-lg" name="Submit">Compare</button></center> <br />
          </form>  
           
</div>
      <hr>
				
		
      

      

  
</div>
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>