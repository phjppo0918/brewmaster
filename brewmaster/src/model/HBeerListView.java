package model;

import java.util.List;

public class HBeerListView {
   private int hBeerTotalCount;
   private int currentPageNumber;
   private List<HBeer> hBeerList;
   private int pageTotalCount;
   private int hBeerCountPerPage;
 

   public HBeerListView(List<HBeer> hBeerList, int hBeerTotalCount,
         int currentPageNumber, int hBeerCountPerPage) {
      this.hBeerList = hBeerList;
      this.hBeerTotalCount = hBeerTotalCount;
      this.currentPageNumber = currentPageNumber;
      this.hBeerCountPerPage = hBeerCountPerPage;
      

      calculatePageTotalCount();
   }

   private void calculatePageTotalCount() {
      if (hBeerTotalCount == 0) {
         pageTotalCount = 0;
      } else {
         pageTotalCount = hBeerTotalCount / hBeerCountPerPage;
         if (hBeerTotalCount % hBeerCountPerPage > 0) {
            pageTotalCount++;
         }
      }
   }

public int getHBeerTotalCount() {
	return hBeerTotalCount;
}

public void setHBeerTotalCount(int hBeerTotalCount) {
	this.hBeerTotalCount = hBeerTotalCount;
}

public int getCurrentPageNumber() {
	return currentPageNumber;
}

public void setCurrentPageNumber(int currentPageNumber) {
	this.currentPageNumber = currentPageNumber;
}

public List<HBeer> getHBeerList() {
	return hBeerList;
}

public void setHBeerList(List<HBeer> hBeerList) {
	this.hBeerList = hBeerList;
}

public int getPageTotalCount() {
	return pageTotalCount;
}

public void setPageTotalCount(int pageTotalCount) {
	this.pageTotalCount = pageTotalCount;
}

public int getHBeerCountPerPage() {
	return hBeerCountPerPage;
}

public void setHBeerCountPerPage(int hBeerCountPerPage) {
	this.hBeerCountPerPage = hBeerCountPerPage;
}

}