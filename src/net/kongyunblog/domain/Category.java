package net.kongyunblog.domain;

import java.io.Serializable;

/**
 * Category
 * @author huangcongmin
 * @date 2013-3-10
 */
@SuppressWarnings("serial")
public class Category implements Serializable {
	
	private Long id;			// 自增型id
	private String name;		// 分类名称
	private String alias;		// 分类别名
	private String url;			// url地址
	private Integer rank;		// 排序
	private String description; // 描述
	private long acticleNum;	// 文章数量
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
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getActicleNum() {
		return acticleNum;
	}
	public void setActicleNum(long acticleNum) {
		this.acticleNum = acticleNum;
	}

}
