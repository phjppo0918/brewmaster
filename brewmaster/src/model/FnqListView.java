package model;

import java.util.List;

public class FnqListView {
   private int fnqTotalCount;
   private int currentPageNumber;
   private List<Fnq> fnqList;
   private int pageTotalCount;
   private int fnqCountPerPage;
 

   public FnqListView(List<Fnq> fnqList, int fnqTotalCount,
         int currentPageNumber, int fnqCountPerPage) {
      this.fnqList = fnqList;
      this.fnqTotalCount = fnqTotalCount;
      this.currentPageNumber = currentPageNumber;
      this.fnqCountPerPage = fnqCountPerPage;
      

      calculatePageTotalCount();
   }

   private void calculatePageTotalCount() {
      if (fnqTotalCount == 0) {
         pageTotalCount = 0;
      } else {
         pageTotalCount = fnqTotalCount / fnqCountPerPage;
         if (fnqTotalCount % fnqCountPerPage > 0) {
            pageTotalCount++;
         }
      }
   }

	public int getFnqTotalCount() {
		return fnqTotalCount;
	}
	
	public void setFnqTotalCount(int fnqTotalCount) {
		this.fnqTotalCount = fnqTotalCount;
	}
	
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}
	
	public List<Fnq> getFnqList() {
		return fnqList;
	}
	
	public void setFnqList(List<Fnq> fnqList) {
		this.fnqList = fnqList;
	}
	
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	
	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	
	public int getFnqCountPerPage() {
		return fnqCountPerPage;
	}
	
	public void setFnqCountPerPage(int fnqCountPerPage) {
		this.fnqCountPerPage = fnqCountPerPage;
	}

}