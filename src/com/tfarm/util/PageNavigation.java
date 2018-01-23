package com.tfarm.util;

public class PageNavigation {

	private String root;
	private boolean nowFirst;
	private boolean nowEnd;
	private int totalArticleCount;
	private int newArticleCount;
	private int totalPageCount;
	private int pageNo;
	private String navigator;
	private int bcode;
	private String key;
	private String word;

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public boolean isNowFirst() {
		return nowFirst;
	}

	public void setNowFirst(boolean nowFirst) {
		this.nowFirst = nowFirst;
	}

	public boolean isNowEnd() {
		return nowEnd;
	}

	public void setNowEnd(boolean nowEnd) {
		this.nowEnd = nowEnd;
	}

	public int getTotalArticleCount() {
		return totalArticleCount;
	}

	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}

	public int getNewArticleCount() {
		return newArticleCount;
	}

	public void setNewArticleCount(int newArticleCount) {
		this.newArticleCount = newArticleCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getBcode() {
		return bcode;
	}

	public void setBcode(int bcode) {
		this.bcode = bcode;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getNavigator() {
		return navigator;
	}

	public void setNavigator() {
		StringBuffer tmpNavigator = new StringBuffer();

		int pageSize = BoardConstance.PAGE_SIZE;
		tmpNavigator.append("<div style='padding-left:400px; padding-top:100px; padding-bottom:50px'>\n");
		tmpNavigator.append("<ul class='pagination'>\n");
		if (this.isNowFirst()) {
			tmpNavigator.append("<li class='page-item'>\n");
			tmpNavigator.append("<a class='page-link' href=\"javascript:listArticle('" + bcode + "', '1', '', '');\">&laquo;&laquo;</a></li>\n");
			tmpNavigator.append("<li class='page-item'>\n");
			tmpNavigator.append("<a class='page-link'>&laquo;</a>\n");

		} else {
			int prePage = (pageNo - 1) / pageSize * pageSize;
			tmpNavigator.append("<li class='page-item'>\n");
			tmpNavigator.append(" <a class='page-link' href=\"javascript:listArticle('" + bcode + "', '1', '', '');\"'>&laquo;&laquo;</a></li>\n");
			tmpNavigator.append("<li class='page-item'>\n");
			tmpNavigator.append("<a class='page-link' href=\"javascript:listArticle('" + bcode + "', '" + prePage + "', '" + key + "', '" + word + "');\">&laquo;</a>\n");

		}
		
		int startPage = (pageNo - 1) / pageSize * pageSize + 1;
		int endPage = startPage + pageSize - 1;
		if(endPage > totalPageCount)
			endPage = totalPageCount;
		
		for (int i = startPage; i <= endPage; i++) {
			if (pageNo == i) {
				tmpNavigator.append("<li class='page-item'>\n");
				tmpNavigator.append("<a class='page-link'>"+i+"</a>\n");
				tmpNavigator.append("</li>\n");
			} else {
				tmpNavigator.append("<li class='page-item'>\n");
				tmpNavigator.append("<a class='page-link' href=\"javascript:listArticle('" + bcode + "', '" + i + "', '" + key + "', '" + word + "');\">"+i+"</a>\n");
				tmpNavigator.append("</li>");
			}
		}
		
		if (this.isNowEnd()) {
			tmpNavigator.append("<li class='page-item'>");
			tmpNavigator.append("<a class='page-link'>&raquo;</a>");
			tmpNavigator.append("</li>");
			tmpNavigator.append(" <li class='page-item'>");
			tmpNavigator.append("<a class='page-link'>&raquo;&raquo;</a>");
			tmpNavigator.append("</li>");
		} else {
			int nextPage = (pageNo - 1) / pageSize * pageSize + pageSize + 1;//(pageNo + pageSize - 1) / pageSize * pageSize + 1
			tmpNavigator.append("<li class='page-item'>");
			tmpNavigator.append("<a class='page-link' href=\"javascript:listArticle('" + bcode + "', '" + nextPage + "', '" + key + "', '" + word + "');\">&raquo;</a>");
			tmpNavigator.append("</li>");
			tmpNavigator.append(" <li class='page-item'>");
			tmpNavigator.append("<a class='page-link' href=\"listArticle('" + bcode + "', '" + totalPageCount + "', '" + key + "', '" + word + "');\">&raquo;&raquo;</a>");
			tmpNavigator.append("</li>");
		}

		tmpNavigator.append("  </ul>\n");
		tmpNavigator.append(" </div>\n");

		this.navigator = tmpNavigator.toString();
	}

}

// <<ó�����<������� 21 22 23 24 25 �������>�����>>

















