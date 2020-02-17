package model;

import java.util.List;

public class UserListView {
   private int userTotalCount;
   private int currentPageNumber;
   private List<User> userList;
   private int pageTotalCount;
   private int userCountPerPage;
 

   public UserListView(List<User> userList, int userTotalCount,
         int currentPageNumber, int userCountPerPage) {
      this.userList = userList;
      this.userTotalCount = userTotalCount;
      this.currentPageNumber = currentPageNumber;
      this.userCountPerPage = userCountPerPage;
      

      calculatePageTotalCount();
   }

   private void calculatePageTotalCount() {
      if (userTotalCount == 0) {
         pageTotalCount = 0;
      } else {
         pageTotalCount = userTotalCount / userCountPerPage;
         if (userTotalCount % userCountPerPage > 0) {
            pageTotalCount++;
         }
      }
   }

public int getUserTotalCount() {
	return userTotalCount;
}

public void setUserTotalCount(int userTotalCount) {
	this.userTotalCount = userTotalCount;
}

public int getCurrentPageNumber() {
	return currentPageNumber;
}

public void setCurrentPageNumber(int currentPageNumber) {
	this.currentPageNumber = currentPageNumber;
}

public List<User> getUserList() {
	return userList;
}

public void setUserList(List<User> userList) {
	this.userList = userList;
}

public int getPageTotalCount() {
	return pageTotalCount;
}

public void setPageTotalCount(int pageTotalCount) {
	this.pageTotalCount = pageTotalCount;
}

public int getUserCountPerPage() {
	return userCountPerPage;
}

public void setUserCountPerPage(int userCountPerPage) {
	this.userCountPerPage = userCountPerPage;
}

}