/**
 * 
 */
package org.ofbiz.shopmax.product;  

/**
 * @author Sumit Pandit & Harsha Chadhar
 *
 */

import java.math.BigDecimal;
import java.sql.Timestamp;

public class ProductImportBean {
    /*
     * "Product Name",
     * "Product Description",
     * "Category Path",
     * "List Price",
     * "Discount Price",
     * "Discount Price Start Date",
     * "Discount Price End Date",
     * "Stock","Shipping Size",
     * "Product Image Filename",
     * "SKU",
     * "Product Thumbnail URL"
     * "SellerSubdomainName"
     */
    private String CategoryPath;
    private BigDecimal DiscountPrice;
    private Timestamp DiscountPriceEndDate;
    private Timestamp DiscountPriceStartDate;
    private BigDecimal ListPrice;
    private String ProductDescription;
    private String ProductImageFilename;
    private String ProductName;
    private String ProductThumbnailURL;
    private String SellerSubdomainName;
    private Integer ShippingSize;
    private String SKU;
    private Integer Stock;
    private final Integer UNLIMITED_VALUE = 999999999;
    
    public ProductImportBean() {
        super();
    }

	public ProductImportBean(String productName, String productDescription,
			String categoryPath, BigDecimal listPrice,
			BigDecimal discountPrice, Timestamp discountPriceStartDate,
			Timestamp discountPriceEndDate, Integer stock,
			Integer shippingSize, String productImageFilename, String sKU,
			String productThumbnailURL, String sellerSubdomainName) {
		super();
		ProductName = productName;
		ProductDescription = productDescription;
		CategoryPath = categoryPath;
		ListPrice = listPrice;
		DiscountPrice = discountPrice;
		DiscountPriceStartDate = discountPriceStartDate;
		DiscountPriceEndDate = discountPriceEndDate;
		Stock = stock;
		ShippingSize = shippingSize;
		ProductImageFilename = productImageFilename;
		SKU = sKU;
		ProductThumbnailURL = productThumbnailURL;
		SellerSubdomainName = sellerSubdomainName;
	}

	/**
	 * @return the categoryPath
	 */
	public String getCategoryPath() {
		return CategoryPath;
	}

	/**
	 * @return the discountPrice
	 */
	public BigDecimal getDiscountPrice() {
		return DiscountPrice;
	}

	/**
	 * @return the discountPriceEndDate
	 */
	public Timestamp getDiscountPriceEndDate() {
		return DiscountPriceEndDate;
	}

	/**
	 * @return the discountPriceStartDate
	 */
	public Timestamp getDiscountPriceStartDate() {
		return DiscountPriceStartDate;
	}

	/**
	 * @return the listPrice
	 */
	public BigDecimal getListPrice() {
		return ListPrice;
	}

	/**
	 * @return the productDescription
	 */
	public String getProductDescription() {
		return ProductDescription;
	}

	/**
	 * @return the productImageFilename
	 */
	public String getProductImageFilename() {
		return ProductImageFilename;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return ProductName;
	}

	/**
	 * @return the productThumbnailURL
	 */
	public String getProductThumbnailURL() {
		return ProductThumbnailURL;
	}

	/**
	 * @return the sellerSubdomainName
	 */
	public String getSellerSubdomainName() {
		return SellerSubdomainName;
	}

	/**
	 * @return the shippingSize
	 */
	public Integer getShippingSize() {
		return ShippingSize;
	}

	/**
	 * @return the sKU
	 */
	public String getSKU() {
		return SKU;
	}

	/**
	 * @return the stock
	 */
	public Integer getStock() {
		return Stock;
	}

	/**
	 * @return the uNLIMITED_VALUE
	 */
	public Integer getUNLIMITED_VALUE() {
		return UNLIMITED_VALUE;
	}

	/**
	 * @param categoryPath the categoryPath to set
	 */
	public void setCategoryPath(String categoryPath) {
		CategoryPath = categoryPath;
	}

	/**
	 * @param discountPrice the discountPrice to set
	 */
	public void setDiscountPrice(BigDecimal discountPrice) {
		DiscountPrice = discountPrice;
	}

	/**
	 * @param discountPriceEndDate the discountPriceEndDate to set
	 */
	public void setDiscountPriceEndDate(Timestamp discountPriceEndDate) {
		DiscountPriceEndDate = discountPriceEndDate;
	}

	/**
	 * @param discountPriceStartDate the discountPriceStartDate to set
	 */
	public void setDiscountPriceStartDate(Timestamp discountPriceStartDate) {
		DiscountPriceStartDate = discountPriceStartDate;
	}

	/**
	 * @param listPrice the listPrice to set
	 */
	public void setListPrice(BigDecimal listPrice) {
		ListPrice = listPrice;
	}

	/**
	 * @param productDescription the productDescription to set
	 */
	public void setProductDescription(String productDescription) {
		ProductDescription = productDescription;
	}

