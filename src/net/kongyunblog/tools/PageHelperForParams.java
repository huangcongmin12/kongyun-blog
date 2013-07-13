package net.kongyunblog.tools;

import java.util.List;

/**
 * 分页类
 * 
 * @author huangcongmin
 * @date 2013-3-19
 */
public class PageHelperForParams {

	private int total; 			// 总共的数据量

	private int pageSize; 		// 每页显条数

	private int totalPage; 		// 总页数

	private int index; 			// 当前页数

	private List<?> data; 		// 数据

	private String path = ""; 	// 连接路径

	/**
	 * 页码HTML信息
	 */
	@SuppressWarnings("unused")
	private String pageHTML;

	private int startPage; 		// 开始页

	private int endPage; 		// 结束页

	private int displayNum = 5; // 显示的页数
	
	private String date;

	public PageHelperForParams() {
	}

	/**
	 * @param index
	 * @param pageSize
	 * @param total
	 * @param path
	 * @param data
	 */
	public PageHelperForParams(int index, int pageSize, int total, String path,String date) {
		this.index = index;
		this.pageSize = pageSize;
		this.total = total;
		this.path = path;
		this.date = date;
	}

	/**
	 *
	 * @author huangcongmin
	 * @date 2013-3-19
	 * @return
	 */
	public int getStartPage() {
		return startPage;
	}

	
	/**
	 *
	 * @author huangcongmin
	 * @date 2013-3-19
	 * @return
	 */
	public int getEndPage() {
		return endPage;
	}

	/**
	 *
	 * @author huangcongmin
	 * @date 2013-3-19
	 * @return
	 */
	public String getPath() {
		return path;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	/**
	 *	设置路径前缀，页面第一页index为1
	 * @author huangcongmin
	 * @date 2013-3-19
	 * @param path
	 */
	public void setPath(String path) {
		this.path = path;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getTotalPage() {
		return (this.total + this.pageSize - 1) / this.pageSize;
	}

	public int getIndex() {
		return index;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}

	/**
	 *
	 * @author huangcongmin
	 * @date 2013-3-19
	 * @return
	 */
	public int getTotal() {
		return total;
	}

	/**
	 *
	 * @author huangcongmin
	 * @date 2013-3-19
	 * @param total
	 */
	public void setTotal(int total) {
		this.total = total;
	}

	/**
	 * 页码HTML信息
	 * @author huangcongmin
	 * @date 2013-3-19
	 * @return
	 */
	public String getPageHTML() {
		totalPage = getTotalPage();
		String result = null;
		if (totalPage != 0 && pageSize != 0) {
			result = "<ul>";
	 		if (index > 1) {
	 			result += "<li><a href='"+ path + (index-1) + "?date=" + this.date + "'><<</a></li>";
	 		}

	 		countPages();
			
			for (int i = startPage; i <= endPage; i++) {
				if (i == index) {
					result += "<li class='active'><a href='" + path + i + "?date=" + this.date +"'>"+ i +"</a></li>";
				} else {
					result += "<li><a href='"+path + i + "?date=" + this.date + "'> "+ i + "</a></li>";
				}
			}
			
 			if (index < totalPage) {
 				result += "<li><a href='" + path + (index+1) + "?date=" + this.date + "'>>></a></li>";
 			}
 			result += "<ul>";
		}
		return result;
	}

	/**
	 * 计算起始页和结束页
	 * @author huangcongmin
	 * @date 2013-3-19
	 */
	public void countPages() {

		if (index - displayNum / 2 < 1) {
			startPage = 1;
			endPage = displayNum > totalPage ? totalPage : displayNum;
		} else if (index + displayNum / 2 > totalPage) {
			int n = totalPage - displayNum + 1;
			startPage = n > 0 ? n : 1;
			endPage = totalPage;
		} else {
			startPage = index - displayNum / 2;
			endPage = startPage + displayNum - 1;
		}
	}

	/**
	 * the pageHTML to set
	 * @author huangcongmin
	 * @date 2013-3-19
	 * @param pageHTML
	 */
	public void setPageHTML(String pageHTML) {
		this.pageHTML = pageHTML;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}