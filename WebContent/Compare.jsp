<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.apache.solr.client.solrj.SolrQuery"%>
<%@ page import="org.apache.solr.client.solrj.SolrServerException"%>
<%@ page import="org.apache.solr.client.solrj.impl.HttpSolrClient"%>
<%@ page import="org.apache.solr.client.solrj.impl.XMLResponseParser"%>
<%@ page import="org.apache.solr.client.solrj.response.QueryResponse"%>
<%@ page import="org.apache.solr.common.SolrDocument"%>
<%@ page import="org.apache.solr.common.SolrDocumentList"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Set"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Compare campus</title>

<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/1-col-portfolio.css" rel="stylesheet">

<style>
@import "https://fonts.googleapis.com/css?family=Montserrat:300,400,700";
.rwd-table {
  margin: 1em 0;
  min-width: 300px;
}
.rwd-table tr {
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
}
.rwd-table th {
  display: none;
}
.rwd-table td {
  display: block;
}
.rwd-table td:first-child {
  padding-top: .5em;
}
.rwd-table td:last-child {
  padding-bottom: .5em;
}
.rwd-table td:before {
  content: attr(data-th) ": ";
  font-weight: bold;
  width: 6.5em;
  display: inline-block;
}
@media (min-width: 480px) {
  .rwd-table td:before {
    display: none;
  }
}
.rwd-table th, .rwd-table td {
  text-align: left;
}
@media (min-width: 480px) {
  .rwd-table th, .rwd-table td {
    display: table-cell;
    padding: .25em .5em;
  }
  .rwd-table th:first-child, .rwd-table td:first-child {
    padding-left: 0;
  }
  .rwd-table th:last-child, .rwd-table td:last-child {
    padding-right: 0;
  }
}

body {
  font-family: Montserrat, sans-serif;
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
  color: #444;
  background: #eee;
}

h1 {
  font-weight: normal;
  letter-spacing: -1px;
  color: #34495E;
}

.rwd-table {
  background: #34495E;
  color: #fff;
  border-radius: .4em;
  overflow: hidden;
}
.rwd-table tr {
  border-color: #46637f;
}
.rwd-table th, .rwd-table td {
  margin: .5em 1em;
}
@media (min-width: 480px) {
  .rwd-table th, .rwd-table td {
    padding: 1em !important;
  }
}
.rwd-table th, .rwd-table td:before {
  color: #dd5;
}

table, th, td {
    border: 1px solid white;
}

table{
width:100%;
}

