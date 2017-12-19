package music.com.vn.dto;

import java.util.Date;

public class LikeDTO {

	
	public Long id;


	private Date modifiedAt;


	private Date createdAt;
	

	private Long user_id;


	private Long song_id;
	
	private Boolean isLike;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Date getModifiedAt() {
		return modifiedAt;
	}


	public void setModifiedAt(Date modifiedAt) {
		this.modifiedAt = modifiedAt;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public Long getUser_id() {
		return user_id;
	}


	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}


	public Long getSong_id() {
		return song_id;
	}


	public void setSong_id(Long song_id) {
		this.song_id = song_id;
	}


	public Boolean getIsLike() {
		return isLike;
	}


	public void setIsLike(Boolean isLike) {
		this.isLike = isLike;
	}
	
	


}
