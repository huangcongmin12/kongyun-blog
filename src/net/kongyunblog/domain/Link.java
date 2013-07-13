package net.kongyunblog.domain;

import java.io.Serializable;

/**
 * Link
 * @author huangcongmin
 * @date 2013-3-10
 */
@SuppressWarnings("serial")
public class Link implements Serializable {
	
	private Long id;						// id
	private String name;					// 链接名称
	private String url;						// 链接地址
	private String description;				// 描述
	private Long categoryId;				// 分类名称
	private Integer rank;					// 排序
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	
}
