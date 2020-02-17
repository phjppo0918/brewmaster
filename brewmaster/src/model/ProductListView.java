package model;

import java.util.List;

public class ProductListView {
   private int productTotalCount;
   private int currentPageNumber;
   private List<Product> productList;
   private int pageTotalCount;
   private int productCountPerPage;
 

   public ProductListView(List<Product> productList, int productTotalCount,
         int currentPageNumber, int productCountPerPage) {
      this.productList = productList;
      this.productTotalCount = productTotalCount;
      this.currentPageNumber = currentPageNumber;
      this.productCountPerPage = productCountPerPage;
      

      calculatePageTotalCount();
   }

   private void calculatePageTotalCount() {
      if (productTotalCount == 0) {
         pageTotalCount = 0;
      } else {
         pageTotalCount = productTotalCount / productCountPerPage;
         if (productTotalCount % productCountPerPage > 0) {
            pageTotalCount++;
         }
      }
   }

public int getProductTotalCount() {
	return productTotalCount;
}

public void setProductTotalCount(int productTotalCount) {
	this.productTotalCount = productTotalCount;
}

public int getCurrentPageNumber() {
	return currentPageNumber;
}

public void setCurrentPageNumber(int currentPageNumber) {
	this.currentPageNumber = currentPageNumber;
}

public List<Product> getProductList() {
	return productList;
}

public void setProductList(List<Product> productList) {
	this.productList = productList;
}

public int getPageTotalCount() {
	return pageTotalCount;
}

public void setPageTotalCount(int pageTotalCount) {
	this.pageTotalCount = pageTotalCount;
}

public int getProductCountPerPage() {
	return productCountPerPage;
}

public void setProductCountPerPage(int productCountPerPage) {
	this.productCountPerPage = productCountPerPage;
}

}