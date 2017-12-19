package music.com.vn.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "artist")
public class ArtistEntity implements Serializable {

  private static final long serialVersionUID = 1L;

  @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column
  private Date modifiedAt;

  @Column
  private Date createdAt;

  private String name;

  private String image;

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

  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
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

  @ManyToMany(fetch = FetchType.LAZY, mappedBy = "ArtistEntities")
  List<SongEntity> songEntities;

  public List<SongEntity> getSongEntities() {
    return songEntities;
  }

  public void setSongEntities(List<SongEntity> songEntities) {
    this.songEntities = songEntities;
  }

  @OneToMany(fetch = FetchType.LAZY)
  @JoinColumn(name = "artist_id", foreignKey = @ForeignKey(value = ConstraintMode.NO_CONSTRAINT))
  private List<AlbumEntity> albumEntities;

  public List<AlbumEntity> getAlbumEntities() {
    return albumEntities;
  }

  public void setAlbumEntities(List<AlbumEntity> albumEntities) {
    this.albumEntities = albumEntities;
  }
}
