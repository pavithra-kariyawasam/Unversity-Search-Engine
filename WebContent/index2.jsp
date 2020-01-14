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
<body style="">


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
    <div class="container" style=" margin:0;">
    <div class="row">
      <div class="col-md-3" style="Background:#000000;color:white">
	      <div  style="margin-top:20px;font-size:12px;">
	      <form name="facet">
	          <button type="button" class="btn btn-success" style="width:100px;height:30px; font-size:10px;margin-left:10px;">Quick search!</button> 
			  <br>
			  <br>
			
			  <h6><b>University Name</b></h6>
		      <ul style="list-style:none;margin-left:-20px;">
			    <li>  <input onClick="return facetcount()" type="checkbox" name="moratuwa" value="University of Moratuwa"> University of Moratuwa</li>
				<li> <input onClick="return facetcount()" type="checkbox" name="CIRP" value="Colombo Institute Of Research & Psychology(CIRP)"> Colombo Institute Of Research & Psychology(CIRP)</li>
				<li> <input onClick="return facetcount()" type="checkbox" name="Horizon" value="Horizon Campus" > Horizon Campus</li>
				<li> <input onClick="return facetcount()" type="checkbox" name="NIBM" value="National Institute of Business Management(NIBM)" > National Institute of Business Management(NIBM)</li>
			    <li><input onClick="return facetcount()" type="checkbox" name="SLIIT" value="SriLanka Institute of Information Technology(SLIIT)"> SriLanka Institute of Information Technology(SLIIT)</li>
				<li> <input onClick="return facetcount()" type="checkbox" name="colombo" value="University of Colombo" > University of Colombo</li>
				<li> <input onClick="return facetcount()" type="checkbox" name="jepura" value="University of Sri Jayewardenepura"> University of Sri Jayewardenepura</li>
				 
			  </ul >
			  <hr>
			  <h6><b>University Type</b></h6>
		      <ul style="list-style:none;margin-left:-20px;">
			      <li><input onClick="return facetcount()" type="checkbox" name="Government" value="Government"> Government</li>
			      <li><input onClick="return facetcount()" type="checkbox" name="Private" value="Private"> Private</li>
			  </ul >
			  <hr>
		      <h6><b>Program Type</b></h6>
		      <ul style="list-style:none;margin-left:-20px;">
			      <li><input onClick="return facetcount()" type="checkbox" name="undergraduate" value="Undergraduate"> Undergraduate</li>
			      <li><input onClick="return facetcount()" type="checkbox" name="postgraduate" value="Postgraduate"> Postgraduate</li>
			      <li><input onClick="return facetcount()" type="checkbox" name="certificate" value="Certificate"> Certificate</li>
			      <li><input onClick="return facetcount()" type="checkbox" name="diploma" value="diploma"> Diploma</li>
			      <li><input onClick="return facetcount()" type="checkbox" name="external" value="external"> External</li>
			      
			      
			  </ul >
			  <hr>
			  <h6><b>UGC Qualification</b></h6>
			  <ul style="list-style:none;margin-left:-20px;">
			      <li><input onClick="return facetcount()" type="checkbox" name="UGCapproved" value="University of Moratuwa"> UGC Approved</li>
			      <li><input onClick="return facetcount()" type="checkbox" name="UGCunapproved" value="University of Moratuwa"> UGC Unapproved</li>
			  </ul>
			  </form>
	      </div>
	      
	      <script>
	      function facetcount() {

          	var NewCount = 0

          	//universities
          	if (document.facet.moratuwa.checked)
          	{
	          	NewCount = NewCount + 1;
	          	
	          	//disable other university options
	          	document.facet.CIRP.disabled=true;
	          	document.facet.Horizon.disabled=true;
	          	document.facet.NIBM.disabled=true;
	          	document.facet.SLIIT.disabled=true;
	          	document.facet.colombo.disabled=true;
	          	document.facet.jepura.disabled=true;

	          	
	          	document.facet.Private.disabled=true;
	          	document.facet.UGCunapproved.disabled=true;
	          	
          	}
          	else{
          		document.facet.CIRP.disabled=false;
	          	document.facet.Horizon.disabled=false;
	          	document.facet.NIBM.disabled=false;
	          	document.facet.SLIIT.disabled=false;
	          	document.facet.colombo.disabled=false;
	          	document.facet.jepura.disabled=false;

          		
	          	document.facet.Private.disabled=false;
	          	document.facet.UGCunapproved.disabled=false;

	          	}
          	
          	
          	
          	if (document.facet.CIRP.checked)
          	{NewCount = NewCount + 1;
          	document.facet.Government.disabled=true;

          	}
          	
          	if (document.facet.Horizon.checked)
          	{NewCount = NewCount + 1}
          	
          	if (document.facet.NIBM.checked)
          	{NewCount = NewCount + 1}
          	
          	if (document.facet.SLIIT.checked)
          	{NewCount = NewCount + 1}

          	if (document.facet.colombo.checked)
          	{NewCount = NewCount + 1}

          	if (document.facet.jepura.checked)
          	{NewCount = NewCount + 1}
          	
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
          	
          	if (document.facet.external.checked)
          		
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
      <div class="col-md-9" style="background:  #2e4d00;margin-right:0px;">
      <div class="row">

      <!-- Search Widget -->
      <div class="col-md-7" style="margin-left:150px;">
      <form action="Search" method=post>
          <div class="card my-4">
            <h5 class="card-header">Search</h5>
            <div class="card-body">
              <div class="input-group">
                <input type="text" name="squery" id="search" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="submit" id="go">Go!</button>
                </span>
              </div>
            </div>
          </div>
     
      </form>
      </div>
      </div>
	 
	 <div class="row">
	 	<h3 style="margin-top:40px;margin-bottom:30px;margin-left:130px;color:white;"><center>Select up to 2 universities to compare</center></h3>
	 
	 </div>



				
     <div class="row" style="margin-left:10px;margin-right:10px;">
        <form action="Compare" method="post" name="compare">
  			<div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <img class="card-img-top" src="images/moratuwa.png" alt="">
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">University of Moratuwa</a>
                  </h4>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="moratuwa" value="University of Moratuwa"> Compare<br>
                </div>
                
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <img class="card-img-top" src="images/CIRP.png" alt="">
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">Colombo Institute Of Research & Psychology(CIRP)</a>
                  </h4>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="CIRP" value="Colombo Institute Of Research & Psychology(CIRP)"> Compare<br>
                </div>
                
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <img class="card-img-top" src="images/horizon.png" alt="">
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">Horizon Campus</a>
                  </h4>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="Horizon" value="Horizon Campus" > Compare<br>
                </div>
                
              </div>
            </div>
		</div>
		<div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <img class="card-img-top" src="images/NIBM.png" alt="">
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">National Institute of Business Management(NIBM)</a>
                  </h4>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="NIBM" value="National Institute of Business Management(NIBM)" > Compare<br>
                </div>
                
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <img class="card-img-top" src="images/sliit.png" alt="">
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">SriLanka Institute of Information Technology(SLIIT)</a>
                  </h4>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="SLIIT" value="SriLanka Institute of Information Technology(SLIIT)"> Compare<br>
                </div>
                
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <img class="card-img-top" src="images/colombo.png" alt="">
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">University of Colombo</a>
                  </h4>
				  
                </div>
                <div class="card-footer">
					  <input onClick="return KeepCount()" type="checkbox" name="colombo" value="University of Colombo" > Compare<br>
                </div>
                
              </div>
            </div>
            </div>
            
            <div class="row">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <img class="card-img-top" src="images/jepura.png" alt="">
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">University of Sri Jayewardenepura</a>
                  </h4>
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
            <center><button type="submit" class="btn btn-primary" name="Submit">Compare Universities ></button></center>
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