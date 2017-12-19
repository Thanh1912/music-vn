package music.com.vn.dto;

import java.util.Date;

public class AlbumDTO {
	
	private Long id;


	private Date modifiedAt;


	private Date createdAt;

	private String name;

	private String poster;

	private Long idArtist;

	private Long idKindOfMusic;

	private Long idUser;

	public Long getIdUser() {
		return idUser;
	}

	public void setIdUser(Long idUser) {
		this.idUser = idUser;
	}

	public Long getIdArtist() {
		return idArtist;
	}

	public void setIdArtist(Long idArtist) {
		this.idArtist = idArtist;
	}

	public Long getIdKindOfMusic() {
		return idKindOfMusic;
	}

	public void setIdKindOfMusic(Long idKindOfMusic) {
		this.idKindOfMusic = idKindOfMusic;
	}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}
	

}
