package com.weaving.biz.email;

public class MessageVO {
  static final long serialVersionUID = 1L;
	
	/** 검색조건 */
      String searchCondition = "";
    
    /** 검색Keyword */
      String searchKeyword = "";
    
    /** 검색사용여부 */
      String searchUseYn = "";
    
    /** 현재페이지 */
      int pageIndex = 1;
    
    /** 페이지갯수 */
      int pageUnit = 10;
    
    /** 페이지사이즈 */
      int pageSize = 10;

    /** firstIndex */
      int firstIndex = 1;

    /** lastIndex */
      int lastIndex = 1;

    /** recordCountPerPage */
      int recordCountPerPage = 10;
    
    /** EMP_ID */
      int empNo;
    
    


	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchCondition() {
        return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    public String getSearchUseYn() {
        return searchUseYn;
    }

    public void setSearchUseYn(String searchUseYn) {
        this.searchUseYn = searchUseYn;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageUnit() {
        return pageUnit;
    }

    public void setPageUnit(int pageUnit) {
        this.pageUnit = pageUnit;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

	@Override
	public String toString() {
		return "MessageVO [searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", searchUseYn="
				+ searchUseYn + ", pageIndex=" + pageIndex + ", pageUnit=" + pageUnit + ", pageSize=" + pageSize
				+ ", firstIndex=" + firstIndex + ", lastIndex=" + lastIndex + ", recordCountPerPage="
				+ recordCountPerPage + ", empNo=" + empNo + "]";
	}

   

	
}
