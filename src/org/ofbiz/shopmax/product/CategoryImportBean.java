/**
 * 
 */
package org.ofbiz.shopmax.product;

/**
 * @author 488510
 *
 */
public class CategoryImportBean {
	   /* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((CategoryID == null) ? 0 : CategoryID.hashCode());
		result = prime * result
				+ ((CategoryName == null) ? 0 : CategoryName.hashCode());
		result = prime * result
				+ ((ShowOnHomePage == null) ? 0 : ShowOnHomePage.hashCode());
		return result;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CategoryImportBean other = (CategoryImportBean) obj;
		if (CategoryID == null) {
			if (other.CategoryID != null)
				return false;
		} else if (!CategoryID.equals(other.CategoryID))
			return false;
		if (CategoryName == null) {
			if (other.CategoryName != null)
				return false;
		} else if (!CategoryName.equals(other.CategoryName))
			return false;
		if (ShowOnHomePage == null) {
			if (other.ShowOnHomePage != null)
				return false;
		} else if (!ShowOnHomePage.equals(other.ShowOnHomePage))
			return false;
		return true;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CategoryImportBean [CategoryName=" + CategoryName
				+ ", CategoryID=" + CategoryID + ", ShowOnHomePage="
				+ ShowOnHomePage + "]";
	}
	private String CategoryName;
	   private String CategoryID;
	   private String ShowOnHomePage;
	/**
	 * @return the categoryName
	 */
	public String getCategoryName() {
		return CategoryName;
	}
	/**
	 * @param categoryName the categoryName to set
	 */
	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	/**
	 * @return the categoryID
	 */
	public String getCategoryID() {
		return CategoryID;
	}
	/**
	 * @param categoryID the categoryID to set
	 */
	public void setCategoryID(String categoryID) {
		CategoryID = categoryID;
	}
	/**
	 * @return the showOnHomePage
	 */
	public String getShowOnHomePage() {
		return ShowOnHomePage;
	}
	/**
	 * @param showOnHomePage the showOnHomePage to set
	 */
	public void setShowOnHomePage(String showOnHomePage) {
		ShowOnHomePage = showOnHomePage;
	}
}
