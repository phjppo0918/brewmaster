package model;

import java.util.List;

public class MarkListView {
   private int markTotalCount;
   private int currentPageNumber;
   private List<Mark> markList;
   private int pageTotalCount;
   private int markCountPerPage;
 

   public MarkListView(List<Mark> markList, int markTotalCount,
         int currentPageNumber, int markCountPerPage) {
      this.markList = markList;
      this.markTotalCount = markTotalCount;
      this.currentPageNumber = currentPageNumber;
      this.markCountPerPage = markCountPerPage;
      

      calculatePageTotalCount();
   }

   private void calculatePageTotalCount() {
      if (markTotalCount == 0) {
         pageTotalCount = 0;
      } else {
         pageTotalCount = markTotalCount / markCountPerPage;
         if (markTotalCount % markCountPerPage > 0) {
            pageTotalCount++;
         }
      }
   }

	public int getMarkTotalCount() {
		return markTotalCount;
	}
	
	public void setMarkTotalCount(int markTotalCount) {
		this.markTotalCount = markTotalCount;
	}
	
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}
	
	public List<Mark> getMarkList() {
		return markList;
	}
	
	public void setMarkList(List<Mark> markList) {
		this.markList = markList;
	}
	
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	
	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	
	public int getMarkCountPerPage() {
		return markCountPerPage;
	}
	
	public void setMarkCountPerPage(int markCountPerPage) {
		this.markCountPerPage = markCountPerPage;
	}

}