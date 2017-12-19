package music.com.vn.dto;

import java.util.Date;
import java.util.List;

public class SongDTO  {

	public Long id;

	private Date modifiedAt;


	private Date createdAt;

	public String hostMovieId;
	
	public String name;
	
	public String thumb;
	
	public String poster;
	
	private Integer countWatch;

	private Long  countLike;

	public InfoUserDTO InfoByNameAuthor;

	private String nameKindOfMusic;

	public Long idAlbum;

	public Long idArtist;

	public Long idUser;

	public Long idKindOfMusic;

	//Mapping
    private List<ArtistDTO> ArtistDTO;

	private List<AlbumDTO> AlbumDTO;

	public Long getCountLike() {
		return countLike;
	}

	public void setCountLike(Long countLike) {
		this.countLike = countLike;
	}

	public String getNameKindOfMusic() {
		return nameKindOfMusic;
	}

	public void setNameKindOfMusic(String nameKindOfMusic) {
		this.nameKindOfMusic = nameKindOfMusic;
	}

	public List<music.com.vn.dto.ArtistDTO> getArtistDTO() {
		return ArtistDTO;
	}

	public void setArtistDTO(List<ArtistDTO> artistDTO) {
		ArtistDTO = artistDTO;
	}

	public List<AlbumDTO> getAlbumDTO() {
		return AlbumDTO;
	}

	public void setAlbumDTO(List<AlbumDTO> albumDTO) {
		AlbumDTO = albumDTO;
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

	public String getHostMovieId() {
		return hostMovieId;
	}

	public void setHostMovieId(String hostMovieId) {
		this.hostMovieId = hostMovieId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public Integer getCountWatch() {
		return countWatch;
	}

	public void setCountWatch(Integer countWatch) {
		this.countWatch = countWatch;
	}

	public Long getIdAlbum() {
		return idAlbum;
	}

	public void setIdAlbum(Long idAlbum) {
		this.idAlbum = idAlbum;
	}

	public Long getIdArtist() {
		return idArtist;
	}

	public void setIdArtist(Long idArtist) {
		this.idArtist = idArtist;
	}

	public InfoUserDTO getInfoByNameAuthor() {
		return InfoByNameAuthor;
	}

	public void setInfoByNameAuthor(InfoUserDTO infoByNameAuthor) {
		InfoByNameAuthor = infoByNameAuthor;
	}

	public Long getIdKindOfMusic() {
		return idKindOfMusic;
	}

	public void setIdKindOfMusic(Long idKindOfMusic) {
		this.idKindOfMusic = idKindOfMusic;
	}

	public Long getIdUser() {
		return idUser;
	}

	public void setIdUser(Long idUser) {
		this.idUser = idUser;
	}
}
