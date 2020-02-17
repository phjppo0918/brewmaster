package model;

import java.util.List;

public class PurchaseListView {
   private int purchaseTotalCount;
   private int currentPageNumber;
   private List<Purchase> purchaseList;
   private int pageTotalCount;
   private int purchaseCountPerPage;
 

   public PurchaseListView(List<Purchase> purchaseList, int purchaseTotalCount,
         int currentPageNumber, int purchaseCountPerPage) {
      this.purchaseList = purchaseList;
      this.purchaseTotalCount = purchaseTotalCount;
      this.currentPageNumber = currentPageNumber;
      this.purchaseCountPerPage = purchaseCountPerPage;
      

      calculatePageTotalCount();
   }

   private void calculatePageTotalCount() {
      if (purchaseTotalCount == 0) {
         pageTotalCount = 0;
      } else {
         pageTotalCount = purchaseTotalCount / purchaseCountPerPage;
         if (purchaseTotalCount % purchaseCountPerPage > 0) {
            pageTotalCount++;
         }
      }
   }

public int getPurchaseTotalCount() {
	return purchaseTotalCount;
}

public void setPurchaseTotalCount(int purchaseTotalCount) {
	this.purchaseTotalCount = purchaseTotalCount;
}

public int getCurrentPageNumber() {
	return currentPageNumber;
}

public void setCurrentPageNumber(int currentPageNumber) {
	this.currentPageNumber = currentPageNumber;
}

public List<Purchase> getPurchaseList() {
	return purchaseList;
}

public void setPurchaseList(List<Purchase> purchaseList) {
	this.purchaseList = purchaseList;
}

public int getPageTotalCount() {
	return pageTotalCount;
}

public void setPageTotalCount(int pageTotalCount) {
	this.pageTotalCount = pageTotalCount;
}

public int getPurchaseCountPerPage() {
	return purchaseCountPerPage;
}

public void setPurchaseCountPerPage(int purchaseCountPerPage) {
	this.purchaseCountPerPage = purchaseCountPerPage;
}

}