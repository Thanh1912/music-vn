package music.com.vn.model;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "album")
public class AlbumEntity implements Serializable {

  private static final long serialVersionUID = 1L;

  @Id
  @Column(name = "id")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  @UpdateTimestamp
  @Temporal(TemporalType.TIMESTAMP)
  @Column
  private Date modifiedAt;
  @CreationTimestamp
  @Temporal(TemporalType.TIMESTAMP)
  @Column
  private Date createdAt;

  private String name;

  private String poster;

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
  @ManyToOne(cascade =
          {
                  CascadeType.DETACH,
                  CascadeType.MERGE,
                  CascadeType.REFRESH,
                  CascadeType.PERSIST
          })
  @JoinColumn(name = "user_id")
  private UserEntity userEntity;

  @ManyToMany(fetch = FetchType.LAZY, mappedBy = "AlbumEntities")
  List<SongEntity> songEntities;

  @ManyToOne(cascade =
          {
                  CascadeType.DETACH,
                  CascadeType.MERGE,
                  CascadeType.REFRESH,
                  CascadeType.PERSIST
          })
  @JoinColumn(name = "artist_id")
  private ArtistEntity artistEntity;
  @ManyToOne(cascade =
          {
                  CascadeType.DETACH,
                  CascadeType.MERGE,
                  CascadeType.REFRESH,
                  CascadeType.PERSIST
          })
  @JoinColumn(name = "kindofmusic_id")
  private KindOfMusicEntity kindOfMusicEntity;

  public List<SongEntity> getSongEntities() {
    return songEntities;
  }

  public void setSongEntities(List<SongEntity> songEntities) {
    this.songEntities = songEntities;
  }

  public ArtistEntity getArtistEntity() {
    return artistEntity;
  }

  public void setArtistEntity(ArtistEntity artistEntity) {
    this.artistEntity = artistEntity;
  }

  public KindOfMusicEntity getKindOfMusicEntity() {
    return kindOfMusicEntity;
  }

  public void setKindOfMusicEntity(KindOfMusicEntity kindOfMusicEntity) {
    this.kindOfMusicEntity = kindOfMusicEntity;
  }

  public UserEntity getUserEntity() {
    return userEntity;
  }

  public void setUserEntity(UserEntity userEntity) {
    this.userEntity = userEntity;
  }
}
