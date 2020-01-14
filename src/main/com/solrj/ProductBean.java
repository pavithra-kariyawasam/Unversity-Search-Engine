
package main.com.solrj;
import org.apache.solr.client.solrj.beans.Field;

public class ProductBean {
	
	@Field()
	public  String id;

	@Field("UniversityName")
	public  String UniversityName;
	
	@Field("UniversityType")
	public  String UniversityType ;
	
	@Field("UniversityWebLink")
	public  String UniversityWebLink ;
	

	@Field("UniversityDescription")
	public  String UniversityDescription ;
	
	@Field("UniversityLocation")
	public  String UniversityLocation;
	
	@Field("UniversityRankSriLanka")
	public  String UniversityRankSriLanka;
	
	@Field("UniversityWorldRank")
	public  String UniversityWorldRank;
	
	@Field("ProgramCatagory")
	public  String ProgramCatagory;
	
	@Field("ProgramType")
	public  String ProgramType;
	
	@Field("ProgramTypeLink")
	public  String ProgramTypeLink;
		
	@Field("DegreeName")
	public  String DegreeName;
	
	@Field("DegreeLink")
	public  String DegreeLink;
	
	@Field("DegreeDescription")
	public  String DegreeDescription;
	
	@Field("UGCQualification")
	public  String UGCQualification;
	
	@Field("FacultyName")
	public  String FacultyName;
	
	@Field("FacultyLink")
	public  String FacultyLink;
	
	@Field("Email")
	public  String Email;
	
	@Field("Tel")
	public  String Tel;
	
	@Field("EntryQualification")
	public  String EntryQualification;
	
	@Field("Branch")
	public  String Branch;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUniversityName() {
		return UniversityName;
	}

	public void setUniversityName(String universityName) {
		UniversityName = universityName;
	}

	public String getUniversityType() {
		return UniversityType;
	}

	public void setUniversityType(String universityType) {
		UniversityType = universityType;
	}

	public String getUniversityWebLink() {
		return UniversityWebLink;
	}

	public void setUniversityWebLink(String universityWebLink) {
		UniversityWebLink = universityWebLink;
	}

	public String getUniversityDescription() {
		return UniversityDescription;
	}

	public void setUniversityDescription(String universityDescription) {
		UniversityDescription = universityDescription;
	}

	public String getUniversityLocation() {
		return UniversityLocation;
	}

	public void setUniversityLocation(String universityLocation) {
		UniversityLocation = universityLocation;
	}

	public String getUniversityRankSriLanka() {
		return UniversityRankSriLanka;
	}

	public void setUniversityRankSriLanka(String universityRankSriLanka) {
		UniversityRankSriLanka = universityRankSriLanka;
	}

	public String getUniversityWorldRank() {
		return UniversityWorldRank;
	}

	public void setUniversityWorldRank(String universityWorldRank) {
		UniversityWorldRank = universityWorldRank;
	}

	public String getProgramCatagory() {
		return ProgramCatagory;
	}

	public void setProgramCatagory(String programCatagory) {
		ProgramCatagory = programCatagory;
	}

	public String getProgramType() {
		return ProgramType;
	}

	public void setProgramType(String programType) {
		ProgramType = programType;
	}

	public String getProgramTypeLink() {
		return ProgramTypeLink;
	}

	public void setProgramTypeLink(String programTypeLink) {
		ProgramTypeLink = programTypeLink;
	}

	public String getDegreeName() {
		return DegreeName;
	}

	public void setDegreeName(String degreeName) {
		DegreeName = degreeName;
	}

	public String getDegreeLink() {
		return DegreeLink;
	}

	public void setDegreeLink(String degreeLink) {
		DegreeLink = degreeLink;
	}

	public String getDegreeDescription() {
		return DegreeDescription;
	}

	public void setDegreeDescription(String degreeDescription) {
		DegreeDescription = degreeDescription;
	}

	public String getUGCQualification() {
		return UGCQualification;
	}