	/**
	 * @param productImageFilename the productImageFilename to set
	 */
	public void setProductImageFilename(String productImageFilename) {
		ProductImageFilename = productImageFilename;
	}

	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		ProductName = productName;
	}

	/**
	 * @param productThumbnailURL the productThumbnailURL to set
	 */
	public void setProductThumbnailURL(String productThumbnailURL) {
		ProductThumbnailURL = productThumbnailURL;
	}

	/**
	 * @param sellerSubdomainName the sellerSubdomainName to set
	 */
	public void setSellerSubdomainName(String sellerSubdomainName) {
		SellerSubdomainName = sellerSubdomainName;
	}

	/**
	 * @param shippingSize the shippingSize to set
	 */
	public void setShippingSize(Integer shippingSize) {
		ShippingSize = shippingSize;
	}

	/**
	 * @param sKU the sKU to set
	 */
	public void setSKU(String sKU) {
		SKU = sKU;
	}

	/**
	 * @param stock the stock to set
	 */
	public void setStock(Integer stock) {
		Stock = stock;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ProductImportBean [ProductName=" + ProductName
				+ ", ProductDescription=" + ProductDescription
				+ ", CategoryPath=" + CategoryPath + ", ListPrice=" + ListPrice
				+ ", DiscountPrice=" + DiscountPrice
				+ ", DiscountPriceStartDate=" + DiscountPriceStartDate
				+ ", DiscountPriceEndDate=" + DiscountPriceEndDate + ", Stock="
				+ Stock + ", ShippingSize=" + ShippingSize
				+ ", ProductImageFilename=" + ProductImageFilename + ", SKU="
				+ SKU + ", ProductThumbnailURL=" + ProductThumbnailURL
				+ ", SellerSubdomainName=" + SellerSubdomainName
				+ ", UNLIMITED_VALUE=" + UNLIMITED_VALUE + "]";
	}
	

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((CategoryPath == null) ? 0 : CategoryPath.hashCode());
		result = prime * result
				+ ((DiscountPrice == null) ? 0 : DiscountPrice.hashCode());
		result = prime
				* result
				+ ((DiscountPriceEndDate == null) ? 0 : DiscountPriceEndDate
						.hashCode());
		result = prime
				* result
				+ ((DiscountPriceStartDate == null) ? 0
						: DiscountPriceStartDate.hashCode());
		result = prime * result
				+ ((ListPrice == null) ? 0 : ListPrice.hashCode());
		result = prime
				* result
				+ ((ProductDescription == null) ? 0 : ProductDescription
						.hashCode());
		result = prime
				* result
				+ ((ProductImageFilename == null) ? 0 : ProductImageFilename
						.hashCode());
		result = prime * result
				+ ((ProductName == null) ? 0 : ProductName.hashCode());
		result = prime
				* result
				+ ((ProductThumbnailURL == null) ? 0 : ProductThumbnailURL
						.hashCode());
		result = prime * result + ((SKU == null) ? 0 : SKU.hashCode());
		result = prime
				* result
				+ ((SellerSubdomainName == null) ? 0 : SellerSubdomainName
						.hashCode());
		result = prime * result
				+ ((ShippingSize == null) ? 0 : ShippingSize.hashCode());
		result = prime * result + ((Stock == null) ? 0 : Stock.hashCode());
		result = prime * result
				+ ((UNLIMITED_VALUE == null) ? 0 : UNLIMITED_VALUE.hashCode());
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
		ProductImportBean other = (ProductImportBean) obj;
		if (CategoryPath == null) {
			if (other.CategoryPath != null)
				return false;
		} else if (!CategoryPath.equals(other.CategoryPath))
			return false;
		if (DiscountPrice == null) {
			if (other.DiscountPrice != null)
				return false;
		} else if (!DiscountPrice.equals(other.DiscountPrice))
			return false;
		if (DiscountPriceEndDate == null) {
			if (other.DiscountPriceEndDate != null)
				return false;
		} else if (!DiscountPriceEndDate.equals(other.DiscountPriceEndDate))
			return false;
		if (DiscountPriceStartDate == null) {
			if (other.DiscountPriceStartDate != null)
				return false;
		} else if (!DiscountPriceStartDate.equals(other.DiscountPriceStartDate))
			return false;
		if (ListPrice == null) {
			if (other.ListPrice != null)
				return false;
		} else if (!ListPrice.equals(other.ListPrice))
			return false;
		if (ProductDescription == null) {
			if (other.ProductDescription != null)
				return false;
		} else if (!ProductDescription.equals(other.ProductDescription))
			return false;
		if (ProductImageFilename == null) {
			if (other.ProductImageFilename != null)
				return false;
		} else if (!ProductImageFilename.equals(other.ProductImageFilename))
			return false;
		if (ProductName == null) {
			if (other.ProductName != null)
				return false;
		} else if (!ProductName.equals(other.ProductName))
			return false;
		if (ProductThumbnailURL == null) {
			if (other.ProductThumbnailURL != null)
				return false;
		} else if (!ProductThumbnailURL.equals(other.ProductThumbnailURL))
			return false;
		if (SKU == null) {
			if (other.SKU != null)
				return false;
		} else if (!SKU.equals(other.SKU))
			return false;
		if (SellerSubdomainName == null) {
			if (other.SellerSubdomainName != null)
				return false;
		} else if (!SellerSubdomainName.equals(other.SellerSubdomainName))
			return false;
		if (ShippingSize == null) {
			if (other.ShippingSize != null)
				return false;
		} else if (!ShippingSize.equals(other.ShippingSize))
			return false;
		if (Stock == null) {
			if (other.Stock != null)
				return false;
		} else if (!Stock.equals(other.Stock))
			return false;
		if (UNLIMITED_VALUE == null) {
			if (other.UNLIMITED_VALUE != null)
				return false;
		} else if (!UNLIMITED_VALUE.equals(other.UNLIMITED_VALUE))
			return false;
		return true;
	}
}