th,td{
width:20px;
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
            <li class="nav-item active">
              
            </li>
            	
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">
    <%
SolrDocumentList docList = (SolrDocumentList) session.getAttribute("docListAll");
try{
	//arrayLisst for get all the values of all university in one array variable.

	List<String> uniname=new ArrayList<String>();
	List<String> UniversityLocation=new ArrayList<String>();
   	List<String> UniversityRankSriLanka=new ArrayList<String>();
	List<String> UniversityWorldRank=new ArrayList<String>();
	List<String> Branch=new ArrayList<String>();
	List<String> ugc=new ArrayList<String>();
	List<String> uniType=new ArrayList<String>();
	List<String> Email=new ArrayList<String>();
	List<String> Tel=new ArrayList<String>();
	List<String> progCaegory=new ArrayList<String>();
	List<String> faculty=new ArrayList<String>();
	List<String> progType=new ArrayList<String>();

	

	//arrayLisst for get all the values of each university in seperate variables.
    List<String> UniversityLocation1=new ArrayList<String>();
    List<String> UniversityLocation2=new ArrayList<String>();
    List<String> UniversityLocation3=new ArrayList<String>();
    List<String> UniversityLocation4=new ArrayList<String>();
    List<String> UniversityLocation5=new ArrayList<String>();
    List<String> UniversityLocation6=new ArrayList<String>();
    List<String> UniversityLocation7=new ArrayList<String>();

	List<String> UniversityRankSriLanka1=new ArrayList<String>();
   	List<String> UniversityRankSriLanka2=new ArrayList<String>();
   	List<String> UniversityRankSriLanka3=new ArrayList<String>();
   	List<String> UniversityRankSriLanka4=new ArrayList<String>();
   	List<String> UniversityRankSriLanka5=new ArrayList<String>();
   	List<String> UniversityRankSriLanka6=new ArrayList<String>();
   	List<String> UniversityRankSriLanka7=new ArrayList<String>();

	List<String> UniversityWorldRank1=new ArrayList<String>();
	List<String> UniversityWorldRank2=new ArrayList<String>();
	List<String> UniversityWorldRank3=new ArrayList<String>();
	List<String> UniversityWorldRank4=new ArrayList<String>();
	List<String> UniversityWorldRank5=new ArrayList<String>();
	List<String> UniversityWorldRank6=new ArrayList<String>();
	List<String> UniversityWorldRank7=new ArrayList<String>();

	List<String> Branch1=new ArrayList<String>();
	List<String> Branch2=new ArrayList<String>();
	List<String> Branch3=new ArrayList<String>();
	List<String> Branch4=new ArrayList<String>();
	List<String> Branch5=new ArrayList<String>();
	List<String> Branch6=new ArrayList<String>();
	List<String> Branch7=new ArrayList<String>();


	
	List<String> ugc1=new ArrayList<String>();
	List<String> ugc2=new ArrayList<String>();
	List<String> ugc3=new ArrayList<String>();
	List<String> ugc4=new ArrayList<String>();
	List<String> ugc5=new ArrayList<String>();
	List<String> ugc6=new ArrayList<String>();
	List<String> ugc7=new ArrayList<String>();
	
	
    List<String> uniType1=new ArrayList<String>();
	List<String> uniType2=new ArrayList<String>();
	List<String> uniType3=new ArrayList<String>();
	List<String> uniType4=new ArrayList<String>();
	List<String> uniType5=new ArrayList<String>();
	List<String> uniType6=new ArrayList<String>();
	List<String> uniType7=new ArrayList<String>();
	
	List<String> Email1=new ArrayList<String>();
	List<String> Email2=new ArrayList<String>();
	List<String> Email3=new ArrayList<String>();
	List<String> Email4=new ArrayList<String>();
	List<String> Email5=new ArrayList<String>();
	List<String> Email6=new ArrayList<String>();
	List<String> Email7=new ArrayList<String>();
	
	List<String> Tel1=new ArrayList<String>();
	List<String> Tel2=new ArrayList<String>();
	List<String> Tel3=new ArrayList<String>();
	List<String> Tel4=new ArrayList<String>();
	List<String> Tel5=new ArrayList<String>();
	List<String> Tel6=new ArrayList<String>();
	List<String> Tel7=new ArrayList<String>();





	
	List<String> progCategoriesSingleUni1=new ArrayList<String>();
	List<String> progCategoriesSingleUni2=new ArrayList<String>();
	List<String> progCategoriesSingleUni3=new ArrayList<String>();
	List<String> progCategoriesSingleUni4=new ArrayList<String>();
	List<String> progCategoriesSingleUni5=new ArrayList<String>();
	List<String> progCategoriesSingleUni6=new ArrayList<String>();
	List<String> progCategoriesSingleUni7=new ArrayList<String>();
	
	
	
	
	List<String> facultiesSingleUni1=new ArrayList<String>();
	List<String> facultiesSingleUni2=new ArrayList<String>();
	List<String> facultiesSingleUni3=new ArrayList<String>();
	List<String> facultiesSingleUni4=new ArrayList<String>();
	List<String> facultiesSingleUni5=new ArrayList<String>();
	List<String> facultiesSingleUni6=new ArrayList<String>();
	List<String> facultiesSingleUni7=new ArrayList<String>();
	
	List<String> programTypesSingleUni1=new ArrayList<String>();
	List<String> programTypesSingleUni2=new ArrayList<String>();
	List<String> programTypesSingleUni3=new ArrayList<String>();
	List<String> programTypesSingleUni4=new ArrayList<String>();
	List<String> programTypesSingleUni5=new ArrayList<String>();
	List<String> programTypesSingleUni6=new ArrayList<String>();
	List<String> programTypesSingleUni7=new ArrayList<String>();

	
	for (int i = 0; i < docList.size(); i=i+1) {
	SolrDocument doc = docList.get(i);
	
	if(((String)doc.getFieldValue("UniversityName")).equals(request.getAttribute("moratuwaCampus")))
	{
		uniname.add((String)doc.getFieldValue("UniversityName"));
		UniversityLocation1.add((String)doc.getFieldValue("UniversityLocation"));
		UniversityRankSriLanka1.add((String)doc.getFieldValue("UniversityRankSriLanka"));
		UniversityWorldRank1.add((String)doc.getFieldValue("UniversityWorldRank"));
		Branch1.add((String)doc.getFieldValue("Branch"));
		
		uniType1.add((String)doc.getFieldValue("UniversityType"));
		Email1.add((String)doc.getFieldValue("Email"));
		Tel1.add((String)doc.getFieldValue("Tel"));
		ugc1.add((String)doc.getFieldValue("UGCQualification"));
		progCategoriesSingleUni1.add((String)doc.getFieldValue("ProgramCatagory"));
		programTypesSingleUni1.add((String)doc.getFieldValue("ProgramType"));
		facultiesSingleUni1.add((String)doc.getFieldValue("FacultyName"));

		
		
		
	}
	if(((String)doc.getFieldValue("UniversityName")).equals(request.getAttribute("cirpCampus")))
	{
		uniname.add((String)doc.getFieldValue("UniversityName"));
		UniversityLocation2.add((String)doc.getFieldValue("UniversityLocation"));
		UniversityRankSriLanka2.add((String)doc.getFieldValue("UniversityRankSriLanka"));
		UniversityWorldRank2.add((String)doc.getFieldValue("UniversityWorldRank"));
		Branch2.add((String)doc.getFieldValue("Branch"));
		
		uniType2.add((String)doc.getFieldValue("UniversityType"));
		Email2.add((String)doc.getFieldValue("Email"));
		Tel2.add((String)doc.getFieldValue("Tel"));
		ugc2.add((String)doc.getFieldValue("UGCQualification"));
		progCategoriesSingleUni2.add((String)doc.getFieldValue("ProgramCatagory"));
		programTypesSingleUni2.add((String)doc.getFieldValue("ProgramType"));
		facultiesSingleUni2.add((String)doc.getFieldValue("FacultyName"));
	}
	if(((String)doc.getFieldValue("UniversityName")).equals(request.getAttribute("horizonCampus")))
	{
		uniname.add((String)doc.getFieldValue("UniversityName"));
		UniversityLocation3.add((String)doc.getFieldValue("UniversityLocation"));
		UniversityRankSriLanka3.add((String)doc.getFieldValue("UniversityRankSriLanka"));
		UniversityWorldRank3.add((String)doc.getFieldValue("UniversityWorldRank"));
		Branch3.add((String)doc.getFieldValue("Branch"));
		
		uniType3.add((String)doc.getFieldValue("UniversityType"));
		Email3.add((String)doc.getFieldValue("Email"));
		Tel3.add((String)doc.getFieldValue("Tel"));
		ugc3.add((String)doc.getFieldValue("UGCQualification"));
		progCategoriesSingleUni3.add((String)doc.getFieldValue("ProgramCatagory"));
		programTypesSingleUni3.add((String)doc.getFieldValue("ProgramType"));
		facultiesSingleUni3.add((String)doc.getFieldValue("FacultyName"));

	}
	if(((String)doc.getFieldValue("UniversityName")).equals(request.getAttribute("nibmCampus")))
	{
		uniname.add((String)doc.getFieldValue("UniversityName"));
		UniversityLocation4.add((String)doc.getFieldValue("UniversityLocation"));
		UniversityRankSriLanka4.add((String)doc.getFieldValue("UniversityRankSriLanka"));
		UniversityWorldRank4.add((String)doc.getFieldValue("UniversityWorldRank"));
		Branch4.add((String)doc.getFieldValue("Branch"));
		
		uniType4.add((String)doc.getFieldValue("UniversityType"));
		Email4.add((String)doc.getFieldValue("Email"));
		Tel4.add((String)doc.getFieldValue("Tel"));
		ugc4.add((String)doc.getFieldValue("UGCQualification"));
		progCategoriesSingleUni4.add((String)doc.getFieldValue("ProgramCatagory"));
		programTypesSingleUni4.add((String)doc.getFieldValue("ProgramType"));
		facultiesSingleUni4.add((String)doc.getFieldValue("FacultyName"));
	}
	if(((String)doc.getFieldValue("UniversityName")).equals(request.getAttribute("sliitCampus")))
	{
		uniname.add((String)doc.getFieldValue("UniversityName"));
		UniversityLocation5.add((String)doc.getFieldValue("UniversityLocation"));
		UniversityRankSriLanka5.add((String)doc.getFieldValue("UniversityRankSriLanka"));
		UniversityWorldRank5.add((String)doc.getFieldValue("UniversityWorldRank"));
		Branch5.add((String)doc.getFieldValue("Branch"));
		
		uniType5.add((String)doc.getFieldValue("UniversityType"));
		Email5.add((String)doc.getFieldValue("Email"));
		Tel5.add((String)doc.getFieldValue("Tel"));
		ugc5.add((String)doc.getFieldValue("UGCQualification"));
		progCategoriesSingleUni5.add((String)doc.getFieldValue("ProgramCatagory"));
		programTypesSingleUni5.add((String)doc.getFieldValue("ProgramType"));
		facultiesSingleUni5.add((String)doc.getFieldValue("FacultyName"));
	}
	if(((String)doc.getFieldValue("UniversityName")).equals(request.getAttribute("colomboCampus")))
	{
		uniname.add((String)doc.getFieldValue("UniversityName"));
		UniversityLocation6.add((String)doc.getFieldValue("UniversityLocation"));
		UniversityRankSriLanka6.add((String)doc.getFieldValue("UniversityRankSriLanka"));
		UniversityWorldRank6.add((String)doc.getFieldValue("UniversityWorldRank"));
		Branch6.add((String)doc.getFieldValue("Branch"));

		uniType6.add((String)doc.getFieldValue("UniversityType"));
		Email6.add((String)doc.getFieldValue("Email"));
		Tel6.add((String)doc.getFieldValue("Tel"));
		ugc6.add((String)doc.getFieldValue("UGCQualification"));
		progCategoriesSingleUni6.add((String)doc.getFieldValue("ProgramCatagory"));
		programTypesSingleUni6.add((String)doc.getFieldValue("ProgramType"));
		facultiesSingleUni6.add((String)doc.getFieldValue("FacultyName"));
	}
	if(((String)doc.getFieldValue("UniversityName")).equals(request.getAttribute("jepuraCampus")))
	{
		uniname.add((String)doc.getFieldValue("UniversityName"));
		UniversityLocation7.add((String)doc.getFieldValue("UniversityLocation"));
		UniversityRankSriLanka7.add((String)doc.getFieldValue("UniversityRankSriLanka"));
		UniversityWorldRank7.add((String)doc.getFieldValue("UniversityWorldRank"));
		Branch7.add((String)doc.getFieldValue("Branch"));
		
		uniType7.add((String)doc.getFieldValue("UniversityType"));
		Email7.add((String)doc.getFieldValue("Email"));
		Tel7.add((String)doc.getFieldValue("Tel"));
		ugc7.add((String)doc.getFieldValue("UGCQualification"));
		progCategoriesSingleUni7.add((String)doc.getFieldValue("ProgramCatagory"));
		programTypesSingleUni7.add((String)doc.getFieldValue("ProgramType"));
		facultiesSingleUni7.add((String)doc.getFieldValue("FacultyName"));
	}
	
	
	}
	///////////////////////////
	//get unique values from ArrayList for all the universities at once in one array
	Set<String> uninamesunique = new HashSet<String>(uniname);
			
			
	Set<String> UniversityLocationunique1 = new HashSet<String>(UniversityLocation1);
	Set<String> UniversityLocationunique2 = new HashSet<String>(UniversityLocation2);
	Set<String> UniversityLocationunique3 = new HashSet<String>(UniversityLocation3);
	Set<String> UniversityLocationunique4 = new HashSet<String>(UniversityLocation4);
	Set<String> UniversityLocationunique5 = new HashSet<String>(UniversityLocation5);
	Set<String> UniversityLocationunique6 = new HashSet<String>(UniversityLocation6);
	Set<String> UniversityLocationunique7 = new HashSet<String>(UniversityLocation7);

	Set<String> UniversityRankSriLankaunique1 = new HashSet<String>(UniversityRankSriLanka1);
	Set<String> UniversityRankSriLankaunique2 = new HashSet<String>(UniversityRankSriLanka2);
	Set<String> UniversityRankSriLankaunique3 = new HashSet<String>(UniversityRankSriLanka3);
	Set<String> UniversityRankSriLankaunique4 = new HashSet<String>(UniversityRankSriLanka4);
	Set<String> UniversityRankSriLankaunique5 = new HashSet<String>(UniversityRankSriLanka5);
	Set<String> UniversityRankSriLankaunique6 = new HashSet<String>(UniversityRankSriLanka6);
	Set<String> UniversityRankSriLankaunique7 = new HashSet<String>(UniversityRankSriLanka7);

	Set<String> UniversityWorldRankunique1 = new HashSet<String>(UniversityWorldRank1);
	Set<String> UniversityWorldRankunique2 = new HashSet<String>(UniversityWorldRank2);
	Set<String> UniversityWorldRankunique3 = new HashSet<String>(UniversityWorldRank3);
	Set<String> UniversityWorldRankunique4 = new HashSet<String>(UniversityWorldRank4);
	Set<String> UniversityWorldRankunique5 = new HashSet<String>(UniversityWorldRank5);
	Set<String> UniversityWorldRankunique6 = new HashSet<String>(UniversityWorldRank6);
	Set<String> UniversityWorldRankunique7 = new HashSet<String>(UniversityWorldRank7);

	Set<String> Branchunique1 = new HashSet<String>(Branch1);
	Set<String> Branchunique2 = new HashSet<String>(Branch2);
	Set<String> Branchunique3 = new HashSet<String>(Branch3);
	Set<String> Branchunique4 = new HashSet<String>(Branch4);
	Set<String> Branchunique5 = new HashSet<String>(Branch5);
	Set<String> Branchunique6 = new HashSet<String>(Branch6);
	Set<String> Branchunique7 = new HashSet<String>(Branch7);


	/////////////////////////////
	//get unique values of each uni and append it to another array
	Set<String> uniType1unique = new HashSet<String>(uniType1);
	Set<String> uniType2unique = new HashSet<String>(uniType2);
	Set<String> uniType3unique = new HashSet<String>(uniType3);
	Set<String> uniType4unique = new HashSet<String>(uniType4);
	Set<String> uniType5unique = new HashSet<String>(uniType5);
	Set<String> uniType6unique = new HashSet<String>(uniType6);
	Set<String> uniType7unique = new HashSet<String>(uniType7);
		
	Set<String> Emailunique1 = new HashSet<String>(Email1);
	Set<String> Emailunique2 = new HashSet<String>(Email2);
	Set<String> Emailunique3 = new HashSet<String>(Email3);
	Set<String> Emailunique4 = new HashSet<String>(Email4);
	Set<String> Emailunique5 = new HashSet<String>(Email5);
	Set<String> Emailunique6 = new HashSet<String>(Email6);
	Set<String> Emailunique7 = new HashSet<String>(Email7);
	
	Set<String> Telunique1 = new HashSet<String>(Tel1);
	Set<String> Telunique2 = new HashSet<String>(Tel2);
	Set<String> Telunique3 = new HashSet<String>(Tel3);
	Set<String> Telunique4 = new HashSet<String>(Tel4);
	Set<String> Telunique5 = new HashSet<String>(Tel5);
	Set<String> Telunique6 = new HashSet<String>(Tel6);
	Set<String> Telunique7 = new HashSet<String>(Tel7);
	

	Set<String>  ugc1unique = new HashSet<String>(ugc1);
	Set<String>  ugc2unique = new HashSet<String>(ugc2);
	Set<String>  ugc3unique = new HashSet<String>(ugc3);
	Set<String>  ugc4unique = new HashSet<String>(ugc4);
	Set<String>  ugc5unique = new HashSet<String>(ugc5);
	Set<String>  ugc6unique = new HashSet<String>(ugc6);
	Set<String>  ugc7unique = new HashSet<String>(ugc7);
	
	Set<String> progCategoriesSingleUni1unique = new HashSet<String>(progCategoriesSingleUni1);
    Set<String> progCategoriesSingleUni2unique = new HashSet<String>(progCategoriesSingleUni2);
	Set<String> progCategoriesSingleUni3unique = new HashSet<String>(progCategoriesSingleUni3);
	Set<String> progCategoriesSingleUni4unique = new HashSet<String>(progCategoriesSingleUni4);
	Set<String> progCategoriesSingleUni5unique = new HashSet<String>(progCategoriesSingleUni5);
    Set<String> progCategoriesSingleUni6unique = new HashSet<String>(progCategoriesSingleUni6);
	Set<String> progCategoriesSingleUni7unique = new HashSet<String>(progCategoriesSingleUni7); 
				
	Set<String> programTypesSingleUni1unique = new HashSet<String>(programTypesSingleUni1);
	Set<String> programTypesSingleUni2unique = new HashSet<String>(programTypesSingleUni2);
	Set<String> programTypesSingleUni3unique = new HashSet<String>(programTypesSingleUni3);
	Set<String> programTypesSingleUni4unique = new HashSet<String>(programTypesSingleUni4);
	Set<String> programTypesSingleUni5unique = new HashSet<String>(programTypesSingleUni5);
    Set<String> programTypesSingleUni6unique = new HashSet<String>(programTypesSingleUni6);
	Set<String> programTypesSingleUni7unique = new HashSet<String>(programTypesSingleUni7);
				
				
	Set<String> facultiesSingleUni1unique = new HashSet<String>(facultiesSingleUni1);
	Set<String> facultiesSingleUni2unique = new HashSet<String>(facultiesSingleUni2);
	Set<String> facultiesSingleUni3unique = new HashSet<String>(facultiesSingleUni3);
	Set<String> facultiesSingleUni4unique = new HashSet<String>(facultiesSingleUni4);
	Set<String> facultiesSingleUni5unique = new HashSet<String>(facultiesSingleUni5);
    Set<String> facultiesSingleUni6unique = new HashSet<String>(facultiesSingleUni6);
	Set<String> facultiesSingleUni7unique = new HashSet<String>(facultiesSingleUni7); 
			
		
	
	        for(String uni:uninamesunique)
	           {
	              
					
				    if (uni.equals("University of Moratuwa"))
					  {
				    	for (String ul:UniversityLocationunique1){UniversityLocation.add(ul);}
				    	for(String us:UniversityRankSriLankaunique1){UniversityRankSriLanka.add(us);}
				    	for(String uw:UniversityWorldRankunique1){UniversityWorldRank.add(uw);}
				    	for(String br:Branchunique1){Branch.add(br);}
				    	//add values to uniType
							if (!uniType1unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder type1 = new StringBuilder();		
								for(String ty:uniType1unique)
								{
									type1.append((String)ty+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								uniType.add((type1.toString()));

						    }
				    	
					    	//add values to Email

							if (!Emailunique1.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder email = new StringBuilder();		
								for(String em:Emailunique1)
								{
									email.append((String)em+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Email.add((email.toString()));
								
							} 
					    	
							if (!Telunique1.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder tel = new StringBuilder();		
								for(String te:Telunique1)
								{
									tel.append((String)te+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Tel.add((tel.toString()));
								
							} 
							
							if (!ugc1unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder UGC = new StringBuilder();		
								for(String ug:ugc1unique)
								{
									UGC.append((String)ug+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								ugc.add((UGC.toString()));
								
							} 
							
							if (!progCategoriesSingleUni1unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder category = new StringBuilder();		
								for(String cat:progCategoriesSingleUni1unique)
								{
									category.append((String)cat+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								progCaegory.add((category.toString()));
								
							} 
							
							if (!programTypesSingleUni1unique.isEmpty())
							{
								StringBuilder type = new StringBuilder();		
								for(String ty:programTypesSingleUni1unique)
								{
									type.append((String)ty+",");
								}
								progType.add((type.toString()));
								
							} 
							
							if (!facultiesSingleUni1unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder facult = new StringBuilder();		
								for(String fac:facultiesSingleUni1unique)
								{
									facult.append((String)fac+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								faculty.add((facult.toString()));
								
							} 
					  }
						if (uni.equals("Colombo Institute Of Research & Psychology(CIRP)"))
						{
							for (String ul:UniversityLocationunique2){UniversityLocation.add(ul);}
					    	for(String us:UniversityRankSriLankaunique2){UniversityRankSriLanka.add(us);}
					    	for(String uw:UniversityWorldRankunique2){UniversityWorldRank.add(uw);}
					    	for(String br:Branchunique2){Branch.add(br);}
					    	//add values to uniType

							if (!uniType2unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder type1 = new StringBuilder();		
								for(String ty:uniType2unique)
								{
									type1.append((String)ty+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								uniType.add((type1.toString()));
								
							} 
					    	
							if (!Emailunique2.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder email = new StringBuilder();		
								for(String em:Emailunique2)
								{
									email.append((String)em+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Email.add((email.toString()));
								
							} 
							
							if (!Telunique2.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder tel = new StringBuilder();		
								for(String te:Telunique2)
								{
									tel.append((String)te+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Tel.add((tel.toString()));
								
							}
							

							if (!ugc2unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder UGC = new StringBuilder();		
								for(String ug:ugc2unique)
								{
									UGC.append((String)ug+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								ugc.add((UGC.toString()));
								
							} 
							
							if (!progCategoriesSingleUni2unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder category = new StringBuilder();		
								for(String cat:progCategoriesSingleUni2unique)
								{
									category.append((String)cat+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								progCaegory.add((category.toString()));
								
							} 
							
							if (!programTypesSingleUni2unique.isEmpty())
							{
								StringBuilder type = new StringBuilder();		
								for(String ty:programTypesSingleUni2unique)
								{
									type.append((String)ty+",");
								}
								progType.add((type.toString()));
								
							} 
							if (!facultiesSingleUni2unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder facult = new StringBuilder();		
								for(String fac:facultiesSingleUni2unique)
								{
									facult.append((String)fac+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								faculty.add((facult.toString()));
								
							} 
						}
						if (uni.equals("Horizon Campus"))
						{
							for (String ul:UniversityLocationunique3){UniversityLocation.add(ul);}
					    	for(String us:UniversityRankSriLankaunique3){UniversityRankSriLanka.add(us);}
					    	for(String uw:UniversityWorldRankunique3){UniversityWorldRank.add(uw);}
					    	for(String br:Branchunique3){Branch.add(br);}
					    	//add values to uniType

							if (!uniType3unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder type1 = new StringBuilder();		
								for(String ty:uniType3unique)
								{
									type1.append((String)ty+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								uniType.add((type1.toString()));
								
							} 
					    	
							if (!Emailunique3.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder email = new StringBuilder();		
								for(String em:Emailunique3)
								{
									email.append((String)em+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Email.add((email.toString()));
								
							} 
							
							if (!Telunique3.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder tel = new StringBuilder();		
								for(String te:Telunique3)
								{
									tel.append((String)te+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Tel.add((tel.toString()));
								
							}
							
							if (!ugc3unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder UGC = new StringBuilder();		
								for(String ug:ugc3unique)
								{
									UGC.append((String)ug+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								ugc.add((UGC.toString()));
								
							} 
							
							if (!progCategoriesSingleUni3unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder category = new StringBuilder();		
								for(String cat:progCategoriesSingleUni3unique)
								{
									category.append((String)cat+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								progCaegory.add((category.toString()));
								
							} 
							if (!programTypesSingleUni3unique.isEmpty())
							{
								StringBuilder type = new StringBuilder();		
								for(String ty:programTypesSingleUni3unique)
								{
									type.append((String)ty+",");
								}
								progType.add((type.toString()));
								
							} 
							if (!facultiesSingleUni3unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder facult = new StringBuilder();		
								for(String fac:facultiesSingleUni3unique)
								{
									facult.append((String)fac+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								faculty.add((facult.toString()));
								
							} 
						}
						
						if (uni.equals("National Institute of Business Management(NIBM)"))
						{
							for (String ul:UniversityLocationunique4){UniversityLocation.add(ul);}
					    	for(String us:UniversityRankSriLankaunique4){UniversityRankSriLanka.add(us);}
					    	for(String uw:UniversityWorldRankunique4){UniversityWorldRank.add(uw);}
					    	for(String br:Branchunique4){Branch.add(br);}
							
					    	//add values to uniType

							if (!uniType4unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder type1 = new StringBuilder();		
								for(String ty:uniType4unique)
								{
									type1.append((String)ty+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								uniType.add((type1.toString()));
								
							} 
					    	
							if (!Emailunique4.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder email = new StringBuilder();		
								for(String em:Emailunique4)
								{
									email.append((String)em+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Email.add((email.toString()));
								
							} 
							
							 if (!Telunique4.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder tel = new StringBuilder();		
									for(String te:Telunique4)
									{
										tel.append((String)te+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									Tel.add((tel.toString()));
									
								}
							 
								if (!ugc4unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder UGC = new StringBuilder();		
									for(String ug:ugc4unique)
									{
										UGC.append((String)ug+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									ugc.add((UGC.toString()));
									
								} 			
								
								if (!progCategoriesSingleUni4unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder category = new StringBuilder();		
									for(String cat:progCategoriesSingleUni4unique)
									{
										category.append((String)cat+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									progCaegory.add((category.toString()));
									
								} 
								
								if (!programTypesSingleUni4unique.isEmpty())
								{
									StringBuilder type = new StringBuilder();		
									for(String ty:programTypesSingleUni4unique)
									{
										type.append((String)ty+",");
									}
									progType.add((type.toString()));
									
								} 
								
								if (!facultiesSingleUni4unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder facult = new StringBuilder();		
									for(String fac:facultiesSingleUni4unique)
									{
										facult.append((String)fac+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									faculty.add((facult.toString()));
									
								} 
						}
						if (uni.toString().equals("SriLanka Institute of Information Technology(SLIIT)"))
						{
							for (String ul:UniversityLocationunique5){UniversityLocation.add(ul);}
					    	for(String us:UniversityRankSriLankaunique5){UniversityRankSriLanka.add(us);}
					    	for(String uw:UniversityWorldRankunique5){UniversityWorldRank.add(uw);}
					    	for(String br:Branchunique5){Branch.add(br);}
					    	//add values to uniType

							if (!uniType5unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder type1 = new StringBuilder();		
								for(String ty:uniType5unique)
								{
									type1.append((String)ty+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								uniType.add((type1.toString()));
								
							} 
					    	
							if (!Emailunique5.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder email = new StringBuilder();		
								for(String em:Emailunique5)
								{
									email.append((String)em+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Email.add((email.toString()));
								
							} 
							

							  if (!Telunique5.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder tel = new StringBuilder();		
								for(String te:Telunique5)
								{
									tel.append((String)te+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Tel.add((tel.toString()));
								
							}
							  
								
								if (!ugc5unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder UGC = new StringBuilder();		
									for(String ug:ugc5unique)
									{
										UGC.append((String)ug+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									ugc.add((UGC.toString()));
									
								} 
								if (!progCategoriesSingleUni5unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder category = new StringBuilder();		
									for(String cat:progCategoriesSingleUni5unique)
									{
										category.append((String)cat+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									progCaegory.add((category.toString()));
									
								} 
								if (!programTypesSingleUni5unique.isEmpty())
								{
									StringBuilder type = new StringBuilder();		
									for(String ty:programTypesSingleUni5unique)
									{
										type.append((String)ty+",");
									}
									progType.add((type.toString()));
									
								} 
							
								if (!facultiesSingleUni5unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder facult = new StringBuilder();		
									for(String fac:facultiesSingleUni5unique)
									{
										facult.append((String)fac+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									faculty.add((facult.toString()));
									
								}
						}
						if (uni.equals("University of Colombo"))
						{
							for (String ul:UniversityLocationunique6){UniversityLocation.add(ul);}
					    	for(String us:UniversityRankSriLankaunique6){UniversityRankSriLanka.add(us);}
					    	for(String uw:UniversityWorldRankunique6){UniversityWorldRank.add(uw);}
					    	for(String br:Branchunique6){Branch.add(br);}
					    	//add values to uniType

							if (!uniType6unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder type1 = new StringBuilder();		
								for(String ty:uniType6unique)
								{
									type1.append((String)ty+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								uniType.add((type1.toString()));
								
							} 
					    	
							if (!Emailunique6.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder email = new StringBuilder();		
								for(String em:Emailunique6)
								{
									email.append((String)em+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Email.add((email.toString()));
								
							} 
							
							 if (!Telunique6.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder tel = new StringBuilder();		
									for(String te:Telunique6)
									{
										tel.append((String)te+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									Tel.add((tel.toString()));
									
								}
							 
								if (!ugc6unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder UGC = new StringBuilder();		
									for(String ug:ugc6unique)
									{
										UGC.append((String)ug+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									ugc.add((UGC.toString()));
									
								} 
								
								if (!progCategoriesSingleUni6unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder category = new StringBuilder();		
									for(String cat:progCategoriesSingleUni6unique)
									{
										category.append((String)cat+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									progCaegory.add((category.toString()));
									
								} 
							
								if (!programTypesSingleUni6unique.isEmpty())
								{
									StringBuilder type = new StringBuilder();		
									for(String ty:programTypesSingleUni6unique)
									{
										type.append((String)ty+",");
									}
									progType.add((type.toString()));
									
								} 
								if (!facultiesSingleUni6unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder facult = new StringBuilder();		
									for(String fac:facultiesSingleUni6unique)
									{
										facult.append((String)fac+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									faculty.add((facult.toString()));
									
								}
						}
						if (uni.toString().equals("University of Sri Jayewardenepura"))
						{
							for (String ul:UniversityLocationunique7){UniversityLocation.add(ul);}
					    	for(String us:UniversityRankSriLankaunique7){UniversityRankSriLanka.add(us);}
					    	for(String uw:UniversityWorldRankunique7){UniversityWorldRank.add(uw);}
					    	for(String br:Branchunique7){Branch.add(br);}
					    	//add values to uniType

							if (!uniType7unique.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder type1 = new StringBuilder();		
								for(String ty:uniType7unique)
								{
									type1.append((String)ty+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								uniType.add((type1.toString()));
								
							} 
					    	
							if (!Emailunique7.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder email = new StringBuilder();		
								for(String em:Emailunique7)
								{
									email.append((String)em+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Email.add((email.toString()));
								
							} 
							

							 if (!Telunique7.isEmpty())
							{
								//append values of program caegories of mora uni
								StringBuilder tel = new StringBuilder();		
								for(String te:Telunique7)
								{
									tel.append((String)te+",");
								}
								//add the categories of moratuwa uni to all uni category variable.
								Tel.add((tel.toString()));
								
							} 
							 
								if (!ugc7unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder UGC = new StringBuilder();		
									for(String ug:ugc7unique)
									{
										UGC.append((String)ug+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									ugc.add((UGC.toString()));
									
								} 
								if (!progCategoriesSingleUni7unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder category = new StringBuilder();		
									for(String cat:progCategoriesSingleUni7unique)
									{
										category.append((String)cat+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									progCaegory.add((category.toString()));
									
								} 
							
								if (!programTypesSingleUni7unique.isEmpty())
								{
									StringBuilder type = new StringBuilder();		
									for(String ty:programTypesSingleUni7unique)
									{
										type.append((String)ty+",");
									}
									progType.add((type.toString()));
									
								} 
								if (!facultiesSingleUni7unique.isEmpty())
								{
									//append values of program caegories of mora uni
									StringBuilder facult = new StringBuilder();		
									for(String fac:facultiesSingleUni7unique)
									{
										facult.append((String)fac+",");
									}
									//add the categories of moratuwa uni to all uni category variable.
									faculty.add((facult.toString()));
									
								} 
								

							
						}
						
						
					}
					
										
				 
				
				
				
				
				
				
				
				
	
				
				
				
				
				
				
				
	


				
				
				
				
				
				
				
	
	
		
	System.out.println(uninamesunique );
	System.out.println(uniType );
	System.out.println(UniversityLocation );
	System.out.println(UniversityRankSriLanka );
	System.out.println(UniversityWorldRank );
	System.out.println(Email );
	System.out.println(Tel );
	System.out.println(Branch );
	System.out.println(ugc );
	System.out.println(progCaegory );
	System.out.println(faculty );
	System.out.println(progType );
    
	
	
%>

<div class="rwd-table" >
   
   <table cellspacing="0"  style="border:1px solid pink;font-size:1vw">
      <tr>
      	<th>University name</th>
	      <%
	        for(String uni:uninamesunique){
	      %>
      
         <th><%=uni %></th>
          <%} %> 
      </tr>

	  <tr>
      	<th>University Type</th>
	      <%
	        for(String type:uniType){
	      %>
      
        <td><%=type.replace(",", " ") %></td>
          <%} %> 
      </tr>
      <tr>
	      <th>Location</th>
		      <%
		        for(String loc:UniversityLocation){
		      %>
	      
	       <td><%=loc %></td>
	          <%} %> 
      
      </tr>
      <tr>
	      <th>Local Rank</th>
		      <%
		        for(String lrank:UniversityRankSriLanka){
		      %>
	      
	       <td><%=lrank  %></td>
	          <%} %> 
      
      </tr>
      <tr>
	      <th>World Rank</th>
		      <%
		        for(String wrank:UniversityWorldRank){
		      %>
	      
	       <td><%=wrank  %></td>
	          <%} %> 
      
      </tr>
      <tr>
	      <th>Email</th>
		      <%
		        for(String email:Email){
		      %>
	      
	       <td><%=email  %></td>
	          <%} %> 
      
      </tr>
      <tr>
	      <th>Telephone</th>
		      <%
		        for(String tel:Tel){
		      %>
	      
	       <td><%=tel  %></td>
	          <%} %> 
      
      </tr>
      <tr>
	      <th>Branches</th>
		      <%
		        for(String br:Branch){
		      %>
	      
	       <td><%=br  %></td>
	          <%} %> 
      
      </tr>
      <tr>
	      <th>UGC Qualification</th>
		      <%
		        for(String ug:ugc){
		      %>
	      
	       <td><%=ug  %></td>
	          <%} %> 
      
      </tr>
      <tr>
	      <th>Faculties</th>
		      <%
		        for(String fc:faculty){
		      %>
	      
	       <td><%=fc  %></td>
	          <%} %> 
      
      </tr>
      <tr>
	      <th>Program category</th>
		      <%
		        for(String pc:progCaegory){
		      %>
	      
	       <td><%=pc  %></td>
	          <%} %> 
      
      </tr>
      <tr>
	      <th>Program Types</th>
		      <%
		        for(String pt:progType){
		      %>
	      
	       <td><%=pt  %></td>
	          <%} %> 
      
      </tr>
      
      
      
   </table>
</div>




<%
	
  	  
	
}
catch (Exception e) {
	e.printStackTrace();
}


%>  

				
		
      

      

  

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