	public void setUGCQualification(String uGCQualification) {
		UGCQualification = uGCQualification;
	}

	public String getFacultyName() {
		return FacultyName;
	}

	public void setFacultyName(String facultyName) {
		FacultyName = facultyName;
	}

	public String getFacultyLink() {
		return FacultyLink;
	}

	public void setFacultyLink(String facultyLink) {
		FacultyLink = facultyLink;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getTel() {
		return Tel;
	}

	public void setTel(String tel) {
		Tel = tel;
	}

	public String getEntryQualification() {
		return EntryQualification;
	}

	public void setEntryQualification(String entryQualification) {
		EntryQualification = entryQualification;
	}

	public String getBranch() {
		return Branch;
	}

	public void setBranch(String branch) {
		Branch = branch;
	}
	
	public ProductBean() {}
	
	public ProductBean(String id, String universityName, String universityType, String universityWebLink,
			String universityDescription, String universityLocation, 
			 String programCatagory, String programType, String programTypeLink,
			String degreeName, String degreeLink, String degreeDescription, String uGCQualification,String email, String tel, String entryQualification, String branch) {
	
		this.id = id;
		this.UniversityName = universityName;
		this.UniversityType = universityType;
		this.UniversityWebLink = universityWebLink;
		this.UniversityDescription = universityDescription;
		this.UniversityLocation = universityLocation;
		this.UniversityRankSriLanka = null;
		this.UniversityWorldRank = null;
		this.ProgramCatagory = programCatagory;
		this.ProgramType = programType;
		this.ProgramTypeLink = programTypeLink;
		this.DegreeName = degreeName;
		this.DegreeLink = degreeLink;
		this.DegreeDescription = degreeDescription;
		this.UGCQualification = uGCQualification;
		this.FacultyName = null;
		this.FacultyLink = null;
		this.Email = email;
		this.Tel = tel;
		this.EntryQualification = entryQualification;
		this.Branch = branch;
	}
	
	public ProductBean(String id, String universityName, String universityType, String universityWebLink,
			String universityDescription, String universityLocation, String universityRankSriLanka,
			String universityWorldRank, String programCatagory, String programType, String programTypeLink,
			String degreeName, String degreeLink, String degreeDescription, String uGCQualification, String facultyName,
			String facultyLink, String email, String tel, String entryQualification, String branch) {
	
		this.id = id;
		this.UniversityName = universityName;
		this.UniversityType = universityType;
		this.UniversityWebLink = universityWebLink;
		this.UniversityDescription = universityDescription;
		this.UniversityLocation = universityLocation;
		this.UniversityRankSriLanka = universityRankSriLanka;
		this.UniversityWorldRank = universityWorldRank;
		this.ProgramCatagory = programCatagory;
		this.ProgramType = programType;
		this.ProgramTypeLink = programTypeLink;
		this.DegreeName = degreeName;
		this.DegreeLink = degreeLink;
		this.DegreeDescription = degreeDescription;
		this.UGCQualification = uGCQualification;
		this.FacultyName = facultyName;
		this.FacultyLink = facultyLink;
		this.Email = email;
		this.Tel = tel;
		this.EntryQualification = entryQualification;
		this.Branch = branch;
	}

	public ProductBean(String id) {
	
		this.id = id;
		this.UniversityName = null;
		this.UniversityType = null;
		this.UniversityWebLink = null;
		this.UniversityDescription = null;
		this.UniversityLocation = null;
		this.UniversityRankSriLanka = null;
		this.UniversityWorldRank = null;
		this.ProgramCatagory = null;
		this.ProgramType = null;
		this.ProgramTypeLink = null;
		this.DegreeName = null;
		this.DegreeLink = null;
		this.DegreeDescription = null;
		this.UGCQualification = null;
		this.FacultyName = null;
		this.FacultyLink = null;
		this.Email = null;
		this.Tel = null;
		this.EntryQualification = null;
		this.Branch = null;
	}


	
	
}
