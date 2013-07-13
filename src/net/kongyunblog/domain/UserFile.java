package net.kongyunblog.domain;

import java.io.Serializable;
import java.util.Date;

import net.kongyunblog.tools.DateHelper;


/**
 * UserFile
 * @author huangcongmin
 * @date 2013-3-10
 */
@SuppressWarnings("serial")
public class UserFile implements Serializable{
	
	private Long id;				// 自增型id
	private String name;			// 文件名称
	private String description;		// 描述
	private String file;			// 文件
	private String path;			// 保存路径
	private Date uploadTime;		// 上传时间
	private long downloads;			// 下载次数
	private Long authorId; 			// 发布者id
	private long size;				// 文件大小
	private String tags;			// 关键字
	private boolean topable;		// 置顶
	@SuppressWarnings("unused")
	private String time;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public long getDownloads() {
		return downloads;
	}
	public void setDownloads(long downloads) {
		this.downloads = downloads;
	}
	public Long getAuthorId() {
		return authorId;
	}
	public void setAuthorId(Long authorId) {
		this.authorId = authorId;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getTime() {
		return DateHelper.getTime(uploadTime);
	}
	public boolean isTopable() {
		return topable;
	}
	public void setTopable(boolean topable) {
		this.topable = topable;
	}
}
