package model;

import java.util.List;

public class ChhListView {
   private int chhTotalCount;
   private int currentPageNumber;
   private List<Chh> chhList;
   private int pageTotalCount;
   private int chhCountPerPage;
 

   public ChhListView(List<Chh> chhList, int chhTotalCount,
         int currentPageNumber, int chhCountPerPage) {
      this.chhList = chhList;
      this.chhTotalCount = chhTotalCount;
      this.currentPageNumber = currentPageNumber;
      this.chhCountPerPage = chhCountPerPage;
      

      calculatePageTotalCount();
   }

   private void calculatePageTotalCount() {
      if (chhTotalCount == 0) {
         pageTotalCount = 0;
      } else {
         pageTotalCount = chhTotalCount / chhCountPerPage;
         if (chhTotalCount % chhCountPerPage > 0) {
            pageTotalCount++;
         }
      }
   }

	public int getChhTotalCount() {
		return chhTotalCount;
	}
	
	public void setChhTotalCount(int chhTotalCount) {
		this.chhTotalCount = chhTotalCount;
	}
	
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}
	
	public List<Chh> getChhList() {
		return chhList;
	}
	
	public void setChhList(List<Chh> chhList) {
		this.chhList = chhList;
	}
	
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	
	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	
	public int getChhCountPerPage() {
		return chhCountPerPage;
	}
	
	public void setChhCountPerPage(int chhCountPerPage) {
		this.chhCountPerPage = chhCountPerPage;
	}

}