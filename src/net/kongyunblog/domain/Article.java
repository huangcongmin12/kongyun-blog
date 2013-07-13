package net.kongyunblog.domain;

import java.io.Serializable;
import java.util.Date;

import net.kongyunblog.tools.DateHelper;



/**
 * Article
 * @author huangcongmin
 * @date 2013-3-10
 */
@SuppressWarnings("serial")
public class Article implements Serializable{
	
	private Long id;			// 自增型id
	private String title;		// 文章标题
	private String description; // 文章描述
	private String content;		// 内容
	private Date createTime;	// 创建时间
	private Date modifyTime;	// 最后修改时间
	private String alias;		// 别名
	private String url;			// url 地址
	private long viewCount;		// 浏览量
	private long commentCount;	// 评论条数
	private Long authorId; 		// 发布者
	private String cover;		// 封面
	private String tags;		// 标签
	private boolean topable;	// 置顶
	private Category category;	// 所属分类
	@SuppressWarnings("unused")
	private String time;
	@SuppressWarnings("unused")
	private String yearAndMonth;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
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
	public long getViewCount() {
		return viewCount;
	}
	public void setViewCount(long viewCount) {
		this.viewCount = viewCount;
	}
	public long getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(long commentCount) {
		this.commentCount = commentCount;
	}
	public Long getAuthorId() {
		return authorId;
	}
	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public boolean isTopable() {
		return topable;
	}
	public void setTopable(boolean topable) {
		this.topable = topable;
	}
	public String getTime() {
		return DateHelper.getTime(createTime);
	}
	public void setTime() {
		this.time = DateHelper.getTime(createTime);
	}
	public String getYearAndMonth() {
		return DateHelper.getYearAndMonth(createTime);
	}
	public void setYearAndMonth() {
		this.time = DateHelper.getYearAndMonth(createTime);
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
